<?php
session_start();
	$_SESSION['onpage']="schedule";
	$id = $_GET['id'];
	$ipldb = new mysqli("localhost","root","","ipldb");

	$query1="SELECT fid_team1, fid_team2 FROM matches where pid_matches = $id";
	
	$result1=mysqli_query($ipldb,$query1);
	while($row=mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		$fid_team1=$row['fid_team1'];
		$fid_team2=$row['fid_team2'];
	}

	$query4="(select pid_teams from teams where name = '$fid_team1')";
	$query5="(select pid_teams from teams where name = '$fid_team2')";
	$queryn1="SELECT name FROM players where fid_team = $query4";
	$queryn2="SELECT name FROM players where fid_team = $query5";
	
	$result4=mysqli_query($ipldb,$query4);
	$result5=mysqli_query($ipldb,$query5);
	$resultn1=mysqli_query($ipldb,$queryn1);
	$resultn2=mysqli_query($ipldb,$queryn2);

	$pid_team1 = mysqli_fetch_array($result4,MYSQLI_NUM);
	$pid_team2 = mysqli_fetch_array($result5,MYSQLI_NUM);
	while ($row=mysqli_fetch_array($resultn1,MYSQLI_NUM)) {
		$name1[] = $row;
	}
	while($row=mysqli_fetch_array($resultn2,MYSQLI_NUM)) {	
		$name2[] = $row;
	}


	$comp1 = $pid_team1[0]."%";
	$comp2 = $pid_team2[0]."%";

	$query2="SELECT * FROM scorecard where playerid LIKE '$comp1' AND matchid = $id";
	$query3="SELECT * FROM scorecard where playerid LIKE '$comp2' AND matchid = $id";

	$result2=mysqli_query($ipldb,$query2);
	$result3=mysqli_query($ipldb,$query3);

	$plinfo1 = array();
	$plinfo2 = array();

	while($row=mysqli_fetch_array($result2,MYSQLI_ASSOC)){
		$plinfo1[]=$row;
	}
	while($row=mysqli_fetch_array($result3,MYSQLI_ASSOC)){
		$plinfo2[]=$row;
	}

?>
<!DOCTYPE html>

<html>
	<head>
	<!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="css/mynavigation.css">
    
    <link type="text/css" rel="stylesheet" href="css/schedule.css">
    <link type="text/css" rel="stylesheet" href="css/scorecard.css">

    <link rel="icon" href="css/images/ipl-logo1.jpg">
	<title>IPL</title>
</head>

<body>
	<!-- always include one </div> element before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">		
				<div class="container">
					  <div class="row myrow">
					  	<h1 style="margin-top: 4vw"><?php echo $fid_team1; ?></h1>
						  <table class="batsman">
						    <thead>
						     	<tr>
						 	  		<th>Batsman</th>
						      		<th class="tl">Runs</th>
						      		<th class="tl">Balls</th>
						      		<th class="tl">Strike Rate</th>
						      	</tr>
						    </thead>
						    <?php for($i=0;$i<11;$i++) { if($plinfo1[$i]['balls']!=0&&$plinfo1[$i]['runs']!=0) { ?>
						      	<tr>
						      		<td><h4><?php echo $name1[$i][0]; ?></h4></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['runs']; ?></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['balls']; ?></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['strikerate']; ?></td>
						      	</tr>
						     <?php } } ?>
						  </table>
					  </div>
					  <div class="row myrow">
					  	<table class="bowler">
						    <thead>
						     	<tr>
						 	  		<th>Bowler</th>
						      		<th class="tl">Overs</th>
						      		<th class="tl">Wickets</th>
						      		<th class="tl">Runs</th>
						      		<th class="tl">ER</th>
						      	</tr>
						    </thead>
						    <?php for($i=0;$i<11;$i++) { if($plinfo1[$i]['overs']!=0) { ?>
						      	<tr>
						      		<td><h4><?php echo $name1[$i][0]; ?></h4></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['overs']; ?></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['wickets']; ?></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['runsconceded']; ?></td>
						      		<td class="tl"><?php echo $plinfo1[$i]['economy']; ?></td>
						      	</tr>
						     <?php } } ?>
						  </table>
					  </div>

					  <div class="row myrow" style="margin-top: 5vh">
					  	<h1><?php echo $fid_team2; ?></h1>
					    <table class="batsman">
						    <thead>
						     	<tr>
						 	  		<th>Player</th>
						      		<th>Runs</th>
						      		<th>Balls</th>
						      		<th>Strike Rate</th>
						      	</tr>
						    </thead>
						    <?php for($i=0;$i<11;$i++) { if($plinfo2[$i]['balls']!=0&&$plinfo2[$i]['runs']!=0) { ?>
						      	<tr>
						      		<td><h4><?php echo $name2[$i][0]; ?></h4></td>
						      		<td><?php echo $plinfo2[$i]['runs']; ?></td>
						      		<td><?php echo $plinfo2[$i]['balls']; ?></td>
						      		<td><?php echo $plinfo2[$i]['strikerate']; ?></td>
						      	</tr>
						     <?php } } ?>
						  </table>
					  </div>
					  <div class="row myrow">
					  	<table class="bowler">
						    <thead>
						     	<tr>
						 	  		<th>Bowler</th>
						      		<th class="tl">Overs</th>
						      		<th class="tl">Wickets</th>
						      		<th class="tl">Runs</th>
						      		<th class="tl">ER</th>
						      	</tr>
						    </thead>
						    <?php for($i=0;$i<11;$i++) { if($plinfo2[$i]['overs']!=0) { ?>
						      	<tr>
						      		<td><h4><?php echo $name2[$i][0]; ?></h4></td>
						      		<td class="tl"><?php echo $plinfo2[$i]['overs']; ?></td>
						      		<td class="tl"><?php echo $plinfo2[$i]['wickets']; ?></td>
						      		<td class="tl"><?php echo $plinfo2[$i]['runsconceded']; ?></td>
						      		<td class="tl"><?php echo $plinfo2[$i]['economy']; ?></td>
						      	</tr>
						     <?php } } ?>
						  </table>
					  </div>
					 
				</div>
    		</div>
 	</div>
</body>
</html>