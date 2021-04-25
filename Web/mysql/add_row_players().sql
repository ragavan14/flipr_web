DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_players`(IN `team_id` INT, IN `name1` VARCHAR(60), IN `type1` INT)
    NO SQL
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
DELIMITER ;