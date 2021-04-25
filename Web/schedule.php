<?php 
	session_start();
	$_SESSION['onpage']="schedule";

	$ipldb = new mysqli("localhost", "root", "", "ipldb");

	$sc="SELECT * FROM matches";

	$result=mysqli_query($ipldb,$sc);

	$schedule = array();

	while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
		$schedule[]=$row;
	}
	$teams=array("","Mumbai Indians","Chennai Super Kings","Royal Challengers Bangalore","Kolkata Knight Riders","Sunrisers Hyderabad","Rajasthan Royals","Kings XI Punjab","Delhi Daredevils");

?>

<!DOCTYPE html>

<html>
	<head>
	<meta name=viewport content="width=device-width, initial-scale=1"> 
	<!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="css/mynavigation.css">
    
    <link type="text/css" rel="stylesheet" href="css/schedule.css">

    <link rel="icon" href="css/images/ipl-logo1.jpg">
	<title>IPL</title>
</head>

<body>
	<!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">
    			<?php for($i=0; $i<mysqli_num_rows($result); $i++) { 
    				if($schedule[$i]['status'] == 0 and $_SESSION['isLoggedIn']== true) {
    					$addr = "scorecard.php?id=".($i+1);
    				}
    				elseif($schedule[$i]['status'] == 0 and $_SESSION['isLoggedIn']== false) {

    					$addr = "login.php";
    				}
    				else {
    					$addr = "showscorecard.php?id=".($i+1);
    				}
    				$id1=(string)array_search($schedule[$i]['fid_team1'], $teams);
    				$id2=(string)array_search($schedule[$i]['fid_team2'], $teams);
    			?>
					<h3 id="matchno" class="match" ><b>Match <?php echo $i+1; ?></b></h3>
				
					<a href=<?php echo $addr;?>>
					<div class="card-spacing">
						<div class="row">
							<a href=<?php echo $addr;?>>
								<div class=" col-md-4">
								  	<div class="row">
								  		<div class="card text-center">
							  				<h3 class="card-title"><?php echo $schedule[$i]['fid_team1']; ?></h3>
							  				<img class="card-img-bottom" src="<?php echo "css\\images\\".$id1.".png"; ?>" >
							  			</div>
							  		</div>
							  	</div>
						  		<div class="card-body col-md-1 text-center">
						  			<h3 class="card-title">vs</h3>
								</div>
						  		<div class=" col-md-4">
								  	<div class="row">
								  		<div class="card text-center">
							  				<h3 class="card-title"><?php echo $schedule[$i]['fid_team2']; ?></h3>
							  				<img class="card-img-bottom" src="<?php echo "css\images\\".$id2.".png"; ?>" >
							  			</div>
							  		</div>
							  	</div>
						  	</a>	
				  			<div class="card-body col-md-3 details" >
				  				<h4>Date : <?php echo date('D d-m-y',strtotime($schedule[$i]['matchdate'])); ?></h4>
				  				<h4>Time : <?php echo date('h : i a',strtotime($schedule[$i]['matchdate'])); ?></h4>
				  				<h4 class="card-title">Venue: <?php echo $schedule[$i]['venue']; ?></h4>
							</div>
				  		</div>
			  		</div>
			  	<?php } ?>
    		</div>
	</div>

</body>
</html>


