-- -------------------------------------------------------
-- Migration: Push Notification Log — Additional Columns
-- Run once against: abbchmprmdb
--
-- Adds:
--   delivery_status  - 'sent' or 'failed'
--   fcm_message_id   - FCM response name on success
--   error_message    - FCM error string on failure
--   fcm_token_used   - snapshot of token at send time
--   id_language      - language the notification was sent in
--   opened_datetime  - when child tapped the notification (set via app callback API)
--   is_opened        - 0/1 flag derived from opened_datetime
--   cron_run_id      - UUID grouping all sends from one cron execution
-- -------------------------------------------------------

ALTER TABLE `push_notification_log_tbl`
    ADD COLUMN `delivery_status`  ENUM('sent','failed') NOT NULL DEFAULT 'sent'  AFTER `sent_datetime`,
    ADD COLUMN `fcm_message_id`   VARCHAR(255)          NULL                     AFTER `delivery_status`,
    ADD COLUMN `error_message`    VARCHAR(255)          NULL                     AFTER `fcm_message_id`,
    ADD COLUMN `fcm_token_used`   VARCHAR(512)          NULL                     AFTER `error_message`,
    ADD COLUMN `id_language`      TINYINT               NULL                     AFTER `fcm_token_used`,
    ADD COLUMN `opened_datetime`  DATETIME              NULL                     AFTER `id_language`,
    ADD COLUMN `is_opened`        TINYINT(1)            NOT NULL DEFAULT 0       AFTER `opened_datetime`,
    ADD COLUMN `cron_run_id`      VARCHAR(36)           NULL                     AFTER `is_opened`;