-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Mar 10, 2026 at 03:16 PM
-- Server version: 5.7.44
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abbchmprmdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `charts_chm_tbl`
--

CREATE TABLE `charts_chm_tbl` (
  `id` int(11) NOT NULL,
  `chart_name` varchar(256) NOT NULL,
  `chart_description` varchar(512) NOT NULL,
  `view_name` varchar(256) NOT NULL,
  `maxrecordstodisplay` int(11) NOT NULL,
  `maxrecordsfrom` varchar(100) NOT NULL,
  `orderby_columnname` varchar(100) NOT NULL,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charts_chm_tbl`
--

INSERT INTO `charts_chm_tbl` (`id`, `chart_name`, `chart_description`, `view_name`, `maxrecordstodisplay`, `maxrecordsfrom`, `orderby_columnname`, `is_dashboard`, `display_order`) VALUES
(1, 'Game utilization', 'Total number of play sessions for various Games', 'chm_totalsessionspergame_view', 40, 'top', 'PlaySessions', 0, 1),
(2, 'Weekly Registration Stats', 'Registrations per week for the last 12 weeks', 'emrp_weeklyregistration_view', 12, 'bottom', 'RegWeek', 1, 2),
(3, 'Daily Game Play Sessions', 'Game Play Sessions per day for the last 30 days', 'chm_dailygameplaysessions_view', 15, 'bottom', 'SessionDate', 1, 3),
(4, 'Govt-Pvt School Distribution', 'Govt vs Pvt Schooltype Child Distribution', 'emrp_schooltypewisechildcount_view', 2, 'top', 'schooltypeid', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `charts_prm_tbl`
--

CREATE TABLE `charts_prm_tbl` (
  `id` int(11) NOT NULL,
  `chart_name` varchar(256) NOT NULL,
  `chart_description` varchar(512) NOT NULL,
  `view_name` varchar(256) NOT NULL,
  `maxrecordstodisplay` int(11) NOT NULL,
  `maxrecordsfrom` varchar(100) NOT NULL,
  `orderby_columnname` varchar(100) NOT NULL,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charts_prm_tbl`
--

INSERT INTO `charts_prm_tbl` (`id`, `chart_name`, `chart_description`, `view_name`, `maxrecordstodisplay`, `maxrecordsfrom`, `orderby_columnname`, `is_dashboard`, `display_order`) VALUES
(1, 'Game utilization', 'Total number of play sessions for various Games', 'prm_totalsessionspergame_view', 40, 'top', 'PlaySessions', 0, 1),
(2, 'Weekly Registration Stats', 'Registrations per week for the last 12 weeks', 'emrp_weeklyregistration_view', 12, 'bottom', 'RegWeek', 1, 2),
(3, 'Daily Game Play Sessions', 'Game Play Sessions per day for the last 30 days', 'prm_dailygameplaysessions_view', 15, 'bottom', 'SessionDate', 1, 3),
(4, 'Competency Level Summary', 'Overall competency level summary based on number submissions against number of attempts across all answe submissions in all the game play sessions across all games', 'prm_attemptssummaryallgames_view', 5, 'top', 'attempts', 1, 4),
(5, 'Govt-Pvt School Distribution', 'Govt vs Pvt Schooltype Child Distribution', 'emrp_schooltypewisechildcount_view', 2, 'top', 'schooltypeid', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `child_tbl`
--

CREATE TABLE `child_tbl` (
  `id_child` int(11) NOT NULL,
  `child_name` varchar(256) NOT NULL,
  `deviceid` varchar(256) NOT NULL,
  `id_grade` int(11) NOT NULL,
  `school_type` tinyint(1) NOT NULL,
  `geo` varchar(256) NOT NULL,
  `district` varchar(256) DEFAULT NULL,
  `id_language` int(11) NOT NULL,
  `organization` varchar(256) DEFAULT NULL,
  `avatar_pic` varchar(256) DEFAULT NULL,
  `fcm_token` varchar(512) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `chmprm_totalgamesplayedview1_view`
-- (See below for the actual view)
--
CREATE TABLE `chmprm_totalgamesplayedview1_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`chmdateplayed` date
,`chmtotalgamesplayed` bigint(21)
,`chmtotalgameplaysessiontime` decimal(54,0)
,`prmdateplayed` date
,`prmtotalgamesplayed` bigint(21)
,`prmtotalgameplaysessiontime` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chmprm_totalgamesplayedview2_view`
-- (See below for the actual view)
--
CREATE TABLE `chmprm_totalgamesplayedview2_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`chmdateplayed` binary(0)
,`chmtotalgamesplayed` binary(0)
,`chmtotalgameplaysessiontime` binary(0)
,`prmdateplayed` date
,`prmtotalgamesplayed` bigint(21)
,`prmtotalgameplaysessiontime` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chmprm_totalgamesplayedview3_view`
-- (See below for the actual view)
--
CREATE TABLE `chmprm_totalgamesplayedview3_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`chmdateplayed` date
,`chmtotalgamesplayed` bigint(21)
,`chmtotalgameplaysessiontime` decimal(65,30)
,`prmdateplayed` date
,`prmtotalgamesplayed` bigint(21)
,`prmtotalgameplaysessiontime` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chmprm_totalgamesplayedview4_view`
-- (See below for the actual view)
--
CREATE TABLE `chmprm_totalgamesplayedview4_view` (
`PlayDate` date
,`Month` int(2)
,`Year` int(4)
,`ChildId` int(11)
,`Name` varchar(256)
,`DeviceID` varchar(256)
,`Organization` varchar(256)
,`TotalCHMgames` bigint(21)
,`TotalPRMgames` bigint(21)
,`TotalGamesPlayed` bigint(22)
,`TotalCHMgamessessiontime` decimal(65,30)
,`TotalPRMgamessessiontime` decimal(54,0)
,`TotalSessionTime` decimal(65,30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_activedevices_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_activedevices_view` (
`DeviceId` varchar(256)
,`Users` bigint(21)
,`Week1` bigint(21)
,`Week2` bigint(21)
,`Week3` bigint(21)
,`Week4` bigint(21)
,`TotalSessionsCount` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_avggameplaysessiontimeperchild_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_avggameplaysessiontimeperchild_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Grade` varchar(30)
,`Organization` varchar(256)
,`Total_Gameplay_Session_Time` decimal(32,0)
,`Number_Of_Gameplay_Sessions` bigint(21)
,`Avg_Gameplay_Session_Time` decimal(11,0)
,`date_last_played` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_childtimepergameplaysession_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_childtimepergameplaysession_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`id_game_play` varchar(100)
,`id_game` varchar(100)
,`session_start_time` datetime
,`total_session_time` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_dailygameplaysessions_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_dailygameplaysessions_view` (
`SessionDate` date
,`GameplaySessionsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_dailytotalsessiontimeperchild_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_dailytotalsessiontimeperchild_view` (
`dateplayed` date
,`DeviceId` varchar(256)
,`childid` int(11)
,`Name` varchar(256)
,`Grade` varchar(30)
,`Organization` varchar(256)
,`Total_Games_Played` bigint(21)
,`Total_Gameplay_Session_Time` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `chm_game_master_tbl`
--

CREATE TABLE `chm_game_master_tbl` (
  `id` int(11) NOT NULL,
  `id_game` varchar(100) NOT NULL,
  `game_description` varchar(512) NOT NULL,
  `id_grade` int(11) NOT NULL,
  `gametoopen` varchar(512) DEFAULT NULL,
  `prerequisitegame` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chm_game_master_tbl`
--

INSERT INTO `chm_game_master_tbl` (`id`, `id_game`, `game_description`, `id_grade`, `gametoopen`, `prerequisitegame`) VALUES
(1, 'NSNG1.1', '', 1, 'NSNG2.1', ''),
(2, 'NSNG2.1', '', 1, 'NSNG3.1', 'NSNG1.1'),
(3, 'NSNG3.1', '', 1, 'NSSG1.1', 'NSNG2.1'),
(4, 'NSSG1.1', '', 1, 'NSSG2.1', ''),
(5, 'NSSG2.1', '', 1, 'NSSG3.2,NOAG1.1,NOSG1.1', 'NSSG1.1'),
(6, 'NSSG3.2', '', 1, 'NSSG4.2', 'NSSG2.1'),
(7, 'NSSG4.2', '', 1, 'NNSG5.3', 'NSSG3.2'),
(8, 'NSSG5.3', '', 1, 'NNSG6.3', 'NSSG4.2'),
(9, 'NSSG6.3', '', 1, '', 'NSSG5.3'),
(10, 'NSCG1.1', '', 1, 'NSCG2.1,NSSC3.2', 'NSSG'),
(11, 'NSCG2.1', '', 1, 'NSCG4.2', 'NSCG1.1'),
(12, 'NSCG3.2', '', 1, 'NSCG4.2,NSCG5.2', 'NSCG2.1'),
(13, 'NSCG4.2', '', 1, 'NSCG5.3', 'NSCG3.2,NSCG3.2'),
(14, 'NSSG5.2', '', 1, 'NSCG5.3', 'NSCG3.2'),
(15, 'NSCG5.3', '', 1, '', 'NSCG5.2,NSCG4.2'),
(16, 'NSPVG1.1', '', 1, 'NSPVG2.1', 'NSNG3.1'),
(17, 'NSPVG2.1', '', 1, 'NSPVG3.2', 'NSPVG1.1'),
(18, 'NSPVG3.2', '', 1, 'NSPVG4.2', 'NSPVG1.1'),
(19, 'NSPVG4.2', '', 1, 'NSPVG6.3', 'NSPVG3.2'),
(20, 'NSPVG5.2', '', 1, 'NSPVG7.3', 'NSPVG4.2'),
(21, 'NSPVG6.3', '', 1, 'NSPVG7.3', 'NSPVG4.2'),
(22, 'NSPVG7.3', '', 1, '', 'NSPVG6.3,NSPV5.2'),
(23, 'NSFG1.1', '', 1, 'NSF2.1', ''),
(24, 'NSFG2.1', '', 1, '', 'NOMD4.2,NSFG1.1'),
(25, 'NOAG1.1', '', 1, 'NOAG2.1,NOMG1.1,NODG2.2', 'NSSG2.1'),
(26, 'NOAG2.1', '', 1, 'NOAG3.2', 'NOAG1.1'),
(27, 'NOAG3.2', '', 1, 'NOAG4.3', 'NOAG2.1'),
(28, 'NOAG4.3', '', 1, '', 'NOAG3.2'),
(29, 'NOSG1.1', '', 1, 'NOSG2.1,NOSD1.2', 'NSSG2.1'),
(30, 'NOSG2.1', '', 1, 'NOSG3.2', 'NOSG1.1'),
(31, 'NOSG3.2', '', 1, 'NOSG4.3', 'NOSG2.1'),
(32, 'NOSG4.3', '', 1, '', 'NOSG3.2'),
(33, 'NOMG1.1', '', 1, 'NOMG2.1', 'NOAG1.1'),
(34, 'NOMG2.1', '', 1, 'NOMG3.2', 'NOMG1.1'),
(35, 'NOMG3.2', '', 1, 'NOMG4.2', 'NOMG2.1'),
(36, 'NOMG4.2', '', 1, 'NOMG5.3,NODG3.2', 'NOMG3.2'),
(37, 'NOMG5.3', '', 1, '', 'NOMG4.2'),
(38, 'NODG1.2', '', 1, 'NODG3.2', 'NOSG1.1'),
(39, 'NODG2.2', '', 1, 'NODG3.2', 'NOAG1.1'),
(40, 'NODG3.2', '', 1, 'NODG4.2', 'NOMG4.2,NODG2.2,NODG1.2'),
(41, 'NODG4.2', '', 1, '', 'NODG3.2,NSPV4.2');

-- --------------------------------------------------------

--
-- Table structure for table `chm_game_play_detail_tbl`
--

CREATE TABLE `chm_game_play_detail_tbl` (
  `id` int(11) NOT NULL,
  `id_game_play` varchar(100) NOT NULL,
  `id_child` int(11) NOT NULL,
  `id_question` varchar(100) NOT NULL,
  `date_time_submission` datetime NOT NULL,
  `time2answer` int(11) NOT NULL,
  `pass` varchar(25) DEFAULT NULL,
  `synced` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chm_game_play_tbl`
--

CREATE TABLE `chm_game_play_tbl` (
  `id` int(11) NOT NULL,
  `id_game_play` varchar(100) NOT NULL,
  `id_game` varchar(100) NOT NULL,
  `id_child` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `hints` int(11) NOT NULL DEFAULT '0',
  `synced` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_monthlygameplaysessions_childvise_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_monthlygameplaysessions_childvise_view` (
`id_child` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`Month` int(2)
,`Year` int(4)
,`GameplaySessionsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_monthlygameplaysessions_orgvise_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_monthlygameplaysessions_orgvise_view` (
`Organization` varchar(256)
,`Month` int(2)
,`Year` int(4)
,`GameplaySessionsCount` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_monthlygameplaysessions_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_monthlygameplaysessions_view` (
`Month` int(2)
,`Year` int(4)
,`GameplaySessionsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `chm_question_master_tbl`
--

CREATE TABLE `chm_question_master_tbl` (
  `id` int(11) NOT NULL,
  `id_question` varchar(100) NOT NULL,
  `id_game` varchar(100) NOT NULL,
  `description` varchar(512) NOT NULL,
  `id_question_type` int(11) NOT NULL,
  `id_micro_concept` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_totalsessionspergame_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_totalsessionspergame_view` (
`GameId` varchar(100)
,`PlaySessions` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_totalsessiontimepergameplay_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_totalsessiontimepergameplay_view` (
`id_game_play` varchar(100)
,`childid` int(11)
,`date_played` date
,`total_session_time` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_total_games_played_with_gameid`
-- (See below for the actual view)
--
CREATE TABLE `chm_total_games_played_with_gameid` (
`DeviceId` varchar(256)
,`NAME` varchar(256)
,`Organization` varchar(256)
,`TotalGames` bigint(21)
,`GameIds` text
,`PlayDate` date
,`Month` int(2)
,`Year` int(4)
,`TotalPlayTime` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `chm_walletscore_tbl`
--

CREATE TABLE `chm_walletscore_tbl` (
  `id` int(11) NOT NULL,
  `id_child` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `datetime_lastupdated` datetime NOT NULL,
  `synced` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `chm_weeklygameplaysessions_perdevice_view`
-- (See below for the actual view)
--
CREATE TABLE `chm_weeklygameplaysessions_perdevice_view` (
`DeviceId` varchar(256)
,`Users` bigint(21)
,`Week` int(2)
,`WeekStartDate` date
,`Year` int(4)
,`GameplaySessionsWeeklyCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `concept_tbl`
--

CREATE TABLE `concept_tbl` (
  `id_concept` int(11) NOT NULL,
  `description` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concept_tbl`
--

INSERT INTO `concept_tbl` (`id_concept`, `description`) VALUES
(1, 'Number Sense'),
(2, 'Number Operations'),
(3, 'Shapes'),
(4, 'Measurements'),
(5, 'Data Handling');

-- --------------------------------------------------------

--
-- Table structure for table `device_accesstoken_tbl`
--

CREATE TABLE `device_accesstoken_tbl` (
  `id` int(11) NOT NULL,
  `access_token` varchar(256) NOT NULL,
  `deviceid` varchar(256) NOT NULL,
  `devicetype` varchar(256) DEFAULT NULL,
  `id_child` int(11) NOT NULL,
  `created_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ekstepevent_interact_tbl`
--

CREATE TABLE `ekstepevent_interact_tbl` (
  `eventdataid` int(11) NOT NULL,
  `id_child` int(11) NOT NULL,
  `id_game_play` varchar(100) NOT NULL,
  `id_question` varchar(100) NOT NULL,
  `ekstep_eventid` varchar(256) NOT NULL,
  `date_time_event` datetime NOT NULL,
  `event_type` varchar(256) DEFAULT NULL,
  `res_id` varchar(256) DEFAULT NULL,
  `synced` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `emrp_active_users_view`
-- (See below for the actual view)
--
CREATE TABLE `emrp_active_users_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Grade` varchar(30)
,`Language` varchar(60)
,`SchoolType` varchar(100)
,`Organization` varchar(256)
,`District` varchar(256)
,`Created_Datetime` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `emrp_dailyregistration_view`
-- (See below for the actual view)
--
CREATE TABLE `emrp_dailyregistration_view` (
`RegDate` date
,`RegistrationCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `emrp_monthlyregistration_orgvise_view`
-- (See below for the actual view)
--
CREATE TABLE `emrp_monthlyregistration_orgvise_view` (
`Organization` varchar(256)
,`RegMonth` int(2)
,`RegYear` int(4)
,`RegistrationCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `emrp_monthlyregistration_view`
-- (See below for the actual view)
--
CREATE TABLE `emrp_monthlyregistration_view` (
`RegMonth` int(2)
,`RegYear` int(4)
,`RegistrationCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `emrp_schooltypewisechildcount_view`
-- (See below for the actual view)
--
CREATE TABLE `emrp_schooltypewisechildcount_view` (
`schooltypeid` tinyint(1)
,`School Type` varchar(100)
,`Child Count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `emrp_weeklyregistration_view`
-- (See below for the actual view)
--
CREATE TABLE `emrp_weeklyregistration_view` (
`RegWeek` int(2)
,`RegYear` int(4)
,`RegistrationCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `game_master_tbl`
--

CREATE TABLE `game_master_tbl` (
  `idg` int(11) NOT NULL,
  `id_game` varchar(100) NOT NULL,
  `game_description` varchar(512) NOT NULL,
  `id_grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game_master_tbl`
--

INSERT INTO `game_master_tbl` (`idg`, `id_game`, `game_description`, `id_grade`) VALUES
(1, 'NSF1.1A-G1', 'Identifying equal parts', 1),
(2, 'SSR2.1A-G1', 'Spatial Understanding - far,near,thin,thick,above,below,under,on,big,small,inside,outside,higher,lower', 1),
(3, 'SSR2.1B-G1', 'Spatial understanding - Tall, short, narrow,wide, fat, thin, thick', 1),
(4, 'ML2.2-G1', 'Seriates using length', 1),
(5, 'ML2.3-G1', 'Measure using non-standard units', 1),
(6, 'MW3.1-G1', 'Compares weight - heavy,light', 1),
(7, 'MW3.2A-G1', 'Compares weight using measuring scale', 1),
(8, 'MT5.1-G1', 'Sequencing activities - events in the day', 1),
(9, 'MT5.2-G1', 'Days of the Week', 1),
(10, 'MT5.4-G1', 'Months of the year', 1),
(11, 'NSF1.1A-G2', 'Identifying equal parts', 2),
(12, 'SSR2.1A-G2', 'Spatial Understanding - far,near, thin, thick,above,below,under,on, big ,small,inside,outside, higher,lower ', 2),
(13, 'SSR2.1B-G2', 'Spatial understanding - Tall, short, narrow,wide, fat, thin, thick', 2),
(14, 'ML2.2-G2', 'Seriates using length', 2),
(15, 'ML2.3-G2', 'Measure using non-standard units', 2),
(16, 'MW3.1-G2', 'Compares weight - heavy,light', 2),
(17, 'MW3.2A-G2', 'Compares weight using measuring scale', 2),
(18, 'MT5.1-G2', 'Sequencing activities - events in the day', 2),
(19, 'MT5.2-G2', 'Days of the Week', 2),
(20, 'MT5.4G2', 'Months of the year', 2),
(21, 'MT6.1-G2', 'Parts of calendar', 2),
(22, 'MT6.2-G2', 'Reading a calendar ', 2),
(23, 'NSF1.1B-G3', 'Select the missing part - Parts and whole', 2),
(24, 'NSF1.2A-G3', 'Select the part that is one fourth,half,three fourth of the whole', 2),
(25, 'NSF1.2B-G3', 'What fraction of the whole does colored part represent?', 2),
(26, 'NSF1.2C-G3', 'Color the parts to represent 1/4,1/2,3/4 of the whole', 2),
(27, 'ML2.4A-G3', 'Measure length using standard unit', 2),
(28, 'ML2.4B-G3', 'Measure length using standard unit', 2),
(29, 'MW3.2B-G3', 'Simple balance - measuring objects using non standard', 2),
(30, 'MW3.2C-G3', 'Measuring weight - non standard ', 2),
(31, 'MW3.2D-G3', 'Measuring weight - non standard ', 2),
(32, 'MW3.3A-G3', 'Measuring weight - Standard unit-gram', 2),
(33, 'MW3.3B1-G3', 'Measuring weight - Standard unit-kilogram', 2),
(34, 'MW3.3B2-G3', 'Measuring weight - Standard unit-gram+kilogram', 2),
(35, 'MT7.1-G3', 'Parts of clock', 2),
(36, 'MT7.2-G3', 'Reads the time correct to hour', 2),
(37, 'MV4.1A-G4', 'Compares using volume', 4),
(38, 'MV4.1B-G4', 'Orders using volume', 4),
(39, 'MV4.1C-G4', 'Orders using volume', 4),
(40, 'MV4.2A-G4', 'Measures using non-standard', 4),
(41, 'MV4.2B-G4', 'Measures using non-standard', 4),
(42, 'MV4.2C-G4', 'Measures using non-standard', 4),
(43, 'MV4.3A-G4', 'Measures using non-standard', 4),
(44, 'MV4.3B-G4', 'Measures using non-standard', 4),
(45, 'MV4.3C-G4', 'Measures using standard - ml, l', 4),
(47, 'NSN1.1-G1', 'Quantity Number Name association -oral number name association', 1),
(48, 'NSN1.2-G1', 'Quantity Number Name association -representation', 1),
(49, 'NSN1.3-G1', 'Quantity -Numeral association', 1),
(50, 'NSN1.4-G1', 'Numeral quantity association', 1),
(51, 'NSN1.5-G1', 'Numeral quantity association', 1),
(52, 'NSN1.6-G1', 'Numeral recognition up to 3 digit number', 1),
(53, 'NSN1.7-G1', 'Tracing the numbers', 1),
(54, 'NSS2.1-G1', 'Sequence -identifies correct sequence - single digit', 1),
(55, 'NSS2.2-G1', 'Sequence - Arranging', 1),
(56, 'NSS2.3-G1', 'Sequence - Missing numbers - single digit', 1),
(57, 'NSS2.4-G1', 'Sequence - before and after - single digit', 1),
(58, 'NSS2.5-G1', 'Sequence - between - single digit', 1),
(59, 'NSS2.6-G1', 'Sequence - missing number puzzle - 1to 20', 1),
(60, 'NSC4.1-G1', 'Comparision Greater Than  and lesser than with quantity only ', 1),
(61, 'NSC4.2-G1', 'Comparision equal to with quantity ', 1),
(62, 'NSC4.3-G1', 'Comparision >, <, = with symbol - 1 to 20', 1),
(63, 'NSC4.4-G1', 'Comparision Ascending Order - 1 to 20', 1),
(64, 'NSC4.5-G1', 'Comparision Descending Order - 1to 20', 1),
(65, 'NOA5.1-G1', 'Addition - small number - max sum is  9 - Show quantity', 1),
(66, 'NOA6.1-G1', 'Number bonds - fill in the blanks', 1),
(67, 'NOA7.1-G1', 'Addition with Place Value concrete with rods and cubes - single digit without carry', 1),
(68, 'NOA7.2-G1', 'Addition with Place Value concrete wth rods and cubes and abstract - single digit with carry', 1),
(69, 'NOS8.1-G1', 'Subtraction with quantity', 1),
(70, 'NOS9.1-G1', 'Subtraction and addition', 1),
(71, 'NOS10.1-G1', 'Subtraction with place value concrete with rods and cubes - single digit without borrow', 1),
(72, 'NOS10.2-G1', 'Subtraction with place value concrete with rods and cubes - single digits with borrow', 1),
(73, 'NOM11.1-G1', 'Multiplication using repeated addition with representation', 1),
(74, 'NOM11.2-G1', 'Multiplication using repeated addition - arranging in a matrix format ', 1),
(75, 'NOM12.3-G1', 'Multiplication Tables random numbers abstract  - - 1 to 5 tables', 1),
(76, 'NOD16.1-G1', 'Division by Repeated Subtraction - representation without remainder', 1),
(77, 'NOD16.2-G1', 'Division by Repeated Subtraction - representation with remainder', 1),
(78, 'NSS2.1-G2', 'Sequence -identifies correct sequence - two digit', 2),
(79, 'NSS2.2-G2', 'Sequence -identifies correct sequence - two digit', 2),
(80, 'NSS2.3-G2', 'Sequence - missing numbers - 2 digit ', 2),
(81, 'NSS2.4-G2', 'Sequence - before and after - 2 digit', 2),
(82, 'NSS2.5-G2', 'Sequence - between -2 digit', 2),
(83, 'NSS2.6-G2', 'Sequence - missing number puzzle - 21 to 99', 2),
(84, 'NSPV3.1-G2', 'Place Value - Expansion form - 2 digit number', 2),
(85, 'NSPV3.2-G2', 'Place Value - Identify the place value of a given digit in a number - 2 digit number', 2),
(86, 'NSC4.3-G2', 'Comparision >, <, = with symbol  - 21- 99', 2),
(87, 'NSC4.4-G2', 'Comparision Ascending Order  - 21 to 99', 2),
(88, 'NSC4.5-G2', 'Comparision Descending Order - 21 to 99', 2),
(89, 'NSC4.6-G2', 'Form biggest and smallest number from given digits - 2 digits', 2),
(90, 'NOA7.1-G2', 'Addition with Place Value concrete with rods and cubes - without carry 2 digit', 2),
(91, 'NOA7.2-G2', 'Addition with Place Value concrete wth rods and cubes and abstract - 2 digit with carry', 2),
(92, 'NOS10.1-G2', 'Subtraction with place value concrete with rods and cubes - two digits without borrow', 2),
(93, 'NOS10.2-G2', 'Subtraction with place value concrete with rods and cubes - two digits with borrow', 2),
(94, 'NOM12.1-G2', 'Multiplication Tables with representation and abstract', 2),
(95, 'NOM12.2-G2', 'Multiplication Tables abstract with fill in the blanks', 2),
(96, 'NOM12.3-G2', 'Multiplication Tables random numbers abstract  - 6 & 7 tables', 2),
(97, 'NOD15.1-G2', 'Equal distribution - representation without remainder', 2),
(98, 'NOD15.2-G2', 'Equal distribution - representation without remainder', 2),
(99, 'NOD16.1-G2', 'Division by Repeated Subtraction - representation without remainder', 2),
(100, 'NOD16.2-G2', 'Division by Repeated Subtraction - representation with remainder', 2),
(101, 'NOD16.3-G2', 'Division using multipication facts ', 2),
(102, 'NOD17.2-G2', 'Division without remainder 2 digit number', 2),
(103, 'NOD17.3-G2', 'Division with remainder representation - 2 digit number', 2),
(104, 'NSS2.1-G3', 'Sequence -identifies correct sequence - three digit - Grade 3', 2),
(105, 'NSS2.2-G3', 'Sequence -identifies correct sequence - three digit - Grade 3', 2),
(106, 'NSS2.3-G3', 'Sequence -missing number - 3 digit', 2),
(107, 'NSS2.4-G3', 'Sequence - before and after - 3 digit', 2),
(108, 'NSS2.5-G3', 'Sequence - between -3 digit', 2),
(109, 'NSS2.6-G3', 'Sequence - missing number puzzle - 100 to 999', 2),
(110, 'NSPV3.1-G3', 'Place Value - Expansion form - 3 digit number', 2),
(111, 'NSPV3.2-G3', 'Place Value - Identify the place value of a given digit in a number - 3 digit number', 2),
(112, 'NSC4.3-G3', 'Comparision >, <, = with symbol - 100 - 999', 2),
(113, 'NSC4.4-G3', 'Comparision Ascending Order - 100- 999', 2),
(114, 'NSC4.5-G3', 'Comparision Descending Order - 100 - 999', 2),
(115, 'NSC4.6-G3', 'Form biggest and smallest number from given digits - 3 digits', 2),
(116, 'NOA7.1-G3', 'Addition with Place Value concrete with rods and cubes -without carry 3 digit', 2),
(117, 'NOA7.2-G3', 'Addition with Place Value concrete wth rods and cubes and abstract - 3 digit with carry', 2),
(118, 'NOS10.1-G3', 'Subtraction with place value concrete with rods and cubes - three digits without borrow', 2),
(119, 'NOS10.2-G3', 'Subtraction with place value concrete with rods and cubes - three digits with borrow', 2),
(120, 'NOM12.3-G3', 'Multiplication Tables random numbers abstract  - 8 & 9 tables', 2),
(121, 'NOM13.1-G3', 'Multiplication Grid - commutative law - Multiplication grid', 2),
(122, 'NOM14.1-G3', 'Long multiplication - area method representation', 2),
(123, 'NOM14.2-G3', 'Long multiplication - area method representation', 2),
(124, 'NOD16.1-G3', 'Division by Repeated Subtraction - representation without remainder', 2),
(125, 'NOD16.2-G3', 'Division by Repeated Subtraction - representation with remainder', 2),
(126, 'NOD16.3-G3', 'Division using multipication facts ', 2),
(127, 'NOD17.2-G3', 'Division without remainder 2 digit number', 2),
(128, 'NOD17.3-G3', 'Division with remainder representation - 2 digit number', 2),
(129, 'NSF1.1A-G1', 'Identifying equal parts', 1),
(130, 'NSF1.2A-G1', 'Identifying equal parts', 1),
(131, 'NSF1.2B-G1', 'Identifying equal parts', 1),
(132, 'NSF1.1A-G2', 'Identifying equal parts', 2),
(133, 'NSF1.2A-G2', 'Identifying equal parts', 2),
(134, 'NSF1.2B-G2', 'Identifying equal parts', 2),
(135, 'NSF1.1B-G3', 'Identifying equal parts', 3),
(136, 'NSF1.3A-G3', 'Identifying equal parts', 3),
(137, 'NSF1.3B-G3', 'Identifying equal parts', 3),
(138, 'NSF1.4-G3', 'Select the part that is one fourth,half,three fourth of the whole', 3),
(139, 'NSS2.1A-G1', 'Identify the sequence –backward counting', 1),
(140, 'NSS2.2A-G1', 'Arrange the sequence – backward counting', 1),
(141, 'NSS2.3A-G1', 'Backward counting – missing number', 1),
(142, 'NSS2.4A-G1', 'Before and After number – Backward counting', 1),
(143, 'NSS2.5A-G1', 'Middle number backward', 1),
(144, 'NSS2.1A-G2', 'Identify the sequence –backward counting', 2),
(145, 'NSS2.2A-G2', 'Arrange the sequence – backward counting', 2),
(146, 'NSS2.3A-G2', 'Backward counting – missing number', 2),
(147, 'NSS2.4A-G2', 'Before and After number – Backward counting', 2),
(148, 'NSS2.5A-G2', 'Middle number backward', 2),
(149, 'NSS2.1A-G3', 'Identify the sequence –backward counting', 3),
(150, 'NSS2.2A-G3', 'Arrange the sequence – backward counting', 3),
(151, 'NSS2.3A-G3', 'Backward counting – missing number', 3),
(152, 'NSS2.4A-G3', 'Before and After number – Backward counting', 3),
(153, 'NSS2.5A-G3', 'Middle number backward', 3),
(154, 'NSS2.7-G3', 'Skip counting – forward – multiples of 2,4,5,10', 3),
(155, 'NSS2.7A-G3', 'Skip counting – backward – multiples of 2,4,5,10', 3),
(156, 'NSPV3.1A-G1', 'Units and grouping by tens', 1),
(157, 'NSPV3.1B-G1', 'Tens and 1’s', 1),
(158, 'NSC4.1A-G1', 'One on one correspondence', 1),
(159, 'NSC4.2A-G2', 'Concrete comparison of 2 digits', 2),
(160, 'NSC4.2A-G3', 'Concrete comparison of 3 digits', 3),
(161, 'SG1.1.1-G1', '', 1),
(162, 'SG2.1.1-G1', '', 1),
(163, 'SG2.2.1-G1', '', 1),
(164, 'SG3.1.1-G1', '', 1),
(165, 'SG3.2.1-G1', '', 1),
(166, 'SG4.1.1-G1', '', 1),
(167, 'SG4.2.1-G1', '', 1),
(168, 'SG5.1.2-G2', '', 2),
(169, 'SG7.1.2-G2', '', 2),
(170, 'SG7.2.2-G2', '', 2),
(171, 'SG7.2.2x-G2', '', 2),
(172, 'SG8.1.2-G2', '', 2),
(173, 'SG8.2.2-G2', '', 2),
(174, 'SG8.2.2x-G2', '', 2),
(175, 'SG11.1.3-G3', '', 3),
(176, 'SG12.1.3-G3', '', 3),
(177, 'SG14.1.3-G3', '', 3),
(178, 'SG15.1.3-G3', '', 3),
(179, 'SG15.2.3-G3', '', 3),
(180, 'SG16.1.4-G4', '', 4),
(181, 'SG17.1.4-G4', '', 4),
(182, 'SG20.1.4-G4', '', 4),
(183, 'SG20.2.4-G4', '', 4),
(184, 'SG24.1.4-G4', '', 4),
(185, 'SG24.2.4-G4', '', 4),
(186, 'SG21.1.5-G5', '', 5),
(187, 'SG21.2.5-G5', '', 5),
(188, 'SG21.3.5-G5', '', 5),
(189, 'SG22.1.5-G5', '', 5),
(190, 'SG23.1.5-G5', '', 5),
(191, 'SG21.3.6-G5', '', 5),
(192, 'NSF1.4-G4', '', 4),
(193, 'NSF2.4-G4', '', 4),
(194, 'NSF3.4-G4', '', 4),
(195, 'NSF1.5-G5', '', 5),
(196, 'NSF2.5-G5', '', 5),
(197, 'NSF3.5-G5', '', 5),
(198, 'NSF4.5-G5', '', 5),
(199, 'NSF5.5-G5', '', 5),
(200, 'NSD1.5-G5', '', 5),
(201, 'NSD2.5-G5', '', 5),
(202, 'NSD4.5-G5', '', 5),
(203, 'NSD5.5-G5', '', 5),
(204, 'NSD6.5-G5', '', 5),
(205, 'NOLDG1-G4', '', 5),
(206, 'NOLDG1-G5', '', 5),
(207, 'NOLMG1-G4', '', 5),
(208, 'NOLMG1-G5', '', 5),
(209, 'DHDCG1-G4', '', 5),
(210, 'DHDCG1-G5', '', 5),
(211, 'DHDTG1-G4', '', 5),
(212, 'DHDTG1-G5', '', 5),
(213, 'NSNPG1.3-G4', '', 5),
(214, 'NSNPG1.3-G5', '', 5),
(215, 'NSNPG1.5-G4', '', 5),
(216, 'NSNPG1.5-G5', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `game_play_detail_tbl`
--

CREATE TABLE `game_play_detail_tbl` (
  `id_game_play_detail` int(11) NOT NULL,
  `id_game_play` varchar(100) NOT NULL,
  `id_child` int(11) NOT NULL,
  `id_question` varchar(100) NOT NULL,
  `date_time_submission` datetime NOT NULL,
  `time2answer` int(11) NOT NULL,
  `pass` varchar(25) DEFAULT NULL,
  `attempts` int(11) DEFAULT NULL,
  `synced` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game_play_tbl`
--

CREATE TABLE `game_play_tbl` (
  `idgp` int(11) NOT NULL,
  `id_game_play` varchar(100) NOT NULL,
  `id_game` varchar(100) NOT NULL,
  `id_child` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `synced` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grade_tbl`
--

CREATE TABLE `grade_tbl` (
  `id_grade` int(11) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade_tbl`
--

INSERT INTO `grade_tbl` (`id_grade`, `description`) VALUES
(1, '1st Grade'),
(2, '2nd Grade'),
(3, '3rd Grade'),
(4, '4th Grade'),
(5, '5th Grade'),
(6, '6th Grade'),
(7, '7th Grade'),
(8, '8th Grade'),
(9, '9th Grade');

-- --------------------------------------------------------

--
-- Table structure for table `language_tbl`
--

CREATE TABLE `language_tbl` (
  `id_language` int(11) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language_tbl`
--

INSERT INTO `language_tbl` (`id_language`, `description`) VALUES
(1, 'Kannada'),
(2, 'Hindi'),
(3, 'English'),
(4, 'Odiya'),
(5, 'Gujarati'),
(6, 'Marathi'),
(7, 'Telugu'),
(8, 'Tamil'),
(9, 'Urdu');

-- --------------------------------------------------------

--
-- Table structure for table `microconcept_group_tbl`
--

CREATE TABLE `microconcept_group_tbl` (
  `idmcg` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  `id_concept` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `microconcept_group_tbl`
--

INSERT INTO `microconcept_group_tbl` (`idmcg`, `description`, `id_concept`) VALUES
(1, 'Numbers', 1),
(2, 'Sequence', 1),
(3, 'Comparision', 1),
(4, 'Place Value', 1),
(5, 'Fractions', 1),
(6, 'Number patterns', 1),
(7, 'Decimals', 1),
(8, 'Spatial Reln', 3),
(9, 'Solid shapes', 3),
(10, 'Flat shapes', 3),
(11, 'Patterns in shapes', 3),
(12, 'Mensuration', 3),
(13, 'Money', 4),
(14, 'Length', 4),
(15, 'Weight', 4),
(16, 'Volume', 4),
(17, 'Time', 4),
(18, 'Data Collection', 5),
(19, 'Data Tabulation', 5),
(20, 'Data Representation', 5),
(21, 'Data Interpretation', 5),
(22, 'Addition', 2),
(23, 'Subtraction', 2),
(24, 'Multiplication', 2),
(25, 'Division', 2);

-- --------------------------------------------------------

--
-- Table structure for table `micro_concept_tbl`
--

CREATE TABLE `micro_concept_tbl` (
  `id_micro_concept` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `id_concept` int(11) NOT NULL,
  `idmcg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `micro_concept_tbl`
--

INSERT INTO `micro_concept_tbl` (`id_micro_concept`, `description`, `id_concept`, `idmcg`) VALUES
(1, 'Number - Fractions - Compare Fractions', 1, 1),
(2, 'Number - Fractions - Equivalent Fractions', 1, 1),
(3, 'Number - Fractions - Part of a whole object (2D shapes) - Fractions', 1, 1),
(4, 'Number - Fractions to Quantities - Volume', 1, 1),
(5, 'Number - Fractions to Quantities - Weight', 1, 1),
(6, 'Number Fractions - Fractions in collection of objects', 1, 1),
(7, 'Number Fractions - Fractions with Quantity and Pictures', 1, 1),
(8, 'Number Fractions - Greater Than, Equal to and lesser than with Fractional numbers', 1, 1),
(9, 'Number Comparision - Form biggest, smallest number from given set of digits', 1, 3),
(10, 'Number Comparision - Greater Than, Equal to and lesser than with Numbers only', 1, 3),
(11, 'Number Comparision - Greater Than, Equal to and lesser than with Quantity only', 1, 3),
(12, 'Number Decimals - Representation of Decimal numbers using Math TLMs', 1, 7),
(13, 'Number Decimals - Rounding off the Decimal numbers to the closest next place value', 1, 7),
(14, 'Number Patterns - Number patterns with logic', 1, 6),
(15, 'Number Patterns - Observes and extends patterns in sequence of number.', 1, 6),
(16, 'Number Patterns - Skip counting using number patterns', 1, 6),
(17, 'Number Place Value - Counts and regroups objects into tens and ones', 1, 4),
(18, 'Number Place Value - Identify place value for a given number', 1, 4),
(19, 'Number Place Value - Identify place value for a given number using math TLMs', 1, 4),
(20, 'Number Place Value - Place Value for Decimal numbers', 1, 4),
(21, 'Number place Value - Representation in Units,Tens,Hundreds', 1, 4),
(22, 'Number PlaceValue - Expansion form and Short form of numbers', 1, 4),
(23, 'Number Sense - Decimals using pictures', 1, 7),
(24, 'Number Sense - Fractions using pictures', 1, 5),
(25, 'Number sense - Numeral quantity association', 1, 1),
(26, 'Number sense -Quantity Numeral  association', 1, 1),
(27, 'Number Sense - Odd Number and Even Numbers', 1, 1),
(28, 'Number Sense - Relate Fractions to Decimal numbers and vice versa', 1, 7),
(29, 'Number Sense- Oral number name association', 1, 1),
(30, 'Number Sequence - Backward', 1, 2),
(31, 'Number Sequence - Before and After', 1, 2),
(32, 'Number Sequence - Between', 1, 2),
(33, 'Number Sequence - Missing number', 1, 2),
(34, 'Number Sequence - Skip counting', 1, 2),
(35, 'Number Sequence-Greater Than and lesser than', 1, 2),
(36, 'Number Sequence-Arranging in Ascending or Descending order', 1, 2),
(37, 'Number Sequence-Identify and Represent number sequence', 1, 2),
(38, 'Number Operations - Add using pictures', 2, 22),
(39, 'Number Operations - Addition - word problem', 2, 22),
(40, 'Number Operations - Addition of  numbers having a Zero digit in it', 2, 22),
(41, 'Number Operations - Addition with Carry (Abstract)', 2, 22),
(42, 'Number Operations - Addition with Place Value using the TLMs in Kit (with carry)', 2, 22),
(43, 'Number Operations- Addition with Place Value using the TLMs in Kit (without carry)', 2, 22),
(44, 'Number Operations - Addition without Carry (Abstract)', 2, 22),
(45, 'Number Operations - Collection of objects and number recognition (collection to Numbers and visa versa)', 2, 22),
(46, 'Number Operations - Commutative property of Addition (a+b=b+a)', 2, 22),
(47, 'Number Operations - Factors and Multiples', 2, 24),
(48, 'Number Operations - Grouping by Tens', 2, 22),
(49, 'Number Operations - Division with repeated subtraction', 2, 25),
(50, 'Number Operations - Long Division with Reminder', 2, 25),
(51, 'Number Operations - Long Division without Reminder', 2, 25),
(52, 'Number Operations - Division - word problem', 2, 25),
(53, 'Number Operations - Division by Multiplication (a/b=c then a=bxc)', 2, 25),
(54, 'Number Operations - Division using the TLM (Money, Base 10 block, counters)', 2, 25),
(55, 'Number Operations - Long Multiplication (Abstract)', 2, 24),
(56, 'Number Operations - Mental Math - Add multiples of 100s, 10s', 2, 24),
(57, 'Number Operations - Mental Math - Subtract multiples of 10, 100s', 2, 24),
(58, 'Number Operations - Multiplication - Repeated Addition', 2, 24),
(59, 'Number Operations - Multiplication - area method (TLM)', 2, 24),
(60, 'Number Operations - Multiplication - commutative law (axb=bxa)', 2, 24),
(61, 'Number Operations - Multiplication - word problem', 2, 24),
(62, 'Number Operations - Multiply and Divide by 10s, 100s and 1000s', 2, 24),
(63, 'Number Operations - Number Bonds - Addition', 2, 22),
(64, 'Number Operations - Number Bonds - Subtraction', 2, 23),
(65, 'Number Operations - Subtraction - word problem', 2, 23),
(66, 'Number Operations - Subtraction of  numbers having a Zero digit in it', 2, 23),
(67, 'Number Operations - Subtraction with Borrow (Abstratct)', 2, 23),
(68, 'Number Operations - Subtraction with Place Value using the TLMs in Kit (with borrow)', 2, 23),
(69, 'Number Operations - Subtraction with Place Value using the TLMs in Kit (without borrow)', 2, 23),
(70, 'Number Operations - Subtraction without Borrow (Abstratct)', 2, 23),
(71, 'Measurements  - Length  -Convert larger units to smaller units and vice versa - Length', 4, 14),
(72, 'Measurements - Length - Seriates using length', 4, 14),
(73, 'Measurements - Length Measure using non-standard units', 4, 14),
(74, 'Measurements- Length Measure length using standard unit', 4, 14),
(75, 'Measurements - Length Word Problem - Measurements - Four Arithmetic operations on Length', 4, 14),
(76, 'Measurements - Money - Convert larger units to smaller units and vice versa - Money', 4, 13),
(77, 'Measurements - Money - Decimals and Fractions in Money', 4, 13),
(78, 'Measurements - Money - Identify Currency Notes and Coins', 4, 13),
(79, 'Measurements - Money - Rate Chart or Invoice or expense sheet - Money', 4, 13),
(80, 'Measurements - Money - Word Problem - Measurements - Money', 4, 13),
(81, 'Measurements - Money-Tabulation using Money  (word problem)', 4, 13),
(82, 'Measurements - Time - Days of the Week', 4, 17),
(83, 'Measurements - Time -Seasons', 4, 17),
(84, 'Measurements - Time -Months of the year', 4, 17),
(85, 'Measurements - Time -Parts of calendar', 4, 17),
(86, 'Measurements - Time -Reading a calendar ', 4, 17),
(87, 'Measurements - Time - Parts of the clock', 4, 17),
(88, 'Measurements - Time - Read Time', 4, 17),
(89, 'Measurements  - Time - AM and PM in Time', 4, 17),
(90, 'Measurements - Time - Subtraction of Time', 4, 17),
(91, 'Measurements - Time - Week, Month and Year concepts', 4, 17),
(92, 'Measurements - Time - Word Problem - Measurements - Time', 4, 17),
(93, 'Measurements - Time-Convert 24 hours to 12 hours and vice versa', 4, 17),
(94, 'Measurements- Time - Addition of Time', 4, 17),
(95, 'Measurements - Volume - Compares using volume', 4, 16),
(96, 'Measurements - Volume - Orders using volume', 4, 16),
(97, 'Measurements - Volume - Measures using non-standard', 4, 16),
(98, 'Measurements - Volume - Measures using standard', 4, 16),
(99, 'Measurements - Volume - Convert larger units to smaller units and vice versa - Volume', 4, 16),
(100, 'Measurements - Volume - Word Problem - Measurements - Volume', 4, 16),
(101, 'Measurements - Volume -Decimals and Fractions in Volume', 4, 16),
(102, 'Measurements - Weight - Word Problem - Measurements - Weight', 4, 15),
(103, 'Measurements  - Weight - Convert larger units to smaller units  and vice versa - Weight', 4, 15),
(104, 'Measurements  - Weight -Compares weight - heavy,light', 4, 15),
(105, 'Measurements  - Weight -Compares weight using measuring scale', 4, 15),
(106, 'Measurements  - Weight -Simple balance - measuring objects using non standard', 4, 15),
(107, 'Measurements  - Weight -Measuring weight - non standard', 4, 15),
(108, 'Measurements  - Weight-Measuring weight - standard', 4, 15),
(109, 'Measurements Length  - Decimals and Fractions in Length', 4, 14),
(110, 'Measurements-Length - Tabulation using Length  (word problem)', 4, 14),
(111, 'Shapes- 2-D shapes attributes', 3, 10),
(112, 'Shapes - Spatial relation shapes - up, down, inside, outside, above, below, near, far, before and after, on and in', 3, 8),
(113, 'Shapes - Spatial relation Numbers - more, less, near, far, before and after', 3, 8),
(114, 'Shapes - 3-D shapes attributes', 3, 9),
(115, 'Shapes - 3-D shapes and 2-D shapes relationship', 3, 9),
(116, 'Shapes - 2-D shapes - Area', 3, 12),
(117, 'Shapes - sequence -Observes and extends patterns in sequence of shapes', 3, 11),
(118, 'Shapes - Fractions -Shade tiles in a collection of tiles to show fraction', 3, 11),
(119, 'Shapes - Symmetry and mirror image', 3, 11),
(120, 'Shapes - Angles', 3, 12),
(121, 'Shapes - Tangrams', 3, 12),
(122, 'Shapes - Mesuration (Area, perimeter, circumference, radius, diameter etc)', 3, 12),
(123, 'Shapes - Identify 3D objects (pictures)', 3, 9),
(124, 'Shapes - Identify 2-D shapes (pictures)', 3, 10),
(125, 'Data Handling - Data Representation - Graphs - Understand and answer the question (word problem)', 5, 20),
(126, 'Data Handling - Collection - Understand and answer the question  (word problem)', 5, 18),
(127, 'Data Handling - Interpretation - Understand and answer the question  (word problem)', 5, 21);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_activedevices_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_activedevices_view` (
`DeviceId` varchar(256)
,`Users` bigint(21)
,`Week1` bigint(21)
,`Week2` bigint(21)
,`Week3` bigint(21)
,`Week4` bigint(21)
,`TotalSessionsCount` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_attemptssummaryallgames_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_attemptssummaryallgames_view` (
`attempts` int(11)
,`submissioncount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_avggameplaysessiontimeperchild_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_avggameplaysessiontimeperchild_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Grade` varchar(30)
,`Organization` varchar(256)
,`Total_Gameplay_Session_Time` decimal(54,0)
,`Number_Of_Gameplay_Sessions` bigint(21)
,`Avg_Gameplay_Session_Time` decimal(33,0)
,`date_last_played` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_childtimepergameplaysession_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_childtimepergameplaysession_view` (
`childid` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`id_game_play` varchar(100)
,`id_game` varchar(100)
,`session_start_time` datetime
,`total_session_time` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_dailygameplaysessions_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_dailygameplaysessions_view` (
`SessionDate` date
,`GameplaySessionsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_dailytotalsessiontimeperchild_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_dailytotalsessiontimeperchild_view` (
`dateplayed` date
,`DeviceId` varchar(256)
,`childid` int(11)
,`Name` varchar(256)
,`Grade` varchar(30)
,`Organization` varchar(256)
,`Total_Games_Played` bigint(21)
,`Total_Gameplay_Session_Time` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_monthlygameplaysessions_childvise_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_monthlygameplaysessions_childvise_view` (
`id_child` int(11)
,`Name` varchar(256)
,`DeviceId` varchar(256)
,`Organization` varchar(256)
,`Month` int(2)
,`Year` int(4)
,`GameplaySessionsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_monthlygameplaysessions_orgvise_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_monthlygameplaysessions_orgvise_view` (
`Organization` varchar(256)
,`Month` int(2)
,`Year` int(4)
,`GameplaySessionsCount` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_monthlygameplaysessions_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_monthlygameplaysessions_view` (
`Month` int(2)
,`Year` int(4)
,`GameplaySessionsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_questionsubmissionsandattemptscounts_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_questionsubmissionsandattemptscounts_view` (
`QuestionID` varchar(100)
,`totalsubmissions` bigint(21)
,`submissionswith4ormoreattempts` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_questionswithfourormoreattempts_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_questionswithfourormoreattempts_view` (
`QuestionID` varchar(100)
,`totalsubmissions` bigint(21)
,`submissionswith4ormoreattempts` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_totalsessionspergame_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_totalsessionspergame_view` (
`GameId` varchar(100)
,`PlaySessions` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_totalsessiontimepergameplay_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_totalsessiontimepergameplay_view` (
`id_game_play` varchar(100)
,`childid` int(11)
,`date_played` date
,`total_session_time` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_total_games_played_with_gameid`
-- (See below for the actual view)
--
CREATE TABLE `prm_total_games_played_with_gameid` (
`DeviceId` varchar(256)
,`NAME` varchar(256)
,`Organization` varchar(256)
,`TotalGames` bigint(21)
,`GameIds` text
,`PlayDate` date
,`MONTH` int(2)
,`YEAR` int(4)
,`TotalPlayTime` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `prm_weeklygameplaysessions_perdevice_view`
-- (See below for the actual view)
--
CREATE TABLE `prm_weeklygameplaysessions_perdevice_view` (
`DeviceId` varchar(256)
,`Users` bigint(21)
,`Week` int(2)
,`WeekStartDate` date
,`Year` int(4)
,`GameplaySessionsWeeklyCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_log_tbl`
--

CREATE TABLE `push_notification_log_tbl` (
  `id` int(11) NOT NULL,
  `id_child` int(11) NOT NULL,
  `notification_type` varchar(50) NOT NULL,
  `sent_datetime` datetime NOT NULL,
  `delivery_status` enum('sent','failed') NOT NULL DEFAULT 'sent',
  `fcm_message_id` varchar(255) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `fcm_token_used` varchar(512) DEFAULT NULL,
  `id_language` tinyint(4) DEFAULT NULL,
  `opened_datetime` datetime DEFAULT NULL,
  `is_opened` tinyint(1) NOT NULL DEFAULT '0',
  `cron_run_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_messages_tbl`
--

CREATE TABLE `push_notification_messages_tbl` (
  `id` int(11) NOT NULL,
  `notification_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'e.g. inactive_3days, inactive_7days',
  `id_language` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_notification_messages_tbl`
--

INSERT INTO `push_notification_messages_tbl` (`id`, `notification_type`, `id_language`, `title`, `body`) VALUES
(1, 'inactive_3days', 1, 'ನಿಮ್ಮನ್ನು ಮಿಸ್ ಮಾಡ್ತಿದ್ದೇವೆ!', '3 ದಿನಗಳಿಂದ ನಿಮ್ಮನ್ನು ನೋಡಿಲ್ಲ! ಹಿಂದಿರುಗಿ ಬನ್ನಿ ಮತ್ತು ಗಣಿತ ಅಭ್ಯಾಸ ಮಾಡಿ.'),
(2, 'inactive_3days', 2, 'आपको याद किया जा रहा है!', '3 दिनों से आपको नहीं देखा! वापस आएं और गणित का अभ्यास करें।'),
(3, 'inactive_3days', 3, 'We\'ve been missing you!', 'It\'s been 3 days! Come back and keep your math skills sharp.'),
(4, 'inactive_3days', 4, 'ଆପଣଙ୍କୁ ମିସ୍ କରୁଛୁ!', '3 ଦିନ ହୋଇଗଲା! ଫେରି ଆସନ୍ତୁ ଏବଂ ଗଣିତ ଅଭ୍ୟାସ ଜାରି ରଖନ୍ତୁ।'),
(5, 'inactive_3days', 5, 'તમારી રાહ જોઈ રહ્યા છીએ!', '3 દિવસ થઈ ગયા! પાછા આવો અને ગણિત પ્રેક્ટિસ ચાલુ રાખો।'),
(6, 'inactive_3days', 6, 'तुमची आठवण येत आहे!', '3 दिवस झाले! परत या आणि गणिताचा सराव सुरू ठेवा।'),
(7, 'inactive_3days', 7, 'మీ కోసం ఎదురు చూస్తున్నాం!', '3 రోజులైంది! తిరిగి రండి మరియు గణిత సాధన కొనసాగించండి.'),
(8, 'inactive_3days', 8, 'உங்களை காத்திருக்கிறோம்!', '3 நாட்கள் ஆகிவிட்டது! திரும்பி வாருங்கள் மற்றும் கணித பயிற்சி தொடருங்கள்.'),
(9, 'inactive_3days', 9, 'آپ کی یاد آ رہی ہے!', '3 دن ہو گئے! واپس آئیں اور ریاضی کی مشق جاری رکھیں۔'),
(10, 'inactive_7days', 1, 'ನಿಮ್ಮನ್ನು ನೋಡಾಲಾಗಲಿಲ್ಲ!', 'ಒಂದು ವಾರ ಆಯಿತು! ಹಿಂದಿರುಗಿ ಬನ್ನಿ ಮತ್ತು ಗಣಿತ ಅಭ್ಯಾಸ ಮಾಡಿ - ನಿಮ್ಮ ಸ್ಟ್ರೀಕ್ ಕಾಯುತ್ತಿದೆ!'),
(11, 'inactive_7days', 2, 'आपकी बहुत याद आ रही है!', 'एक हफ्ता हो गया! वापस आएं और गणित का अभ्यास करें - आपकी स्ट्रीक इंतजार कर रही है!'),
(12, 'inactive_7days', 3, 'We miss you!', 'A whole week! Come back and practice your math - your streak is waiting for you!'),
(13, 'inactive_7days', 4, 'ଆମେ ଆପଣଙ୍କୁ ମିସ୍ କରୁଛୁ!', 'ଏକ ସପ୍ତାହ ହୋଇଗଲା! ଫେରି ଆସନ୍ତୁ ଏବଂ ଗଣିତ ଅଭ୍ୟାସ କରନ୍ତୁ - ଆପଣଙ୍କ ସ୍ଟ୍ରୀକ୍ ଅପେକ୍ଷା କରୁଛି!'),
(14, 'inactive_7days', 5, 'અમે તમને ખૂબ યાદ કરીએ છીએ!', 'એક અઠવાડિયું થઈ ગયું! પાછા આવો અને ગણિત પ્રેક્ટિસ કરો - તમારી સ્ટ્રીક રાહ જુએ છે!'),
(15, 'inactive_7days', 6, 'आम्ही तुम्हाला मिस करत आहोत!', 'एक आठवडा झाला! परत या आणि गणिताचा सराव करा - तुमची स्ट्रीक वाट पाहत आहे!'),
(16, 'inactive_7days', 7, 'మీరు మాకు గుర్తొచ్చారు!', 'ఒక వారం అయింది! తిరిగి రండి మరియు గణిత సాధన చేయండి - మీ స్ట్రీక్ మీ కోసం వేచి ఉంది!'),
(17, 'inactive_7days', 8, 'நாங்கள் உங்களை நினைக்கிறோம்!', 'ஒரு வாரம் ஆகிவிட்டது! திரும்பி வாருங்கள் - உங்கள் ஸ்ட்ரீக் காத்திருக்கிறது!'),
(18, 'inactive_7days', 9, 'ہم آپ کو بہت یاد کرتے ہیں!', 'ایک ہفتہ ہو گیا! واپس آئیں اور ریاضی کی مشق کریں - آپ کی سٹریک آپ کا انتظار کر رہی ہے!'),
(19, 'inactive_14days', 1, 'ನಾವು ನಿಮ್ಮನ್ನು ಕಳೆದುಕೊಳ್ಳುತ್ತಿದ್ದೇವೆ!', '2 ವಾರಗಳಿಂದ ನೀವು ಇಲ್ಲ! ಇಂದೇ ಹಿಂದಿರುಗಿ ಬನ್ನಿ - ನಿಮ್ಮ ಗಣಿತ ಕೌಶಲ್ಯ ನಿಮ್ಮ ಹಿಂದಿರಿಗಿ ಬಾ ಎಂದು ಕಾಯುತ್ತಿದೆ!'),
(20, 'inactive_14days', 2, 'क्या आप हमें भूल गए?', '2 हफ्ते हो गए! आज ही वापस आएं - आपकी गणित की प्रतिभा आपका इंतजार कर रही है!'),
(21, 'inactive_14days', 3, 'It\'s been 2 weeks!', 'We haven\'t seen you in 2 weeks. Come back today - your math talent is waiting to shine!'),
(22, 'inactive_14days', 4, 'ଆପଣ ଆମକୁ ଭୁଲି ଯାଇଛନ୍ତି କି?', '2 ସପ୍ତାହ ହୋଇଗଲା! ଆଜି ଫେରି ଆସନ୍ତୁ - ଆପଣଙ୍କ ଗଣିତ ପ୍ରତିଭା ଅପେକ୍ଷା କରୁଛି!'),
(23, 'inactive_14days', 5, 'શું તમે અમને ભૂલી ગયા?', '2 અઠવાડિયા થઈ ગયા! આજે જ પાછા આવો - તમારી ગણિત પ્રતિભા રાહ જુએ છે!'),
(24, 'inactive_14days', 6, 'तुम्ही आम्हाला विसरलात का?', '2 आठवडे झाले! आजच परत या - तुमची गणित प्रतिभा वाट पाहत आहे!'),
(25, 'inactive_14days', 7, 'మీరు మాకు మర్చిపోయారా?', '2 వారాలు అయింది! ఈ రోజే తిరిగి రండి - మీ గణిత నైపుణ్యం మీ కోసం వేచి ఉంది!'),
(26, 'inactive_14days', 8, 'நீங்கள் எங்களை மறந்துவிட்டீர்களா?', '2 வாரங்கள் ஆகிவிட்டது! இன்றே திரும்பி வாருங்கள் - உங்கள் கணித திறமை காத்திருக்கிறது!'),
(27, 'inactive_14days', 9, 'کیا آپ نے ہمیں بھلا دیا؟', '2 ہفتے ہو گئے! آج ہی واپس آئیں - آپ کی ریاضی کی صلاحیت آپ کا انتظار کر رہی ہے!'),
(28, 'mid_game_3days', 1, 'ಆಟ ಅರ್ಧದಲ್ಲಿ ಬಿಟ್ಟಿರಿ!', 'ಹಿಂದಿರುಗಿ ಅಲ್ಲಿಂದ ಮುಂದುವರಿಸಿ. ನಿಮ್ಮ ಪ್ರಗತಿ ಸಂರಕ್ಷಿಸಲಾಗಿದೆ!'),
(29, 'mid_game_3days', 2, 'खेल बीच में छोड़ा!', 'वापस आएं और जहां छोड़ा था वहां से शुरू करें। आपकी प्रगति सुरक्षित है!'),
(30, 'mid_game_3days', 3, 'You left mid-game!', 'Come back and finish where you left off. Your progress is saved!'),
(31, 'mid_game_3days', 4, 'ଆପଣ ଖେଳ ମଝିରେ ଛାଡ଼ିଲେ!', 'ଫେରି ଆସନ୍ତୁ ଏବଂ ଯେଠୁ ଛାଡ଼ିଥିଲେ ସେଠୁ ଶେଷ କରନ୍ତୁ। ଆପଣଙ୍କ ପ୍ରଗତି ସୁରକ୍ଷିତ!'),
(32, 'mid_game_3days', 5, 'તમે રમત અધૂરી છોડી!', 'પાછા આવો અને જ્યાંથી છોડ્યું ત્યાંથી પૂર્ણ કરો. તમારી પ્રગતિ સચવાઈ છે!'),
(33, 'mid_game_3days', 6, 'खेळ अर्धवट सोडला!', 'परत या आणि जिथे सोडले होते तिथून पूर्ण करा. तुमची प्रगती जपली आहे!'),
(34, 'mid_game_3days', 7, 'మీరు ఆట మధ్యలో వదిలారు!', 'తిరిగి రండి మరియు మీరు వదిలిన చోటి నుండి పూర్తి చేయండి. మీ పురోగతి సేవ్ అయింది!'),
(35, 'mid_game_3days', 8, 'நீங்கள் நடுவில் விட்டீர்கள்!', 'திரும்பி வாருங்கள் விட்ட இடத்திலிருந்து தொடருங்கள். உங்கள் முன்னேற்றம் சேமிக்கப்பட்டது!'),
(36, 'mid_game_3days', 9, 'آپ نے کھیل ادھورا چھوڑا!', 'واپس آئیں اور جہاں سے چھوڑا تھا وہاں سے مکمل کریں۔ آپ کی پیشرفت محفوظ ہے!'),
(37, 'reward_5games', 1, 'ನೀವು ಗಣಿತ ತಾರೆ!', 'ಅದ್ಭುತ! ನೀವು 5 ಆಟಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ. ಮುಂದುವರಿಸಿ - ಬಹುಮಾನಗಳು ನಿಮ್ಮನ್ನು ಕಾಯುತ್ತಿವೆ!'),
(38, 'reward_5games', 2, 'आप गणित स्टार हैं!', 'शाबाश! आपने 5 गेम पूरे किए। आगे बढ़ते रहें - पुरस्कार आपका इंतजार कर रहे हैं!'),
(39, 'reward_5games', 3, 'You are a Math Star!', 'Amazing! You have completed 5 games. Keep it up - rewards await you!'),
(40, 'reward_5games', 4, 'ଆପଣ ଗଣିତ ତାରା!', 'ବାh! ଆପଣ 5ଟି ଖେଳ ସମ୍ପୂର୍ଣ୍ଣ କଲେ। ଚାଲୁ ରଖନ୍ତୁ - ପୁରସ୍କାର ଅପେକ୍ଷା କରୁଛି!'),
(41, 'reward_5games', 5, 'તમે ગણિત સ્ટાર છો!', 'અદ્ભુત! 5 ગેમ્સ પૂર્ણ કર્યા. ચાલુ રાખો - ઇનામ તમારી રાહ જુએ છે!'),
(42, 'reward_5games', 6, 'तुम्ही गणित स्टार आहात!', 'शाब्बास! तुम्ही 5 गेम पूर्ण केले. असेच सुरू ठेवा - बक्षिसे वाट पाहत आहेत!'),
(43, 'reward_5games', 7, 'మీరు గణిత నక్షత్రం!', 'అద్భుతం! మీరు 5 గేమ్‌లు పూర్తి చేసారు. కొనసాగించండి - బహుమతులు మీ కోసం వేచి ఉన్నాయి!'),
(44, 'reward_5games', 8, 'நீங்கள் கணித நட்சத்திரம்!', 'அருமை! நீங்கள் 5 விளையாட்டுகளை முடித்தீர்கள். தொடருங்கள் - பரிசுகள் உங்களுக்காக காத்திருக்கின்றன!'),
(45, 'reward_5games', 9, 'آپ ریاضی کے ستارے ہیں!', 'شاباش! آپ نے 5 گیمز مکمل کیے۔ جاری رکھیں - انعامات آپ کا انتظار کر رہے ہیں!'),
(46, 'daily_reminder', 1, 'ದಿನದ ಗಣಿತ ಸವಾಲು!', 'ನಿಮ್ಮ ದಿನದ ಅಭ್ಯಾಸ ಮಾಡಿ. ಕೆಲವು ನಿಮಿಷಗಳ ಗಣಿತ ನಿಮ್ಮ ಕೌಶಲ್ಯ ಹೆಚ್ಚಿಸುತ್ತದೆ!'),
(47, 'daily_reminder', 2, 'दैनिक गणित चुनौती!', 'अपनी रोज़ाना की प्रैक्टिस का समय है। कुछ मिनट गणित आपके कौशल को तेज़ रखेगा!'),
(48, 'daily_reminder', 3, 'Daily Math Challenge!', 'Time for your daily practice. A few minutes of math a day keeps your skills sharp!'),
(49, 'daily_reminder', 4, 'ଦୈନିକ ଗଣିତ ଚ୍ୟାଲେଞ୍ଜ!', 'ଆପଣଙ୍କ ଦୈନିକ ଅଭ୍ୟାସ ସମୟ। ଗଣିତ ଅଭ୍ୟାସ ଜାରି ରଖନ୍ତୁ!'),
(50, 'daily_reminder', 5, 'દૈનિક ગણિત પડકાર!', 'તમારી રોજિંદી પ્રેક્ટિસ નો સમય. થોડી મિનિટ ગણિત તમારી કુશળતા વધારશે!'),
(51, 'daily_reminder', 6, 'दैनंदिन गणित आव्हान!', 'तुमच्या दैनंदिन सरावाची वेळ आहे. दररोज काही मिनिटे गणित केल्याने तुमचे कौशल्य सुधारेल!'),
(52, 'daily_reminder', 7, 'రోజువారీ గణిత సవాల్!', 'మీ రోజువారీ సాధన సమయం. కొన్ని నిమిషాల గణితం మీ నైపుణ్యాలను పదును పెడతాయి!'),
(53, 'daily_reminder', 8, 'தினசரி கணித சவால்!', 'உங்கள் தினசரி பயிற்சியின் நேரம். சில நிமிட கணிதம் உங்கள் திறமையை கூர்தீட்டும்!'),
(54, 'daily_reminder', 9, 'روزانہ ریاضی چیلنج!', 'اپنی روزانہ کی مشق کا وقت ہے۔ چند منٹ کی ریاضی آپ کی مہارت کو تیز رکھے گی!');

-- --------------------------------------------------------

--
-- Table structure for table `question_classification_tbl`
--

CREATE TABLE `question_classification_tbl` (
  `id_question_classification` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_classification_tbl`
--

INSERT INTO `question_classification_tbl` (`id_question_classification`, `code`, `description`) VALUES
(1, NULL, 'KNOWLEDGE/UNDERSTANDING'),
(2, NULL, 'APPLY/ANALYSE'),
(3, NULL, 'EVALUATE/SYNTHESIS/CREATE');

-- --------------------------------------------------------

--
-- Table structure for table `question_tbl`
--

CREATE TABLE `question_tbl` (
  `idq` int(11) NOT NULL,
  `id_question` varchar(100) NOT NULL,
  `id_game` varchar(100) NOT NULL,
  `description` varchar(512) NOT NULL,
  `id_question_type` int(11) NOT NULL,
  `id_micro_concept` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_question_classification` int(11) NOT NULL,
  `correct_answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_tbl`
--

INSERT INTO `question_tbl` (`idq`, `id_question`, `id_game`, `description`, `id_question_type`, `id_micro_concept`, `id_level`, `id_question_classification`, `correct_answer`) VALUES
(1, 'NSF1.1A-G1-Q1', 'NSF1.1A-G1', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(2, 'SSR2.1A-G1-Q1', 'SSR2.1A-G1', 'Select the animal whose head Is above the tree', 3, 112, 1, 1, NULL),
(3, 'SSR2.1A-G1-Q2', 'SSR2.1A-G1', 'Select the animal whose head Is below the tree', 3, 112, 1, 1, NULL),
(4, 'SSR2.1A-G1-Q3', 'SSR2.1A-G1', 'Select the animal above the ground', 3, 112, 1, 1, NULL),
(5, 'SSR2.1A-G1-Q4', 'SSR2.1A-G1', 'Select the animal on the ground', 3, 112, 1, 1, NULL),
(6, 'SSR2.1A-G1-Q5', 'SSR2.1A-G1', 'Select the object below the chair', 3, 112, 1, 1, NULL),
(7, 'SSR2.1A-G1-Q6', 'SSR2.1A-G1', 'Select the object above the chair', 3, 112, 1, 1, NULL),
(8, 'SSR2.1A-G1-Q7', 'SSR2.1A-G1', 'Select the object on the ladder', 3, 112, 1, 1, NULL),
(9, 'SSR2.1A-G1-Q8', 'SSR2.1A-G1', 'Select the object above the sofa', 3, 112, 1, 1, NULL),
(10, 'SSR2.1A-G1-Q9', 'SSR2.1A-G1', 'Select the oject below the sofa', 3, 112, 1, 1, NULL),
(11, 'SSR2.1A-G1-Q10', 'SSR2.1A-G1', 'Select the bigger animal', 3, 112, 1, 1, NULL),
(12, 'SSR2.1A-G1-Q11', 'SSR2.1A-G1', 'Select the smaller animal', 3, 112, 1, 1, NULL),
(13, 'SSR2.1A-G1-Q12', 'SSR2.1A-G1', 'Select the bigger object', 3, 112, 1, 1, NULL),
(14, 'SSR2.1A-G1-Q13', 'SSR2.1A-G1', 'Select the smaller object', 3, 112, 1, 1, NULL),
(15, 'SSR2.1A-G1-Q14', 'SSR2.1A-G1', 'Select the animal on the bed', 3, 112, 1, 1, NULL),
(16, 'SSR2.1A-G1-Q15', 'SSR2.1A-G1', 'Select the animal under the bed', 3, 112, 1, 1, NULL),
(17, 'SSR2.1A-G1-Q16', 'SSR2.1A-G1', 'Select the object on the table', 3, 112, 1, 1, NULL),
(18, 'SSR2.1A-G1-Q17', 'SSR2.1A-G1', 'Select the object under the table', 3, 112, 1, 1, NULL),
(19, 'SSR2.1A-G1-Q18', 'SSR2.1A-G1', 'Select the toy on the sofa', 3, 112, 1, 1, NULL),
(20, 'SSR2.1A-G1-Q19', 'SSR2.1A-G1', 'Select the toy under the table', 3, 112, 1, 1, NULL),
(21, 'SSR2.1A-G1-Q20', 'SSR2.1A-G1', 'Select the animal on the tree', 3, 112, 1, 1, NULL),
(22, 'SSR2.1A-G1-Q21', 'SSR2.1A-G1', 'Select the animal under the tree', 3, 112, 1, 1, NULL),
(23, 'SSR2.1A-G1-Q22', 'SSR2.1A-G1', 'Select the animal inside the house', 3, 112, 1, 1, NULL),
(24, 'SSR2.1A-G1-Q23', 'SSR2.1A-G1', 'Select the animal outside the house', 3, 112, 1, 1, NULL),
(25, 'SSR2.1A-G1-Q24', 'SSR2.1A-G1', 'Select the animal inside the bowl', 3, 112, 1, 1, NULL),
(26, 'SSR2.1A-G1-Q25', 'SSR2.1A-G1', 'Select the animal outside the bowl', 3, 112, 1, 1, NULL),
(27, 'SSR2.1A-G1-Q26', 'SSR2.1A-G1', 'Select the object inside the house', 3, 112, 1, 1, NULL),
(28, 'SSR2.1A-G1-Q27', 'SSR2.1A-G1', 'Select the object outside the house', 3, 112, 1, 1, NULL),
(29, 'SSR2.1A-G1-Q28', 'SSR2.1A-G1', 'Select the animal inside the basket', 3, 112, 1, 1, NULL),
(30, 'SSR2.1A-G1-Q29', 'SSR2.1A-G1', 'Select the animal outside the basket', 3, 112, 1, 1, NULL),
(31, 'SSR2.1A-G1-Q30', 'SSR2.1A-G1', 'Select the thing that is on top of flower', 3, 112, 1, 1, NULL),
(32, 'SSR2.1A-G1-Q31', 'SSR2.1A-G1', 'Select the thing that is at the bottom of the flower', 3, 112, 1, 1, NULL),
(33, 'SSR2.1A-G1-Q32', 'SSR2.1A-G1', 'Select the bottom most book', 3, 112, 1, 1, NULL),
(34, 'SSR2.1A-G1-Q33', 'SSR2.1A-G1', 'Select the top most book', 3, 112, 1, 1, NULL),
(35, 'SSR2.1A-G1-Q34', 'SSR2.1A-G1', 'Select the object on top of the stairs', 3, 112, 1, 1, NULL),
(36, 'SSR2.1A-G1-Q35', 'SSR2.1A-G1', 'Select the object on the bottom of the stairs', 3, 112, 1, 1, NULL),
(37, 'SSR2.1A-G1-Q36', 'SSR2.1A-G1', 'Select the object on top of the shelf', 3, 112, 1, 1, NULL),
(38, 'SSR2.1A-G1-Q37', 'SSR2.1A-G1', 'Select the object on bottom of the shelf', 3, 112, 1, 1, NULL),
(39, 'SSR2.1A-G1-Q38', 'SSR2.1A-G1', 'Select the tree near the house', 3, 112, 1, 1, NULL),
(40, 'SSR2.1A-G1-Q39', 'SSR2.1A-G1', 'Select the tree far from the house', 3, 112, 1, 1, NULL),
(41, 'SSR2.1A-G1-Q40', 'SSR2.1A-G1', 'Select the object near the banana', 3, 112, 1, 1, NULL),
(42, 'SSR2.1A-G1-Q41', 'SSR2.1A-G1', 'Select the object far from the banana', 3, 112, 1, 1, NULL),
(43, 'SSR2.1A-G1-Q42', 'SSR2.1A-G1', 'Select the object near the jug', 3, 112, 1, 1, NULL),
(44, 'SSR2.1A-G1-Q43', 'SSR2.1A-G1', 'Select the object far from the jug', 3, 112, 1, 1, NULL),
(45, 'SSR2.1A-G1-Q44', 'SSR2.1A-G1', 'Select the animal near the scooter', 3, 112, 1, 1, NULL),
(46, 'SSR2.1A-G1-Q45', 'SSR2.1A-G1', 'Select the animal far from the scooter', 3, 112, 1, 1, NULL),
(47, 'SSR2.1A-G1-Q46', 'SSR2.1A-G1', 'Select the animal near the elephant', 3, 112, 1, 1, NULL),
(48, 'SSR2.1A-G1-Q47', 'SSR2.1A-G1', 'Select the animal far from the elephant', 3, 112, 1, 1, NULL),
(49, 'SSR2.1A-G1-Q48', 'SSR2.1A-G1', 'Select the animal flyig high', 3, 112, 1, 1, NULL),
(50, 'SSR2.1A-G1-Q49', 'SSR2.1A-G1', 'Select the animal flying low', 3, 112, 1, 1, NULL),
(51, 'SSR2.1A-G1-Q50', 'SSR2.1A-G1', 'Select the object high on the wall', 3, 112, 1, 1, NULL),
(52, 'SSR2.1A-G1-Q51', 'SSR2.1A-G1', 'Select the object low on the wall', 3, 112, 1, 1, NULL),
(53, 'SSR2.1A-G1-Q52', 'SSR2.1A-G1', 'Select the higher object', 3, 112, 1, 1, NULL),
(54, 'SSR2.1A-G1-Q53', 'SSR2.1A-G1', 'Select the lower object', 3, 112, 1, 1, NULL),
(55, 'SSR2.1A-G1-Q54', 'SSR2.1A-G1', 'Select the object going high', 3, 112, 1, 1, NULL),
(56, 'SSR2.1A-G1-Q55', 'SSR2.1A-G1', 'Select the object that is low', 3, 112, 1, 1, NULL),
(57, 'SSR2.1B-G1-Q1', 'SSR2.1B-G1', 'Select the taller house', 3, 112, 1, 1, NULL),
(58, 'SSR2.1B-G1-Q2', 'SSR2.1B-G1', 'Select the shorter house', 3, 112, 1, 1, NULL),
(59, 'SSR2.1B-G1-Q3', 'SSR2.1B-G1', 'Select the taller object', 3, 112, 1, 1, NULL),
(60, 'SSR2.1B-G1-Q4', 'SSR2.1B-G1', 'Select the shorter object', 3, 112, 1, 1, NULL),
(61, 'SSR2.1B-G1-Q5', 'SSR2.1B-G1', 'Select the taller animal', 3, 112, 1, 1, NULL),
(62, 'SSR2.1B-G1-Q6', 'SSR2.1B-G1', 'Select the shorter animal', 3, 112, 1, 1, NULL),
(63, 'SSR2.1B-G1-Q7', 'SSR2.1B-G1', 'Select the gate which is narrow', 3, 112, 1, 1, NULL),
(64, 'SSR2.1B-G1-Q8', 'SSR2.1B-G1', 'Select the wider gate', 3, 112, 1, 1, NULL),
(65, 'SSR2.1B-G1-Q9', 'SSR2.1B-G1', 'Select the narrow road', 3, 112, 1, 1, NULL),
(66, 'SSR2.1B-G1-Q10', 'SSR2.1B-G1', 'Select the wider road', 3, 112, 1, 1, NULL),
(67, 'SSR2.1B-G1-Q11', 'SSR2.1B-G1', 'Select the wider object', 3, 112, 1, 1, NULL),
(68, 'SSR2.1B-G1-Q12', 'SSR2.1B-G1', 'Select the narrower object', 3, 112, 1, 1, NULL),
(69, 'SSR2.1B-G1-Q13', 'SSR2.1B-G1', 'Select the wider river', 3, 112, 1, 1, NULL),
(70, 'SSR2.1B-G1-Q14', 'SSR2.1B-G1', 'Select the narrow river', 3, 112, 1, 1, NULL),
(71, 'SSR2.1B-G1-Q15', 'SSR2.1B-G1', 'Select the animal with the shorter tail', 3, 112, 1, 1, NULL),
(72, 'SSR2.1B-G1-Q16', 'SSR2.1B-G1', 'Select the animal with the longer tail', 3, 112, 1, 1, NULL),
(73, 'SSR2.1B-G1-Q17', 'SSR2.1B-G1', 'Select the shirt with longer sleeves', 3, 112, 1, 1, NULL),
(74, 'SSR2.1B-G1-Q18', 'SSR2.1B-G1', 'Select the shirt with shorter sleeves', 3, 112, 1, 1, NULL),
(75, 'SSR2.1B-G1-Q19', 'SSR2.1B-G1', 'Select the snake with a longer body', 3, 112, 1, 1, NULL),
(76, 'SSR2.1B-G1-Q20', 'SSR2.1B-G1', 'Select the snake with the shorter body', 3, 112, 1, 1, NULL),
(77, 'SSR2.1B-G1-Q21', 'SSR2.1B-G1', 'Select the bird with longer legs', 3, 112, 1, 1, NULL),
(78, 'SSR2.1B-G1-Q22', 'SSR2.1B-G1', 'Select the bird with shorter legs', 3, 112, 1, 1, NULL),
(79, 'SSR2.1B-G1-Q23', 'SSR2.1B-G1', 'Select the fat fish', 3, 112, 1, 1, NULL),
(80, 'SSR2.1B-G1-Q24', 'SSR2.1B-G1', 'Select the thin fish', 3, 112, 1, 1, NULL),
(81, 'SSR2.1B-G1-Q25', 'SSR2.1B-G1', 'Select the fat snake', 3, 112, 1, 1, NULL),
(82, 'SSR2.1B-G1-Q26', 'SSR2.1B-G1', 'Select the thin snake', 3, 112, 1, 1, NULL),
(83, 'SSR2.1B-G1-Q27', 'SSR2.1B-G1', 'Select the fat book', 3, 112, 1, 1, NULL),
(84, 'SSR2.1B-G1-Q28', 'SSR2.1B-G1', 'Select the thin book', 3, 112, 1, 1, NULL),
(85, 'SSR2.1B-G1-Q29', 'SSR2.1B-G1', 'Select the fat tyre', 3, 112, 1, 1, NULL),
(86, 'SSR2.1B-G1-Q30', 'SSR2.1B-G1', 'Select the thin tyre', 3, 112, 1, 1, NULL),
(87, 'SSR2.1B-G1-Q31', 'SSR2.1B-G1', 'Select the fat slice', 3, 112, 1, 1, NULL),
(88, 'SSR2.1B-G1-Q32', 'SSR2.1B-G1', 'Select the thin slice', 3, 112, 1, 1, NULL),
(89, 'SSR2.1B-G1-Q33', 'SSR2.1B-G1', 'Select the thin rope', 3, 112, 1, 1, NULL),
(90, 'SSR2.1B-G1-Q34', 'SSR2.1B-G1', 'Select the thick rope', 3, 112, 1, 1, NULL),
(91, 'SSR2.1B-G1-Q35', 'SSR2.1B-G1', 'Select the thin Box', 3, 112, 1, 1, NULL),
(92, 'SSR2.1B-G1-Q36', 'SSR2.1B-G1', 'Select the thick Box', 3, 112, 1, 1, NULL),
(93, 'SSR2.1B-G1-Q37', 'SSR2.1B-G1', 'Select the thick snake', 3, 112, 1, 1, NULL),
(94, 'SSR2.1B-G1-Q38', 'SSR2.1B-G1', 'Select the thin snake', 3, 112, 1, 1, NULL),
(95, 'ML2.2-G1-Q1', 'ML2.2-G1', 'Drag and arrange the objects from tallest to shortest in the box', 5, 72, 1, 1, NULL),
(96, 'ML2.2-G1-Q2', 'ML2.2-G1', 'Drag and arrange the objects from shortest to tallest in the box', 5, 72, 1, 1, NULL),
(97, 'ML2.2-G1-Q3', 'ML2.2-G1', 'Drag and arrange the objects from longer to shorter in the box', 5, 72, 1, 1, NULL),
(98, 'ML2.2-G1-Q4', 'ML2.2-G1', 'Drag and arrange the objects from shorter to longer in the box', 5, 72, 1, 1, NULL),
(99, 'ML2.2-G1-Q5', 'ML2.2-G1', 'Drag and arrange the animals from tallest to shortest in the box', 5, 72, 1, 1, NULL),
(100, 'ML2.2-G1-Q6', 'ML2.2-G1', 'Drag and arrange the animals from shortest to tallest in the box', 5, 72, 1, 1, NULL),
(101, 'ML2.2-G1-Q7', 'ML2.2-G1', 'Drag and arrange the animals from longer to shorter in the box', 5, 72, 1, 1, NULL),
(102, 'ML2.2-G1-Q8', 'ML2.2-G1', 'Drag and arrange the animals from shorter to longer in the box', 5, 72, 1, 1, NULL),
(103, 'ML2.2-G1-Q9', 'ML2.2-G1', 'Drag and arrange the birds from tallest to shortest in the box', 5, 72, 1, 1, NULL),
(104, 'ML2.2-G1-Q10', 'ML2.2-G1', 'Drag and arrange the birds from shortest to tallest in the box', 5, 72, 1, 1, NULL),
(105, 'ML2.3-G1-Q1', 'ML2.3-G1', 'Drag and place the leaves to measure the length of the tree. Select the value', 2, 73, 1, 1, NULL),
(106, 'ML2.3-G1-Q2', 'ML2.3-G1', 'Drag and place the sharpner to measure the length of the pencil. Select the value', 2, 73, 1, 1, NULL),
(107, 'ML2.3-G1-Q3', 'ML2.3-G1', 'Drag and place the lizards to measure the length of the crocodile. Select the value', 2, 73, 1, 1, NULL),
(108, 'ML2.3-G1-Q4', 'ML2.3-G1', 'Drag and place the flies to measure the length of the snake. Select the value', 2, 73, 1, 1, NULL),
(109, 'ML2.3-G1-Q5', 'ML2.3-G1', 'Drag and place the handspans to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(110, 'ML2.3-G1-Q6', 'ML2.3-G1', 'Drag and place the armspans to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(111, 'ML2.3-G1-Q7', 'ML2.3-G1', 'Drag and place the footspans to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(112, 'ML2.3-G1-Q8', 'ML2.3-G1', 'Drag and place the rope to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(113, 'MW3.1-G1-Q1', 'MW3.1-G1', 'Select the heavier object', 3, 104, 1, 1, NULL),
(114, 'MW3.1-G1-Q2', 'MW3.1-G2', 'Select the lighter object', 3, 104, 1, 1, NULL),
(117, 'MW3.2A-G1-Q1', 'MW3.2A-G1', 'Drag the objects on the weighing scale.  Select the heavier object', 3, 105, 1, 1, NULL),
(118, 'MW3.2A-G1-Q2', 'MW3.2A-G1', 'Drag the objects on the weighing scale.  Select the lighter object', 3, 105, 1, 1, NULL),
(119, 'MT5.1-G1-Q1', 'MT5.1-G1', 'Arrange the pictures in the order of activities carried out from morning till night', 5, 82, 1, 1, NULL),
(120, 'MT5.2-G1-Q1', 'MT5.2-G1', 'Arrange the days of the weeks in the right order to complete the picture', 5, 82, 1, 1, NULL),
(121, 'MT5.2-G1-Q2', 'MT5.2-G1', 'Arrange the given days of the week in the right order to see the jumbled picture', 5, 82, 1, 1, NULL),
(122, 'MT5.2-G1-Q3', 'MT5.2-G1', 'Drag and arrange the days of the week in the right order in the boxes above', 5, 82, 1, 1, NULL),
(123, 'MT5.4-G1-Q1', 'MT5.4-G1', 'Drag and arrange the months of the year in the right order', 5, 84, 1, 1, NULL),
(124, 'MT5.4-G1-Q2', 'MT5.4-G1', 'What comes after January', 3, 84, 1, 1, NULL),
(125, 'MT5.4-G1-Q3', 'MT5.4-G1', 'What comes before January', 3, 84, 1, 1, NULL),
(126, 'MT5.4-G1-Q4', 'MT5.4-G1', 'What comes after February', 3, 84, 1, 1, NULL),
(127, 'MT5.4-G1-Q5', 'MT5.4-G1', 'What comes before February', 3, 84, 1, 1, NULL),
(128, 'MT5.4-G1-Q6', 'MT5.4-G1', 'What comes after March', 3, 84, 1, 1, NULL),
(129, 'MT5.4-G1-Q7', 'MT5.4-G1', 'What comes before March', 3, 84, 1, 1, NULL),
(130, 'MT5.4-G1-Q8', 'MT5.4-G1', 'What comes after April', 3, 84, 1, 1, NULL),
(131, 'MT5.4-G1-Q9', 'MT5.4-G1', 'What comes before April', 3, 84, 1, 1, NULL),
(132, 'MT5.4-G1-Q10', 'MT5.4-G1', 'What comes after May', 3, 84, 1, 1, NULL),
(133, 'MT5.4-G1-Q11', 'MT5.4-G1', 'What comes before May', 3, 84, 1, 1, NULL),
(134, 'MT5.4-G1-Q12', 'MT5.4-G1', 'What comes after June', 3, 84, 1, 1, NULL),
(135, 'MT5.4-G1-Q13', 'MT5.4-G1', 'What comes before June', 3, 84, 1, 1, NULL),
(136, 'MT5.4-G1-Q14', 'MT5.4-G1', 'What comes after July', 3, 84, 1, 1, NULL),
(137, 'MT5.4-G1-Q15', 'MT5.4-G1', 'What comes before July', 3, 84, 1, 1, NULL),
(138, 'MT5.4-G1-Q16', 'MT5.4-G1', 'What comes after August', 3, 84, 1, 1, NULL),
(139, 'MT5.4-G1-Q17', 'MT5.4-G1', 'What comes before August', 3, 84, 1, 1, NULL),
(140, 'MT5.4-G1-Q18', 'MT5.4-G1', 'What comes after September', 3, 84, 1, 1, NULL),
(141, 'MT5.4-G1-Q19', 'MT5.4-G1', 'What comes before September', 3, 84, 1, 1, NULL),
(142, 'MT5.4-G1-Q20', 'MT5.4-G1', 'What comes after October', 3, 84, 1, 1, NULL),
(143, 'MT5.4-G1-Q21', 'MT5.4-G1', 'What comes before October', 3, 84, 1, 1, NULL),
(144, 'MT5.4-G1-Q22', 'MT5.4-G1', 'What comes after November', 3, 84, 1, 1, NULL),
(145, 'MT5.4-G1-Q23', 'MT5.4-G1', 'What comes before November', 3, 84, 1, 1, NULL),
(146, 'MT5.4-G1-Q24', 'MT5.4-G1', 'What comes after December', 3, 84, 1, 1, NULL),
(147, 'MT5.4-G1-Q25', 'MT5.4-G1', 'What comes before December', 3, 84, 1, 1, NULL),
(148, 'NSF1.1A-G2-Q1', 'NSF1.1A-G2', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(149, 'SSR2.1A-G2-Q1', 'SSR2.1A-G2', 'Select the animal whose head Is above the tree', 3, 112, 1, 1, NULL),
(150, 'SSR2.1A-G2-Q2', 'SSR2.1A-G2', 'Select the animal whose head Is below the tree', 3, 112, 1, 1, NULL),
(151, 'SSR2.1A-G2-Q3', 'SSR2.1A-G2', 'Select the animal above the ground', 3, 112, 1, 1, NULL),
(152, 'SSR2.1A-G2-Q4', 'SSR2.1A-G2', 'Select the animal on the ground', 3, 112, 1, 1, NULL),
(153, 'SSR2.1A-G2-Q5', 'SSR2.1A-G2', 'Select the object below the chair', 3, 112, 1, 1, NULL),
(154, 'SSR2.1A-G2-Q6', 'SSR2.1A-G2', 'Select the object above the chair', 3, 112, 1, 1, NULL),
(155, 'SSR2.1A-G2-Q7', 'SSR2.1A-G2', 'Select the object on the ladder', 3, 112, 1, 1, NULL),
(156, 'SSR2.1A-G2-Q8', 'SSR2.1A-G2', 'Select the object above the sofa', 3, 112, 1, 1, NULL),
(157, 'SSR2.1A-G2-Q9', 'SSR2.1A-G2', 'Select the oject below the sofa', 3, 112, 1, 1, NULL),
(158, 'SSR2.1A-G2-Q10', 'SSR2.1A-G2', 'Select the bigger animal', 3, 112, 1, 1, NULL),
(159, 'SSR2.1A-G2-Q11', 'SSR2.1A-G2', 'Select the smaller animal', 3, 112, 1, 1, NULL),
(160, 'SSR2.1A-G2-Q12', 'SSR2.1A-G2', 'Select the bigger object', 3, 112, 1, 1, NULL),
(161, 'SSR2.1A-G2-Q13', 'SSR2.1A-G2', 'Select the smaller object', 3, 112, 1, 1, NULL),
(162, 'SSR2.1A-G2-Q14', 'SSR2.1A-G2', 'Select the animal on the bed', 3, 112, 1, 1, NULL),
(163, 'SSR2.1A-G2-Q15', 'SSR2.1A-G2', 'Select the animal under the bed', 3, 112, 1, 1, NULL),
(164, 'SSR2.1A-G2-Q16', 'SSR2.1A-G2', 'Select the object on the table', 3, 112, 1, 1, NULL),
(165, 'SSR2.1A-G2-Q17', 'SSR2.1A-G2', 'Select the object under the table', 3, 112, 1, 1, NULL),
(166, 'SSR2.1A-G2-Q18', 'SSR2.1A-G2', 'Select the toy on the sofa', 3, 112, 1, 1, NULL),
(167, 'SSR2.1A-G2-Q19', 'SSR2.1A-G2', 'Select the toy under the table', 3, 112, 1, 1, NULL),
(168, 'SSR2.1A-G2-Q20', 'SSR2.1A-G2', 'Select the animal on the tree', 3, 112, 1, 1, NULL),
(169, 'SSR2.1A-G2-Q21', 'SSR2.1A-G2', 'Select the animal under the tree', 3, 112, 1, 1, NULL),
(170, 'SSR2.1A-G2-Q22', 'SSR2.1A-G2', 'Select the animal inside the house', 3, 112, 1, 1, NULL),
(171, 'SSR2.1A-G2-Q23', 'SSR2.1A-G2', 'Select the animal outside the house', 3, 112, 1, 1, NULL),
(172, 'SSR2.1A-G2-Q24', 'SSR2.1A-G2', 'Select the animal inside the bowl', 3, 112, 1, 1, NULL),
(173, 'SSR2.1A-G2-Q25', 'SSR2.1A-G2', 'Select the animal outside the bowl', 3, 112, 1, 1, NULL),
(174, 'SSR2.1A-G2-Q26', 'SSR2.1A-G2', 'Select the object inside the house', 3, 112, 1, 1, NULL),
(175, 'SSR2.1A-G2-Q27', 'SSR2.1A-G2', 'Select the object outside the house', 3, 112, 1, 1, NULL),
(176, 'SSR2.1A-G2-Q28', 'SSR2.1A-G2', 'Select the animal inside the basket', 3, 112, 1, 1, NULL),
(177, 'SSR2.1A-G2-Q29', 'SSR2.1A-G2', 'Select the animal outside the basket', 3, 112, 1, 1, NULL),
(178, 'SSR2.1A-G2-Q30', 'SSR2.1A-G2', 'Select the thing that is on top of flower', 3, 112, 1, 1, NULL),
(179, 'SSR2.1A-G2-Q31', 'SSR2.1A-G2', 'Select the thing that is at the bottom of the flower', 3, 112, 1, 1, NULL),
(180, 'SSR2.1A-G2-Q32', 'SSR2.1A-G2', 'Select the bottom most book', 3, 112, 1, 1, NULL),
(181, 'SSR2.1A-G2-Q33', 'SSR2.1A-G2', 'Select the top most book', 3, 112, 1, 1, NULL),
(182, 'SSR2.1A-G2-Q34', 'SSR2.1A-G2', 'Select the object on top of the stairs', 3, 112, 1, 1, NULL),
(183, 'SSR2.1A-G2-Q35', 'SSR2.1A-G2', 'Select the object on the bottom of the stairs', 3, 112, 1, 1, NULL),
(184, 'SSR2.1A-G2-Q36', 'SSR2.1A-G2', 'Select the object on top of the shelf', 3, 112, 1, 1, NULL),
(185, 'SSR2.1A-G2-Q37', 'SSR2.1A-G2', 'Select the object on bottom of the shelf', 3, 112, 1, 1, NULL),
(186, 'SSR2.1A-G2-Q38', 'SSR2.1A-G2', 'Select the tree near the house', 3, 112, 1, 1, NULL),
(187, 'SSR2.1A-G2-Q39', 'SSR2.1A-G2', 'Select the tree far from the house', 3, 112, 1, 1, NULL),
(188, 'SSR2.1A-G2-Q40', 'SSR2.1A-G2', 'Select the object near the banana', 3, 112, 1, 1, NULL),
(189, 'SSR2.1A-G2-Q41', 'SSR2.1A-G2', 'Select the object far from the banana', 3, 112, 1, 1, NULL),
(190, 'SSR2.1A-G2-Q42', 'SSR2.1A-G2', 'Select the object near the jug', 3, 112, 1, 1, NULL),
(191, 'SSR2.1A-G2-Q43', 'SSR2.1A-G2', 'Select the object far from the jug', 3, 112, 1, 1, NULL),
(192, 'SSR2.1A-G2-Q44', 'SSR2.1A-G2', 'Select the animal near the scooter', 3, 112, 1, 1, NULL),
(193, 'SSR2.1A-G2-Q45', 'SSR2.1A-G2', 'Select the animal far from the scooter', 3, 112, 1, 1, NULL),
(194, 'SSR2.1A-G2-Q46', 'SSR2.1A-G2', 'Select the animal near the elephant', 3, 112, 1, 1, NULL),
(195, 'SSR2.1A-G2-Q47', 'SSR2.1A-G2', 'Select the animal far from the elephant', 3, 112, 1, 1, NULL),
(196, 'SSR2.1A-G2-Q48', 'SSR2.1A-G2', 'Select the animal flyig high', 3, 112, 1, 1, NULL),
(197, 'SSR2.1A-G2-Q49', 'SSR2.1A-G2', 'Select the animal flying low', 3, 112, 1, 1, NULL),
(198, 'SSR2.1A-G2-Q50', 'SSR2.1A-G2', 'Select the object high on the wall', 3, 112, 1, 1, NULL),
(199, 'SSR2.1A-G2-Q51', 'SSR2.1A-G2', 'Select the object low on the wall', 3, 112, 1, 1, NULL),
(200, 'SSR2.1A-G2-Q52', 'SSR2.1A-G2', 'Select the higher object', 3, 112, 1, 1, NULL),
(201, 'SSR2.1A-G2-Q53', 'SSR2.1A-G2', 'Select the lower object', 3, 112, 1, 1, NULL),
(202, 'SSR2.1A-G2-Q54', 'SSR2.1A-G2', 'Select the object going high', 3, 112, 1, 1, NULL),
(203, 'SSR2.1A-G2-Q55', 'SSR2.1A-G2', 'Select the object that is low', 3, 112, 1, 1, NULL),
(204, 'SSR2.1B-G2-Q1', 'SSR2.1B-G2', 'Select the taller house', 3, 112, 1, 1, NULL),
(205, 'SSR2.1B-G2-Q2', 'SSR2.1B-G2', 'Select the shorter house', 3, 112, 1, 1, NULL),
(206, 'SSR2.1B-G2-Q3', 'SSR2.1B-G2', 'Select the taller object', 3, 112, 1, 1, NULL),
(207, 'SSR2.1B-G2-Q4', 'SSR2.1B-G2', 'Select the shorter object', 3, 112, 1, 1, NULL),
(208, 'SSR2.1B-G2-Q5', 'SSR2.1B-G2', 'Select the taller animal', 3, 112, 1, 1, NULL),
(209, 'SSR2.1B-G2-Q6', 'SSR2.1B-G2', 'Select the shorter animal', 3, 112, 1, 1, NULL),
(210, 'SSR2.1B-G2-Q7', 'SSR2.1B-G2', 'Select the gate which is narrow', 3, 112, 1, 1, NULL),
(211, 'SSR2.1B-G2-Q8', 'SSR2.1B-G2', 'Select the wider gate', 3, 112, 1, 1, NULL),
(212, 'SSR2.1B-G2-Q9', 'SSR2.1B-G2', 'Select the narrow road', 3, 112, 1, 1, NULL),
(213, 'SSR2.1B-G2-Q10', 'SSR2.1B-G2', 'Select the wider road', 3, 112, 1, 1, NULL),
(214, 'SSR2.1B-G2-Q11', 'SSR2.1B-G2', 'Select the wider object', 3, 112, 1, 1, NULL),
(215, 'SSR2.1B-G2-Q12', 'SSR2.1B-G2', 'Select the narrower object', 3, 112, 1, 1, NULL),
(216, 'SSR2.1B-G2-Q13', 'SSR2.1B-G2', 'Select the wider river', 3, 112, 1, 1, NULL),
(217, 'SSR2.1B-G2-Q14', 'SSR2.1B-G2', 'Select the narrow river', 3, 112, 1, 1, NULL),
(218, 'SSR2.1B-G2-Q15', 'SSR2.1B-G2', 'Select the animal with the shorter tail', 3, 112, 1, 1, NULL),
(219, 'SSR2.1B-G2-Q16', 'SSR2.1B-G2', 'Select the animal with the longer tail', 3, 112, 1, 1, NULL),
(220, 'SSR2.1B-G2-Q17', 'SSR2.1B-G2', 'Select the shirt with longer sleeves', 3, 112, 1, 1, NULL),
(221, 'SSR2.1B-G2-Q18', 'SSR2.1B-G2', 'Select the shirt with shorter sleeves', 3, 112, 1, 1, NULL),
(222, 'SSR2.1B-G2-Q19', 'SSR2.1B-G2', 'Select the snake with a longer body', 3, 112, 1, 1, NULL),
(223, 'SSR2.1B-G2-Q20', 'SSR2.1B-G2', 'Select the snake with the shorter body', 3, 112, 1, 1, NULL),
(224, 'SSR2.1B-G2-Q21', 'SSR2.1B-G2', 'Select the bird with longer legs', 3, 112, 1, 1, NULL),
(225, 'SSR2.1B-G2-Q22', 'SSR2.1B-G2', 'Select the bird with shorter legs', 3, 112, 1, 1, NULL),
(226, 'SSR2.1B-G2-Q23', 'SSR2.1B-G2', 'Select the fat fish', 3, 112, 1, 1, NULL),
(227, 'SSR2.1B-G2-Q24', 'SSR2.1B-G2', 'Select the thin fish', 3, 112, 1, 1, NULL),
(228, 'SSR2.1B-G2-Q25', 'SSR2.1B-G2', 'Select the fat snake', 3, 112, 1, 1, NULL),
(229, 'SSR2.1B-G2-Q26', 'SSR2.1B-G2', 'Select the thin snake', 3, 112, 1, 1, NULL),
(230, 'SSR2.1B-G2-Q27', 'SSR2.1B-G2', 'Select the fat book', 3, 112, 1, 1, NULL),
(231, 'SSR2.1B-G2-Q28', 'SSR2.1B-G2', 'Select the thin book', 3, 112, 1, 1, NULL),
(232, 'SSR2.1B-G2-Q29', 'SSR2.1B-G2', 'Select the fat tyre', 3, 112, 1, 1, NULL),
(233, 'SSR2.1B-G2-Q30', 'SSR2.1B-G2', 'Select the thin tyre', 3, 112, 1, 1, NULL),
(234, 'SSR2.1B-G2-Q31', 'SSR2.1B-G2', 'Select the fat slice', 3, 112, 1, 1, NULL),
(235, 'SSR2.1B-G2-Q32', 'SSR2.1B-G2', 'Select the thin slice', 3, 112, 1, 1, NULL),
(236, 'SSR2.1B-G2-Q33', 'SSR2.1B-G2', 'Select the thin rope', 3, 112, 1, 1, NULL),
(237, 'SSR2.1B-G2-Q34', 'SSR2.1B-G2', 'Select the thick rope', 3, 112, 1, 1, NULL),
(238, 'SSR2.1B-G2-Q35', 'SSR2.1B-G2', 'Select the thin Box', 3, 112, 1, 1, NULL),
(239, 'SSR2.1B-G2-Q36', 'SSR2.1B-G2', 'Select the thick Box', 3, 112, 1, 1, NULL),
(240, 'SSR2.1B-G2-Q37', 'SSR2.1B-G2', 'Select the thick snake', 3, 112, 1, 1, NULL),
(241, 'SSR2.1B-G2-Q38', 'SSR2.1B-G2', 'Select the thin snake', 3, 112, 1, 1, NULL),
(242, 'ML2.2-G2-Q1', 'ML2.2-G2', 'Drag and arrange the objects from tallest to shortest in the box', 5, 72, 1, 1, NULL),
(243, 'ML2.2-G2-Q2', 'ML2.2-G2', 'Drag and arrange the objects from shortest to tallest in the box', 5, 72, 1, 1, NULL),
(244, 'ML2.2-G2-Q3', 'ML2.2-G2', 'Drag and arrange the objects from longer to shorter in the box', 5, 72, 1, 1, NULL),
(245, 'ML2.2-G2-Q4', 'ML2.2-G2', 'Drag and arrange the objects from shorter to longer in the box', 5, 72, 1, 1, NULL),
(246, 'ML2.2-G2-Q5', 'ML2.2-G2', 'Drag and arrange the animals from tallest to shortest in the box', 5, 72, 1, 1, NULL),
(247, 'ML2.2-G2-Q6', 'ML2.2-G2', 'Drag and arrange the animals from shortest to tallest in the box', 5, 72, 1, 1, NULL),
(248, 'ML2.2-G2-Q7', 'ML2.2-G2', 'Drag and arrange the animals from longer to shorter in the box', 5, 72, 1, 1, NULL),
(249, 'ML2.2-G2-Q8', 'ML2.2-G2', 'Drag and arrange the animals from shorter to longer in the box', 5, 72, 1, 1, NULL),
(250, 'ML2.2-G2-Q9', 'ML2.2-G2', 'Drag and arrange the birds from tallest to shortest in the box', 5, 72, 1, 1, NULL),
(251, 'ML2.2-G2-Q10', 'ML2.2-G2', 'Drag and arrange the birds from shortest to tallest in the box', 5, 72, 1, 1, NULL),
(252, 'ML2.3-G2-Q1', 'ML2.3-G2', 'Drag and place the leaves to measure the length of the tree. Select the value', 2, 73, 1, 1, NULL),
(253, 'ML2.3-G2-Q2', 'ML2.3-G2', 'Drag and place the sharpner to measure the length of the pencil. Select the value', 2, 73, 1, 1, NULL),
(254, 'ML2.3-G2-Q3', 'ML2.3-G2', 'Drag and place the lizards to measure the length of the crocodile. Select the value', 2, 73, 1, 1, NULL),
(255, 'ML2.3-G2-Q4', 'ML2.3-G2', 'Drag and place the flies to measure the length of the snake. Select the value', 2, 73, 1, 1, NULL),
(256, 'ML2.3-G2-Q5', 'ML2.3-G2', 'Drag and place the handspans to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(257, 'ML2.3-G2-Q6', 'ML2.3-G2', 'Drag and place the armspans to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(258, 'ML2.3-G2-Q7', 'ML2.3-G2', 'Drag and place the footspans to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(259, 'ML2.3-G2-Q8', 'ML2.3-G2', 'Drag and place the rope to measure the length of the object. Select the value', 2, 73, 1, 1, NULL),
(260, 'MW3.1-G2-Q1', 'MW3.1-G2', 'Select the heavier object', 3, 104, 1, 1, NULL),
(261, 'MW3.1-G2-Q2', 'MW3.1-G2', 'Select the lighter object', 3, 104, 1, 1, NULL),
(262, 'MW3.1-G2-Q3', 'MW3.1-G2', 'Select the heavier animal', 3, 104, 1, 1, NULL),
(263, 'MW3.1-G2-Q4', 'MW3.1-G2', 'Select the lighter animal', 3, 104, 1, 1, NULL),
(264, 'MW3.2A-G2-Q1', 'MW3.2A-G2', 'Drag the objects on the weighing scale.  Select the heavier object', 3, 105, 1, 1, NULL),
(265, 'MW3.2A-G2-Q2', 'MW3.2A-G2', 'Drag the objects on the weighing scale.  Select the lighter object', 3, 105, 1, 1, NULL),
(266, 'MT5.1-G2-Q1', 'MT5.1-G2', 'Arrange the pictures in the order of activities carried out from morning till night', 5, 82, 1, 1, NULL),
(267, 'MT5.2-G2-Q1', 'MT5.2-G2', 'Arrange the days of the weeks in the right order to complete the picture', 5, 82, 1, 1, NULL),
(268, 'MT5.2-G2-Q2', 'MT5.2-G2', 'Arrange the given days of the week in the right order to see the jumbled picture', 5, 82, 1, 1, NULL),
(269, 'MT5.2-G2-Q3', 'MT5.2-G2', 'Drag and arrange the days of the week in the right order in the boxes above', 5, 82, 1, 1, NULL),
(270, 'MT5.4-G2-Q1', 'MT5.4G2', 'Drag and arrange the months of the year in the right order', 5, 82, 1, 1, NULL),
(271, 'MT5.4-G2-Q2', 'MT5.4G2', 'What comes after January', 3, 84, 1, 1, NULL),
(272, 'MT5.4-G2-Q3', 'MT5.4G2', 'What comes before January', 3, 84, 1, 1, NULL),
(273, 'MT5.4-G2-Q4', 'MT5.4G2', 'What comes after February', 3, 84, 1, 1, NULL),
(274, 'MT5.4-G2-Q5', 'MT5.4G2', 'What comes before February', 3, 84, 1, 1, NULL),
(275, 'MT5.4-G2-Q6', 'MT5.4G2', 'What comes after March', 3, 84, 1, 1, NULL),
(276, 'MT5.4-G2-Q7', 'MT5.4G2', 'What comes before March', 3, 84, 1, 1, NULL),
(277, 'MT5.4-G2-Q8', 'MT5.4G2', 'What comes after April', 3, 84, 1, 1, NULL),
(278, 'MT5.4-G2-Q9', 'MT5.4G2', 'What comes before April', 3, 84, 1, 1, NULL),
(279, 'MT5.4-G2-Q10', 'MT5.4G2', 'What comes after May', 3, 84, 1, 1, NULL),
(280, 'MT5.4-G2-Q11', 'MT5.4G2', 'What comes before May', 3, 84, 1, 1, NULL),
(281, 'MT5.4-G2-Q12', 'MT5.4G2', 'What comes after June', 3, 84, 1, 1, NULL),
(282, 'MT5.4-G2-Q13', 'MT5.4G2', 'What comes before June', 3, 84, 1, 1, NULL),
(283, 'MT5.4-G2-Q14', 'MT5.4G2', 'What comes after July', 3, 84, 1, 1, NULL),
(284, 'MT5.4-G2-Q15', 'MT5.4G2', 'What comes before July', 3, 84, 1, 1, NULL),
(285, 'MT5.4-G2-Q16', 'MT5.4G2', 'What comes after August', 3, 84, 1, 1, NULL),
(286, 'MT5.4-G2-Q17', 'MT5.4G2', 'What comes before August', 3, 84, 1, 1, NULL),
(287, 'MT5.4-G2-Q18', 'MT5.4G2', 'What comes after September', 3, 84, 1, 1, NULL),
(288, 'MT5.4-G2-Q19', 'MT5.4G2', 'What comes before September', 3, 84, 1, 1, NULL),
(289, 'MT5.4-G2-Q20', 'MT5.4G2', 'What comes after October', 3, 84, 1, 1, NULL),
(290, 'MT5.4-G2-Q21', 'MT5.4G2', 'What comes before October', 3, 84, 1, 1, NULL),
(291, 'MT5.4-G2-Q22', 'MT5.4G2', 'What comes after November', 3, 84, 1, 1, NULL),
(292, 'MT5.4-G2-Q23', 'MT5.4G2', 'What comes before November', 3, 84, 1, 1, NULL),
(293, 'MT5.4-G2-Q24', 'MT5.4G2', 'What comes after December', 3, 84, 1, 1, NULL),
(294, 'MT5.4-G2-Q25', 'MT5.4G2', 'What comes before December', 3, 84, 1, 1, NULL),
(295, 'MT6.1-G2-Q1', 'MT6.1-G2', 'Select the following days', 3, 86, 1, 1, NULL),
(296, 'MT6.2-G2-Q1', 'MT6.2-G2', 'Select the following days', 3, 86, 1, 1, NULL),
(297, 'NSF1.1B-G3-Q1', 'NSF1.1B-G3', 'Select the missing part and make the whole object (complete the object?)', 3, 3, 1, 1, NULL),
(298, 'NSF1.2A-G3-Q1', 'NSF1.2A-G3', 'Select the part that is one fourth of the whole', 3, 3, 1, 1, NULL),
(299, 'NSF1.2A-G3-Q2', 'NSF1.2A-G3', 'Select the part that is half of the whole', 3, 3, 1, 1, NULL),
(300, 'NSF1.2A-G3-Q3', 'NSF1.2A-G3', 'Select the part that is  three fourth of the whole', 3, 3, 1, 1, NULL),
(301, 'NSF1.2B-G3-Q1', 'NSF1.2B-G3', 'What fraction of the whole does orange   part represent', 3, 3, 1, 1, NULL),
(302, 'NSF1.2B-G3-Q2', 'NSF1.2B-G3', 'What fraction of the whole does blue  part represent', 3, 3, 1, 1, NULL),
(303, 'NSF1.2B-G3-Q3', 'NSF1.2B-G3', 'What fraction of the whole does green  part represent', 3, 3, 1, 1, NULL),
(304, 'NSF1.2B-G3-Q4', 'NSF1.2B-G3', 'What fraction of the whole does purple  part represent', 3, 3, 1, 1, NULL),
(305, 'NSF1.2B-G3-Q5', 'NSF1.2B-G3', 'What fraction of the whole does red  part represent', 3, 3, 1, 1, NULL),
(306, 'NSF1.2C-G3-Q1', 'NSF1.2C-G3', 'Color the parts to represent 1/4 of the whole', 2, 3, 1, 1, NULL),
(307, 'NSF1.2C-G3-Q2', 'NSF1.2C-G3', 'Color the parts to represent 1/2 of the whole', 2, 3, 1, 1, NULL),
(308, 'NSF1.2C-G3-Q3', 'NSF1.2C-G3', 'Color the parts to represent 3/4 of the whole', 2, 3, 1, 1, NULL),
(309, 'ML2.4A-G3-Q1', 'ML2.4A-G3', 'Drag the tape to measure the length of the object. Enter the value and select the check button', 2, 74, 1, 1, NULL),
(310, 'ML2.4A-G3-Q2', 'ML2.4A-G3', 'Drag the bar to measure the height of the object. Enter the value and select the check button', 2, 74, 1, 1, NULL),
(311, 'ML2.4B-G3-Q1', 'ML2.4B-G3', 'Drag and place the meter scale to measure the length of the object. Enter the value and select the check button', 2, 74, 1, 1, NULL),
(312, 'MW3.2B-G3-Q1', 'MW3.2B-G3', 'Drag and place the measuring objects to balance the scale. Enter the value of the measuring objects used to measure the given object', 2, 107, 1, 1, NULL),
(313, 'MW3.2C-G3-Q1', 'MW3.2C-G3', 'Drag and place the 10 gm blue rods to measure the weight of the object. Enter the value of the measured object', 2, 108, 1, 1, NULL),
(314, 'MW3.2C-G3-Q2', 'MW3.2C-G3', 'Drag and place the 1 gm yellow cubes to measure the weight of the object. Enter the value of the measured object', 2, 108, 1, 1, NULL),
(315, 'MW3.2D-G3-Q1', 'MW3.2D-G3', 'Drag and place the 1 gm cubes and 10gm rods to measure the weight of the object. Enter the value of the measured object', 2, 108, 1, 1, NULL),
(316, 'MW3.3A-G3-Q1', 'MW3.3A-G3', 'Drag and place the correct weights to measure the weight of the object. Enter the value of the measured object in grams', 2, 108, 1, 1, NULL),
(317, 'MW3.3B1-G3-Q1', 'MW3.3B1-G3', 'Drag and place the correct weights to measure the weight of the object. Enter the value of the measured object in kilograms', 2, 108, 1, 1, NULL),
(318, 'MW3.3B2-G3-Q1', 'MW3.3B2-G3', 'Drag and place the correct weights to measure the weight of the object. Enter the value of the measured object in kilograms and grams', 2, 108, 1, 1, NULL),
(319, 'MT7.1-G3-Q1', 'MT7.1-G3', 'Drag and place the numbers in the clock. Select the check button when done', 2, 87, 1, 1, NULL),
(320, 'MT7.2-G3-Q1', 'MT7.2-G3', 'Drag  the numbers to denote the time shown on the clock', 2, 88, 1, 1, NULL),
(321, 'MV4.1A-G4-Q1', 'MV4.1A-G4', 'Which of these containers has more liquid', 3, 95, 1, 1, NULL),
(322, 'MV4.1A-G4-Q2', 'MV4.1A-G4', 'Which of these containers has less liquid', 3, 95, 1, 1, NULL),
(323, 'MV4.1A-G4-Q3', 'MV4.1A-G4', 'Which of the containers have equal amount of liquid', 3, 95, 1, 1, NULL),
(324, 'MV4.1B-G4-Q1', 'MV4.1B-G4', 'Arrange the containers from less to more liquid in the box. Select check button when done', 5, 96, 1, 1, NULL),
(325, 'MV4.1B-G4-Q2', 'MV4.1B-G4', 'Arrange the containers from more to less liquid in the box. Select check button when done', 5, 96, 1, 1, NULL),
(326, 'MV4.1C-G4-Q1', 'MV4.1C-G4', 'Arrange the containers which can hold more to less amount of liquid. Select check button when done', 5, 96, 1, 1, NULL),
(327, 'MV4.1C-G4-Q2', 'MV4.1C-G4', 'Arrange the containers which can hold less to more amount of liquid. Select check button when done', 5, 96, 1, 1, NULL),
(328, 'MV4.2A-G4-Q1', 'MV4.2A-G4', 'Select the smaller container to fill the bigger container completely . Enter the number of times smaller container was required to fill the bigger container', 2, 97, 1, 1, NULL),
(329, 'MV4.2B-G4-Q1', 'MV4.2B-G4', 'Select the smallest container in the box to fill all the bigger containers completely . Enter the number of times smaller container was required to fill the bigger containers', 2, 97, 1, 1, NULL),
(330, 'MV4.2C-G4-Q1', 'MV4.2C-G4', 'Select the two smaller containers one by one to fill the bigger container completely. Enter the number of times smaller containers were required to fill the bigger container', 2, 97, 1, 1, NULL),
(331, 'MV4.3A-G4-Q1', 'MV4.3A-G4', 'Select the smaller measuring container to fill the bigger container till the red mark. Enter the total amount filled in milliters', 2, 98, 1, 1, NULL),
(332, 'MV4.3B-G4-Q1', 'MV4.3B-G4', 'Select the  measuring container to fill the given container completely. Select the check button when completely filled', 2, 98, 1, 1, NULL),
(333, 'MV4.3C-G4-Q1', 'MV4.3C-G4', 'Select a combination of the two measuring containers to fill the other container till the red mark. Select the check button once filled', 2, 98, 1, 1, NULL),
(334, 'MV4.3C-G4-Q2', 'MV4.3C-G4', 'Select a combination of the two measuring containers to fill the other container till the red mark. Select the check button once filled', 2, 98, 1, 1, NULL),
(335, 'NSN1.1-G1-Q1', 'NSN1.1-G1', 'Listen to the number name and select the objects that match with the name', 3, 25, 1, 1, NULL),
(336, 'NSN1.2-G1-Q1', 'NSN1.2-G1', 'Listen to the number name and pick that many mangoes from the tree and put it into the basket', 5, 25, 1, 1, NULL),
(337, 'NSN1.3-G1-Q1', 'NSN1.3-G1', 'Count the number of fish and select the matching number', 3, 26, 1, 1, NULL),
(338, 'NSN1.4-G1-Q1', 'NSN1.4-G1', 'Look at the displayed number and select the matching objects', 3, 26, 1, 1, NULL),
(339, 'NSN1.5-G1-Q1', 'NSN1.5-G1', 'Look at the displayed  number name and  pick that many mangoes from the tree and put it into the basket', 5, 26, 1, 1, NULL),
(340, 'NSN1.6-G1-Q1', 'NSN1.6-G1', 'Listen to the number name and burst the balloon having that number', 3, 26, 1, 1, NULL),
(341, 'NSN1.7-G1-Q1', 'NSN1.7-G1', 'Count the fish and trace the number', 3, 26, 1, 1, NULL),
(342, 'NSS2.1-G1-Q1', 'NSS2.1-G1', 'Select the catterpillar that is displaying the numbers in sequence', 3, 37, 1, 1, NULL),
(343, 'NSS2.2-G1-Q1', 'NSS2.2-G1', 'Place the numbers in sequence on the catterpillars body', 5, 37, 1, 1, NULL),
(344, 'NSS2.3-G1-Q1', 'NSS2.3-G1', 'Place the missing numbers in sequence on the catterpillars body', 5, 37, 1, 1, NULL),
(345, 'NSS2.4-G1-Q1', 'NSS2.4-G1', 'What comes before and after the number on the cattepillars body', 5, 31, 1, 1, NULL),
(346, 'NSS2.5-G1-Q1', 'NSS2.5-G1', 'What comes in between the two  numbers on the cattepillars body', 5, 32, 1, 1, NULL),
(347, 'NSS2.6-G1-Q1', 'NSS2.6-G1', 'Place the missing piece in the puzzle', 2, 33, 1, 1, NULL),
(348, 'NSC4.1-G1-Q1', 'NSC4.1-G1', 'Which is lesser ? ', 3, 11, 1, 1, NULL),
(349, 'NSC4.1-G1-Q2', 'NSC4.1-G1', 'Which is greater', 3, 11, 1, 1, NULL),
(350, 'NSC4.2-G1-Q1', 'NSC4.2-G1', 'Are they equal? ', 4, 11, 1, 1, NULL),
(351, 'NSC4.3-G1-Q1', 'NSC4.3-G1', 'Compare the two numbers and place the correct symbol between the numbers', 2, 10, 1, 1, NULL),
(352, 'NSC4.4-G1-Q1', 'NSC4.4-G1', 'Help the boy climb up the tree by arranging the numbers in ascending order. Start by placing  the smallest number at the bottom', 5, 36, 1, 1, NULL),
(353, 'NSC4.5-G1-Q1', 'NSC4.5-G1', 'Help the boy climb down the tree by arranging the numbers in descending order. Start by placing the biggest number at the top', 5, 36, 1, 1, NULL),
(354, 'NOA5.1-G1-Q1', 'NOA5.1-G1', 'Give me 1 more carrot . How may do I have together?  ', 2, 38, 1, 1, NULL),
(355, 'NOA5.1-G1-Q2', 'NOA5.1-G1', 'Give me 2 more carrot. How Many do I have together ', 2, 38, 1, 1, NULL),
(356, 'NOA5.1-G1-Q3', 'NOA5.1-G1', 'Give me 3 more carrot. How Many do I have together ? ', 2, 38, 1, 1, NULL),
(357, 'NOA5.1-G1-Q4', 'NOA5.1-G1', 'Give me 4 more carrot. How Many do I have together ? ', 2, 38, 1, 1, NULL),
(358, 'NOA5.1-G1-Q5', 'NOA5.1-G1', 'Give me 5 more carrot. How Many do I have together ? ', 2, 38, 1, 1, NULL),
(359, 'NOA5.1-G1-Q6', 'NOA5.1-G1', 'Give me 6 more carrot. How Many do I have together ? ', 2, 38, 1, 1, NULL),
(360, 'NOA5.1-G1-Q7', 'NOA5.1-G1', 'Give me 7 more carrot. How Many do I have together ', 2, 38, 1, 1, NULL),
(361, 'NOA5.1-G1-Q8', 'NOA5.1-G1', 'Give me 8 more carrot. How Many do I have together ? ', 2, 38, 1, 1, NULL),
(362, 'NOA5.1-G1-Q9', 'NOA5.1-G1', 'Give me 9 more carrot. How Many do I have together ? ', 2, 38, 1, 1, NULL),
(363, 'NOA6.1-G1-Q1', 'NOA6.1-G1', 'How many more carrots will make a 1', 2, 38, 1, 1, NULL),
(364, 'NOA6.1-G1-Q2', 'NOA6.1-G1', 'How many more carrots will make a 2 ', 2, 38, 1, 1, NULL),
(365, 'NOA6.1-G1-Q3', 'NOA6.1-G1', 'How many more carrots will make a 3 ', 2, 38, 1, 1, NULL),
(366, 'NOA6.1-G1-Q4', 'NOA6.1-G1', 'How many more carrots will make a 4 ', 2, 38, 1, 1, NULL),
(367, 'NOA6.1-G1-Q5', 'NOA6.1-G1', 'How many more carrots will make a 5 ', 2, 38, 1, 1, NULL),
(368, 'NOA6.1-G1-Q6', 'NOA6.1-G1', 'How many more carrots will make a 6 ', 2, 38, 1, 1, NULL),
(369, 'NOA6.1-G1-Q7', 'NOA6.1-G1', 'How many more carrots will make a 7 ', 2, 38, 1, 1, NULL),
(370, 'NOA6.1-G1-Q8', 'NOA6.1-G1', 'How many more carrots will make a 8 ', 2, 38, 1, 1, NULL),
(371, 'NOA6.1-G1-Q9', 'NOA6.1-G1', 'How many more carrots will make a 9 ', 2, 38, 1, 1, NULL),
(372, 'NOA7.1-G1-Q1', 'NOA7.1-G1', 'Drop the coins equal to the second number to find the sum. ', 2, 42, 1, 1, NULL),
(373, 'NOA7.2-G1-Q1', 'NOA7.2-G1', 'Drop the coins equal to the second number to find the sum. ', 2, 42, 1, 1, NULL),
(374, 'NOS8.1-G1-Q1', 'NOS8.1-G1', 'Give me 1 carrot - how many are left', 2, 66, 1, 1, NULL),
(375, 'NOS8.1-G1-Q2', 'NOS8.1-G1', 'Give me 2 carrots- how many are left', 2, 66, 1, 1, NULL),
(376, 'NOS8.1-G1-Q3', 'NOS8.1-G1', 'Give me 3 carrots - how many are left', 2, 66, 1, 1, NULL),
(377, 'NOS8.1-G1-Q4', 'NOS8.1-G1', 'Give me 4 carrots - how may are left', 2, 66, 1, 1, NULL),
(378, 'NOS8.1-G1-Q5', 'NOS8.1-G1', 'Give me 5 carrots - how many are left', 2, 66, 1, 1, NULL),
(379, 'NOS8.1-G1-Q6', 'NOS8.1-G1', 'Give me 6 carrots - how many are left', 2, 66, 1, 1, NULL),
(380, 'NOS8.1-G1-Q7', 'NOS8.1-G1', 'Give me 7 carrots - how many are left', 2, 66, 1, 1, NULL),
(381, 'NOS8.1-G1-Q8', 'NOS8.1-G1', 'Give me 8 carrots - how many are left', 2, 66, 1, 1, NULL),
(382, 'NOS8.1-G1-Q9', 'NOS8.1-G1', 'Give me 9 carrots - how many are left', 2, 66, 1, 1, NULL),
(383, 'NOS9.1-G1-Q1', 'NOS9.1-G1', 'Count and burst the purple balloons. How many pink ballons are left', 2, 63, 1, 1, NULL),
(384, 'NOS10.1-G1-Q1', 'NOS10.1-G1', 'Put the coloured coins equal to the second number into the coloured slot to subtract it.', 2, 69, 1, 1, NULL),
(385, 'NOS10.2-G1-Q1', 'NOS10.2-G1', 'Put the coloured coins equal to the second number into the coloured slot to subtract it.  ', 2, 68, 1, 1, NULL),
(386, 'NOM11.1-G1-Q1', 'NOM11.1-G1', 'How many apples together ', 2, 58, 1, 1, NULL),
(387, 'NOM11.2-G1-Q1', 'NOM11.2-G1', 'Place the groups of apples in the boxes ,  how many are there altogether? ', 2, 58, 1, 1, NULL),
(388, 'NOM12.3-G1-Q1', 'NOM12.3-G1', 'What is the product ', 2, 60, 1, 1, NULL),
(389, 'NOD16.1-G1-Q1', 'NOD16.1-G1', 'Give  1 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(390, 'NOD16.1-G1-Q2', 'NOD16.1-G1', 'Give  2 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(391, 'NOD16.1-G1-Q3', 'NOD16.1-G1', 'Give  3 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(392, 'NOD16.1-G1-Q4', 'NOD16.1-G1', 'Give  4 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(393, 'NOD16.1-G1-Q5', 'NOD16.1-G1', 'Give  5 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(394, 'NOD16.1-G1-Q6', 'NOD16.1-G1', 'Give  6 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(395, 'NODD16.1-G1-Q7', 'NOD16.1-G1', 'Give  7 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(396, 'NOD16.1-G1-Q8', 'NOD16.1-G1', 'Give  8 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(397, 'NOD16.1-G1-Q9', 'NOD16.1-G1', 'Give  9 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(398, 'NOD16.2-G1-Q1', 'NOD16.2-G1', 'Give  1 carrot to each rabbit. How many rabbits did you feed? How many carrots are left', 2, 49, 1, 1, NULL),
(399, 'NOD16.2-G1-Q2', 'NOD16.2-G1', 'Give  2 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(400, 'NOD16.2-G1-Q3', 'NOD16.2-G1', 'Give  3 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(401, 'NOD16.2-G1-Q4', 'NOD16.2-G1', 'Give  4 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(402, 'NOD16.2-G1-Q5', 'NOD16.2-G1', 'Give  5 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(403, 'NOD16.2-G1-Q6', 'NOD16.2-G1', 'Give  6 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(404, 'NOD16.2-G1-Q7', 'NOD16.2-G1', 'Give  7 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(405, 'NOD16.2-G1-Q8', 'NOD16.2-G1', 'Give  8 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(406, 'NOD16.2-G1-Q9', 'NOD16.2-G1', 'Give  9 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(407, 'NSS2.1-G2-Q1', 'NSS2.1-G2', 'Select the catterpillar that is displaying the numbers in sequence', 3, 37, 1, 1, NULL),
(408, 'NSS2.2-G2-Q1', 'NSS2.2-G2', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(409, 'NSS2.3-G2-Q1', 'NSS2.3-G2', 'Place the missing numbers in sequence on the catterpillars body', 5, 33, 1, 1, NULL),
(410, 'NSS2.4-G2-Q1', 'NSS2.4-G2', 'What comes before and after the number on the cattepillars body', 2, 31, 1, 1, NULL),
(411, 'NSS2.5-G2-Q1', 'NSS2.5-G2', 'What comes in between the two  numbers on the cattepillars body?', 2, 32, 1, 1, NULL),
(412, 'NSS2.6-G2-Q1', 'NSS2.6-G2', 'Place the missing piece in the puzzle', 2, 33, 1, 1, NULL),
(413, 'NSPV3.1-G2-Q1', 'NSPV3.1-G2', 'Drop the coins in the machine to show the displayed number. Enter the expansion form of this number', 2, 18, 1, 1, NULL),
(414, 'NSPV3.2-G2-Q1', 'NSPV3.2-G2', 'Count the number of blue and yellow coins and enter the number in the colored boxes', 2, 18, 1, 1, NULL),
(415, 'NSC4.3-G2-Q1', 'NSC4.3-G2', 'Compare the two numbers and place the correct symbol between the numbers', 2, 10, 1, 1, NULL),
(416, 'NSC4.4-G2-Q1', 'NSC4.4-G2', 'Help the boy climb up the tree by arranging the numbers in ascending order. ', 5, 36, 1, 1, NULL),
(417, 'NSC4.5-G2-Q1', 'NSC4.5-G2', 'Help the boy climb down the tree by arranging the numbers in descending order. ', 5, 36, 1, 1, NULL),
(418, 'NSC4.6-G2-Q1', 'NSC4.6-G2', 'Form a 3 digit number using the given digits. ', 5, 9, 1, 1, NULL),
(419, 'NOA7.1-G2-Q1', 'NOA7.1-G2', 'Drop the coins equal to the second number to find the sum', 2, 43, 1, 1, NULL),
(420, 'NOA7.2-G2-Q1', 'NOA7.2-G2', 'Drop the coins equal to the second number to find the sum', 2, 42, 1, 1, NULL),
(421, 'NOS10.1-G2-Q1', 'NOS10.1-G2', 'Put the coloured coins equal to the second number into the coloured slot to subtract it. ', 2, 69, 1, 1, NULL),
(422, 'NOS10.2-G2-Q1', 'NOS10.2-G2', 'Put the coloured coins equal to the second number into the coloured slot to subtract it.  ', 2, 68, 1, 1, NULL),
(423, 'NOM12.1-G2-Q1', 'NOM12.1-G2', 'Drag/tap on the eggs to show the given multiplication fact  and find the product', 2, 53, 1, 1, NULL),
(424, 'NOM12.2-G2-Q1', 'NOM12.2-G2', 'Drag/tap on the eggs to generate the multiplication table and write the product', 2, 60, 1, 1, NULL),
(425, 'NOM12.3-G2-Q1', 'NOM12.3-G2', 'What is the product', 2, 60, 1, 1, NULL),
(426, 'NOD15.1-G2-Q1', 'NOD15.1-G2', 'Distribute equally  the fish in the bigger tank into the smaller tanks. How many fish in each small tank', 2, 49, 1, 1, NULL),
(427, 'NOD15.2-G2-Q1', 'NOD15.2-G2', 'Distribute equally  the fish in the bigger tank into the smaller tanks. How many fish in each small tank? How many remaining in the big tank', 2, 49, 1, 1, NULL),
(428, 'NOD16.1-G2-Q1', 'NOD16.1-G2', 'Give  1 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(429, 'NOD16.1-G2-Q2', 'NOD16.1-G2', 'Give  2 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(430, 'NOD16.1-G2-Q3', 'NOD16.1-G2', 'Give  3 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(431, 'NOD16.1-G2-Q4', 'NOD16.1-G2', 'Give  4 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(432, 'NOD16.1-G2-Q5', 'NOD16.1-G2', 'Give  5 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(433, 'NOD16.1-G2-Q6', 'NOD16.1-G2', 'Give  6 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(434, 'NOD16.1-G2-Q7', 'NOD16.1-G2', 'Give  7 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(435, 'NOD16.1-G2-Q8', 'NOD16.1-G2', 'Give  8 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(436, 'NOD16.1-G2-Q9', 'NOD16.1-G2', 'Give  9 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(437, 'NOD16.2-G2-Q1', 'NOD16.2-G2', 'Give  1 carrot to each rabbit. How many rabbits did you feed? How many carrots are left', 2, 49, 1, 1, NULL),
(438, 'NOD16.2-G2-Q2', 'NOD16.2-G2', 'Give  2 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(439, 'NOD16.2-G2-Q3', 'NOD16.2-G2', 'Give  3 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(440, 'NOD16.2-G2-Q4', 'NOD16.2-G2', 'Give  4 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(441, 'NOD16.2-G2-Q5', 'NOD16.2-G2', 'Give  5 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(442, 'NOD16.2-G2-Q6', 'NOD16.2-G2', 'Give  6 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(443, 'NOD16.2-G2-Q7', 'NOD16.2-G2', 'Give  7 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(444, 'NOD16.2-G2-Q8', 'NOD16.2-G2', 'Give  8 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(445, 'NOD16.2-G2-Q9', 'NOD16.2-G2', 'Give  9 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(446, 'NOD16.3-G2-Q1', 'NOD16.3-G2', 'Distribute the eggs in each row in the crete to the baskets. How many baskets did you fill', 2, 53, 1, 1, NULL),
(447, 'NOD17.2-G2-Q1', 'NOD17.2-G2', 'Distribute the coins which are in the machine equally to each tray. ', 2, 50, 1, 1, NULL),
(448, 'NOD17.3-G2-Q1', 'NOD17.3-G2', 'Distribute the coins which are in the machine equally to each tray. ', 2, 51, 1, 1, NULL),
(449, 'NSS2.1-G3-Q1', 'NSS2.1-G3', 'Select the catterpillar that is displaying the numbers in sequence', 3, 37, 1, 1, NULL),
(450, 'NSS2.2-G3-Q1', 'NSS2.2-G3', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(451, 'NSS2.3-G3-Q1', 'NSS2.3-G3', 'Place the missing numbers in sequence on the catterpillars body', 5, 33, 1, 1, NULL),
(452, 'NSS2.4-G3-Q1', 'NSS2.4-G3', 'What comes before and after the number on the cattepillars body', 2, 31, 1, 1, NULL),
(453, 'NSS2.5-G3-Q1', 'NSS2.5-G3', 'What comes in between the two  numbers on the cattepillars body?', 2, 32, 1, 1, NULL),
(454, 'NSS2.6-G3-Q1', 'NSS2.6-G3', 'Place the missing piece in the puzzle', 2, 33, 1, 1, NULL),
(455, 'NSPV3.1-G3-Q1', 'NSPV3.1-G3', 'Drop the coins in the machine to show the displayed number', 2, 18, 1, 1, NULL),
(456, 'NSPV3.2-G3-Q1', 'NSPV3.2-G3', 'Count the number of green, blue and yellow coins and enter the number in the colored boxes', 2, 18, 1, 1, NULL),
(457, 'NSC4.3-G3-Q1', 'NSC4.3-G3', 'Compare the two numbers and place the correct symbol between the numbers', 2, 10, 1, 1, NULL),
(458, 'NSC4.4-G3-Q1', 'NSC4.4-G3', 'Help the boy climb up the tree by arranging the numbers in ascending order. Start by placing  the smallest number at the bottom', 5, 36, 1, 1, NULL),
(459, 'NSC4.5-G3-Q1', 'NSC4.5-G3', 'Help the boy climb down the tree by arranging the numbers in descending order. Start by placing the biggest number at the top', 5, 36, 1, 1, NULL),
(460, 'NSC4.6-G3-Q1', 'NSC4.6-G3', 'Form a 3 digit number using the given digits . Place the smallest number formed below the mouse and the biggest number below the elephant', 5, 9, 1, 1, NULL),
(461, 'NOA7.1-G3-Q1', 'NOA7.1-G3', 'Drop the coins equal to the second number to find the sum', 2, 43, 1, 1, NULL),
(462, 'NOA7.2-G3-Q1', 'NOA7.2-G3', 'Drop the coins equal to the second number to find the sum', 2, 42, 1, 1, NULL),
(463, 'NOS10.1-G3-Q1', 'NOS10.1-G3', 'Put the coloured coins equal to the second number into the coloured slot to subtract it.  ', 2, 69, 1, 1, NULL),
(464, 'NOS10.2-G3-Q1', 'NOS10.2-G3', 'Put the coloured coins equal to the second number into the coloured slot to subtract it. ', 2, 68, 1, 1, NULL),
(465, 'NOM12.3-G3-Q1', 'NOM12.3-G3', 'What is the product ', 2, 60, 1, 1, NULL),
(466, 'NOM13.1-G3-Q1', 'NOM13.1-G3', 'Fix thepuzzle pieces to complete the multiplication grid', 2, 60, 1, 1, NULL),
(467, 'NOM14.1-G3-Q1', 'NOM14.1-G3', 'Use the green 100s plate , the blue tens rod and the yellow ones cube to fill the empty grid. Add these  to find the product', 2, 59, 1, 1, NULL);
INSERT INTO `question_tbl` (`idq`, `id_question`, `id_game`, `description`, `id_question_type`, `id_micro_concept`, `id_level`, `id_question_classification`, `correct_answer`) VALUES
(468, 'NOM14.2-G3-Q1', 'NOM14.2-G3', 'Represent the multipicands using the blue rods and yellow cubes by placing in orange row and column. Use the green 100s plate , the blue tens rod and the yellow ones cube to fill the empty grid. Add these  to find the product', 2, 59, 1, 1, NULL),
(469, 'NOD16.1-G3-Q1', 'NOD16.1-G3', 'Give  1 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(470, 'NOD16.1-G3-Q2', 'NOD16.1-G3', 'Give  2 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(471, 'NOD16.1-G3-Q3', 'NOD16.1-G3', 'Give  3 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(472, 'NOD16.1-G3-Q4', 'NOD16.1-G3', 'Give  4 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(473, 'NOD16.1-G3-Q5', 'NOD16.1-G3', 'Give  5 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(474, 'NOD16.1-G3-Q6', 'NOD16.1-G3', 'Give  6 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(475, 'NOD16.1-G3-Q7', 'NOD16.1-G3', 'Give  7 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(476, 'NOD16.1-G3-Q8', 'NOD16.1-G3', 'Give  8 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(477, 'NOD16.1-G3-Q9', 'NOD16.1-G3', 'Give  9 carrot to each rabbit. How many rabbits did you feed', 2, 49, 1, 1, NULL),
(478, 'NOD16.2-G3-Q1', 'NOD16.2-G3', 'Give  1 carrot to each rabbit. How many rabbits did you feed? How many carrots are left', 2, 49, 1, 1, NULL),
(479, 'NOD16.2-G3-Q2', 'NOD16.2-G3', 'Give  2 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(480, 'NOD16.2-G3-Q3', 'NOD16.2-G3', 'Give  3 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(481, 'NOD16.2-G3-Q4', 'NOD16.2-G3', 'Give  4 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(482, 'NOD16.2-G3-Q5', 'NOD16.2-G3', 'Give  5 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(483, 'NOD16.2-G3-Q6', 'NOD16.2-G3', 'Give  6 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(484, 'NOD16.2-G3-Q7', 'NOD16.2-G3', 'Give  7 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(485, 'NOD16.2-G3-Q8', 'NOD16.2-G3', 'Give  8 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(486, 'NOD16.2-G3-Q9', 'NOD16.2-G3', 'Give  9 carrot to each rabbit. How many rabbits did you feed?How many carrots are left', 2, 49, 1, 1, NULL),
(487, 'NOD16.3-G3-Q1', 'NOD16.3-G3', 'Distribute the eggs in each row in the crete to the baskets. How many baskets did you fill', 2, 49, 1, 1, NULL),
(488, 'NOD17.2-G3-Q1', 'NOD17.2-G3', 'Distribute the coins which are in the machine equally to each tray.  How many coins are there in one tray?Write the answers in coloured boxes. ', 2, 50, 1, 1, NULL),
(489, 'NOD17.3-G3-Q1', 'NOD17.3-G3', 'Distribute the coins which are in the machine equally to each tray. How many coins are there in one tray?  Write the answers in coloured boxes.  How many are remaining in machine ', 2, 51, 1, 1, NULL),
(490, 'NSF1.1A-G1-Q1', 'NSF1.1A-G1', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(491, 'NSF1.2A-G1-Q1', 'NSF1.2A-G1', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(492, 'NSF1.2B-G1-Q1', 'NSF1.2B-G1', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(493, 'NSF1.1A-G2-Q1', 'NSF1.1A-G2', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(494, 'NSF1.2A-G2-Q1', 'NSF1.2A-G2', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(495, 'NSF1.2B-G2-Q1', 'NSF1.2B-G2', 'Select the object divided into equal parts', 3, 3, 1, 1, NULL),
(496, 'NSF1.1B-G3-Q1', 'NSF1.1B-G3', 'Select the missing part and make the whole object (complete the object?)', 3, 3, 1, 1, NULL),
(497, 'NSF1.3A-G3-Q1', 'NSF1.3A-G3', 'Select the missing part and make the whole object (complete the object?)', 3, 3, 1, 1, NULL),
(498, 'NSF1.3B-G3-Q1', 'NSF1.3B-G3', 'Select the missing part and make the whole object (complete the object?)', 3, 3, 1, 1, NULL),
(499, 'NSF1.4-G3-Q1', 'NSF1.4-G3', 'Select the part that is one fourth of the whole', 3, 3, 1, 1, NULL),
(500, 'NSF1.4-G3-Q2', 'NSF1.4-G3', 'Select the part that is half of the whole', 3, 3, 1, 1, NULL),
(501, 'NSF1.4-G3-Q3', 'NSF1.4-G3', 'Select the part that is  three fourth of the whole', 3, 3, 1, 1, NULL),
(502, 'NSF1.4-G3-Q4', 'NSF1.4-G3', 'What fraction of the whole does orange   part represent?', 3, 3, 1, 1, NULL),
(503, 'NSF1.4-G3-Q5', 'NSF1.4-G3', 'What fraction of the whole does blue  part represent?', 3, 3, 1, 1, NULL),
(504, 'NSF1.4-G3-Q6', 'NSF1.4-G3', 'What fraction of the whole does green  part represent?', 3, 3, 1, 1, NULL),
(505, 'NSF1.4-G3-Q7', 'NSF1.4-G3', 'What fraction of the whole does purple  part represent?', 3, 3, 1, 1, NULL),
(506, 'NSF1.4-G3-Q8', 'NSF1.4-G3', 'What fraction of the whole does red  part represent?', 3, 3, 1, 1, NULL),
(507, 'NSF1.4-G3-Q9', 'NSF1.4-G3', 'Color the parts to represent 1/4 of the whole', 2, 3, 1, 1, NULL),
(508, 'NSF1.4-G3-Q10', 'NSF1.4-G3', 'Color the parts to represent 1/2 of the whole', 2, 3, 1, 1, NULL),
(509, 'NSF1.4-G3-Q11', 'NSF1.4-G3', 'Color the parts to represent 3/4 of the whole', 2, 3, 1, 1, NULL),
(510, 'NSS2.1A-G1-Q1', 'NSS2.1A-G1', 'Select the catterpillar that is displaying the numbers in sequence', 3, 37, 1, 1, NULL),
(511, 'NSS2.2A-G1-Q1', 'NSS2.2A-G1', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(512, 'NSS2.3A-G1-Q1', 'NSS2.3A-G1', 'Place the missing numbers in sequence on the catterpillars body', 5, 37, 1, 1, NULL),
(513, 'NSS2.4A-G1-Q1', 'NSS2.4A-G1', 'What comes before and after the number on the cattepillars body?', 5, 31, 1, 1, NULL),
(514, 'NSS2.5A-G1-Q1', 'NSS2.5A-G1', 'What comes in between the two  numbers on the cattepillars body?', 5, 32, 1, 1, NULL),
(515, 'NSS2.1A-G2-Q1', 'NSS2.1A-G2', 'Select the catterpillar that is displaying the numbers in sequence', 3, 37, 1, 1, NULL),
(516, 'NSS2.2A-G2-Q1', 'NSS2.2A-G2', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(517, 'NSS2.3A-G2-Q1', 'NSS2.3A-G2', 'Place the missing numbers in sequence on the catterpillars body', 5, 33, 1, 1, NULL),
(518, 'NSS2.4A-G2-Q1', 'NSS2.4A-G2', 'What comes before and after the number on the cattepillars body?', 5, 31, 1, 1, NULL),
(519, 'NSS2.5A-G2-Q1', 'NSS2.5A-G2', 'What comes in between the two  numbers on the cattepillars body?', 5, 32, 1, 1, NULL),
(520, 'NSS2.1A-G3-Q1', 'NSS2.1A-G3', 'Select the catterpillar that is displaying the numbers in sequence', 3, 37, 1, 1, NULL),
(521, 'NSS2.2A-G3-Q1', 'NSS2.2A-G3', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(522, 'NSS2.3A-G3-Q1', 'NSS2.3A-G3', 'Place the missing numbers in sequence on the catterpillars body', 5, 33, 1, 1, NULL),
(523, 'NSS2.4A-G3-Q1', 'NSS2.4A-G3', 'What comes before and after the number on the cattepillars body?', 5, 31, 1, 1, NULL),
(524, 'NSS2.5A-G3-Q1', 'NSS2.5A-G3', 'What comes in between the two  numbers on the cattepillars body?', 5, 32, 1, 1, NULL),
(525, 'NSS2.7-G3-Q1', 'NSS2.7-G3', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(526, 'NSS2.7A-G3-Q1', 'NSS2.7A-G3', 'Place the numbers in sequecne on the catterpillars body', 5, 37, 1, 1, NULL),
(527, 'NSPV3.1A-G1-Q1', 'NSPV3.1A-G1', 'How many Cubes', 5, 17, 1, 1, NULL),
(528, 'NSPV3.1A-G1-Q2', 'NSPV3.1A-G1', 'How many Sticks', 5, 17, 1, 1, NULL),
(529, 'NSPV3.1B-G1-Q1', 'NSPV3.1B-G1', 'How many 1s', 5, 17, 1, 1, NULL),
(530, 'NSC4.1A-G1-Q1', 'NSC4.1A-G1', 'less Object', 4, 11, 1, 1, NULL),
(531, 'NSC4.1A-G1-Q2', 'NSC4.1A-G1', 'More Object', 4, 11, 1, 1, NULL),
(532, 'NSC4.2A-G2-Q1', 'NSC4.2A-G2', 'Place the correct Symbol', 2, 11, 1, 1, NULL),
(533, 'NSC4.2A-G3-Q1', 'NSC4.2A-G3', 'Place the correct Symbol', 2, 11, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_type_tbl`
--

CREATE TABLE `question_type_tbl` (
  `id_question_type` int(11) NOT NULL,
  `code` varchar(25) NOT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_type_tbl`
--

INSERT INTO `question_type_tbl` (`id_question_type`, `code`, `description`) VALUES
(1, 'MTF', 'Match the following'),
(2, 'FIB', 'Fill in the blanks'),
(3, 'MCQ', 'Multiple choice question'),
(4, 'TOF', 'True or False'),
(5, 'RAR', 'Rearrange'),
(6, 'WORD', 'Statement or Worded problem');

-- --------------------------------------------------------

--
-- Table structure for table `reports_chm_groups_tbl`
--

CREATE TABLE `reports_chm_groups_tbl` (
  `report_group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_chm_groups_tbl`
--

INSERT INTO `reports_chm_groups_tbl` (`report_group_id`, `group_name`, `display_order`) VALUES
(1, 'User Reports', 1),
(2, 'Engagement Reports', 2),
(4, 'App Usage Metrics Reports', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reports_chm_tbl`
--

CREATE TABLE `reports_chm_tbl` (
  `report_id` int(11) NOT NULL,
  `report_code` varchar(50) NOT NULL,
  `report_name` varchar(100) NOT NULL,
  `view_name` varchar(60) NOT NULL,
  `uniquevaluecolumnname` varchar(100) NOT NULL,
  `report_description` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT 'Id of the report group to which this report belongs to',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_chm_tbl`
--

INSERT INTO `reports_chm_tbl` (`report_id`, `report_code`, `report_name`, `view_name`, `uniquevaluecolumnname`, `report_description`, `group_id`, `is_active`, `display_order`) VALUES
(1, 'USRRPT1', 'Registered Users', 'emrp_active_users_view', 'childid', 'Details of all the registered Children', 1, 1, 1),
(2, 'USRRPT2', 'Daily Registration Stats', 'emrp_dailyregistration_view', 'RegDate', 'Daily Registration Statistics', 1, 1, 2),
(3, 'USRRPT3', 'Weekly Registration Stats', 'emrp_weeklyregistration_view', 'RegWeek', 'Weekly Registration Statistics', 1, 1, 3),
(4, 'USRRPT4', 'Monthly Registration Stats', 'emrp_monthlyregistration_view', 'RegMonth', 'Monthly Registration Statistics', 1, 1, 4),
(5, 'ENGRPT1', 'Daily Game Play Session Stats', 'chm_dailygameplaysessions_view', 'SessionDate', 'Daily Game Play Session Statistics', 2, 1, 1),
(7, 'AUMRPT1', 'Avg. Play Session Time', 'chm_avggameplaysessiontimeperchild_view', 'childid', 'Average session time across all game play sessions played by a Child ', 4, 1, 2),
(8, 'AUMRPT2', 'Game Utilization Metrics', 'chm_totalsessionspergame_view', 'GameId', 'Total number of play sessions for each of the Games', 4, 1, 3),
(9, 'AUMRPT3', 'Game Play Sessions (Last 2 Wks)', 'chm_childtimepergameplaysession_view', 'id_game_play', 'Game Play Sessions played by each Child during the last two weeks', 4, 1, 4),
(10, 'USRRPT5', 'Monthly Registration Stats by Organization', 'chm_monthlyregistration_orgvise_view', 'Organization', 'Organization-vise Registration Stats', 1, 1, 5),
(11, 'ENGRPT2', 'Monthly Game Play Session Stats', 'chm_monthlygameplaysessions_view', 'Month', 'Monthly Game Play Session Statistics', 2, 1, 2),
(12, 'ENGRPT3', 'Monthly Game Play Session Stats Child-vise', 'chm_monthlygameplaysessions_childvise_view', 'Month', 'Monthly Game Play Session Statistics per Child', 2, 1, 3),
(13, 'ENGRPT4', 'Monthly Game Play Session Stats Organization-vise', 'chm_monthlygameplaysessions_orgvise_view', 'Month', 'Monthly Game Play Session Statistics per Organization', 2, 1, 4),
(15, 'AUMRPT4', 'Daily Total Game Play Session time per Child', 'chm_dailytotalsessiontimeperchild_view', 'dateplayed', 'Total Game Play Session time per Child per Day for the last one Month', 4, 1, 1),
(16, 'USRRPT6', 'Active Devices', 'chm_activedevices_view', 'DeviceId', 'List of Devices logged-in at least once every week during the last 4 weeks', 1, 1, 6),
(17, 'ENGRPT6', 'Weekly Game Play Sessions Device-vise', 'chm_weeklygameplaysessions_perdevice_view', 'DeviceId', 'Total Game Play Sessions count per Device per Week during the last 6 months', 2, 1, 6),
(18, 'AUMRPT5', 'Practice And Challenge Modes - Daily Total Games per Child', 'chmprm_totalgamesplayedview4_view', 'PlayDate', 'Daily Total Number of Games Played (play sessions) by each Child in Challenge Plus Practice Modes for last 2 Months (including current month)', 4, 1, 5),
(19, 'AUMRPT6', 'Challenge Modes - Daily Total Games per Child', 'chm_total_games_played_with_gameid', 'PlayDate', 'Daily Total Number of Games Played (play sessions) by each Child in Challenge Mode for last 2 Months (including current month)', 4, 1, 6),
(20, 'AUMRPT7', 'Practice Modes - Daily Total Games per Child', 'prm_total_games_played_with_gameid', 'PlayDate', 'Daily Total Number of Games Played (play sessions) by each Child in Practice Mode for last 2 Months (including current month)', 4, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `reports_prm_groups_tbl`
--

CREATE TABLE `reports_prm_groups_tbl` (
  `report_group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_prm_groups_tbl`
--

INSERT INTO `reports_prm_groups_tbl` (`report_group_id`, `group_name`, `display_order`) VALUES
(1, 'User Reports', 1),
(2, 'Engagement Reports', 2),
(3, 'Learning Outcome Metrics Reports', 3),
(4, 'App Usage Metrics Reports', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reports_prm_tbl`
--

CREATE TABLE `reports_prm_tbl` (
  `report_id` int(11) NOT NULL,
  `report_code` varchar(50) NOT NULL,
  `report_name` varchar(100) NOT NULL,
  `view_name` varchar(60) NOT NULL,
  `uniquevaluecolumnname` varchar(100) NOT NULL,
  `report_description` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT 'Id of the report group to which this report belongs to',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `display_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_prm_tbl`
--

INSERT INTO `reports_prm_tbl` (`report_id`, `report_code`, `report_name`, `view_name`, `uniquevaluecolumnname`, `report_description`, `group_id`, `is_active`, `display_order`) VALUES
(1, 'USRRPT1', 'Registered Users', 'emrp_active_users_view', 'childid', 'Details of all the registered Children', 1, 0, 1),
(2, 'USRRPT2', 'Daily Registration Stats', 'emrp_dailyregistration_view', 'RegDate', 'Daily Registration Statistics', 1, 0, 2),
(3, 'USRRPT3', 'Weekly Registration Stats', 'emrp_weeklyregistration_view', 'RegWeek', 'Weekly Registration Statistics', 1, 0, 3),
(4, 'USRRPT4', 'Monthly Registration Stats', 'emrp_monthlyregistration_view', 'RegMonth', 'Monthly Registration Statistics', 1, 0, 4),
(5, 'ENGRPT1', 'Daily Game Play Session Stats', 'prm_dailygameplaysessions_view', 'SessionDate', 'Daily Game Play Session Statistics', 2, 1, 1),
(6, 'LOMRPT1', 'Competency Level Summary', 'prm_attemptssummaryallgames_view', 'attempts', 'Competency Level in terms of number of successful submission in #N attempts', 3, 1, 1),
(7, 'AUMRPT1', 'Avg. Play Session Time', 'prm_avggameplaysessiontimeperchild_view', 'childid', 'Average session time across all game play sessions played by a Child ', 4, 1, 2),
(8, 'AUMRPT2', 'Game Utilization Metrics', 'prm_totalsessionspergame_view', 'GameId', 'Total number of play sessions for each of the Games', 4, 1, 3),
(9, 'AUMRPT3', 'Game Play Sessions (Last 2 Wks)', 'prm_childtimepergameplaysession_view', 'id_game_play', 'Game Play Sessions played by each Child during the last two weeks', 4, 1, 4),
(10, 'USRRPT5', 'Monthly Registration Stats by Organization', 'prm_monthlyregistration_orgvise_view', 'Organization', 'Organization-vise Registration Stats', 1, 1, 5),
(11, 'ENGRPT2', 'Monthly Game Play Session Stats', 'prm_monthlygameplaysessions_view', 'Month', 'Monthly Game Play Session Statistics', 2, 1, 2),
(12, 'ENGRPT3', 'Monthly Game Play Session Stats Child-vise', 'prm_monthlygameplaysessions_childvise_view', 'Month', 'Monthly Game Play Session Statistics per Child', 2, 1, 3),
(13, 'ENGRPT4', 'Monthly Game Play Session Stats Organization-vise', 'prm_monthlygameplaysessions_orgvise_view', 'Month', 'Monthly Game Play Session Statistics per Organization', 2, 1, 4),
(14, 'ENGRPT5', 'Questions with more number of attempts', 'prm_questionsubmissionsandattemptscounts_view', 'QuestionID', 'List of Questions with the number of Submissions that had 4 or more attempts', 2, 1, 5),
(15, 'AUMRPT4', 'Daily Total Game Play Session time per Child', 'prm_dailytotalsessiontimeperchild_view', 'dateplayed', 'Total Game Play Session time per Child per Day for the last two Months (including current month)', 4, 1, 1),
(16, 'USRRPT6', 'Active Devices', 'prm_activedevices_view', 'DeviceId', 'List of Devices logged-in at least once every week during the last 4 weeks', 1, 1, 6),
(17, 'ENGRPT6', 'Weekly Game Play Sessions Device-vise', 'prm_weeklygameplaysessions_perdevice_view', 'DeviceId', 'Total Game Play Sessions count per Device per Week during the last 6 months', 2, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `report_chm_columns_tbl`
--

CREATE TABLE `report_chm_columns_tbl` (
  `report_column_auto_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `report_column_seqid` int(11) NOT NULL,
  `report_column_name` varchar(60) NOT NULL,
  `report_column_label` varchar(60) DEFAULT NULL COMMENT 'stores the column lable as it appears in the report header',
  `column_datatype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_chm_columns_tbl`
--

INSERT INTO `report_chm_columns_tbl` (`report_column_auto_id`, `report_id`, `report_column_seqid`, `report_column_name`, `report_column_label`, `column_datatype`) VALUES
(1, 1, 1, 'Name', 'Name', 'varchar'),
(2, 1, 2, 'DeviceId', 'DeviceId', 'varchar'),
(3, 1, 3, 'Grade', 'Grade', 'varchar'),
(4, 1, 4, 'Language', 'Language', 'varchar'),
(5, 1, 5, 'SchoolType', 'School Type', 'varchar'),
(6, 1, 6, 'Organization', 'Organization', 'varchar'),
(7, 1, 7, 'District', 'District', 'varchar'),
(8, 1, 8, 'Created_Datetime', 'Date', 'datetime'),
(9, 2, 1, 'RegDate', 'Date', 'datetime'),
(10, 2, 2, 'RegistrationCount', '#Registrations', 'integer'),
(11, 3, 1, 'RegWeek', 'Week', 'varchar'),
(12, 3, 2, 'RegistrationCount', '#Registrations', 'integer'),
(13, 4, 1, 'RegMonth', 'Month', 'varchar'),
(14, 4, 2, 'RegistrationCount', '#Registrations', 'integer'),
(15, 5, 1, 'SessionDate', 'Date', 'datetime'),
(16, 5, 2, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(17, 7, 1, 'Name', 'Name', 'varchar'),
(18, 7, 2, 'DeviceId', 'DeviceId', 'varchar'),
(19, 7, 3, 'Grade', 'Grade', 'varchar'),
(20, 7, 4, 'Organization', 'Organization', 'varchar'),
(21, 7, 5, 'Total_Gameplay_Session_Time', 'Total Session Time', 'integer'),
(22, 7, 6, 'Number_Of_Gameplay_Sessions', 'Number of Sessions', 'integer'),
(23, 7, 7, 'Avg_Gameplay_Session_Time', 'Avg Session Time', 'integer'),
(24, 7, 8, 'date_last_played', 'Last Played On', 'datetime'),
(25, 8, 1, 'GameId', 'GameId', 'varchar'),
(26, 8, 2, 'PlaySessions', 'Play Sessions', 'integer'),
(27, 9, 1, 'Name', 'Name', 'varchar'),
(28, 9, 2, 'DeviceId', 'DeviceId', 'varchar'),
(29, 9, 3, 'Organization', 'Organization', 'varchar'),
(30, 9, 4, 'id_game', 'GameId', 'varchar'),
(31, 9, 5, 'session_start_time', 'Session Date', 'datetime'),
(32, 9, 6, 'total_session_time', 'Total Session Time', 'integer'),
(33, 10, 1, 'Organization', 'Organization', 'varchar'),
(34, 10, 2, 'RegMonth', 'Month', 'varchar'),
(35, 10, 3, 'RegYear', 'Year', 'varchar'),
(36, 10, 4, 'RegistrationCount', '#Registrations', 'integer'),
(37, 11, 1, 'Month', 'Month', 'integer'),
(38, 11, 2, 'Year', 'Year', 'integer'),
(39, 11, 3, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(40, 12, 1, 'Name', 'Name', 'varchar'),
(41, 12, 2, 'DeviceId', 'DeviceId', 'varchar'),
(42, 12, 3, 'Organization', 'Organization', 'varchar'),
(43, 12, 4, 'Month', 'Month', 'integer'),
(44, 12, 5, 'Year', 'Year', 'integer'),
(45, 12, 6, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(46, 13, 1, 'Organization', 'Organization', 'varchar'),
(47, 13, 2, 'Month', 'Month', 'integer'),
(48, 13, 3, 'Year', 'Year', 'integer'),
(49, 13, 4, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(50, 15, 1, 'dateplayed', 'Date', 'datetime'),
(51, 15, 2, 'DeviceId', 'DeviceId', 'varchar'),
(52, 15, 3, 'Name', 'Name', 'varchar'),
(53, 15, 4, 'Grade', 'Grade', 'varchar'),
(54, 15, 5, 'Organization', 'Organization', 'varchar'),
(55, 15, 6, 'Total_Gameplay_Session_Time', 'Total Session Time', 'integer'),
(56, 16, 1, 'DeviceId', 'DeviceId', 'varchar'),
(57, 16, 2, 'Users', 'Users', 'integer'),
(58, 16, 3, 'Week1', 'Wk1Sessions', 'integer'),
(59, 16, 4, 'Week2', 'Wk2Sessions', 'integer'),
(60, 16, 5, 'Week3', 'Wk3Sessions', 'integer'),
(61, 16, 6, 'Week4', 'Wk4Sessions', 'integer'),
(62, 16, 7, 'TotalSessionsCount', 'Total Sessions Count', 'integer'),
(63, 17, 1, 'DeviceId', 'DeviceId', 'varchar'),
(64, 17, 2, 'Users', 'Users', 'integer'),
(65, 17, 3, 'Week', 'Week', 'integer'),
(66, 17, 4, 'Year', 'Year', 'integer'),
(67, 17, 5, 'WeekStartDate', 'Week Start Date', 'datetime'),
(68, 17, 6, 'GameplaySessionsWeeklyCount', 'Weekly Sessions Count', 'integer'),
(69, 18, 2, 'Name', 'Name', 'varchar'),
(70, 18, 1, 'DeviceId', 'DeviceId', 'varchar'),
(71, 18, 3, 'Organization', 'Organization', 'varchar'),
(72, 18, 4, 'PlayDate', 'Date', 'Date'),
(73, 18, 7, 'TotalCHMgames', 'Total CHM Games', 'integer'),
(74, 18, 8, 'TotalPRMgames', 'Total PRM Games', 'integer'),
(75, 18, 9, 'TotalGamesPlayed', 'Total Games', 'integer'),
(76, 18, 10, 'TotalCHMgamessessiontime', 'Total CHM Playtime', 'integer'),
(77, 18, 11, 'TotalPRMgamessessiontime', 'Total PRM Playtime', 'integer'),
(78, 18, 12, 'TotalSessionTime', 'Total Playtime', 'integer'),
(79, 18, 5, 'Month', 'Month', 'integer'),
(80, 18, 6, 'Year', 'Year', 'integer'),
(81, 19, 2, 'Name', 'Name', 'varchar'),
(82, 19, 1, 'DeviceId', 'DeviceId', 'varchar'),
(83, 19, 3, 'Organization', 'Organization', 'varchar'),
(84, 19, 4, 'PlayDate', 'Date', 'Date'),
(85, 19, 7, 'TotalGames', 'Total Games', 'integer'),
(86, 19, 9, 'TotalPlayTime', 'Total Playtime', 'integer'),
(87, 19, 5, 'Month', 'Month', 'integer'),
(88, 19, 6, 'Year', 'Year', 'integer'),
(89, 19, 8, 'GameIds', 'GameIds', 'varchar'),
(90, 20, 2, 'Name', 'Name', 'varchar'),
(91, 20, 1, 'DeviceId', 'DeviceId', 'varchar'),
(92, 20, 3, 'Organization', 'Organization', 'varchar'),
(93, 20, 4, 'PlayDate', 'Date', 'Date'),
(94, 20, 7, 'TotalGames', 'Total Games', 'integer'),
(95, 20, 9, 'TotalPlayTime', 'Total Playtime', 'integer'),
(96, 20, 5, 'Month', 'Month', 'integer'),
(97, 20, 6, 'Year', 'Year', 'integer'),
(98, 20, 8, 'GameIds', 'GameIds', 'varchar');

-- --------------------------------------------------------

--
-- Table structure for table `report_chm_master_wc_tbl`
--

CREATE TABLE `report_chm_master_wc_tbl` (
  `id` int(11) NOT NULL,
  `table_name` varchar(70) NOT NULL,
  `wc_column_name` varchar(70) NOT NULL,
  `support_column_name` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_chm_master_wc_tbl`
--

INSERT INTO `report_chm_master_wc_tbl` (`id`, `table_name`, `wc_column_name`, `support_column_name`) VALUES
(1, 'grade_tbl', 'Grade', 'description'),
(2, 'language_tbl', 'Language', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `report_chm_whereclause_tbl`
--

CREATE TABLE `report_chm_whereclause_tbl` (
  `report_whereclause_auto_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `report_whereclause_seqid` int(11) NOT NULL,
  `report_whereclause_column_name` varchar(60) NOT NULL,
  `report_whereclause_column_label` varchar(60) DEFAULT NULL COMMENT 'The column name as it appears in the UI',
  `wc_datatype` varchar(20) NOT NULL,
  `column_data_prefix` varchar(30) DEFAULT NULL,
  `default_value` varchar(50) DEFAULT NULL COMMENT 'Default value for the whereclause field (the value entered here will be used as the default value, except if the value is  ''CURRENTDATE'' . For ''CURRENTDATE'', the actual date is shown as the default value)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_chm_whereclause_tbl`
--

INSERT INTO `report_chm_whereclause_tbl` (`report_whereclause_auto_id`, `report_id`, `report_whereclause_seqid`, `report_whereclause_column_name`, `report_whereclause_column_label`, `wc_datatype`, `column_data_prefix`, `default_value`) VALUES
(1, 1, 1, 'Grade', 'Grade', 'varchar', NULL, NULL),
(2, 1, 2, 'Language', 'Language', 'varchar', NULL, NULL),
(3, 1, 3, 'Created_Datetime', 'Reg. Date', 'datetime', NULL, NULL),
(4, 1, 4, 'Organization', 'Organization', 'varchar', NULL, NULL),
(5, 1, 5, 'District', 'District', 'varchar', NULL, NULL),
(6, 2, 1, 'RegDate', 'Registration Date', 'datetime', NULL, NULL),
(7, 5, 1, 'SessionDate', 'Session Date', 'datetime', NULL, NULL),
(8, 7, 1, 'Grade', 'Grade', 'varchar', NULL, NULL),
(9, 7, 2, 'Organization', 'Organization', 'varchar', NULL, NULL),
(10, 7, 3, 'Number_Of_Gameplay_Sessions', 'Number of Sessions', 'integer', NULL, NULL),
(11, 7, 4, 'date_last_played', 'Last Played On', 'datetime', NULL, NULL),
(12, 8, 1, 'GameId', 'GameId', 'varchar', NULL, NULL),
(13, 9, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(14, 9, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(15, 9, 3, 'Organization', 'Organization', 'varchar', NULL, NULL),
(16, 9, 4, 'id_game', 'GameId', 'varchar', NULL, NULL),
(17, 9, 5, 'session_start_time', 'Session Date', 'datetime', NULL, NULL),
(18, 9, 6, 'total_session_time', 'Total Session Time', 'integer', NULL, NULL),
(19, 10, 1, 'Organization', 'Organization', 'varchar', NULL, NULL),
(20, 12, 1, 'Organization', 'Organization', 'varchar', NULL, NULL),
(21, 13, 1, 'Organization', 'Organization', 'varchar', NULL, NULL),
(22, 15, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(23, 15, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(24, 15, 3, 'Grade', 'Grade', 'varchar', NULL, NULL),
(25, 15, 4, 'Organization', 'Organization', 'varchar', NULL, NULL),
(26, 15, 5, 'dateplayed', 'Date', 'datetime', NULL, NULL),
(27, 17, 1, 'WeekStartDate', 'Week Start Date', 'datetime', NULL, NULL),
(28, 18, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(29, 18, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(30, 18, 3, 'Organization', 'Organization', 'varchar', NULL, NULL),
(31, 18, 4, 'PlayDate', 'Date', 'datetime', NULL, NULL),
(32, 19, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(33, 19, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(34, 19, 3, 'Organization', 'Organization', 'varchar', NULL, NULL),
(35, 19, 4, 'PlayDate', 'Date', 'datetime', NULL, NULL),
(36, 20, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(37, 20, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(38, 20, 3, 'Organization', 'Organization', 'varchar', NULL, NULL),
(39, 20, 4, 'PlayDate', 'Date', 'datetime', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_prm_columns_tbl`
--

CREATE TABLE `report_prm_columns_tbl` (
  `report_column_auto_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `report_column_seqid` int(11) NOT NULL,
  `report_column_name` varchar(60) NOT NULL,
  `report_column_label` varchar(60) DEFAULT NULL COMMENT 'stores the column lable as it appears in the report header',
  `column_datatype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_prm_columns_tbl`
--

INSERT INTO `report_prm_columns_tbl` (`report_column_auto_id`, `report_id`, `report_column_seqid`, `report_column_name`, `report_column_label`, `column_datatype`) VALUES
(1, 1, 1, 'Name', 'Name', 'varchar'),
(2, 1, 2, 'DeviceId', 'DeviceId', 'varchar'),
(3, 1, 3, 'Grade', 'Grade', 'varchar'),
(4, 1, 4, 'Language', 'Language', 'varchar'),
(5, 1, 5, 'SchoolType', 'School Type', 'varchar'),
(6, 1, 6, 'Organization', 'Organization', 'varchar'),
(7, 1, 7, 'District', 'District', 'varchar'),
(8, 1, 8, 'Created_Datetime', 'Date', 'datetime'),
(9, 2, 1, 'RegDate', 'Date', 'datetime'),
(10, 2, 2, 'RegistrationCount', '#Registrations', 'integer'),
(11, 3, 1, 'RegWeek', 'Week', 'varchar'),
(12, 3, 2, 'RegistrationCount', '#Registrations', 'integer'),
(13, 4, 1, 'RegMonth', 'Month', 'varchar'),
(14, 4, 2, 'RegistrationCount', '#Registrations', 'integer'),
(15, 5, 1, 'SessionDate', 'Date', 'datetime'),
(16, 5, 2, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(17, 6, 1, 'attempts', '#Attempts', 'integer'),
(18, 6, 2, 'submissioncount', 'Submissions Count', 'integer'),
(19, 7, 1, 'Name', 'Name', 'varchar'),
(20, 7, 2, 'DeviceId', 'DeviceId', 'varchar'),
(21, 7, 3, 'Grade', 'Grade', 'varchar'),
(22, 7, 4, 'Organization', 'Organization', 'varchar'),
(23, 7, 5, 'Total_Gameplay_Session_Time', 'Total Session Time', 'integer'),
(24, 7, 6, 'Number_Of_Gameplay_Sessions', 'Number of Sessions', 'integer'),
(25, 7, 7, 'Avg_Gameplay_Session_Time', 'Avg Session Time', 'integer'),
(26, 7, 8, 'date_last_played', 'Last Played On', 'datetime'),
(27, 8, 1, 'GameId', 'GameId', 'varchar'),
(28, 8, 2, 'PlaySessions', 'Play Sessions', 'integer'),
(29, 9, 1, 'Name', 'Name', 'varchar'),
(30, 9, 2, 'DeviceId', 'DeviceId', 'varchar'),
(31, 9, 3, 'Organization', 'Organization', 'varchar'),
(32, 9, 4, 'id_game', 'GameId', 'varchar'),
(33, 9, 5, 'session_start_time', 'Session Date', 'datetime'),
(34, 9, 6, 'total_session_time', 'Total Session Time', 'integer'),
(35, 10, 1, 'Organization', 'Organization', 'varchar'),
(36, 10, 2, 'RegMonth', 'Month', 'varchar'),
(37, 10, 3, 'RegYear', 'Year', 'varchar'),
(38, 10, 4, 'RegistrationCount', '#Registrations', 'integer'),
(39, 11, 1, 'Month', 'Month', 'integer'),
(40, 11, 2, 'Year', 'Year', 'integer'),
(41, 11, 3, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(42, 12, 1, 'Name', 'Name', 'varchar'),
(43, 12, 2, 'DeviceId', 'DeviceId', 'varchar'),
(44, 12, 3, 'Organization', 'Organization', 'varchar'),
(45, 12, 4, 'Month', 'Month', 'integer'),
(46, 12, 5, 'Year', 'Year', 'integer'),
(47, 12, 6, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(48, 13, 1, 'Organization', 'Organization', 'varchar'),
(49, 13, 2, 'Month', 'Month', 'integer'),
(50, 13, 3, 'Year', 'Year', 'integer'),
(51, 13, 4, 'GameplaySessionsCount', 'Gameplay Sessions', 'integer'),
(52, 14, 1, 'QuestionID', 'Question ID', 'varchar'),
(53, 14, 2, 'totalsubmissions', 'Total #Submissions', 'integer'),
(54, 14, 3, 'submissionswith4ormoreattempts', '#Submissions with >3 Attempts', 'integer'),
(55, 15, 1, 'dateplayed', 'Date', 'datetime'),
(56, 15, 2, 'DeviceId', 'DeviceId', 'varchar'),
(57, 15, 3, 'Name', 'Name', 'varchar'),
(58, 15, 4, 'Grade', 'Grade', 'varchar'),
(59, 15, 5, 'Organization', 'Organization', 'varchar'),
(60, 15, 6, 'Total_Gameplay_Session_Time', 'Total Session Time', 'integer'),
(61, 16, 1, 'DeviceId', 'DeviceId', 'varchar'),
(62, 16, 2, 'Users', 'Users', 'integer'),
(63, 16, 3, 'Week1', 'Wk1Sessions', 'integer'),
(64, 16, 4, 'Week2', 'Wk2Sessions', 'integer'),
(65, 16, 5, 'Week3', 'Wk3Sessions', 'integer'),
(66, 16, 6, 'Week4', 'Wk4Sessions', 'integer'),
(67, 16, 7, 'TotalSessionsCount', 'Total Sessions Count', 'integer'),
(68, 17, 1, 'DeviceId', 'DeviceId', 'varchar'),
(69, 17, 2, 'Users', 'Users', 'integer'),
(70, 17, 3, 'Week', 'Week', 'integer'),
(71, 17, 4, 'Year', 'Year', 'integer'),
(72, 17, 5, 'WeekStartDate', 'Week Start Date', 'datetime'),
(73, 17, 6, 'GameplaySessionsWeeklyCount', 'Weekly Sessions Count', 'integer');

-- --------------------------------------------------------

--
-- Table structure for table `report_prm_master_wc_tbl`
--

CREATE TABLE `report_prm_master_wc_tbl` (
  `id` int(11) NOT NULL,
  `table_name` varchar(70) NOT NULL,
  `wc_column_name` varchar(70) NOT NULL,
  `support_column_name` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_prm_master_wc_tbl`
--

INSERT INTO `report_prm_master_wc_tbl` (`id`, `table_name`, `wc_column_name`, `support_column_name`) VALUES
(1, 'grade_tbl', 'Grade', 'description'),
(2, 'language_tbl', 'Language', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `report_prm_whereclause_tbl`
--

CREATE TABLE `report_prm_whereclause_tbl` (
  `report_whereclause_auto_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `report_whereclause_seqid` int(11) NOT NULL,
  `report_whereclause_column_name` varchar(60) NOT NULL,
  `report_whereclause_column_label` varchar(60) DEFAULT NULL COMMENT 'The column name as it appears in the UI',
  `wc_datatype` varchar(20) NOT NULL,
  `column_data_prefix` varchar(30) DEFAULT NULL,
  `default_value` varchar(50) DEFAULT NULL COMMENT 'Default value for the whereclause field (the value entered here will be used as the default value, except if the value is  ''CURRENTDATE'' . For ''CURRENTDATE'', the actual date is shown as the default value)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_prm_whereclause_tbl`
--

INSERT INTO `report_prm_whereclause_tbl` (`report_whereclause_auto_id`, `report_id`, `report_whereclause_seqid`, `report_whereclause_column_name`, `report_whereclause_column_label`, `wc_datatype`, `column_data_prefix`, `default_value`) VALUES
(1, 1, 1, 'Grade', 'Grade', 'varchar', NULL, NULL),
(2, 1, 2, 'Language', 'Language', 'varchar', NULL, NULL),
(3, 1, 3, 'Created_Datetime', 'Reg. Date', 'datetime', NULL, NULL),
(4, 1, 4, 'Organization', 'Organization', 'varchar', NULL, NULL),
(5, 1, 5, 'District', 'District', 'varchar', NULL, NULL),
(6, 2, 1, 'RegDate', 'Registration Date', 'datetime', NULL, NULL),
(7, 5, 1, 'SessionDate', 'Session Date', 'datetime', NULL, NULL),
(8, 6, 1, 'attempts', 'Attempts', 'integer', NULL, NULL),
(9, 7, 1, 'Grade', 'Grade', 'varchar', NULL, NULL),
(10, 7, 2, 'Organization', 'Organization', 'varchar', NULL, NULL),
(11, 7, 3, 'Number_Of_Gameplay_Sessions', 'Number of Sessions', 'integer', NULL, NULL),
(12, 7, 4, 'date_last_played', 'Last Played On', 'datetime', NULL, NULL),
(13, 8, 1, 'GameId', 'GameId', 'varchar', NULL, NULL),
(14, 9, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(15, 9, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(16, 9, 3, 'Organization', 'Organization', 'varchar', NULL, NULL),
(17, 9, 4, 'id_game', 'GameId', 'varchar', NULL, NULL),
(18, 9, 5, 'session_start_time', 'Session Date', 'datetime', NULL, NULL),
(19, 9, 6, 'total_session_time', 'Total Session Time', 'integer', NULL, NULL),
(20, 10, 1, 'Organization', 'Organization', 'varchar', NULL, NULL),
(21, 12, 1, 'Organization', 'Organization', 'varchar', NULL, NULL),
(22, 13, 1, 'Organization', 'Organization', 'varchar', NULL, NULL),
(23, 14, 1, 'submissionswith4ormoreattempts', '#Submissions (with >3 attempts)', 'integer', NULL, NULL),
(24, 14, 2, 'totalsubmissions', 'Total #Submissions', 'integer', NULL, NULL),
(25, 15, 1, 'Name', 'Name', 'varchar', NULL, NULL),
(26, 15, 2, 'DeviceId', 'DeviceId', 'varchar', NULL, NULL),
(27, 15, 3, 'Grade', 'Grade', 'varchar', NULL, NULL),
(28, 15, 4, 'Organization', 'Organization', 'varchar', NULL, NULL),
(29, 15, 5, 'dateplayed', 'Date', 'datetime', NULL, NULL),
(30, 17, 1, 'WeekStartDate', 'Week Start Date', 'datetime', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schooltype_tbl`
--

CREATE TABLE `schooltype_tbl` (
  `id` int(11) NOT NULL,
  `school_type` tinyint(4) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schooltype_tbl`
--

INSERT INTO `schooltype_tbl` (`id`, `school_type`, `description`) VALUES
(1, 0, 'Government'),
(2, 1, 'Private');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `user_id` int(11) NOT NULL,
  `email_id` varchar(150) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `organization` varchar(250) DEFAULT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture_filename` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `charts_chm_tbl`
--
ALTER TABLE `charts_chm_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charts_prm_tbl`
--
ALTER TABLE `charts_prm_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `child_tbl`
--
ALTER TABLE `child_tbl`
  ADD PRIMARY KEY (`id_child`),
  ADD UNIQUE KEY `uk_child` (`child_name`,`deviceid`),
  ADD KEY `child_name` (`child_name`,`deviceid`,`id_child`),
  ADD KEY `fk_language` (`id_language`),
  ADD KEY `idx_child_id_grade` (`id_child`,`id_grade`);

--
-- Indexes for table `chm_game_master_tbl`
--
ALTER TABLE `chm_game_master_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_game1` (`id_game`);

--
-- Indexes for table `chm_game_play_detail_tbl`
--
ALTER TABLE `chm_game_play_detail_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chmgame_play2` (`id_game_play`),
  ADD KEY `idx_chmid_child1` (`id_child`),
  ADD KEY `idx_chmid_question1` (`id_question`),
  ADD KEY `idx_gpdt_child_date` (`id_child`,`date_time_submission`),
  ADD KEY `idx_gpdt_gameplay_child` (`id_game_play`,`id_child`);

--
-- Indexes for table `chm_game_play_tbl`
--
ALTER TABLE `chm_game_play_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chmchild_id` (`id_child`),
  ADD KEY `idx_game2` (`id_game`),
  ADD KEY `idx_game_play1` (`id_game_play`),
  ADD KEY `idx_game_cover` (`id_game`,`id_game_play`),
  ADD KEY `idx_gpt_start_time` (`start_time`);

--
-- Indexes for table `chm_question_master_tbl`
--
ALTER TABLE `chm_question_master_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chmqt_idgame` (`id_game`),
  ADD KEY `fk_chmqt_question_type` (`id_question_type`),
  ADD KEY `fk_chmqt_micro_concept` (`id_micro_concept`);

--
-- Indexes for table `chm_walletscore_tbl`
--
ALTER TABLE `chm_walletscore_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `concept_tbl`
--
ALTER TABLE `concept_tbl`
  ADD PRIMARY KEY (`id_concept`);

--
-- Indexes for table `device_accesstoken_tbl`
--
ALTER TABLE `device_accesstoken_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_token` (`access_token`,`deviceid`,`id_child`),
  ADD KEY `idx_id_child2` (`id_child`);

--
-- Indexes for table `ekstepevent_interact_tbl`
--
ALTER TABLE `ekstepevent_interact_tbl`
  ADD PRIMARY KEY (`eventdataid`);

--
-- Indexes for table `game_master_tbl`
--
ALTER TABLE `game_master_tbl`
  ADD PRIMARY KEY (`idg`),
  ADD KEY `idx_game1` (`id_game`);

--
-- Indexes for table `game_play_detail_tbl`
--
ALTER TABLE `game_play_detail_tbl`
  ADD PRIMARY KEY (`id_game_play_detail`),
  ADD KEY `idx_game_play2` (`id_game_play`),
  ADD KEY `idx_id_child1` (`id_child`),
  ADD KEY `idx_id_question1` (`id_question`);

--
-- Indexes for table `game_play_tbl`
--
ALTER TABLE `game_play_tbl`
  ADD PRIMARY KEY (`idgp`),
  ADD KEY `fk_child_id` (`id_child`),
  ADD KEY `idx_game2` (`id_game`),
  ADD KEY `idx_game_play1` (`id_game_play`);

--
-- Indexes for table `grade_tbl`
--
ALTER TABLE `grade_tbl`
  ADD PRIMARY KEY (`id_grade`);

--
-- Indexes for table `language_tbl`
--
ALTER TABLE `language_tbl`
  ADD PRIMARY KEY (`id_language`);

--
-- Indexes for table `microconcept_group_tbl`
--
ALTER TABLE `microconcept_group_tbl`
  ADD PRIMARY KEY (`idmcg`),
  ADD KEY `fk_mconceptgrp` (`id_concept`);

--
-- Indexes for table `micro_concept_tbl`
--
ALTER TABLE `micro_concept_tbl`
  ADD PRIMARY KEY (`id_micro_concept`),
  ADD KEY `fk_mcidmcg` (`idmcg`),
  ADD KEY `fk_mcconcept` (`id_concept`);

--
-- Indexes for table `push_notification_log_tbl`
--
ALTER TABLE `push_notification_log_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_push_log` (`id_child`,`notification_type`,`sent_datetime`);

--
-- Indexes for table `push_notification_messages_tbl`
--
ALTER TABLE `push_notification_messages_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_type_lang` (`notification_type`,`id_language`),
  ADD KEY `fk_pnm_language` (`id_language`);

--
-- Indexes for table `question_classification_tbl`
--
ALTER TABLE `question_classification_tbl`
  ADD PRIMARY KEY (`id_question_classification`);

--
-- Indexes for table `question_tbl`
--
ALTER TABLE `question_tbl`
  ADD PRIMARY KEY (`idq`),
  ADD KEY `fk_qt_idgame` (`id_game`),
  ADD KEY `fk_qt_question_type` (`id_question_type`),
  ADD KEY `fk_qt_micro_concept` (`id_micro_concept`),
  ADD KEY `fk_qt_question_classification` (`id_question_classification`);

--
-- Indexes for table `question_type_tbl`
--
ALTER TABLE `question_type_tbl`
  ADD PRIMARY KEY (`id_question_type`);

--
-- Indexes for table `reports_chm_groups_tbl`
--
ALTER TABLE `reports_chm_groups_tbl`
  ADD PRIMARY KEY (`report_group_id`);

--
-- Indexes for table `reports_chm_tbl`
--
ALTER TABLE `reports_chm_tbl`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `reports_prm_groups_tbl`
--
ALTER TABLE `reports_prm_groups_tbl`
  ADD PRIMARY KEY (`report_group_id`);

--
-- Indexes for table `reports_prm_tbl`
--
ALTER TABLE `reports_prm_tbl`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `report_chm_columns_tbl`
--
ALTER TABLE `report_chm_columns_tbl`
  ADD PRIMARY KEY (`report_column_auto_id`);

--
-- Indexes for table `report_chm_master_wc_tbl`
--
ALTER TABLE `report_chm_master_wc_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_chm_whereclause_tbl`
--
ALTER TABLE `report_chm_whereclause_tbl`
  ADD PRIMARY KEY (`report_whereclause_auto_id`);

--
-- Indexes for table `report_prm_columns_tbl`
--
ALTER TABLE `report_prm_columns_tbl`
  ADD PRIMARY KEY (`report_column_auto_id`);

--
-- Indexes for table `report_prm_master_wc_tbl`
--
ALTER TABLE `report_prm_master_wc_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_prm_whereclause_tbl`
--
ALTER TABLE `report_prm_whereclause_tbl`
  ADD PRIMARY KEY (`report_whereclause_auto_id`);

--
-- Indexes for table `schooltype_tbl`
--
ALTER TABLE `schooltype_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`user_id`,`email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `charts_chm_tbl`
--
ALTER TABLE `charts_chm_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `charts_prm_tbl`
--
ALTER TABLE `charts_prm_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `child_tbl`
--
ALTER TABLE `child_tbl`
  MODIFY `id_child` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chm_game_master_tbl`
--
ALTER TABLE `chm_game_master_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `chm_game_play_detail_tbl`
--
ALTER TABLE `chm_game_play_detail_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chm_game_play_tbl`
--
ALTER TABLE `chm_game_play_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chm_question_master_tbl`
--
ALTER TABLE `chm_question_master_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chm_walletscore_tbl`
--
ALTER TABLE `chm_walletscore_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `concept_tbl`
--
ALTER TABLE `concept_tbl`
  MODIFY `id_concept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `device_accesstoken_tbl`
--
ALTER TABLE `device_accesstoken_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekstepevent_interact_tbl`
--
ALTER TABLE `ekstepevent_interact_tbl`
  MODIFY `eventdataid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_master_tbl`
--
ALTER TABLE `game_master_tbl`
  MODIFY `idg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `game_play_detail_tbl`
--
ALTER TABLE `game_play_detail_tbl`
  MODIFY `id_game_play_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_play_tbl`
--
ALTER TABLE `game_play_tbl`
  MODIFY `idgp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_tbl`
--
ALTER TABLE `grade_tbl`
  MODIFY `id_grade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `language_tbl`
--
ALTER TABLE `language_tbl`
  MODIFY `id_language` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `microconcept_group_tbl`
--
ALTER TABLE `microconcept_group_tbl`
  MODIFY `idmcg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `micro_concept_tbl`
--
ALTER TABLE `micro_concept_tbl`
  MODIFY `id_micro_concept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `push_notification_log_tbl`
--
ALTER TABLE `push_notification_log_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notification_messages_tbl`
--
ALTER TABLE `push_notification_messages_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `question_classification_tbl`
--
ALTER TABLE `question_classification_tbl`
  MODIFY `id_question_classification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `question_tbl`
--
ALTER TABLE `question_tbl`
  MODIFY `idq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `question_type_tbl`
--
ALTER TABLE `question_type_tbl`
  MODIFY `id_question_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reports_chm_groups_tbl`
--
ALTER TABLE `reports_chm_groups_tbl`
  MODIFY `report_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports_chm_tbl`
--
ALTER TABLE `reports_chm_tbl`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reports_prm_groups_tbl`
--
ALTER TABLE `reports_prm_groups_tbl`
  MODIFY `report_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports_prm_tbl`
--
ALTER TABLE `reports_prm_tbl`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `report_chm_columns_tbl`
--
ALTER TABLE `report_chm_columns_tbl`
  MODIFY `report_column_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `report_chm_master_wc_tbl`
--
ALTER TABLE `report_chm_master_wc_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_chm_whereclause_tbl`
--
ALTER TABLE `report_chm_whereclause_tbl`
  MODIFY `report_whereclause_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `report_prm_columns_tbl`
--
ALTER TABLE `report_prm_columns_tbl`
  MODIFY `report_column_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `report_prm_master_wc_tbl`
--
ALTER TABLE `report_prm_master_wc_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_prm_whereclause_tbl`
--
ALTER TABLE `report_prm_whereclause_tbl`
  MODIFY `report_whereclause_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `schooltype_tbl`
--
ALTER TABLE `schooltype_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `chmprm_totalgamesplayedview1_view`
--
DROP TABLE IF EXISTS `chmprm_totalgamesplayedview1_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chmprm_totalgamesplayedview1_view`  AS SELECT `chtbl`.`id_child` AS `childid`, `chtbl`.`child_name` AS `Name`, `chtbl`.`deviceid` AS `DeviceId`, `chtbl`.`organization` AS `Organization`, `chmdtstpc`.`dateplayed` AS `chmdateplayed`, `chmdtstpc`.`Total_Games_Played` AS `chmtotalgamesplayed`, `chmdtstpc`.`Total_Gameplay_Session_Time` AS `chmtotalgameplaysessiontime`, `prmdtstpc`.`dateplayed` AS `prmdateplayed`, `prmdtstpc`.`Total_Games_Played` AS `prmtotalgamesplayed`, `prmdtstpc`.`Total_Gameplay_Session_Time` AS `prmtotalgameplaysessiontime` FROM ((`child_tbl` `chtbl` left join `chm_dailytotalsessiontimeperchild_view` `chmdtstpc` on((`chtbl`.`id_child` = `chmdtstpc`.`childid`))) left join `prm_dailytotalsessiontimeperchild_view` `prmdtstpc` on(((`chtbl`.`id_child` = `prmdtstpc`.`childid`) and (`prmdtstpc`.`dateplayed` = `chmdtstpc`.`dateplayed`)))) WHERE (`chmdtstpc`.`dateplayed` between ((last_day(now()) - interval 2 month) + interval 1 day) and now()) ORDER BY `chtbl`.`id_child` ASC, `chmdtstpc`.`dateplayed` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chmprm_totalgamesplayedview2_view`
--
DROP TABLE IF EXISTS `chmprm_totalgamesplayedview2_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chmprm_totalgamesplayedview2_view`  AS SELECT `chtbl`.`id_child` AS `childid`, `chtbl`.`child_name` AS `Name`, `chtbl`.`deviceid` AS `DeviceId`, `chtbl`.`organization` AS `Organization`, NULL AS `chmdateplayed`, NULL AS `chmtotalgamesplayed`, NULL AS `chmtotalgameplaysessiontime`, `prmdtstpc`.`dateplayed` AS `prmdateplayed`, `prmdtstpc`.`Total_Games_Played` AS `prmtotalgamesplayed`, `prmdtstpc`.`Total_Gameplay_Session_Time` AS `prmtotalgameplaysessiontime` FROM (`child_tbl` `chtbl` left join `prm_dailytotalsessiontimeperchild_view` `prmdtstpc` on((`chtbl`.`id_child` = `prmdtstpc`.`childid`))) WHERE ((`prmdtstpc`.`dateplayed` between ((last_day(now()) - interval 2 month) + interval 1 day) and now()) AND (not(`prmdtstpc`.`dateplayed` in (select `chmdtstpc`.`dateplayed` from `chm_dailytotalsessiontimeperchild_view` `chmdtstpc` where ((`chmdtstpc`.`dateplayed` between ((last_day(now()) - interval 2 month) + interval 1 day) and now()) AND (`chtbl`.`id_child` = `chmdtstpc`.`childid`)))))) ORDER BY `chtbl`.`id_child` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chmprm_totalgamesplayedview3_view`
--
DROP TABLE IF EXISTS `chmprm_totalgamesplayedview3_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chmprm_totalgamesplayedview3_view`  AS SELECT `chmprm_totalgamesplayedview1_view`.`childid` AS `childid`, `chmprm_totalgamesplayedview1_view`.`Name` AS `Name`, `chmprm_totalgamesplayedview1_view`.`DeviceId` AS `DeviceId`, `chmprm_totalgamesplayedview1_view`.`Organization` AS `Organization`, `chmprm_totalgamesplayedview1_view`.`chmdateplayed` AS `chmdateplayed`, `chmprm_totalgamesplayedview1_view`.`chmtotalgamesplayed` AS `chmtotalgamesplayed`, `chmprm_totalgamesplayedview1_view`.`chmtotalgameplaysessiontime` AS `chmtotalgameplaysessiontime`, `chmprm_totalgamesplayedview1_view`.`prmdateplayed` AS `prmdateplayed`, `chmprm_totalgamesplayedview1_view`.`prmtotalgamesplayed` AS `prmtotalgamesplayed`, `chmprm_totalgamesplayedview1_view`.`prmtotalgameplaysessiontime` AS `prmtotalgameplaysessiontime` FROM `chmprm_totalgamesplayedview1_view`union all select `chmprm_totalgamesplayedview2_view`.`childid` AS `childid`,`chmprm_totalgamesplayedview2_view`.`Name` AS `Name`,`chmprm_totalgamesplayedview2_view`.`DeviceId` AS `DeviceId`,`chmprm_totalgamesplayedview2_view`.`Organization` AS `Organization`,`chmprm_totalgamesplayedview2_view`.`chmdateplayed` AS `chmdateplayed`,`chmprm_totalgamesplayedview2_view`.`chmtotalgamesplayed` AS `chmtotalgamesplayed`,`chmprm_totalgamesplayedview2_view`.`chmtotalgameplaysessiontime` AS `chmtotalgameplaysessiontime`,`chmprm_totalgamesplayedview2_view`.`prmdateplayed` AS `prmdateplayed`,`chmprm_totalgamesplayedview2_view`.`prmtotalgamesplayed` AS `prmtotalgamesplayed`,`chmprm_totalgamesplayedview2_view`.`prmtotalgameplaysessiontime` AS `prmtotalgameplaysessiontime` from `chmprm_totalgamesplayedview2_view`  ;

-- --------------------------------------------------------

--
-- Structure for view `chmprm_totalgamesplayedview4_view`
--
DROP TABLE IF EXISTS `chmprm_totalgamesplayedview4_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chmprm_totalgamesplayedview4_view`  AS SELECT ifnull(`vw`.`chmdateplayed`,`vw`.`prmdateplayed`) AS `PlayDate`, month(ifnull(`vw`.`chmdateplayed`,`vw`.`prmdateplayed`)) AS `Month`, year(ifnull(`vw`.`chmdateplayed`,`vw`.`prmdateplayed`)) AS `Year`, `vw`.`childid` AS `ChildId`, `vw`.`Name` AS `Name`, `vw`.`DeviceId` AS `DeviceID`, `vw`.`Organization` AS `Organization`, ifnull(`vw`.`chmtotalgamesplayed`,0) AS `TotalCHMgames`, ifnull(`vw`.`prmtotalgamesplayed`,0) AS `TotalPRMgames`, (ifnull(`vw`.`chmtotalgamesplayed`,0) + ifnull(`vw`.`prmtotalgamesplayed`,0)) AS `TotalGamesPlayed`, ifnull(`vw`.`chmtotalgameplaysessiontime`,0) AS `TotalCHMgamessessiontime`, ifnull(`vw`.`prmtotalgameplaysessiontime`,0) AS `TotalPRMgamessessiontime`, (ifnull(`vw`.`chmtotalgameplaysessiontime`,0) + ifnull(`vw`.`prmtotalgameplaysessiontime`,0)) AS `TotalSessionTime` FROM `chmprm_totalgamesplayedview3_view` AS `vw` GROUP BY `vw`.`childid`, `vw`.`DeviceId`, `PlayDate`, `vw`.`chmdateplayed`, `vw`.`prmdateplayed`, `vw`.`Name`, `vw`.`Organization`, `vw`.`chmtotalgamesplayed`, `vw`.`prmtotalgamesplayed`, `vw`.`chmtotalgameplaysessiontime`, `vw`.`prmtotalgameplaysessiontime` ORDER BY `vw`.`DeviceId` ASC, `vw`.`Name` ASC, `PlayDate` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_activedevices_view`
--
DROP TABLE IF EXISTS `chm_activedevices_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_activedevices_view`  AS SELECT `chm_weeklygameplaysessions_perdevice_view`.`DeviceId` AS `DeviceId`, max(`chm_weeklygameplaysessions_perdevice_view`.`Users`) AS `Users`, max(if((`chm_weeklygameplaysessions_perdevice_view`.`Week` = week((curdate() - interval 3 week),0)),`chm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week1`, max(if((`chm_weeklygameplaysessions_perdevice_view`.`Week` = week((curdate() - interval 2 week),0)),`chm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week2`, max(if((`chm_weeklygameplaysessions_perdevice_view`.`Week` = week((curdate() - interval 1 week),0)),`chm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week3`, max(if((`chm_weeklygameplaysessions_perdevice_view`.`Week` = week(curdate(),0)),`chm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week4`, sum(`chm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`) AS `TotalSessionsCount` FROM `chm_weeklygameplaysessions_perdevice_view` WHERE (`chm_weeklygameplaysessions_perdevice_view`.`Week` between week((curdate() - interval 3 week),0) and week(curdate(),0)) GROUP BY `chm_weeklygameplaysessions_perdevice_view`.`DeviceId` HAVING (count(`chm_weeklygameplaysessions_perdevice_view`.`DeviceId`) > 3) ORDER BY `chm_weeklygameplaysessions_perdevice_view`.`DeviceId` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_avggameplaysessiontimeperchild_view`
--
DROP TABLE IF EXISTS `chm_avggameplaysessiontimeperchild_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_avggameplaysessiontimeperchild_view`  AS SELECT `gpdt`.`id_child` AS `childid`, `ch`.`child_name` AS `Name`, `ch`.`deviceid` AS `DeviceId`, `gr`.`description` AS `Grade`, `ch`.`organization` AS `Organization`, sum(`gpdt`.`time2answer`) AS `Total_Gameplay_Session_Time`, count(distinct `gpdt`.`id_game_play`) AS `Number_Of_Gameplay_Sessions`, round(avg(`gpdt`.`time2answer`),0) AS `Avg_Gameplay_Session_Time`, max(`gpdt`.`date_time_submission`) AS `date_last_played` FROM ((`chm_game_play_detail_tbl` `gpdt` join `child_tbl` `ch` on((`ch`.`id_child` = `gpdt`.`id_child`))) join `grade_tbl` `gr` on((`ch`.`id_grade` = `gr`.`id_grade`))) GROUP BY `gpdt`.`id_child`, `ch`.`child_name`, `ch`.`deviceid`, `gr`.`description` ORDER BY `ch`.`child_name` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_childtimepergameplaysession_view`
--
DROP TABLE IF EXISTS `chm_childtimepergameplaysession_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_childtimepergameplaysession_view`  AS SELECT `gpdt`.`id_child` AS `childid`, `cht`.`child_name` AS `Name`, `cht`.`deviceid` AS `DeviceId`, `cht`.`organization` AS `Organization`, `gpdt`.`id_game_play` AS `id_game_play`, `gpt`.`id_game` AS `id_game`, `gpt`.`start_time` AS `session_start_time`, sum(`gpdt`.`time2answer`) AS `total_session_time` FROM ((`chm_game_play_tbl` `gpt` join `chm_game_play_detail_tbl` `gpdt` on((`gpt`.`id_game_play` = `gpdt`.`id_game_play`))) join `child_tbl` `cht` on((`cht`.`id_child` = `gpdt`.`id_child`))) WHERE (`gpt`.`start_time` >= (now() - interval 2 week)) GROUP BY `gpdt`.`id_game_play`, `gpt`.`id_game`, `gpdt`.`id_child`, `cht`.`child_name`, `cht`.`deviceid`, `gpt`.`start_time` ;

-- --------------------------------------------------------

--
-- Structure for view `chm_dailygameplaysessions_view`
--
DROP TABLE IF EXISTS `chm_dailygameplaysessions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_dailygameplaysessions_view`  AS SELECT cast(`chm_game_play_tbl`.`start_time` as date) AS `SessionDate`, count(if((cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 1 day) and now()),`chm_game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsCount` FROM `chm_game_play_tbl` WHERE (cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 365 day) and now()) GROUP BY `SessionDate` ORDER BY `SessionDate` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_dailytotalsessiontimeperchild_view`
--
DROP TABLE IF EXISTS `chm_dailytotalsessiontimeperchild_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_dailytotalsessiontimeperchild_view`  AS SELECT `tstpgpv`.`date_played` AS `dateplayed`, `eauv`.`DeviceId` AS `DeviceId`, `tstpgpv`.`childid` AS `childid`, `eauv`.`Name` AS `Name`, `eauv`.`Grade` AS `Grade`, `eauv`.`Organization` AS `Organization`, count(`tstpgpv`.`id_game_play`) AS `Total_Games_Played`, sum(`tstpgpv`.`total_session_time`) AS `Total_Gameplay_Session_Time` FROM (`chm_totalsessiontimepergameplay_view` `tstpgpv` join `emrp_active_users_view` `eauv`) WHERE ((`eauv`.`childid` = `tstpgpv`.`childid`) AND (cast(`tstpgpv`.`date_played` as date) between ((last_day(now()) - interval 2 month) + interval 1 day) and now())) GROUP BY `tstpgpv`.`date_played`, `tstpgpv`.`childid`, `eauv`.`DeviceId`, `eauv`.`Name`, `eauv`.`Grade`, `eauv`.`Organization` ORDER BY `dateplayed` ASC, `eauv`.`DeviceId` ASC, `eauv`.`Name` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_monthlygameplaysessions_childvise_view`
--
DROP TABLE IF EXISTS `chm_monthlygameplaysessions_childvise_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_monthlygameplaysessions_childvise_view`  AS SELECT `child_tbl`.`id_child` AS `id_child`, `child_tbl`.`child_name` AS `Name`, `child_tbl`.`deviceid` AS `DeviceId`, `child_tbl`.`organization` AS `Organization`, month(`chm_game_play_tbl`.`start_time`) AS `Month`, year(`chm_game_play_tbl`.`start_time`) AS `Year`, count(if((cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 1 month) and now()),`chm_game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsCount` FROM (`child_tbl` join `chm_game_play_tbl`) WHERE ((`child_tbl`.`id_child` = `chm_game_play_tbl`.`id_child`) AND (cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 12 month) and now())) GROUP BY `child_tbl`.`id_child`, `Name`, `Month`, `Year` ORDER BY `child_tbl`.`id_child` ASC, `Name` ASC, `Month` ASC, `Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_monthlygameplaysessions_orgvise_view`
--
DROP TABLE IF EXISTS `chm_monthlygameplaysessions_orgvise_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_monthlygameplaysessions_orgvise_view`  AS SELECT `mgpscvv`.`Organization` AS `Organization`, `mgpscvv`.`Month` AS `Month`, `mgpscvv`.`Year` AS `Year`, sum(`mgpscvv`.`GameplaySessionsCount`) AS `GameplaySessionsCount` FROM `chm_monthlygameplaysessions_childvise_view` AS `mgpscvv` GROUP BY `mgpscvv`.`Organization`, `mgpscvv`.`Month`, `mgpscvv`.`Year` ORDER BY `mgpscvv`.`Organization` ASC, `mgpscvv`.`Month` ASC, `mgpscvv`.`Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_monthlygameplaysessions_view`
--
DROP TABLE IF EXISTS `chm_monthlygameplaysessions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_monthlygameplaysessions_view`  AS SELECT month(`chm_game_play_tbl`.`start_time`) AS `Month`, year(`chm_game_play_tbl`.`start_time`) AS `Year`, count(if((cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 1 month) and now()),`chm_game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsCount` FROM `chm_game_play_tbl` WHERE (cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 12 month) and now()) GROUP BY `Month`, `Year` ORDER BY `Month` ASC, `Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_totalsessionspergame_view`
--
DROP TABLE IF EXISTS `chm_totalsessionspergame_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_totalsessionspergame_view`  AS SELECT `gpt`.`id_game` AS `GameId`, count(`gpt`.`id_game_play`) AS `PlaySessions` FROM `chm_game_play_tbl` AS `gpt` GROUP BY `gpt`.`id_game` ;

-- --------------------------------------------------------

--
-- Structure for view `chm_totalsessiontimepergameplay_view`
--
DROP TABLE IF EXISTS `chm_totalsessiontimepergameplay_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_totalsessiontimepergameplay_view`  AS SELECT `gpdt`.`id_game_play` AS `id_game_play`, `gpdt`.`id_child` AS `childid`, cast(`gpdt`.`date_time_submission` as date) AS `date_played`, sum(`gpdt`.`time2answer`) AS `total_session_time` FROM `chm_game_play_detail_tbl` AS `gpdt` GROUP BY `gpdt`.`id_game_play`, `gpdt`.`id_child`, cast(`gpdt`.`date_time_submission` as date) ;

-- --------------------------------------------------------

--
-- Structure for view `chm_total_games_played_with_gameid`
--
DROP TABLE IF EXISTS `chm_total_games_played_with_gameid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_total_games_played_with_gameid`  AS SELECT `A`.`DeviceId` AS `DeviceId`, `A`.`NAME` AS `NAME`, `A`.`Organization` AS `Organization`, count(distinct `A`.`chm_game_id`) AS `TotalGames`, group_concat(`A`.`chm_game_id` separator ',') AS `GameIds`, `A`.`chm_date` AS `PlayDate`, `A`.`chm_month` AS `Month`, `A`.`chm_year` AS `Year`, sum(`A`.`total_chm_time`) AS `TotalPlayTime` FROM (select `gpdt`.`id_child` AS `childid`,`cht`.`child_name` AS `NAME`,`cht`.`deviceid` AS `DeviceId`,`cht`.`organization` AS `Organization`,`gpt`.`id_game` AS `chm_game_id`,cast(`gpt`.`start_time` as date) AS `chm_date`,month(cast(`gpt`.`start_time` as date)) AS `chm_month`,year(cast(`gpt`.`start_time` as date)) AS `chm_year`,sum(`gpdt`.`time2answer`) AS `total_chm_time` from ((`chm_game_play_detail_tbl` `gpdt` left join `chm_game_play_tbl` `gpt` on((`gpt`.`id_game_play` = `gpdt`.`id_game_play`))) left join `child_tbl` `cht` on((`cht`.`id_child` = `gpdt`.`id_child`))) where (cast(`gpt`.`start_time` as date) between ((last_day(now()) - interval 2 month) + interval 1 day) and now()) group by `gpdt`.`id_child`,`NAME`,`cht`.`deviceid`,`chm_date`,`chm_month`,`chm_year`,`gpt`.`id_game`) AS `A` GROUP BY `A`.`DeviceId`, `A`.`NAME`, `A`.`Organization`, `PlayDate`, `Month`, `Year` ORDER BY `PlayDate` ASC, `A`.`NAME` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `chm_weeklygameplaysessions_perdevice_view`
--
DROP TABLE IF EXISTS `chm_weeklygameplaysessions_perdevice_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chm_weeklygameplaysessions_perdevice_view`  AS SELECT `child_tbl`.`deviceid` AS `DeviceId`, count(distinct `chm_game_play_tbl`.`id_child`) AS `Users`, week(`chm_game_play_tbl`.`start_time`,0) AS `Week`, (cast(`chm_game_play_tbl`.`start_time` as date) - interval (dayofweek(cast(`chm_game_play_tbl`.`start_time` as date)) - 1) day) AS `WeekStartDate`, year(`chm_game_play_tbl`.`start_time`) AS `Year`, count(if((cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 1 week) and now()),`chm_game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsWeeklyCount` FROM (`child_tbl` join `chm_game_play_tbl`) WHERE ((`child_tbl`.`id_child` = `chm_game_play_tbl`.`id_child`) AND (cast(`chm_game_play_tbl`.`start_time` as date) between (now() - interval 24 week) and now())) GROUP BY `child_tbl`.`deviceid`, `Week`, `WeekStartDate`, `Year` ORDER BY `child_tbl`.`deviceid` ASC, `Week` ASC, `WeekStartDate` ASC, `Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `emrp_active_users_view`
--
DROP TABLE IF EXISTS `emrp_active_users_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emrp_active_users_view`  AS SELECT `ch`.`id_child` AS `childid`, `ch`.`child_name` AS `Name`, `ch`.`deviceid` AS `DeviceId`, `gr`.`description` AS `Grade`, `ln`.`description` AS `Language`, `sc`.`description` AS `SchoolType`, `ch`.`organization` AS `Organization`, `ch`.`district` AS `District`, `ch`.`created_datetime` AS `Created_Datetime` FROM (((`child_tbl` `ch` join `grade_tbl` `gr` on((`ch`.`id_grade` = `gr`.`id_grade`))) join `language_tbl` `ln` on((`ch`.`id_language` = `ln`.`id_language`))) join `schooltype_tbl` `sc` on((`ch`.`school_type` = `sc`.`school_type`))) ;

-- --------------------------------------------------------

--
-- Structure for view `emrp_dailyregistration_view`
--
DROP TABLE IF EXISTS `emrp_dailyregistration_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emrp_dailyregistration_view`  AS SELECT cast(`child_tbl`.`created_datetime` as date) AS `RegDate`, count(if((cast(`child_tbl`.`created_datetime` as date) between (now() - interval 1 day) and now()),`child_tbl`.`id_child`,0)) AS `RegistrationCount` FROM `child_tbl` WHERE (cast(`child_tbl`.`created_datetime` as date) between (now() - interval 30 day) and now()) GROUP BY `RegDate` ORDER BY `RegDate` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `emrp_monthlyregistration_orgvise_view`
--
DROP TABLE IF EXISTS `emrp_monthlyregistration_orgvise_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emrp_monthlyregistration_orgvise_view`  AS SELECT `child_tbl`.`organization` AS `Organization`, month(`child_tbl`.`created_datetime`) AS `RegMonth`, year(`child_tbl`.`created_datetime`) AS `RegYear`, count(if((cast(`child_tbl`.`created_datetime` as date) between (now() - interval 1 month) and now()),`child_tbl`.`id_child`,0)) AS `RegistrationCount` FROM `child_tbl` WHERE (cast(`child_tbl`.`created_datetime` as date) between (now() - interval 12 month) and now()) GROUP BY `child_tbl`.`organization`, `RegMonth`, `RegYear` ORDER BY `child_tbl`.`organization` ASC, `RegMonth` ASC, `RegYear` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `emrp_monthlyregistration_view`
--
DROP TABLE IF EXISTS `emrp_monthlyregistration_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emrp_monthlyregistration_view`  AS SELECT month(`child_tbl`.`created_datetime`) AS `RegMonth`, year(`child_tbl`.`created_datetime`) AS `RegYear`, count(if((cast(`child_tbl`.`created_datetime` as date) between (now() - interval 1 month) and now()),`child_tbl`.`id_child`,0)) AS `RegistrationCount` FROM `child_tbl` WHERE (cast(`child_tbl`.`created_datetime` as date) between (now() - interval 12 month) and now()) GROUP BY `RegMonth`, `RegYear` ORDER BY `RegMonth` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `emrp_schooltypewisechildcount_view`
--
DROP TABLE IF EXISTS `emrp_schooltypewisechildcount_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emrp_schooltypewisechildcount_view`  AS SELECT `child_tbl`.`school_type` AS `schooltypeid`, `schooltype_tbl`.`description` AS `School Type`, count(`child_tbl`.`id_child`) AS `Child Count` FROM (`child_tbl` join `schooltype_tbl`) WHERE (`child_tbl`.`school_type` = `schooltype_tbl`.`school_type`) GROUP BY `child_tbl`.`school_type`, `schooltype_tbl`.`description` ORDER BY `child_tbl`.`school_type` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `emrp_weeklyregistration_view`
--
DROP TABLE IF EXISTS `emrp_weeklyregistration_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `emrp_weeklyregistration_view`  AS SELECT week(`ch`.`created_datetime`,0) AS `RegWeek`, year(`ch`.`created_datetime`) AS `RegYear`, count(if((cast(`ch`.`created_datetime` as date) between (now() - interval 1 week) and now()),`ch`.`id_child`,0)) AS `RegistrationCount` FROM `child_tbl` AS `ch` WHERE (cast(`ch`.`created_datetime` as date) between (now() - interval 12 week) and now()) GROUP BY `RegWeek`, `RegYear` ORDER BY `RegWeek` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_activedevices_view`
--
DROP TABLE IF EXISTS `prm_activedevices_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_activedevices_view`  AS SELECT `prm_weeklygameplaysessions_perdevice_view`.`DeviceId` AS `DeviceId`, max(`prm_weeklygameplaysessions_perdevice_view`.`Users`) AS `Users`, max(if((`prm_weeklygameplaysessions_perdevice_view`.`Week` = week((curdate() - interval 3 week),0)),`prm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week1`, max(if((`prm_weeklygameplaysessions_perdevice_view`.`Week` = week((curdate() - interval 2 week),0)),`prm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week2`, max(if((`prm_weeklygameplaysessions_perdevice_view`.`Week` = week((curdate() - interval 1 week),0)),`prm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week3`, max(if((`prm_weeklygameplaysessions_perdevice_view`.`Week` = week(curdate(),0)),`prm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`,0)) AS `Week4`, sum(`prm_weeklygameplaysessions_perdevice_view`.`GameplaySessionsWeeklyCount`) AS `TotalSessionsCount` FROM `prm_weeklygameplaysessions_perdevice_view` WHERE (`prm_weeklygameplaysessions_perdevice_view`.`Week` between week((curdate() - interval 3 week),0) and week(curdate(),0)) GROUP BY `prm_weeklygameplaysessions_perdevice_view`.`DeviceId` HAVING (count(`prm_weeklygameplaysessions_perdevice_view`.`DeviceId`) > 3) ORDER BY `prm_weeklygameplaysessions_perdevice_view`.`DeviceId` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_attemptssummaryallgames_view`
--
DROP TABLE IF EXISTS `prm_attemptssummaryallgames_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_attemptssummaryallgames_view`  AS SELECT `game_play_detail_tbl`.`attempts` AS `attempts`, count(`game_play_detail_tbl`.`id_game_play_detail`) AS `submissioncount` FROM `game_play_detail_tbl` GROUP BY `game_play_detail_tbl`.`attempts` ORDER BY `game_play_detail_tbl`.`attempts` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_avggameplaysessiontimeperchild_view`
--
DROP TABLE IF EXISTS `prm_avggameplaysessiontimeperchild_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_avggameplaysessiontimeperchild_view`  AS SELECT `tstpgpv`.`childid` AS `childid`, `eauv`.`Name` AS `Name`, `eauv`.`DeviceId` AS `DeviceId`, `eauv`.`Grade` AS `Grade`, `eauv`.`Organization` AS `Organization`, sum(`tstpgpv`.`total_session_time`) AS `Total_Gameplay_Session_Time`, count(`tstpgpv`.`id_game_play`) AS `Number_Of_Gameplay_Sessions`, round(avg(`tstpgpv`.`total_session_time`),0) AS `Avg_Gameplay_Session_Time`, max(`tstpgpv`.`date_played`) AS `date_last_played` FROM (`prm_totalsessiontimepergameplay_view` `tstpgpv` join `emrp_active_users_view` `eauv`) WHERE (`eauv`.`childid` = `tstpgpv`.`childid`) GROUP BY `tstpgpv`.`childid`, `eauv`.`Name`, `eauv`.`DeviceId`, `eauv`.`Grade` ORDER BY `eauv`.`Name` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_childtimepergameplaysession_view`
--
DROP TABLE IF EXISTS `prm_childtimepergameplaysession_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_childtimepergameplaysession_view`  AS SELECT `gpdt`.`id_child` AS `childid`, `cht`.`child_name` AS `Name`, `cht`.`deviceid` AS `DeviceId`, `cht`.`organization` AS `Organization`, `gpdt`.`id_game_play` AS `id_game_play`, `gpt`.`id_game` AS `id_game`, `gpt`.`start_time` AS `session_start_time`, sum(`gpdt`.`time2answer`) AS `total_session_time` FROM ((`game_play_detail_tbl` `gpdt` left join `game_play_tbl` `gpt` on((`gpt`.`id_game_play` = `gpdt`.`id_game_play`))) left join `child_tbl` `cht` on((`cht`.`id_child` = `gpdt`.`id_child`))) WHERE (cast(`gpt`.`start_time` as date) between (now() - interval 2 week) and now()) GROUP BY `gpdt`.`id_game_play`, `gpt`.`id_game`, `gpdt`.`id_child`, `Name`, `cht`.`deviceid`, `session_start_time` ORDER BY `Name` ASC, `session_start_time` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_dailygameplaysessions_view`
--
DROP TABLE IF EXISTS `prm_dailygameplaysessions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_dailygameplaysessions_view`  AS SELECT cast(`game_play_tbl`.`start_time` as date) AS `SessionDate`, count(if((cast(`game_play_tbl`.`start_time` as date) between (now() - interval 1 day) and now()),`game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsCount` FROM `game_play_tbl` WHERE (cast(`game_play_tbl`.`start_time` as date) between (now() - interval 365 day) and now()) GROUP BY `SessionDate` ORDER BY `SessionDate` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_dailytotalsessiontimeperchild_view`
--
DROP TABLE IF EXISTS `prm_dailytotalsessiontimeperchild_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_dailytotalsessiontimeperchild_view`  AS SELECT `tstpgpv`.`date_played` AS `dateplayed`, `eauv`.`DeviceId` AS `DeviceId`, `tstpgpv`.`childid` AS `childid`, `eauv`.`Name` AS `Name`, `eauv`.`Grade` AS `Grade`, `eauv`.`Organization` AS `Organization`, count(`tstpgpv`.`id_game_play`) AS `Total_Games_Played`, sum(`tstpgpv`.`total_session_time`) AS `Total_Gameplay_Session_Time` FROM (`prm_totalsessiontimepergameplay_view` `tstpgpv` join `emrp_active_users_view` `eauv`) WHERE ((`eauv`.`childid` = `tstpgpv`.`childid`) AND (cast(`tstpgpv`.`date_played` as date) between ((last_day(now()) - interval 2 month) + interval 1 day) and now())) GROUP BY `tstpgpv`.`date_played`, `tstpgpv`.`childid`, `eauv`.`DeviceId`, `eauv`.`Name`, `eauv`.`Grade`, `eauv`.`Organization` ORDER BY `dateplayed` ASC, `eauv`.`DeviceId` ASC, `eauv`.`Name` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_monthlygameplaysessions_childvise_view`
--
DROP TABLE IF EXISTS `prm_monthlygameplaysessions_childvise_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_monthlygameplaysessions_childvise_view`  AS SELECT `child_tbl`.`id_child` AS `id_child`, `child_tbl`.`child_name` AS `Name`, `child_tbl`.`deviceid` AS `DeviceId`, `child_tbl`.`organization` AS `Organization`, month(`game_play_tbl`.`start_time`) AS `Month`, year(`game_play_tbl`.`start_time`) AS `Year`, count(if((cast(`game_play_tbl`.`start_time` as date) between (now() - interval 1 month) and now()),`game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsCount` FROM (`child_tbl` join `game_play_tbl`) WHERE ((`child_tbl`.`id_child` = `game_play_tbl`.`id_child`) AND (cast(`game_play_tbl`.`start_time` as date) between (now() - interval 12 month) and now())) GROUP BY `child_tbl`.`id_child`, `Name`, `Month`, `Year` ORDER BY `child_tbl`.`id_child` ASC, `Name` ASC, `Month` ASC, `Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_monthlygameplaysessions_orgvise_view`
--
DROP TABLE IF EXISTS `prm_monthlygameplaysessions_orgvise_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_monthlygameplaysessions_orgvise_view`  AS SELECT `mgpscvv`.`Organization` AS `Organization`, `mgpscvv`.`Month` AS `Month`, `mgpscvv`.`Year` AS `Year`, sum(`mgpscvv`.`GameplaySessionsCount`) AS `GameplaySessionsCount` FROM `prm_monthlygameplaysessions_childvise_view` AS `mgpscvv` GROUP BY `mgpscvv`.`Organization`, `mgpscvv`.`Month`, `mgpscvv`.`Year` ORDER BY `mgpscvv`.`Organization` ASC, `mgpscvv`.`Month` ASC, `mgpscvv`.`Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_monthlygameplaysessions_view`
--
DROP TABLE IF EXISTS `prm_monthlygameplaysessions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_monthlygameplaysessions_view`  AS SELECT month(`game_play_tbl`.`start_time`) AS `Month`, year(`game_play_tbl`.`start_time`) AS `Year`, count(if((cast(`game_play_tbl`.`start_time` as date) between (now() - interval 1 month) and now()),`game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsCount` FROM `game_play_tbl` WHERE (cast(`game_play_tbl`.`start_time` as date) between (now() - interval 12 month) and now()) GROUP BY `Month`, `Year` ORDER BY `Month` ASC, `Year` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_questionsubmissionsandattemptscounts_view`
--
DROP TABLE IF EXISTS `prm_questionsubmissionsandattemptscounts_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_questionsubmissionsandattemptscounts_view`  AS SELECT substring_index(`gpdt`.`id_question`,'#',1) AS `QuestionID`, count(`gpdt`.`id_game_play_detail`) AS `totalsubmissions`, count(if((`gpdt`.`attempts` > 3),`gpdt`.`id_game_play_detail`,NULL)) AS `submissionswith4ormoreattempts` FROM `game_play_detail_tbl` AS `gpdt` GROUP BY `QuestionID` ORDER BY `submissionswith4ormoreattempts` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_questionswithfourormoreattempts_view`
--
DROP TABLE IF EXISTS `prm_questionswithfourormoreattempts_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_questionswithfourormoreattempts_view`  AS SELECT `prm_questionsubmissionsandattemptscounts_view`.`QuestionID` AS `QuestionID`, `prm_questionsubmissionsandattemptscounts_view`.`totalsubmissions` AS `totalsubmissions`, `prm_questionsubmissionsandattemptscounts_view`.`submissionswith4ormoreattempts` AS `submissionswith4ormoreattempts` FROM `prm_questionsubmissionsandattemptscounts_view` WHERE (`prm_questionsubmissionsandattemptscounts_view`.`submissionswith4ormoreattempts` > 0) GROUP BY `prm_questionsubmissionsandattemptscounts_view`.`QuestionID` ORDER BY `prm_questionsubmissionsandattemptscounts_view`.`submissionswith4ormoreattempts` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_totalsessionspergame_view`
--
DROP TABLE IF EXISTS `prm_totalsessionspergame_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_totalsessionspergame_view`  AS SELECT `gpt`.`id_game` AS `GameId`, count(`gpt`.`id_game_play`) AS `PlaySessions` FROM `game_play_tbl` AS `gpt` GROUP BY `gpt`.`id_game` ORDER BY `PlaySessions` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_totalsessiontimepergameplay_view`
--
DROP TABLE IF EXISTS `prm_totalsessiontimepergameplay_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_totalsessiontimepergameplay_view`  AS SELECT `gpdt`.`id_game_play` AS `id_game_play`, `gpdt`.`id_child` AS `childid`, cast(`gpdt`.`date_time_submission` as date) AS `date_played`, sum(`gpdt`.`time2answer`) AS `total_session_time` FROM `game_play_detail_tbl` AS `gpdt` GROUP BY `gpdt`.`id_game_play`, `childid`, `date_played` ORDER BY `gpdt`.`id_child` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_total_games_played_with_gameid`
--
DROP TABLE IF EXISTS `prm_total_games_played_with_gameid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_total_games_played_with_gameid`  AS SELECT `A`.`DeviceId` AS `DeviceId`, `A`.`NAME` AS `NAME`, `A`.`Organization` AS `Organization`, count(distinct `A`.`chm_game_id`) AS `TotalGames`, group_concat(`A`.`chm_game_id` separator ',') AS `GameIds`, `A`.`prm_date` AS `PlayDate`, `A`.`prm_month` AS `MONTH`, `A`.`prm_year` AS `YEAR`, sum(`A`.`total_chm_time`) AS `TotalPlayTime` FROM (select `gpdt`.`id_child` AS `childid`,`cht`.`child_name` AS `NAME`,`cht`.`deviceid` AS `DeviceId`,`cht`.`organization` AS `Organization`,`gpt`.`id_game` AS `chm_game_id`,cast(`gpt`.`start_time` as date) AS `prm_date`,month(`gpt`.`start_time`) AS `prm_month`,year(`gpt`.`start_time`) AS `prm_year`,sum(`gpdt`.`time2answer`) AS `total_chm_time` from ((`game_play_detail_tbl` `gpdt` left join `game_play_tbl` `gpt` on((`gpt`.`id_game_play` = `gpdt`.`id_game_play`))) left join `child_tbl` `cht` on((`cht`.`id_child` = `gpdt`.`id_child`))) where (cast(`gpt`.`start_time` as date) between ((last_day(now()) - interval 2 month) + interval 1 day) and now()) group by `gpdt`.`id_child`,`NAME`,`cht`.`deviceid`,`prm_date`,`prm_month`,`prm_year`,`gpt`.`id_game`) AS `A` GROUP BY `A`.`DeviceId`, `A`.`NAME`, `A`.`Organization`, `PlayDate`, `MONTH`, `YEAR` ORDER BY `PlayDate` ASC, `A`.`NAME` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `prm_weeklygameplaysessions_perdevice_view`
--
DROP TABLE IF EXISTS `prm_weeklygameplaysessions_perdevice_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prm_weeklygameplaysessions_perdevice_view`  AS SELECT `child_tbl`.`deviceid` AS `DeviceId`, count(distinct `game_play_tbl`.`id_child`) AS `Users`, week(`game_play_tbl`.`start_time`,0) AS `Week`, (cast(`game_play_tbl`.`start_time` as date) - interval (dayofweek(cast(`game_play_tbl`.`start_time` as date)) - 1) day) AS `WeekStartDate`, year(`game_play_tbl`.`start_time`) AS `Year`, count(if((cast(`game_play_tbl`.`start_time` as date) between (now() - interval 1 week) and now()),`game_play_tbl`.`id_game_play`,0)) AS `GameplaySessionsWeeklyCount` FROM (`child_tbl` join `game_play_tbl`) WHERE ((`child_tbl`.`id_child` = `game_play_tbl`.`id_child`) AND (cast(`game_play_tbl`.`start_time` as date) between (now() - interval 24 week) and now())) GROUP BY `child_tbl`.`deviceid`, `Week`, `WeekStartDate`, `Year` ORDER BY `child_tbl`.`deviceid` ASC, `Week` ASC, `WeekStartDate` ASC, `Year` ASC ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `child_tbl`
--
ALTER TABLE `child_tbl`
  ADD CONSTRAINT `fk_language` FOREIGN KEY (`id_language`) REFERENCES `language_tbl` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chm_game_play_tbl`
--
ALTER TABLE `chm_game_play_tbl`
  ADD CONSTRAINT `fk_chmchild_id` FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chm_question_master_tbl`
--
ALTER TABLE `chm_question_master_tbl`
  ADD CONSTRAINT `fk_chmqt_idgame` FOREIGN KEY (`id_game`) REFERENCES `chm_game_master_tbl` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chmqt_micro_concept` FOREIGN KEY (`id_micro_concept`) REFERENCES `micro_concept_tbl` (`id_micro_concept`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chmqt_question_type` FOREIGN KEY (`id_question_type`) REFERENCES `question_type_tbl` (`id_question_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `game_play_tbl`
--
ALTER TABLE `game_play_tbl`
  ADD CONSTRAINT `fk_child_id` FOREIGN KEY (`id_child`) REFERENCES `child_tbl` (`id_child`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `microconcept_group_tbl`
--
ALTER TABLE `microconcept_group_tbl`
  ADD CONSTRAINT `fk_mconceptgrp` FOREIGN KEY (`id_concept`) REFERENCES `concept_tbl` (`id_concept`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `micro_concept_tbl`
--
ALTER TABLE `micro_concept_tbl`
  ADD CONSTRAINT `fk_mcconcept` FOREIGN KEY (`id_concept`) REFERENCES `concept_tbl` (`id_concept`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mcidmcg` FOREIGN KEY (`idmcg`) REFERENCES `microconcept_group_tbl` (`idmcg`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `push_notification_messages_tbl`
--
ALTER TABLE `push_notification_messages_tbl`
  ADD CONSTRAINT `fk_pnm_language` FOREIGN KEY (`id_language`) REFERENCES `language_tbl` (`id_language`) ON UPDATE CASCADE;

--
-- Constraints for table `question_tbl`
--
ALTER TABLE `question_tbl`
  ADD CONSTRAINT `fk_qt_idgame` FOREIGN KEY (`id_game`) REFERENCES `game_master_tbl` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_qt_micro_concept` FOREIGN KEY (`id_micro_concept`) REFERENCES `micro_concept_tbl` (`id_micro_concept`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_qt_question_classification` FOREIGN KEY (`id_question_classification`) REFERENCES `question_classification_tbl` (`id_question_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_qt_question_type` FOREIGN KEY (`id_question_type`) REFERENCES `question_type_tbl` (`id_question_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
