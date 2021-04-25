-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2018 at 01:33 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_leaguetable` (IN `team_id1` INT, IN `team_id2` INT, IN `winnerid` INT)  NO SQL
BEGIN
DECLARE win1 integer;
DECLARE loss1 integer;
DECLARE draw1 integer;
DECLARE points1 integer;
DECLARE played1 integer;
DECLARE win2 integer;
DECLARE loss2 integer;
DECLARE draw2 integer;
DECLARE points2 integer;
DECLARE played2 integer;

SET win1 = (SELECT win FROM leaguetable WHERE team_id = team_id1);
SET loss1 = (SELECT loss FROM leaguetable WHERE team_id = team_id1);
SET draw1 = (SELECT draw FROM leaguetable WHERE team_id = team_id1);
SET points1 = (SELECT points FROM leaguetable WHERE team_id = team_id1);
SET played1 = (SELECT matches_played FROM leaguetable WHERE team_id = team_id1) + 1;
SET win2 = (SELECT win FROM leaguetable WHERE team_id = team_id2);
SET loss2 = (SELECT loss FROM leaguetable WHERE team_id = team_id2);
SET draw2 = (SELECT draw FROM leaguetable WHERE team_id = team_id2);
SET points2 = (SELECT points FROM leaguetable WHERE team_id = team_id2);
SET played2 = (SELECT matches_played FROM leaguetable WHERE team_id = team_id2) + 1;


    SELECT win2;
    SELECT loss2;
    SELECT points2;
    
IF (winnerid = team_id1) THEN
	SET win1 = win1 + 1;
    SET loss2 = loss2 + 1;
    SET points1 = points1 + 2;
    UPDATE leaguetable SET matches_played=played1,win=win1,points=points1 WHERE team_id=team_id1;
    UPDATE leaguetable SET matches_played=played2,loss=loss2 WHERE team_id=team_id2;
    
ELSEIF (winnerid = team_id2) THEN
	SET win2 = win2 + 1;
    SET loss1 = loss1 + 1;
     SET points2 = points2 + 2;
   
    UPDATE leaguetable SET matches_played=played2,win=win2,points=points2 WHERE team_id=team_id2;
    UPDATE leaguetable SET matches_played=played1,loss=loss1 WHERE team_id=team_id1;
ELSE
	SET draw1 = draw1 + 1;
    SET draw2 = draw2 + 1;
    SET points1 = points1 + 1;
    SET points2 = points2 + 1;
    UPDATE leaguetable SET matches_played=played1,draw=draw1,points=points1 WHERE team_id=team_id1;
    UPDATE leaguetable SET matches_played=played2,draw=draw2,points=points2 WHERE team_id=team_id2;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_matches` (IN `fid1` INT, IN `fid2` INT, IN `incr` INT)  MODIFIES SQL DATA
BEGIN
	INSERT INTO matches(fid_team1,venue) 
    SELECT teams.name,teams.venue FROM teams WHERE teams.pid_teams=fid1;
    SET @maxid := (SELECT MAX(pid_matches) FROM matches);
    UPDATE `matches` SET `fid_team2`=(SELECT teams.name FROM teams WHERE teams.pid_teams=fid2) WHERE pid_matches=@maxid;
    IF incr=1 THEN SET @maxdate := ADDTIME((SELECT MAX(matchdate) FROM matches), '20:00:00');
    ELSEIF incr=0 THEN SET @maxdate := DATE_ADD((SELECT MAX(matchdate) FROM matches), INTERVAL 1 DAY);
    ELSEIF incr=2 THEN SET @maxdate := ADDTIME((SELECT MAX(matchdate) FROM matches), '04:00:00');
    END IF;
    UPDATE matches SET matchdate=@maxdate WHERE pid_matches=@maxid;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_players` (IN `team_id` INT, IN `name1` VARCHAR(60), IN `type1` INT)  NO SQL
BEGIN
	DECLARE pid integer;
    DECLARE runs1 integer;
    DECLARE wickets1 integer;
    DECLARE minid integer;
    declare maxid integer;
    
    SET minid = team_id*100;
    SET maxid = (team_id+1)*100;
    SET pid = (SELECT MAX(id_player) FROM players WHERE id_player BETWEEN minid AND maxid );
    IF pid IS NULL THEN
    	SET pid = team_id*100 + 1;
    ELSE
    	SET pid = pid + 1;
    END IF;
    SELECT pid;
    
    SET runs1 = 600 + floor(rand()*(4500 - 600 + 1));
    SET wickets1 = 0 + floor(rand() * (120 - 0 + 1));
    
    INSERT INTO players(id_player,name,fid_team,type,runs,wickets) VALUES(pid,name1,team_id,type1,runs1,wickets1);
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_scorecard` (IN `matchid1` INT, IN `playerid1` INT, IN `runs1` INT, IN `balls1` INT, IN `overs1` INT, IN `wickets1` INT, IN `runsconceded1` INT)  NO SQL
BEGIN
DECLARE srrate float(10,2);
DECLARE eco float(10,2);

