<?php
ob_start();
session_start();
$id = $_POST['id'];
$host = 'localhost'; 
$db = 'ipldb';
$user = 'root';
$pass = '';
$dsn = "mysql:host=$host;dbname=$db";
$pdo=new PDO($dsn, $user, $pass);
$sql = 'CALL add_row_scorecard(:matchid1,:playerid1,:runs1,:balls1,:overs1,:wickets1,:runsconceded1)'; 
$stmt = $pdo->prepare($sql);
for($i=0; $i<11; $i++) {
	$pid = $_POST['team1id']*100+($i+1);
	#echo $_POST['1'.$i.'1']."   ".$_POST['1'.$i.'2']."   ".$_POST['1'.$i.'3']."   ".$_POST['1'.$i.'4']."   ".$_POST['1'.$i.'5']."   <br>";
	$stmt->bindParam(':matchid1', $_POST['id'], PDO::PARAM_INT);
	$stmt->bindParam(':playerid1', $pid, PDO::PARAM_INT);
	$stmt->bindParam(':runs1', $_POST['1'.$i.'1'], PDO::PARAM_INT);
	$stmt->bindParam(':balls1', $_POST['1'.$i.'2'], PDO::PARAM_INT);
	$stmt->bindParam(':overs1', $_POST['1'.$i.'3'], PDO::PARAM_INT);
	$stmt->bindParam(':wickets1', $_POST['1'.$i.'4'], PDO::PARAM_INT);
	$stmt->bindParam(':runsconceded1', $_POST['1'.$i.'5'], PDO::PARAM_INT);
	$stmt->execute();
}
for($i=0; $i<11; $i++) {
	$pid = $_POST['team2id']*100+($i+1);
	$stmt->bindParam(':matchid1', $_POST['id'], PDO::PARAM_INT);
	$stmt->bindParam(':playerid1', $pid, PDO::PARAM_INT);
	$stmt->bindParam(':runs1', $_POST['2'.$i.'1'], PDO::PARAM_INT);
	$stmt->bindParam(':balls1', $_POST['2'.$i.'2'], PDO::PARAM_INT);
	$stmt->bindParam(':overs1', $_POST['2'.$i.'3'], PDO::PARAM_INT);
	$stmt->bindParam(':wickets1', $_POST['2'.$i.'4'], PDO::PARAM_INT);
	$stmt->bindParam(':runsconceded1', $_POST['2'.$i.'5'], PDO::PARAM_INT);
	$stmt->execute();
}
$stmt->closeCursor();
$winner =0;
if($_POST['team1runs'] > $_POST['team2runs']) {
	$winner = $_POST['team1id'];
}
elseif ($_POST['team1runs'] < $_POST['team2runs']) {
	$winner = $_POST['team2id'];
}
else{
	$winner = 0;
}
$sql = 'CALL add_row_leaguetable(:team_id1,:team_id2,:winnerid)';
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':team_id1', $_POST['team1id'], PDO::PARAM_INT);
$stmt->bindParam(':team_id2', $_POST['team2id'], PDO::PARAM_INT);
$stmt->bindParam(':winnerid', $winner, PDO::PARAM_INT);
$stmt->execute();
$stmt->closeCursor();
$finalscore = $_POST['team1runs']."/".$_POST['team1wickets']."-".$_POST['team2runs']."/".$_POST['team2wickets'];
$ipldb = new mysqli("localhost", "root", "", "ipldb");    
$query ="UPDATE matches SET status = 1,result = '$finalscore' WHERE pid_matches=$id";
mysqli_query($ipldb,$query);
header('Refresh: 0; URL = showscorecard.php?id='.$id);
?>