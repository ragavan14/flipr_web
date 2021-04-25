-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2018 at 11:26 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `pid_matches` int(11) NOT NULL,
  `matchdate` datetime NOT NULL DEFAULT '2018-04-07 20:00:00',
  `fid_team1` varchar(60) DEFAULT NULL,
  `fid_team2` varchar(60) DEFAULT NULL,
  `venue` varchar(60) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `result` varchar(60) NOT NULL DEFAULT 'not yet played'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`pid_matches`, `matchdate`, `fid_team1`, `fid_team2`, `venue`, `status`, `result`) VALUES
(1, '2018-04-07 20:00:00', 'Mumbai Indians', 'Chennai Super Kings', 'Wankhede Stadium', 0, 'not yet played'),
(2, '2018-04-08 16:00:00', 'Kings XI Punjab', 'Delhi Daredevils', 'IS Bindra Stadium', 0, 'not yet played'),
(3, '2018-04-08 20:00:00', 'Kolkata Knight Riders', 'Royal Challengers Bangalore', 'Eden Gardens', 0, 'not yet played'),
(4, '2018-04-09 20:00:00', 'Sunrisers Hyderabad', 'Rajasthan Royals', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(5, '2018-04-10 20:00:00', 'Chennai Super Kings', 'Kolkata Knight Riders', 'M. A. Chidambaram Stadium', 0, 'not yet played'),
(6, '2018-04-11 20:00:00', 'Rajasthan Royals', 'Delhi Daredevils', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(7, '2018-04-12 20:00:00', 'Sunrisers Hyderabad', 'Mumbai Indians', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(8, '2018-04-13 20:00:00', 'Royal Challengers Bangalore', 'Kings XI Punjab', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(9, '2018-04-14 16:00:00', 'Mumbai Indians', 'Delhi Daredevils', 'Wankhede Stadium', 0, 'not yet played'),
(10, '2018-04-14 20:00:00', 'Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Eden Gardens', 0, 'not yet played'),
(11, '2018-04-15 16:00:00', 'Royal Challengers Bangalore', 'Rajasthan Royals', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(12, '2018-04-15 20:00:00', 'Kings XI Punjab', 'Chennai Super Kings', 'IS Bindra Stadium', 0, 'not yet played'),
(13, '2018-04-16 20:00:00', 'Kolkata Knight Riders', 'Delhi Daredevils', 'Eden Gardens', 0, 'not yet played'),
(14, '2018-04-17 20:00:00', 'Mumbai Indians', 'Royal Challengers Bangalore', 'Wankhede Stadium', 0, 'not yet played'),
(15, '2018-04-18 20:00:00', 'Rajasthan Royals', 'Kolkata Knight Riders', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(16, '2018-04-19 20:00:00', 'Kings XI Punjab', 'Sunrisers Hyderabad', 'IS Bindra Stadium', 0, 'not yet played'),
(17, '2018-04-20 20:00:00', 'Chennai Super Kings', 'Rajasthan Royals', 'M. A. Chidambaram Stadium', 0, 'not yet played'),
(18, '2018-04-21 16:00:00', 'Kolkata Knight Riders', 'Kings XI Punjab', 'Eden Gardens', 0, 'not yet played'),
(19, '2018-04-21 20:00:00', 'Delhi Daredevils', 'Royal Challengers Bangalore', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(20, '2018-04-22 16:00:00', 'Sunrisers Hyderabad', 'Chennai Super Kings', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(21, '2018-04-22 20:00:00', 'Rajasthan Royals', 'Mumbai Indians', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(22, '2018-04-23 20:00:00', 'Delhi Daredevils', 'Kings XI Punjab', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(23, '2018-04-24 20:00:00', 'Mumbai Indians', 'Sunrisers Hyderabad', 'Wankhede Stadium', 0, 'not yet played'),
(24, '2018-04-25 20:00:00', 'Royal Challengers Bangalore', 'Chennai Super Kings', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(25, '2018-04-26 20:00:00', 'Sunrisers Hyderabad', 'Kings XI Punjab', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(26, '2018-04-27 20:00:00', 'Delhi Daredevils', 'Kolkata Knight Riders', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(27, '2018-04-28 20:00:00', 'Chennai Super Kings', 'Mumbai Indians', 'M. A. Chidambaram Stadium', 0, 'not yet played'),
(28, '2018-04-29 16:00:00', 'Rajasthan Royals', 'Sunrisers Hyderabad', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(29, '2018-04-29 20:00:00', 'Royal Challengers Bangalore', 'Kolkata Knight Riders', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(30, '2018-04-30 20:00:00', 'Chennai Super Kings', 'Delhi Daredevils', 'M. A. Chidambaram Stadium', 0, 'not yet played'),
(31, '2018-05-01 20:00:00', 'Royal Challengers Bangalore', 'Mumbai Indians', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(32, '2018-05-02 20:00:00', 'Delhi Daredevils', 'Rajasthan Royals', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(33, '2018-05-03 20:00:00', 'Kolkata Knight Riders', 'Chennai Super Kings', 'Eden Gardens', 0, 'not yet played'),
(34, '2018-05-04 20:00:00', 'Kings XI Punjab', 'Mumbai Indians', 'Holkar Cricket Stadium', 0, 'not yet played'),
(35, '2018-05-05 16:00:00', 'Chennai Super Kings', 'Royal Challengers Bangalore', 'M. A. Chidambaram Stadium', 0, 'not yet played'),
(36, '2018-05-05 20:00:00', 'Sunrisers Hyderabad', 'Delhi Daredevils', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(37, '2018-05-06 16:00:00', 'Mumbai Indians', 'Kolkata Knight Riders', 'Wankhede Stadium', 0, 'not yet played'),
(38, '2018-05-06 20:00:00', 'Kings XI Punjab', 'Rajasthan Royals', 'Holkar Cricket Stadium', 0, 'not yet played'),
(39, '2018-05-07 20:00:00', 'Sunrisers Hyderabad', 'Royal Challengers Bangalore', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(40, '2018-05-08 20:00:00', 'Rajasthan Royals', 'Kings XI Punjab', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(41, '2018-05-09 20:00:00', 'Kolkata Knight Riders', 'Mumbai Indians', 'Eden Gardens', 0, 'not yet played'),
(42, '2018-05-10 20:00:00', 'Delhi Daredevils', 'Sunrisers Hyderabad', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(43, '2018-05-11 20:00:00', 'Rajasthan Royals', 'Chennai Super Kings', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(44, '2018-05-12 16:00:00', 'Kings XI Punjab', 'Kolkata Knight Riders', 'Holkar Cricket Stadium', 0, 'not yet played'),
(45, '2018-05-12 20:00:00', 'Royal Challengers Bangalore', 'Delhi Daredevils', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(46, '2018-05-13 16:00:00', 'Chennai Super Kings', 'Sunrisers Hyderabad', 'M. A. Chidambaram Stadium', 0, 'not yet played'),
(47, '2018-05-13 20:00:00', 'Mumbai Indians', 'Rajasthan Royals', 'Wankhede Stadium', 0, 'not yet played'),
(48, '2018-05-14 20:00:00', 'Kings XI Punjab', 'Royal Challengers Bangalore', 'Holkar Stadium', 0, 'not yet played'),
(49, '2018-05-15 20:00:00', 'Kolkata Knight Riders', 'Rajasthan Royals', 'Eden Gardens', 0, 'not yet played'),
(50, '2018-05-16 20:00:00', 'Mumbai Indians', 'Kings XI Punjab', 'Wankhede Stadium', 0, 'not yet played'),
(51, '2018-05-17 20:00:00', 'Royal Challengers Bangalore', 'Sunrisers Hyderabad', 'M. Chinnaswamy Stadium', 0, 'not yet played'),
(52, '2018-05-18 20:00:00', 'Delhi Daredevils', 'Chennai Super Kings', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(53, '2018-05-19 16:00:00', 'Rajasthan Royals', 'Royal Challengers Bangalore', 'Sawai Mansingh Stadium', 0, 'not yet played'),
(54, '2018-05-19 20:00:00', 'Sunrisers Hyderabad', 'Kolkata Knight Riders', 'Rajiv Gandhi Intl Cricket Stadium', 0, 'not yet played'),
(55, '2018-05-20 16:00:00', 'Delhi Daredevils', 'Mumbai Indians', 'Feroz Shah Kotla Stadium', 0, 'not yet played'),
(56, '2018-05-20 20:00:00', 'Chennai Super Kings', 'Kings XI Punjab', 'M. A. Chidambaram Stadium', 0, 'not yet played');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`pid_matches`),
  ADD KEY `FOREIGN1` (`fid_team1`),
  ADD KEY `FOREIGN2` (`fid_team2`),
  ADD KEY `idx_matchdate` (`matchdate`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `pid_matches` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
