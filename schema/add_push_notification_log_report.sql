-- ============================================================
-- Push Notification Log Report
-- Adds a "Push Notification Log" report to the CHM Reports portal
--
-- Next available IDs (from abbchmprmdb_latest_schema.sql):
--   reports_chm_groups_tbl  AUTO_INCREMENT = 5  → group_id  = 5
--   reports_chm_tbl         AUTO_INCREMENT = 21 → report_id = 21
--   report_chm_columns_tbl  AUTO_INCREMENT = 99 → auto_ids  = 99-107
--   report_chm_whereclause_tbl AUTO_INCREMENT = 40 → auto_ids = 40-43
-- ============================================================

-- Step 1: Create the database view
-- Joins push_notification_log_tbl with child_tbl to get the child name.
CREATE OR REPLACE VIEW push_notification_log_view AS
SELECT
    pnl.id                  AS log_id,
    c.child_name            AS child_name,
    pnl.id_child            AS child_id,
    pnl.notification_type,
    pnl.sent_datetime,
    pnl.delivery_status,
    pnl.is_opened,
    pnl.opened_datetime,
    pnl.fcm_message_id,
    pnl.error_message,
    pnl.cron_run_id
FROM push_notification_log_tbl pnl
JOIN child_tbl c ON c.id_child = pnl.id_child;

-- Step 2: Add "Notification Reports" group
INSERT INTO `reports_chm_groups_tbl` (`report_group_id`, `group_name`, `display_order`) VALUES
(5, 'Notification Reports', 5);

-- Step 3: Register the report
INSERT INTO `reports_chm_tbl` (`report_id`, `report_code`, `report_name`, `view_name`, `uniquevaluecolumnname`, `report_description`, `group_id`, `is_active`, `display_order`) VALUES
(21, 'NFNRPT1', 'Push Notification Log', 'push_notification_log_view', 'log_id',
 'Log of all push notifications sent to children — type, delivery status, and open tracking',
 5, 1, 1);

-- Step 4: Define report columns
INSERT INTO `report_chm_columns_tbl` (`report_column_auto_id`, `report_id`, `report_column_seqid`, `report_column_name`, `report_column_label`, `column_datatype`) VALUES
(101,  21, 1, 'child_name',        'Child Name',        'varchar'),
(102, 21, 2, 'notification_type', 'Notification Type', 'varchar'),
(103, 21, 3, 'sent_datetime',     'Sent At',           'datetime'),
(104, 21, 4, 'delivery_status',   'Status',            'varchar'),
(105, 21, 5, 'is_opened',         'Opened',            'integer'),
(106, 21, 6, 'opened_datetime',   'Opened At',         'datetime'),
(107, 21, 7, 'fcm_message_id',    'FCM Message ID',    'varchar'),
(108, 21, 8, 'error_message',     'Error',             'varchar'),
(109, 21, 9, 'cron_run_id',       'Cron Run ID',       'varchar');

-- Step 5: Define filter (whereclause) options
INSERT INTO `report_chm_whereclause_tbl` (`report_whereclause_auto_id`, `report_id`, `report_whereclause_seqid`, `report_whereclause_column_name`, `report_whereclause_column_label`, `wc_datatype`, `column_data_prefix`, `default_value`) VALUES
(40, 21, 1, 'child_name',        'Child Name',        'varchar',  NULL, NULL),
(41, 21, 2, 'notification_type', 'Notification Type', 'varchar',  NULL, NULL),
(42, 21, 3, 'sent_datetime',     'Sent Date',         'datetime', NULL, NULL),
(43, 21, 4, 'delivery_status',   'Status',            'varchar',  NULL, NULL);
