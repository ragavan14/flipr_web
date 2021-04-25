<?php
	session_start();

	$ipldb = new mysqli("localhost", "root", "", "ipldb");
	$id=$_GET['id'];
	$plid=$_GET['id']*100;

	/*Query Strings */
	$tq="SELECT * FROM teams where pid_teams=$id";
	for($i=1;$i<12;$i++)
		$pi[$i]="SELECT * FROM players WHERE id_player=$plid+$i";
	
	/*Query executed */
	$result=mysqli_query($ipldb,$tq);
	for($i=1;$i<12;$i++)
		$playerinfo[$i]=mysqli_query($ipldb,$pi[$i]);

	/*Query output */
	$title=mysqli_fetch_array($result,MYSQLI_ASSOC);
	for($i=1;$i<12;$i++)
		$plinfo[$i]=mysqli_fetch_array($playerinfo[$i],MYSQLI_ASSOC);

	for($i=1;$i<12;$i++){
		if($plinfo[$i]['type']==1) $pltype[$i]="Batsman"; 
		elseif($plinfo[$i]['type']==2) $pltype[$i]="All-Rounder"; 
		elseif($plinfo[$i]['type']==3) $pltype[$i]="Bowler"; 
	}
	$icon="css\images\\".$id . ".png";
	$count=1;
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
    
    <link type="text/css" rel="stylesheet" href="css/teams.css">

	<title>IPL</title>
	<link rel="icon" href="css/images/ipl-logo1.jpg">
</head>

<body>
	<!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">
				<div class="row">
					<div class="card col-md-4 text-center"><img class="card-img-top-team" src="<?php echo $icon; ?>"></div>
					<div class="card col-md-6 teaminfofont" style="margin-top: 4vh; margin-left: 2vh;">
						<h1><?php echo $title['name']; ?></br></br></h1>
						<h3>Captain:   <?php echo $title['captain'];?> </br></h3>
						<h3>Venue  :   <?php echo $title['venue'];?></h3>
						<h3>Leagues won:<?php echo $title['leagues_won']; ?></h3>
					</div>
				</div>
				<table>
					<thead>
						<tr>
							<th>Player Name</th>
							<th>Player Type</th>
							<th>IPL Career Runs</th>
							<th>IPL Career Wickets</th>
						</tr>
					</thead>
					<tr>
						<td><b><?php echo $plinfo[$count]['name'];?></b> <?php echo " (C)"; ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
					<?php $count=$count+1 ?>
					<tr>
						<td><?php echo $plinfo[$count]['name'] ?></td>
						<td><?php echo $pltype[$count]; ?></td>
						<td><?php echo $plinfo[$count]['runs'] ?></td>
						<td><?php echo $plinfo[$count]['wickets'] ?></td>
					</tr>
				</table>
			</div>
		</div>
</body>
</html>
