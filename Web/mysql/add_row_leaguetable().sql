DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_row_leaguetable`(IN `team_id1` INT, IN `team_id2` INT, IN `winnerid` INT)
    NO SQL
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
    SET points1 = points1 + 3;
    UPDATE leaguetable SET matches_played=played1,win=win1,points=points1 WHERE team_id=team_id1;
    UPDATE leaguetable SET matches_played=played2,loss=loss2 WHERE team_id=team_id2;
    
ELSEIF (winnerid = team_id2) THEN
	SET win2 = win2 + 1;
    SET loss1 = loss1 + 1;
     SET points2 = points2 + 3;
   
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
DELIMITER ;