IF (balls1=0) THEN
	SET srrate = 0.0;
ELSE
    SET srrate = runs1/balls1;
end IF;
    
IF (overs1=0) THEN
	SET eco = 0.0;
ELSE    
	SET eco = runsconceded1/overs1;
end if;

INSERT INTO scorecard(playerid,matchid,runs,balls,strikerate,overs,wickets,runsconceded,economy) VALUES(playerid1,matchid1,runs1,balls1,srrate,overs1,wickets1,runsconceded1,eco);



END$$

DELIMITER ;

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
(1, 'Mumbai Indians', 1, 1, 0, 0, 2, 1),
(2, 'Chennai Super Kings', 1, 0, 1, 0, 0, 2),
(3, 'Royal Challengers Banglore', 0, 0, 0, 0, 0, 3),
(4, 'Kolkata Knight Riders', 0, 0, 0, 0, 0, 4),
(5, 'Sunrisers Hyderabad', 0, 0, 0, 0, 0, 5),
(6, 'Rajasthan Royals', 0, 0, 0, 0, 0, 6),
(7, 'Kings XI Punjab', 1, 1, 0, 0, 2, 7),
(8, 'Delhi Daredevils', 1, 0, 1, 0, 0, 8);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`pid_matches`, `matchdate`, `fid_team1`, `fid_team2`, `venue`, `status`, `result`) VALUES
(1, '2018-04-07 20:00:00', 'Mumbai Indians', 'Chennai Super Kings', 'Wankhede Stadium', 1, '201/1-187/4'),
(2, '2018-04-08 16:00:00', 'Kings XI Punjab', 'Delhi Daredevils', 'IS Bindra Stadium', 1, '250/2-205/3'),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id_player`, `name`, `fid_team`, `type`, `runs`, `wickets`) VALUES
(101, 'Rohit Sharma', 1, 1, 1426, 115),
(102, 'Kieron Pollard', 1, 2, 1213, 114),
(103, 'Krunal Pandya', 1, 2, 2994, 102),
(104, 'Jean-Paul Duminy', 1, 2, 2368, 31),
(105, 'Hardik Pandya', 1, 2, 3168, 102),
(106, 'Ishan Kishan', 1, 2, 2092, 116),
(107, 'Jasprt Bumrah', 1, 3, 2396, 31),
(108, 'Mustafizur Rahman', 1, 3, 1349, 48),
(109, 'Pat Cummins', 1, 3, 3418, 76),
(110, 'Suryakumar Yadav', 1, 1, 1722, 65),
(111, 'Siddhesh Lad', 1, 1, 1647, 85),
(201, 'MS Dhoni', 2, 1, 2409, 4),
(202, 'Suresh Raina', 2, 1, 3265, 82),
(203, 'Faf du Plessis', 2, 1, 3704, 109),
(204, 'Kedar Jadav', 2, 1, 3096, 92),
(205, 'Dwayne Bravo', 2, 2, 2426, 96),
(206, 'Shane Watson', 2, 2, 2039, 74),
(207, 'Ravindra Jadeja', 2, 2, 2549, 24),
(208, 'Harbhajan Singh', 2, 3, 3251, 55),
(209, 'Ambati Rayudu', 2, 2, 3554, 4),
(210, 'Imran Tahir', 2, 3, 3588, 39),
(211, 'Shardul Thakur', 2, 3, 2722, 16),
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
(701, 'Ravichandran Ashwin', 7, 3, 3423, 7),
(702, 'Yuvraj Singh', 7, 1, 2669, 27),
(703, 'Karun Nair', 7, 1, 812, 120),
(704, 'Chris Gayle', 7, 1, 2754, 35),
(705, 'David Miller', 7, 1, 1065, 37),
(706, 'Aaron Finch', 7, 1, 1806, 44),
(707, 'Axar Patel', 7, 2, 2322, 51),
(708, 'Lokesh Rahul', 7, 2, 2559, 57),
(709, 'Mohit Sharma', 7, 3, 2853, 1),
(710, 'Mujeeb Ur Rahman', 7, 3, 2702, 12),
(711, 'Andrew Tye', 7, 3, 1018, 2),
(801, 'Gautam Gambhir', 8, 1, 1585, 44),
(802, 'Shreyas Iyer', 8, 1, 1641, 111),
(803, 'Jason Roy', 8, 1, 2689, 0),
(804, 'Colin Munro', 8, 1, 2082, 49),
(805, 'Glenn Maxwell', 8, 2, 659, 103),
(806, 'Vijay Shankar', 8, 2, 3993, 90),
(807, 'Chris Morris', 8, 2, 2079, 49),
(808, 'Rishabh Pant', 8, 1, 3320, 38),
(809, 'Mohammed Shami', 8, 3, 2754, 79),
(810, 'Jayant Yadav', 8, 3, 4413, 116),
(811, 'Kagiso Rabada', 8, 3, 3057, 58);

-- --------------------------------------------------------

--
-- Table structure for table `scorecard`
--

CREATE TABLE `scorecard` (
  `playerid` int(11) NOT NULL,
  `matchid` int(11) NOT NULL,
  `runs` int(11) DEFAULT NULL,
  `balls` int(11) DEFAULT NULL,
  `strikerate` decimal(10,4) DEFAULT NULL,
  `overs` float DEFAULT NULL,
  `wickets` int(11) DEFAULT NULL,
  `runsconceded` int(11) DEFAULT NULL,
  `economy` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scorecard`
