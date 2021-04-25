-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2018 at 05:31 PM
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
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id_player` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `fid_team` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `runs` int(11) NOT NULL,
  `wickets` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id_player`, `name`, `fid_team`, `type`, `runs`, `wickets`) VALUES
(101, 'Rohit Sharma', 1, 1, 1387, 109),
(102, 'Kieron Pollard', 1, 2, 1190, 114),
(103, 'Krunal Pandya', 1, 2, 2902, 97),
(104, 'Jean-Paul Duminy', 1, 2, 2363, 26),
(105, 'Hardik Pandya', 1, 2, 3168, 102),
(106, 'Ishan Kishan', 1, 2, 2087, 111),
(107, 'Jasprt Bumrah', 1, 3, 2396, 31),
(108, 'Mustafizur Rahman', 1, 3, 1349, 44),
(109, 'Pat Cummins', 1, 3, 3418, 75),
(110, 'Suryakumar Yadav', 1, 1, 1722, 63),
(111, 'Siddhesh Lad', 1, 1, 1647, 83),
(201, 'MS Dhoni', 2, 1, 1731, 4),
(202, 'Suresh Raina', 2, 1, 3207, 17),
(203, 'Faf du Plessis', 2, 1, 3655, 106),
(204, 'Kedar Jadav', 2, 1, 3089, 92),
(205, 'Dwayne Bravo', 2, 2, 2422, 64),
(206, 'Shane Watson', 2, 2, 2032, 74),
(207, 'Ravindra Jadeja', 2, 2, 2549, 21),
(208, 'Harbhajan Singh', 2, 3, 3251, 53),
(209, 'Ambati Rayudu', 2, 2, 3554, 2),
(210, 'Imran Tahir', 2, 3, 3588, 37),
(211, 'Shardul Thakur', 2, 3, 2722, 13),
(301, 'Virat Kohli', 3, 1, 2923, 9),
(302, 'Sarfaraz Khan', 3, 1, 1205, 85),
(303, 'Colin de Grandhomme', 3, 2, 1049, 65),
(304, 'Moeen Ali', 3, 2, 775, 29),
(305, 'Washington Sundar', 3, 2, 1103, 42),
(306, 'Corey Anderson', 3, 2, 3386, 71),
(307, 'AB de Villiers', 3, 1, 3206, 47),
(308, 'Brendon McCullum', 3, 1, 2301, 109),
(309, 'Umesh Yadav', 3, 3, 2867, 2),
(310, 'Yuzvendra Chahal', 3, 3, 903, 15),
(311, 'Mohammed Siraj', 3, 3, 3212, 78),
(401, 'Dinesh Karthik', 4, 1, 2358, 56),
(402, 'Chris Lynn', 4, 1, 2407, 2),
(403, 'Andre Russell', 4, 2, 2663, 66),
(404, 'Piyush Chawla', 4, 2, 4281, 98),
(405, 'Robin Uthappa', 4, 2, 4066, 9),
(406, 'Sunil Narine', 4, 3, 2399, 31),
(407, 'Mitchell Starc', 4, 3, 1713, 62),
(408, 'Mitchell Johnson', 4, 3, 3072, 59),
(409, 'Kuldeep Yadav', 4, 3, 1798, 12),
(410, 'Cameron Delport', 4, 2, 1402, 21),
(411, 'Shubman Gill', 4, 1, 3302, 59),
(501, 'Shikhar Dhawan', 5, 1, 1272, 94),
(502, 'Kane Williamson', 5, 1, 3519, 118),
(503, 'Manish Pandey', 5, 1, 3748, 58),
(504, 'Shakib Al Hasan', 5, 2, 1728, 94),
(505, 'Carlos Brathwaite', 5, 2, 4285, 7),
(506, 'Yusuf Pathan', 5, 2, 3211, 78),
(507, 'Deepak Hooda', 5, 2, 1308, 69),
(508, 'Wriddhiman Saha', 5, 2, 1408, 82),
(509, 'Bhuvneshwar Kumar', 5, 3, 2331, 83),
(510, 'Rashid Khan', 5, 3, 2582, 85),
(511, 'Sandeep Sharma', 5, 3, 2411, 63),
(601, 'Ajinkya Rahane', 6, 1, 1235, 59),
(602, 'Rahul Tripathi', 6, 1, 1748, 97),
(603, 'D Arcy Short', 6, 1, 4062, 69),
(604, 'Stuart Binny', 6, 2, 3219, 109),
(605, 'Ben Stokes', 6, 2, 2703, 41),
(606, 'Sanju Samson', 6, 2, 3044, 56),
(607, 'Jos Buttler', 6, 3, 1921, 89),
(608, 'Jaydev Unadkat', 6, 3, 2658, 96),
(609, 'Krishnappa Gowtham', 6, 3, 3165, 72),
(610, 'Ishank Jaggi', 6, 1, 3909, 18),
(611, 'Nitesh Rana', 6, 1, 3822, 98),
(701, 'Ravichandran Ashwin', 7, 3, 3367, 7),
(702, 'Yuvraj Singh', 7, 1, 2594, 27),
(703, 'Karun Nair', 7, 1, 780, 120),
(704, 'Chris Gayle', 7, 1, 2656, 35),
(705, 'David Miller', 7, 1, 1065, 37),
(706, 'Aaron Finch', 7, 1, 1806, 44),
(707, 'Axar Patel', 7, 2, 2322, 51),
(708, 'Lokesh Rahul', 7, 2, 2559, 52),
(709, 'Mohit Sharma', 7, 3, 2853, 0),
(710, 'Mujeeb Ur Rahman', 7, 3, 2702, 11),
(711, 'Andrew Tye', 7, 3, 1018, 0),
(801, 'Gautam Gambhir', 8, 1, 1577, 44),
(802, 'Shreyas Iyer', 8, 1, 1632, 111),
(803, 'Jason Roy', 8, 1, 2621, 0),
(804, 'Colin Munro', 8, 1, 2077, 49),
(805, 'Glenn Maxwell', 8, 2, 650, 103),
(806, 'Vijay Shankar', 8, 2, 3993, 90),
(807, 'Chris Morris', 8, 2, 2079, 49),
(808, 'Rishabh Pant', 8, 1, 3320, 32),
(809, 'Mohammed Shami', 8, 3, 2754, 78),
(810, 'Jayant Yadav', 8, 3, 4413, 115),
(811, 'Kagiso Rabada', 8, 3, 3057, 57);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id_player`),
  ADD KEY `fid_team` (`fid_team`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
