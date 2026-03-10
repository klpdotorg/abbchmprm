<?php

/**
 * Push Notification Translations
 *
 * Messages are stored in push_notification_messages_tbl:
 *   notification_type | id_language | title | body
 *
 * To update a message: edit the row directly in the DB via phpMyAdmin.
 * To add a new language: INSERT a new row with the new id_language.
 * Fallback: English (id_language = 3) is used if translation not found.
 */

/**
 * Get the translated title and body for a notification type and language.
 * Fetches from push_notification_messages_tbl.
 * Falls back to English (id_language = 3) if no translation found.
 *
 * @param string $type        - notification type key (e.g. 'inactive_3days')
 * @param int    $id_language - language ID from child_tbl
 * @return array ['title' => string, 'body' => string]
 */
function getNotificationText($type, $id_language) {

    $dbh  = services_dbhandler::getInstance();
    $lang = intval($id_language);
    $type = $dbh->getSanitizedData($type);

    // Try the child's language first, then fall back to English (3)
    $query = "SELECT title, body
              FROM push_notification_messages_tbl
              WHERE notification_type = '$type'
                AND id_language IN ($lang, 3)
              ORDER BY CASE id_language WHEN $lang THEN 0 ELSE 1 END
              LIMIT 1";

    $dbh->executeQuery($query);
    $rows = $dbh->fetchAssocList();

    if (!empty($rows)) {
        return array('title' => $rows[0]['title'], 'body' => $rows[0]['body']);
    }

    // Hard fallback if DB has no entry at all
    return array('title' => 'Practice Math Today!', 'body' => 'Open the app and play a game!');
}
?>
