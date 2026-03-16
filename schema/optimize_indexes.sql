-- ============================================================
-- Index Optimization for abbchmprmdb
-- Generated: 2026-03-12
--
-- Run each section independently. Safe for MySQL 5.7 InnoDB.
-- Check for active FK constraints before dropping indexes
-- (MySQL prevents dropping an index used by a FK constraint).
-- ============================================================

-- ============================================================
-- SECTION 1: DROP REDUNDANT INDEXES
-- ============================================================

-- child_tbl: duplicate of UNIQUE KEY uk_child(child_name,deviceid)
-- InnoDB UNIQUE KEY already carries id_child (PK) as row pointer implicitly.
ALTER TABLE `child_tbl` DROP KEY `child_name`;

-- child_tbl: id_child is the PK — composite (id_child,id_grade) never helps
-- JOIN ON id_grade queries. Replaced by idx_child_grade below.
ALTER TABLE `child_tbl` DROP KEY `idx_child_id_grade`;

-- chm_game_play_tbl: idx_game2(id_game) is fully subsumed by
-- idx_game_cover(id_game, id_game_play) where id_game is the leading column.
ALTER TABLE `chm_game_play_tbl` DROP KEY `idx_game2`;

-- chm_game_play_tbl: standalone id_child replaced by composite (id_child,start_time)
-- All views that join on id_child also filter by start_time date range.
ALTER TABLE `chm_game_play_tbl` DROP KEY `fk_chmchild_id`;

-- game_play_tbl: standalone id_child replaced by composite (id_child,start_time)
ALTER TABLE `game_play_tbl` DROP KEY `fk_child_id`;

-- game_play_detail_tbl: standalone id_child replaced by composite
-- (id_child,date_time_submission) which covers all existing uses.
ALTER TABLE `game_play_detail_tbl` DROP KEY `idx_id_child1`;


-- ============================================================
-- SECTION 2: ADD MISSING INDEXES — child_tbl
-- (used by nearly every view, currently missing join indexes)
-- ============================================================

-- For: emrp_active_users_view JOIN grade_tbl ON ch.id_grade = gr.id_grade
--      chm/prm_avggameplaysessiontimeperchild_view
ALTER TABLE `child_tbl`
  ADD KEY `idx_child_grade` (`id_grade`);

-- For: emrp_active_users_view JOIN schooltype_tbl ON ch.school_type = sc.school_type
--      emrp_schooltypewisechildcount_view
ALTER TABLE `child_tbl`
  ADD KEY `idx_child_schooltype` (`school_type`);

-- For: emrp_dailyregistration_view, emrp_weeklyregistration_view,
--      emrp_monthlyregistration_view, emrp_monthlyregistration_orgvise_view
--      All use: WHERE CAST(created_datetime AS DATE) BETWEEN ... AND NOW()
ALTER TABLE `child_tbl`
  ADD KEY `idx_child_created_datetime` (`created_datetime`);


-- ============================================================
-- SECTION 3: ADD MISSING INDEXES — game_play_tbl (PRM)
-- MOST CRITICAL: every PRM date-range view does a full table scan without these
-- (chm_game_play_tbl already has equivalent indexes — this mirrors them)
-- ============================================================

-- For: prm_dailygameplaysessions_view, prm_monthlygameplaysessions_view,
--      prm_weeklygameplaysessions_perdevice_view, prm_childtimepergameplaysession_view,
--      prm_total_games_played_with_gameid
--      All use: WHERE CAST(start_time AS DATE) BETWEEN ... AND NOW()
ALTER TABLE `game_play_tbl`
  ADD KEY `idx_gpt_start_time` (`start_time`);

-- For: prm_monthlygameplaysessions_childvise_view, prm_weeklygameplaysessions_perdevice_view
--      WHERE id_child = ... AND CAST(start_time AS DATE) BETWEEN ...
ALTER TABLE `game_play_tbl`
  ADD KEY `idx_gpt_child_start` (`id_child`, `start_time`);


-- ============================================================
-- SECTION 4: ADD MISSING INDEXES — game_play_detail_tbl (PRM)
-- Mirrors the indexes that already exist on chm_game_play_detail_tbl
-- ============================================================

-- For: prm_totalsessiontimepergameplay_view (GROUP BY id_child, date_played)
--      which feeds: prm_dailytotalsessiontimeperchild_view,
--                   prm_avggameplaysessiontimeperchild_view,
--                   chmprm_totalgamesplayedview1/2/3/4
-- Mirrors: chm_game_play_detail_tbl.idx_gpdt_child_date
ALTER TABLE `game_play_detail_tbl`
  ADD KEY `idx_gpdt_child_date` (`id_child`, `date_time_submission`);

-- For: prm_childtimepergameplaysession_view, prm_total_games_played_with_gameid
--      JOIN game_play_tbl ON gpt.id_game_play = gpdt.id_game_play
-- Mirrors: chm_game_play_detail_tbl.idx_gpdt_gameplay_child
ALTER TABLE `game_play_detail_tbl`
  ADD KEY `idx_gpdt_gameplay_child` (`id_game_play`, `id_child`);


-- ============================================================
-- SECTION 5: ADD MISSING INDEXES — chm_game_play_tbl (upgrade)
-- ============================================================

-- Replaces the dropped fk_chmchild_id(id_child).
-- Better composite for: chm_monthlygameplaysessions_childvise_view,
--                        chm_weeklygameplaysessions_perdevice_view
ALTER TABLE `chm_game_play_tbl`
  ADD KEY `idx_chmgpt_child_start` (`id_child`, `start_time`);


-- ============================================================
-- SECTION 6: ADD MISSING INDEXES — other tables
-- ============================================================

-- push_notification_log_tbl: for report date-range queries on sent_datetime
ALTER TABLE `push_notification_log_tbl`
  ADD KEY `idx_pnl_sent_datetime` (`sent_datetime`);

-- chm_walletscore_tbl: no index on id_child despite FK relationship with child_tbl
ALTER TABLE `chm_walletscore_tbl`
  ADD KEY `idx_chmws_idchild` (`id_child`);
