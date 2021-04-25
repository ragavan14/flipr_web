DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_teams`(IN `fid1` INT, IN `fid2` INT, IN `incr` INT)
    MODIFIES SQL DATA
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
DELIMITER ;