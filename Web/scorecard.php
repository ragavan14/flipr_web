<?php 
	session_start();
	$_SESSION['onpage']="schedule";
	$id = $_GET['id'];

	$ipldb = new mysqli("localhost", "root", "", "ipldb");

	$query1="SELECT fid_team1, fid_team2 FROM matches where pid_matches = $id";
	

	$result1=mysqli_query($ipldb,$query1);
	while($row=mysqli_fetch_array($result1,MYSQLI_ASSOC)){
		$fid_team1=$row['fid_team1'];
		$fid_team2=$row['fid_team2'];
	}
	#echo $fid_team1." ".$fid_team2;

	$query2="SELECT name FROM players where fid_team = (select pid_teams from teams where name = '$fid_team1')";
	$query3="SELECT name FROM players where fid_team = (select pid_teams from teams where name = '$fid_team2')";
	$query4="(select pid_teams from teams where name = '$fid_team1')";
	$query5="(select pid_teams from teams where name = '$fid_team2')";

	$result2=mysqli_query($ipldb,$query2);
	$result3=mysqli_query($ipldb,$query3);
	$result4=mysqli_query($ipldb,$query4);
	$result5=mysqli_query($ipldb,$query5);

	$team1 = array();
	$team2 = array();
	$t1score = array();
	$t2score = array();

	while($row=mysqli_fetch_array($result2,MYSQLI_ASSOC)){
		$team1[]=$row;
		$t1score[]=array('runs'=>'0','balls'=>'0','overs'=>'0','wickets'=>'0','runsconceded'=>'0');
	}
	while($row=mysqli_fetch_array($result3,MYSQLI_ASSOC)){
		$team2[]=$row;
		$t2score[]=array('runs'=>'0','balls'=>'0','overs'=>'0','wickets'=>'0','runsconceded'=>'0');
	}
	while($row=mysqli_fetch_array($result4,MYSQLI_ASSOC)){
		$team1id=$row['pid_teams'];
	}
	while($row=mysqli_fetch_array($result5,MYSQLI_ASSOC)){
		$team2id=$row['pid_teams'];
	}
	#echo $team1id." ".$team2id;

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
	<!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">		
				<div class="container">
					<form class = "form" action = "updatescorecard.php" method = "post">
					  <div class="row myrow">
					  	<h1><?php echo $fid_team1; ?></h1>
					    <table class="table myrow">
					      <thead>
					        <tr>
					          <th class="col-md-3">Player Name</th>
					          <th class="col-md-1">Runs</th>
					          <th class="col-md-1">Balls</th>
					          <th class="col-md-1">Overs</th>
					          <th class="col-md-1">Wickets</th>
					          <th class="col-md-1">Runs Conceded</th>
					        </tr>
					      </thead>
					      <tbody>
					      	<?php for($i=0; $i<mysqli_num_rows($result2); $i++) { 
			    				
				    		?>
				    			<div class = "form-group">
							        <tr>
							          <td>
							            <p class="form-control-static"><?php echo $team1[$i]['name']; ?></p>
							              
							          </td>
							          <td>
							          	<?php $str = "1".$i."1"; ?>
							            <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "1".$i."2"; ?>
 										<input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "1".$i."3"; ?>
							             <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "1".$i."4"; ?>
							             <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "1".$i."5"; ?>
							             <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          
							        </tr>
							    </div>
					        <?php } ?>
					      </tbody>
					    </table>
					  </div>


					  <div class="row myrow">
					  	<h1><?php echo $fid_team2; ?></h1>
					    <table class="table myrow">
					      <thead>
					        <tr>
					          <th class="col-md-3">Player Name</th>
					          <th class="col-md-1">Runs</th>
					          <th class="col-md-1">Balls</th>
					          <th class="col-md-1">Overs</th>
					          <th class="col-md-1">Wickets</th>
					          <th class="col-md-1">Runs Conceded</th>
					        </tr>
					      </thead>
					      <tbody>
					      	<?php for($i=0; $i<mysqli_num_rows($result3); $i++) { 
			    				
				    		?>
				    			<div class = "form-group">
							        <tr>
							          <td>
							            <p class="form-control-static"><?php echo $team2[$i]['name']; ?></p>
							              
							          </td>
							          <td>
							          	<?php $str = "2".$i."1"; ?>
							            <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "2".$i."2"; ?>
 										<input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "2".$i."3"; ?>
							             <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "2".$i."4"; ?>
							             <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          <td>
							          	<?php $str = "2".$i."5"; ?>
							             <input value="0" type="number" min="0" step="1" class="form-control" size="4" name="<?php echo htmlspecialchars($str); ?>">
							          </td>
							          
							        </tr>
							    </div>
					        <?php } ?>
					      </tbody>
					    </table>
					  </div>



					  <div class="row myrow">
					  	<h1>Result</h1>
					    <table class="table myrow">
					      <thead>
					        <tr>
					            <th colspan="2"><?php echo $fid_team1; ?></th>
					            <th colspan="2"><?php echo $fid_team2; ?></th>
					        </tr>
					        <tr>
					            <th>Runs</th>
					            <th>Wickets</th>
					            <th>Runs</th>
					            <th>Wickets</th>
					        </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td>
					            	<input type="number" value="0" min="0" step="1" class="form-control" size="4" name="team1runs">
					            </td>
					            <td>
					            	<input type="number" value="0" min="0" step="1" class="form-control" size="4" name="team1wickets">
					            </td>
					            <td>
					            	<input type="number" value="0" min="0" step="1" class="form-control" size="4" name="team2runs">
					            </td>
					            <td>
					            	<input type="number" value="0" min="0" step="1" class="form-control" size="4" name="team2wickets">
					            </td>
					        </tr>
					    </tbody>
					      </tbody>
					    </table>
					  </div>




					  <input type="hidden" class="form-control" size="4" name="team1id" value="<?php echo htmlspecialchars($team1id); ?>">
					  <input type="hidden" class="form-control" size="4" name="team2id" value="<?php echo htmlspecialchars($team2id); ?>">
					  <input type="hidden" class="form-control" size="4" name="id" value="<?php echo htmlspecialchars($id); ?>">
					  <div class="col-md-12 text-center">
					  		<input type="submit" class="btn btn-info" value="Submit Scorecard">
					  </div>
					</form>
				</div>
    		</div>
 		</div>
</body>
</html>

