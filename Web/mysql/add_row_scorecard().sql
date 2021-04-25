DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_scorecard`(IN `matchid1` INT, IN `playerid1` INT, IN `runs1` INT, IN `balls1` INT, IN `overs1` INT, IN `wickets1` INT, IN `runsconceded1` INT)
    NO SQL
BEGIN
DECLARE srrate float(10,2);
DECLARE eco float(10,2);

SET srrate = runs1/balls1;
SET eco = runsconceded1/overs1;

INSERT INTO scorecard(playerid,matchid,runs,balls,strikerate,overs,wickets,runsconceded,economy) VALUES(playerid1,matchid1,runs1,balls1,srrate,overs1,wickets1,runsconceded1,eco);



END$$
DELIMITER ;