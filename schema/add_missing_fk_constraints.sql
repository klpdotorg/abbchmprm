-- ============================================================
-- Missing Foreign Key Constraints for abbchmprmdb
-- Generated: 2026-03-10
-- Run this script AFTER verifying data integrity
-- ============================================================

-- ============================================================
-- SECTION 1: GRADE RELATIONSHIPS
-- ============================================================

--done
ALTER TABLE `child_tbl`
  ADD CONSTRAINT `fk_child_idgrade`
    FOREIGN KEY (`id_grade`) REFERENCES `grade_tbl` (`id_grade`);

--done
ALTER TABLE `game_master_tbl`
  ADD CONSTRAINT `fk_gmt_idgrade`
    FOREIGN KEY (`id_grade`) REFERENCES `grade_tbl` (`id_grade`);

--done
ALTER TABLE `chm_game_master_tbl`
  ADD CONSTRAINT `fk_chmgmt_idgrade`
    FOREIGN KEY (`id_grade`) REFERENCES `grade_tbl` (`id_grade`);

-- ============================================================
-- SECTION 2: PRM GAME PLAY TABLES
-- ============================================================

--not working
ALTER TABLE `game_play_tbl`
  ADD CONSTRAINT `fk_gpt_idgame`
    FOREIGN KEY (`id_game`) REFERENCES `game_master_tbl` (`id_game`);

--done
ALTER TABLE `game_play_detail_tbl`
  ADD CONSTRAINT `fk_gpdt_idchild`
    FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`);

--not done
ALTER TABLE `game_play_detail_tbl`
  ADD CONSTRAINT `fk_gpdt_idgameplay`
    FOREIGN KEY (`id_game_play`) REFERENCES `game_play_tbl` (`id_game_play`);

--not working
ALTER TABLE `game_play_detail_tbl`
  ADD CONSTRAINT `fk_gpdt_idquestion`
    FOREIGN KEY (`id_question`) REFERENCES `question_tbl` (`id_question`);

-- ============================================================
-- SECTION 3: CHM GAME PLAY TABLES
-- ============================================================

--not working
ALTER TABLE `chm_game_play_tbl`
  ADD CONSTRAINT `fk_chmgpt_idgame`
    FOREIGN KEY (`id_game`) REFERENCES `chm_game_master_tbl` (`id_game`);

--done
ALTER TABLE `chm_game_play_detail_tbl`
  ADD CONSTRAINT `fk_chmgpdt_idchild`
    FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`);

ALTER TABLE `chm_game_play_detail_tbl`
  ADD CONSTRAINT `fk_chmgpdt_idgameplay`
    FOREIGN KEY (`id_game_play`) REFERENCES `chm_game_play_tbl` (`id_game_play`);

--not working
ALTER TABLE `chm_game_play_detail_tbl`
  ADD CONSTRAINT `fk_chmgpdt_idquestion`
    FOREIGN KEY (`id_question`) REFERENCES `chm_question_master_tbl` (`id_question`);

-- ============================================================
-- SECTION 4: WALLET, DEVICE & EVENT TABLES
-- ============================================================

--done
ALTER TABLE `chm_walletscore_tbl`
  ADD CONSTRAINT `fk_chmws_idchild`
    FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`);

--done
ALTER TABLE `device_accesstoken_tbl`
  ADD CONSTRAINT `fk_dat_idchild`
    FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`);

--done
ALTER TABLE `ekstepevent_interact_tbl`
  ADD CONSTRAINT `fk_eit_idchild`
    FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`);

ALTER TABLE `ekstepevent_interact_tbl`
  ADD CONSTRAINT `fk_eit_idgameplay`
    FOREIGN KEY (`id_game_play`) REFERENCES `chm_game_play_tbl` (`id_game_play`);

ALTER TABLE `ekstepevent_interact_tbl`
  ADD CONSTRAINT `fk_eit_idquestion`
    FOREIGN KEY (`id_question`) REFERENCES `chm_question_master_tbl` (`id_question`);

-- ============================================================
-- SECTION 5: PUSH NOTIFICATION LOG
-- ============================================================

ALTER TABLE `push_notification_log_tbl`
  ADD CONSTRAINT `fk_pnl_idchild`
    FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`);

-- NOTE: push_notification_log_tbl.id_language is tinyint(4) but
-- language_tbl.id_language is int(11) — TYPE MISMATCH.
-- Fix the column type first, then run the FK below:

--done
ALTER TABLE `push_notification_log_tbl`
  MODIFY COLUMN `id_language` int(11) DEFAULT NULL;

--done
ALTER TABLE `push_notification_log_tbl`
  ADD CONSTRAINT `fk_pnl_idlanguage`
    FOREIGN KEY (`id_language`) REFERENCES `language_tbl` (`id_language`);

-- ============================================================
-- SECTION 6: REPORT CONFIGURATION TABLES (CHM)
-- ============================================================

--done
ALTER TABLE `reports_chm_tbl`
  ADD CONSTRAINT `fk_rchm_groupid`
    FOREIGN KEY (`group_id`) REFERENCES `reports_chm_groups_tbl` (`report_group_id`);

--done
ALTER TABLE `report_chm_columns_tbl`
  ADD CONSTRAINT `fk_rchmcol_reportid`
    FOREIGN KEY (`report_id`) REFERENCES `reports_chm_tbl` (`report_id`);

--done
ALTER TABLE `report_chm_whereclause_tbl`
  ADD CONSTRAINT `fk_rchmwc_reportid`
    FOREIGN KEY (`report_id`) REFERENCES `reports_chm_tbl` (`report_id`);

-- ============================================================
-- SECTION 7: REPORT CONFIGURATION TABLES (PRM)
-- ============================================================

--done
ALTER TABLE `reports_prm_tbl`
  ADD CONSTRAINT `fk_rprm_groupid`
    FOREIGN KEY (`group_id`) REFERENCES `reports_prm_groups_tbl` (`report_group_id`);

--done
ALTER TABLE `report_prm_columns_tbl`
  ADD CONSTRAINT `fk_rprmcol_reportid`
    FOREIGN KEY (`report_id`) REFERENCES `reports_prm_tbl` (`report_id`);

--done
ALTER TABLE `report_prm_whereclause_tbl`
  ADD CONSTRAINT `fk_rprmwc_reportid`
    FOREIGN KEY (`report_id`) REFERENCES `reports_prm_tbl` (`report_id`);
