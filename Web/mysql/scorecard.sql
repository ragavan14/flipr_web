-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 01, 2018 at 12:47 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `scorecard`
--

DROP TABLE IF EXISTS `scorecard`;
CREATE TABLE IF NOT EXISTS `scorecard` (
  `playerid` int(11) NOT NULL,
  `matchid` int(11) NOT NULL,
  `runs` int(11) DEFAULT '0',
  `balls` int(11) DEFAULT '0',
  `strikerate` decimal(10,4) DEFAULT '0.0000',
  `overs` float DEFAULT '0',
  `wickets` int(11) DEFAULT '0',
  `runsconceded` int(11) DEFAULT '0',
  `economy` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`playerid`,`matchid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `scorecard`
--
DROP TRIGGER IF EXISTS `tig_bef_ins_scorecard`;
DELIMITER $$
CREATE TRIGGER `tig_bef_ins_scorecard` AFTER INSERT ON `scorecard` FOR EACH ROW begin
	update players set runs=runs+new.runs where new.playerid=id_player;
    update players set wickets=wickets+new.wickets where new.playerid=id_player;
end
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
