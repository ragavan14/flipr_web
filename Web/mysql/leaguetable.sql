-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2018 at 11:27 AM
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
-- Table structure for table `leaguetable`
--

CREATE TABLE `leaguetable` (
  `id` int(2) NOT NULL,
  `name` varchar(60) NOT NULL,
  `matches_played` int(2) NOT NULL DEFAULT '0',
  `win` int(2) NOT NULL DEFAULT '0',
  `loss` int(2) NOT NULL DEFAULT '0',
  `draw` int(2) NOT NULL DEFAULT '0',
  `points` int(2) NOT NULL DEFAULT '0',
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaguetable`
--

INSERT INTO `leaguetable` (`id`, `name`, `matches_played`, `win`, `loss`, `draw`, `points`, `team_id`) VALUES
(1, 'Mumbai Indians', 0, 0, 0, 0, 0, 1),
(2, 'Chennai Super Kings', 0, 0, 0, 0, 0, 2),
(3, 'Royal Challengers Banglore', 0, 0, 0, 0, 0, 3),
(4, 'Kolkata Knight Riders', 0, 0, 0, 0, 0, 4),
(5, 'Sunrisers Hyderabad', 0, 0, 0, 0, 0, 5),
(6, 'Rajasthan Royals', 0, 0, 0, 0, 0, 6),
(7, 'Kings XI Punjab', 0, 0, 0, 0, 0, 7),
(8, 'Delhi Daredevils', 0, 0, 0, 0, 0, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leaguetable`
--
ALTER TABLE `leaguetable`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
