-- -------------------------------------------------------
-- Push Notification Migration
-- Run this against: abbchmprmdb
-- -------------------------------------------------------

-- Step 1: Add FCM token and last_login tracking to child_tbl
ALTER TABLE `child_tbl`
    ADD COLUMN `fcm_token`  VARCHAR(512) NULL AFTER `avatar_pic`,
    ADD COLUMN `last_login` DATETIME     NULL AFTER `fcm_token`;

-- Step 2: Notification log table (prevents duplicate sends)
CREATE TABLE IF NOT EXISTS `push_notification_log_tbl` (
    `id`                INT          NOT NULL AUTO_INCREMENT,
    `id_child`          INT          NOT NULL,
    `notification_type` VARCHAR(50)  NOT NULL,  -- inactive_7days | mid_game_3days | reward_5games | daily_reminder
    `sent_datetime`     DATETIME     NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_push_log` (`id_child`, `notification_type`, `sent_datetime`)
) ENGINE = InnoDB;

ALTER TABLE `device_accesstoken_tbl`
ADD COLUMN `app_version_name` VARCHAR(100) NULL AFTER `devicetype`;

ALTER TABLE child_tbl
ADD UNIQUE KEY uk_child_name_device_grade (child_name, deviceid, id_grade);
