<?php

/**
 * Push Notification Cron Job
 * File: cron/push_notification_cron.php
 *
 * Run daily via crontab (e.g. 9 AM every day):
 *   0 9 * * * php /var/www/html/cron/push_notification_cron.php >> /var/log/push_cron.log 2>&1
 *
 * Rules:
 *   1a. inactive_3days  - Child has not logged in for 3-6 days
 *   1b. inactive_7days  - Child has not logged in for 7-13 days
 *   1c. inactive_14days - Child has not logged in for 14+ days
 *   2.  mid_game_3days  - Child played a game 1-3 days ago but not since (left mid-game)
 *   3.  reward_5games   - Child just crossed 5 total games completed (one-time reward)
 *   4.  daily_reminder  - Child has not played any game in the last 24 hours
 */

// ----------------------------------------------------------------
// Bootstrap: simulate the API session environment so existing
// classes (services_dbhandler, exceptionMgr, etc.) load correctly
// ----------------------------------------------------------------
session_start();

$appbasedir = realpath(dirname(__FILE__) . '/..');
$_SESSION['ABSAPP_BASE_DIR']       = $appbasedir;
$_SESSION['ABSAPP_CONFIG_FILE']    = $appbasedir . '/config/appconfig.php';
$_SESSION['ABSAPP_DB_CONFIG_FILE'] = $appbasedir . '/config/dbconfig.php';

require_once($appbasedir . '/app/boot/checksandincludes.php');
require_once($appbasedir . '/push/fcm_helper.php');
require_once($appbasedir . '/cron/notification_translations.php');

global $cfg_fcm_service_account_json_path, $cfg_fcm_project_id;

$fcm    = new fcm_helper($cfg_fcm_service_account_json_path, $cfg_fcm_project_id);
$dbh    = services_dbhandler::getInstance();
$logmgr = new exceptionMgr(" ");

$now = date('Y-m-d H:i:s');
$logmgr->logInfo("push_notification_cron: Started at $now");

// ----------------------------------------------------------------
// Helper: check if a notification was already sent to this child
//         within the given interval (to prevent duplicate sends)
// ----------------------------------------------------------------
function alreadySent($dbh, $childid, $type, $interval_hours) {

    $query = "SELECT COUNT(*) AS cnt
              FROM push_notification_log_tbl
              WHERE id_child          = " . intval($childid) . "
                AND notification_type = '" . $type . "'
                AND sent_datetime     > DATE_SUB(NOW(), INTERVAL " . intval($interval_hours) . " HOUR)";

    $dbh->executeQuery($query);
    $rows = $dbh->fetchAssocList();
    return (isset($rows[0]['cnt']) && $rows[0]['cnt'] > 0);
}

// ----------------------------------------------------------------
// Helper: log a sent notification
// ----------------------------------------------------------------
function logNotification($dbh, $childid, $type) {

    $query = "INSERT INTO push_notification_log_tbl (id_child, notification_type, sent_datetime)
              VALUES (" . intval($childid) . ", '" . $type . "', NOW())";
    $dbh->executeQuery($query);
}

// ----------------------------------------------------------------
// Helper: send and log one notification (uses child's language)
// ----------------------------------------------------------------
function sendAndLog($fcm, $dbh, $logmgr, $row, $type) {

    $id_language = isset($row['id_language']) ? intval($row['id_language']) : 3;
    $text        = getNotificationText($type, $id_language);

    $result = $fcm->sendPushNotification($row['fcm_token'], $text['title'], $text['body']);

    if ($result['success']) {
        logNotification($dbh, $row['id_child'], $type);
        $logmgr->logInfo("push_notification_cron [$type]: Sent to child " . $row['id_child'] . " (" . $row['child_name'] . ") lang=$id_language");
    } else {
        $logmgr->logInfo("push_notification_cron [$type]: FAILED for child " . $row['id_child'] . " - " . $result['error']);
    }
}

// ================================================================
// RULE 1a: 3 days inactive (last login 3-6 days ago)
// Throttle: don't re-send within 3 days
// ================================================================
$query_inactive_3 = "SELECT id_child, child_name, fcm_token, id_language
                     FROM child_tbl
                     WHERE fcm_token  IS NOT NULL
                       AND last_login IS NOT NULL
                       AND last_login < DATE_SUB(NOW(), INTERVAL 3 DAY)
                       AND last_login >= DATE_SUB(NOW(), INTERVAL 7 DAY)";

$dbh->executeQuery($query_inactive_3);
$inactive_3_children = $dbh->fetchAssocList();

if ($inactive_3_children) {
    foreach ($inactive_3_children as $row) {
        if (!alreadySent($dbh, $row['id_child'], 'inactive_3days', 72)) { // 72h = 3 days
            sendAndLog($fcm, $dbh, $logmgr, $row, 'inactive_3days');
        }
    }
}

// ================================================================
// RULE 1b: 7 days inactive (last login 7-13 days ago)
// Throttle: don't re-send within 7 days
// ================================================================
$query_inactive_7 = "SELECT id_child, child_name, fcm_token, id_language
                     FROM child_tbl
                     WHERE fcm_token  IS NOT NULL
                       AND last_login IS NOT NULL
                       AND last_login < DATE_SUB(NOW(), INTERVAL 7 DAY)
                       AND last_login >= DATE_SUB(NOW(), INTERVAL 14 DAY)";

