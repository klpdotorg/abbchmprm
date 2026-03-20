<?php
/**
 * Test FCM Notifications — All Message Types
 *
 * Sends a test notification for every notification type using messages
 * fetched from push_notification_messages_tbl (same as the real cron).
 * Also writes a row to push_notification_log_tbl for each sent notification
 * so that when the app calls api/tracknotificationopen.php the row is there
 * to be marked as opened.
 *
 * Run from command line:
 *   php push/test_fcm.php
 *
 * Language IDs: 1=Kannada, 2=Hindi, 3=English, 4=Odiya,
 *               5=Gujarati, 6=Marathi, 7=Telugu, 8=Tamil, 9=Urdu
 */

session_start();

$appbasedir = realpath(dirname(__FILE__) . '/..');
$_SESSION['ABSAPP_BASE_DIR']       = $appbasedir;
$_SESSION['ABSAPP_CONFIG_FILE']    = $appbasedir . '/config/appconfig.php';
$_SESSION['ABSAPP_DB_CONFIG_FILE'] = $appbasedir . '/config/dbconfig.php';

require_once($appbasedir . '/app/boot/checksandincludes.php');
require_once($appbasedir . '/push/fcm_helper.php');
require_once($appbasedir . '/cron/notification_translations.php');

global $cfg_fcm_service_account_json_path, $cfg_fcm_project_id;

// ================================================================
// CONFIG — edit these before running
// ================================================================
$test_fcm_token   = 'crJO1sMtSvCi2kiALxy2fe:APA91bENJoxTNEX6Eu3mQPi5swl0VfxLWC6jwFg8TnIkbasgtp5VqyLT3iltCydQCv3YP6uZn91uvfLwenoLYKR7OvSOYT8D_uTFqR2MJMTCAiUeh3GclHs';
$test_language_id = 3;   // language to use for message text
$test_child_id    = 1;   // id_child to log against (use a real child id from your DB)
// ================================================================

$language_names = [
    1 => 'Kannada', 2 => 'Hindi',   3 => 'English', 4 => 'Odiya',
    5 => 'Gujarati', 6 => 'Marathi', 7 => 'Telugu',  8 => 'Tamil', 9 => 'Urdu'
];

$all_types = [
    'inactive_3days',
    'inactive_7days',
    'inactive_14days',
    'inactive_1month',
    'inactive_2months',
    'inactive_3months',
    'mid_game_3days',
    'reward_5games',
    'daily_reminder',
];

$fcm = new fcm_helper($cfg_fcm_service_account_json_path, $cfg_fcm_project_id);
$dbh = services_dbhandler::getInstance();

// Unique run ID so all rows from this test run are grouped
$test_run_id = 'TEST-' . date('Ymd-His');

$lang_name = isset($language_names[$test_language_id]) ? $language_names[$test_language_id] : "ID $test_language_id";
echo "FCM Test — All Notification Types\n";
echo "Language : $lang_name (id=$test_language_id)\n";
echo "Child ID : $test_child_id\n";
echo "Run ID   : $test_run_id\n";
echo "Token    : " . substr($test_fcm_token, 0, 20) . "...\n";
echo str_repeat('-', 60) . "\n\n";

$pass = 0;
$fail = 0;

foreach ($all_types as $type) {

    $text = getNotificationText($type, $test_language_id);

    echo "[$type]\n";
    echo "  Title : " . $text['title'] . "\n";
    echo "  Body  : " . $text['body']  . "\n";

    $result = $fcm->sendPushNotification(
        $test_fcm_token,
        $text['title'],
        $text['body'],
        ['notification_type' => $type]
    );

    if ($result['success']) {
        $fcm_message_id = isset($result['response']['name']) ? $result['response']['name'] : null;
        $fcm_msg_sql    = $fcm_message_id ? "'" . addslashes($fcm_message_id) . "'" : "NULL";
        $token_sql      = "'" . addslashes($test_fcm_token) . "'";

        $dbh->executeQuery(
            "INSERT INTO push_notification_log_tbl
                 (id_child, notification_type, sent_datetime, delivery_status,
                  fcm_message_id, error_message, fcm_token_used, id_language, cron_run_id)
             VALUES
                 (" . intval($test_child_id) . ", '" . addslashes($type) . "', NOW(), 'sent',
                  $fcm_msg_sql, NULL, $token_sql,
                  " . intval($test_language_id) . ", '" . addslashes($test_run_id) . "')"
        );

        echo "  ✅ SENT  $fcm_message_id\n\n";
        $pass++;
    } else {
        $error_sql  = "'" . addslashes($result['error']) . "'";
        $token_sql  = "'" . addslashes($test_fcm_token) . "'";

        $dbh->executeQuery(
            "INSERT INTO push_notification_log_tbl
                 (id_child, notification_type, sent_datetime, delivery_status,
                  fcm_message_id, error_message, fcm_token_used, id_language, cron_run_id)
             VALUES
                 (" . intval($test_child_id) . ", '" . addslashes($type) . "', NOW(), 'failed',
                  NULL, $error_sql, $token_sql,
                  " . intval($test_language_id) . ", '" . addslashes($test_run_id) . "')"
        );

        echo "  ❌ FAILED  " . $result['error'] . "\n\n";
        $fail++;
    }
}

echo str_repeat('-', 60) . "\n";
echo "Result : $pass sent, $fail failed  (total " . count($all_types) . ")\n";
echo "Check  : SELECT * FROM push_notification_log_tbl WHERE cron_run_id = '$test_run_id';\n";
?>