--

INSERT INTO `scorecard` (`playerid`, `matchid`, `runs`, `balls`, `strikerate`, `overs`, `wickets`, `runsconceded`, `economy`) VALUES
(101, 1, 30, 50, '0.6000', 0, 0, 0, '0.0000'),
(102, 1, 23, 32, '0.7200', 0, 0, 0, '0.0000'),
(103, 1, 89, 100, '0.8900', 0, 0, 0, '0.0000'),
(104, 1, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(105, 1, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(106, 1, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(107, 1, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(108, 1, 0, 0, '0.0000', 5, 4, 30, '6.0000'),
(109, 1, 0, 0, '0.0000', 5, 1, 30, '6.0000'),
(110, 1, 0, 0, '0.0000', 5, 2, 38, '7.6000'),
(111, 1, 0, 0, '0.0000', 5, 2, 40, '8.0000'),
(201, 1, 45, 54, '0.8300', 0, 0, 0, '0.0000'),
(202, 1, 56, 70, '0.8000', 0, 0, 0, '0.0000'),
(203, 1, 46, 19, '2.4200', 0, 0, 0, '0.0000'),
(204, 1, 2, 1, '2.0000', 0, 0, 0, '0.0000'),
(205, 1, 4, 6, '0.6700', 0, 0, 0, '0.0000'),
(206, 1, 7, 2, '3.5000', 0, 0, 0, '0.0000'),
(207, 1, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(208, 1, 0, 0, '0.0000', 5, 2, 40, '8.0000'),
(209, 1, 0, 0, '0.0000', 5, 2, 70, '14.0000'),
(210, 1, 0, 0, '0.0000', 5, 2, 57, '11.4000'),
(211, 1, 0, 0, '0.0000', 5, 3, 18, '3.6000'),
(701, 2, 56, 66, '0.8500', 0, 0, 0, '0.0000'),
(702, 2, 75, 65, '1.1500', 0, 0, 0, '0.0000'),
(703, 2, 32, 65, '0.4900', 0, 0, 0, '0.0000'),
(704, 2, 98, 53, '1.8500', 0, 0, 0, '0.0000'),
(705, 2, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(706, 2, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(707, 2, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(708, 2, 0, 0, '0.0000', 5, 5, 6, '1.2000'),
(709, 2, 0, 0, '0.0000', 5, 1, 4, '0.8000'),
(710, 2, 0, 0, '0.0000', 5, 1, 96, '19.2000'),
(711, 2, 0, 0, '0.0000', 5, 2, 101, '20.2000'),
(801, 2, 8, 56, '0.1400', 0, 0, 0, '0.0000'),
(802, 2, 9, 30, '0.3000', 0, 0, 0, '0.0000'),
(803, 2, 68, 39, '1.7400', 0, 0, 0, '0.0000'),
(804, 2, 5, 6, '0.8300', 0, 0, 0, '0.0000'),
(805, 2, 9, 32, '0.2800', 0, 0, 0, '0.0000'),
(806, 2, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(807, 2, 0, 0, '0.0000', 0, 0, 0, '0.0000'),
(808, 2, 0, 0, '0.0000', 5, 6, 0, '0.0000'),
(809, 2, 0, 0, '0.0000', 5, 1, 6, '1.2000'),
(810, 2, 0, 0, '0.0000', 5, 1, 89, '17.8000'),
(811, 2, 0, 0, '0.0000', 5, 1, 109, '21.8000');

--
-- Triggers `scorecard`
--
DELIMITER $$
CREATE TRIGGER `tig_bef_ins_scorecard` AFTER INSERT ON `scorecard` FOR EACH ROW begin
	update players set runs=runs+new.runs where new.playerid=id_player;
    update players set wickets=wickets+new.wickets where new.playerid=id_player;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `pid_teams` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `leagues_won` varchar(60) NOT NULL DEFAULT 'Not Yet Won',
  `captain` varchar(60) NOT NULL,
  `home` varchar(60) NOT NULL,
  `venue` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`pid_teams`, `name`, `leagues_won`, `captain`, `home`, `venue`) VALUES
(1, 'Mumbai Indians', '2013, 2015, 2017', 'Rohit Sharma', 'Mumbai', 'Wankhede Stadium'),
(2, 'Chennai Super Kings', '2010, 2011', 'Mahendra Singh Dhoni', 'Chennai', 'M. A. Chidambaram Stadium'),
(3, 'Royal Challengers Bangalore', 'Not Yet Won ', 'Virat Kohli', 'Bengaluru', 'M. Chinnaswamy Stadium'),
(4, 'Kolkata Knight Riders', '2012, 2014', 'Dinesh Karthik', 'Kolkata', 'Eden Gardens'),
(5, 'Sunrisers Hyderabad', '2016', 'Shikhar Dhawan', 'Hyderabad', 'Rajiv Gandhi Intl Cricket Stadium'),
(6, 'Rajasthan Royals', '2008', 'Ajinkya Rahane', 'Jaipur', 'Sawai Mansingh Stadium'),
(7, 'Kings XI Punjab', 'Not Yet Won ', 'Ravichandran Ashwin', 'Mohali', 'IS Bindra Stadium'),
(8, 'Delhi Daredevils', 'Not Yet Won ', 'Gautam Gambhir', 'Delhi', 'Feroz Shah Kotla Stadium');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `name`, `email`) VALUES
('pratik', 'pratik', 'Pratik Prabhu', 'pratikprabhu@gmail.com'),
('jayant', 'jayant', 'Jayant Rane', 'jayantrane@gmail.com'),
('siddhesh', 'siddhesh', 'Siddhesh Patel', 'siddheshpatel@gmail.com'),
('onkar', 'onkar', 'Onkar Bangar', 'onkarbangar@gmail.com'),
('a', 'a', 'AAAAAa', 'aa@aa.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leaguetable`
--
ALTER TABLE `leaguetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`pid_matches`),
  ADD KEY `FOREIGN1` (`fid_team1`),
  ADD KEY `FOREIGN2` (`fid_team2`),
  ADD KEY `idx_matchdate` (`matchdate`) USING BTREE;

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id_player`),
  ADD KEY `fid_team` (`fid_team`);

--
-- Indexes for table `scorecard`
--
ALTER TABLE `scorecard`
  ADD PRIMARY KEY (`playerid`,`matchid`),
  ADD KEY `matchid` (`matchid`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`pid_teams`),
  ADD UNIQUE KEY `uni_name` (`name`) USING BTREE,
  ADD UNIQUE KEY `uni_captain` (`captain`) USING BTREE,
  ADD KEY `idx_pid` (`pid_teams`) USING BTREE,
  ADD KEY `idx_venue` (`venue`,`name`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `pid_matches` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `leaguetable`
--
ALTER TABLE `leaguetable`
  ADD CONSTRAINT `leaguetable_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`pid_teams`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`fid_team1`) REFERENCES `teams` (`name`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`fid_team2`) REFERENCES `teams` (`name`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`fid_team`) REFERENCES `teams` (`pid_teams`);

--
-- Constraints for table `scorecard`
--
ALTER TABLE `scorecard`
  ADD CONSTRAINT `scorecard_ibfk_1` FOREIGN KEY (`matchid`) REFERENCES `matches` (`pid_matches`),
  ADD CONSTRAINT `scorecard_ibfk_2` FOREIGN KEY (`playerid`) REFERENCES `players` (`id_player`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
