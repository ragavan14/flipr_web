use ipldb;

delimiter //

create trigger tig_bef_ins_scorecard
after insert
on scorecard for each row
begin
	update players set runs=runs+new.runs where new.playerid=id_player;
    update players set wickets=wickets+new.wickets where new.playerid=id_player;
end
//