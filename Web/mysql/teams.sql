-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2018 at 05:02 PM
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
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `pid_teams` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `leagues_won` varchar(60) NOT NULL DEFAULT 'Not Yet Won',
  `captain` varchar(60) NOT NULL,
  `home` varchar(60) NOT NULL,
  `venue` varchar(60) NOT NULL,
  PRIMARY KEY (`pid_teams`),
  UNIQUE KEY `uni_name` (`name`) USING BTREE,
  UNIQUE KEY `uni_captain` (`captain`) USING BTREE,
  KEY `idx_pid` (`pid_teams`) USING BTREE,
  KEY `idx_venue` (`venue`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`pid_teams`, `name`, `leagues_won`, `captain`, `home`, `venue`) VALUES
(1, 'Mumbai Indians', '2013, 2015, 2017', 'Rohit Sharma', 'Mumbai', 'Wankhede Stadium'),
(2, 'Chennai Super Kings', '2010, 2011', 'Mahendra Singh Dhoni', 'Chennai', 'M. A. Chidambaram Stadium'),
(3, 'Royal Challengers Bangalore', 'Not Yet Won ', 'Virat Kohli', 'Bengaluru', 'M. Chinnaswamy Stadium'),
(4, 'Kolkata Knight Riders', '2012, 2014', 'Dinesh Karthik', 'Kolkata', 'Eden Gardens'),
(5, 'Sunrisers Hyderabad', '2016', 'Shikhar Dhawan', 'Hyderabad', 'Rajiv Gandhi Intl Cricket Stadium'),
(6, 'Rajasthan Royals', '2008', 'Steven Smith', 'Jaipur', 'Sawai Mansingh Stadium'),
(7, 'Kings XI Punjab', 'Not Yet Won ', 'Ravichandran Ashwin', 'Mohali', 'IS Bindra Stadium'),
(8, 'Delhi Daredevils', 'Not Yet Won ', 'Gautam Gambhir', 'Delhi', 'Feroz Shah Kotla Stadium');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