$dbh->executeQuery($query_inactive_7);
$inactive_7_children = $dbh->fetchAssocList();

if ($inactive_7_children) {
    foreach ($inactive_7_children as $row) {
        if (!alreadySent($dbh, $row['id_child'], 'inactive_7days', 168)) { // 168h = 7 days
            sendAndLog($fcm, $dbh, $logmgr, $row, 'inactive_7days');
        }
    }
}

// ================================================================
// RULE 1c: 14 days inactive (last login 14+ days ago)
// Throttle: don't re-send within 14 days
// ================================================================
$query_inactive_14 = "SELECT id_child, child_name, fcm_token, id_language
                      FROM child_tbl
                      WHERE fcm_token  IS NOT NULL
                        AND last_login IS NOT NULL
                        AND last_login < DATE_SUB(NOW(), INTERVAL 14 DAY)";

$dbh->executeQuery($query_inactive_14);
$inactive_14_children = $dbh->fetchAssocList();

if ($inactive_14_children) {
    foreach ($inactive_14_children as $row) {
        if (!alreadySent($dbh, $row['id_child'], 'inactive_14days', 336)) { // 336h = 14 days
            sendAndLog($fcm, $dbh, $logmgr, $row, 'inactive_14days');
        }
    }
}

// ================================================================
// RULE 2: Left mid-game (last game played 1-3 days ago, not today)
// Condition: most recent game session started between 24h and 3 days ago
// Throttle:  don't re-send within 24 hours
// ================================================================
$query_midgame = "SELECT C.id_child, C.child_name, C.fcm_token, C.id_language,
                         MAX(G.start_time) AS last_game_time
                  FROM child_tbl C
                  JOIN (
                      SELECT id_child, start_time FROM game_play_tbl
                      UNION ALL
                      SELECT id_child, start_time FROM chm_game_play_tbl
                  ) G ON G.id_child = C.id_child
                  WHERE C.fcm_token IS NOT NULL
                  GROUP BY C.id_child, C.child_name, C.fcm_token, C.id_language
                  HAVING last_game_time < DATE_SUB(NOW(), INTERVAL 24 HOUR)
                     AND last_game_time > DATE_SUB(NOW(), INTERVAL 3 DAY)";

$dbh->executeQuery($query_midgame);
$midgame_children = $dbh->fetchAssocList();

if ($midgame_children) {
    foreach ($midgame_children as $row) {
        if (!alreadySent($dbh, $row['id_child'], 'mid_game_3days', 24)) {
            sendAndLog($fcm, $dbh, $logmgr, $row, 'mid_game_3days');
        }
    }
}

// ================================================================
// RULE 3: Completed 5 games (one-time reward)
// Condition: total game sessions (PRM + CHM) >= 5
//            AND never sent 'reward_5games' before
// ================================================================
$query_5games = "SELECT C.id_child, C.child_name, C.fcm_token, C.id_language,
                        COUNT(*) AS total_games
                 FROM child_tbl C
                 JOIN (
                     SELECT id_child FROM game_play_tbl
                     UNION ALL
                     SELECT id_child FROM chm_game_play_tbl
                 ) G ON G.id_child = C.id_child
                 WHERE C.fcm_token IS NOT NULL
                   AND C.id_child NOT IN (
                       SELECT id_child FROM push_notification_log_tbl
                       WHERE notification_type = 'reward_5games'
                   )
                 GROUP BY C.id_child, C.child_name, C.fcm_token, C.id_language
                 HAVING total_games >= 5";

$dbh->executeQuery($query_5games);
$reward_children = $dbh->fetchAssocList();

if ($reward_children) {
    foreach ($reward_children as $row) {
        sendAndLog($fcm, $dbh, $logmgr, $row, 'reward_5games');
    }
}

// ================================================================
// RULE 4: Daily reminder (no game played in last 24 hours)
// Condition: child has played at least one game ever
//            AND no game in the last 24 hours
// Throttle:  don't re-send within 24 hours
// Note: skip children already covered by the 7-day inactive rule
// ================================================================
$query_daily = "SELECT C.id_child, C.child_name, C.fcm_token, C.id_language,
                       MAX(G.start_time) AS last_game_time
                FROM child_tbl C
                JOIN (
                    SELECT id_child, start_time FROM game_play_tbl
                    UNION ALL
                    SELECT id_child, start_time FROM chm_game_play_tbl
                ) G ON G.id_child = C.id_child
                WHERE C.fcm_token IS NOT NULL
                GROUP BY C.id_child, C.child_name, C.fcm_token, C.id_language
                HAVING last_game_time < DATE_SUB(NOW(), INTERVAL 24 HOUR)
                   AND last_game_time > DATE_SUB(NOW(), INTERVAL 7 DAY)";

$dbh->executeQuery($query_daily);
$daily_children = $dbh->fetchAssocList();

if ($daily_children) {
    foreach ($daily_children as $row) {
        if (!alreadySent($dbh, $row['id_child'], 'daily_reminder', 24)) {
            sendAndLog($fcm, $dbh, $logmgr, $row, 'daily_reminder');
        }
    }
}

$logmgr->logInfo("push_notification_cron: Finished at " . date('Y-m-d H:i:s'));
?>
