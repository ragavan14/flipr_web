<?php 
session_start();
$_SESSION['onpage']="players";

?>

<!DOCTYPE html>

<html>

<head>
	<meta name=viewport content="width=device-width, initial-scale=1"> 
	<script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/typeahead.js"></script>
	<script>
    $(document).ready(function () {
        $('#txtPlayer').typeahead({
            source: function (query, result) {
                $.ajax({
                    url: "search.php",
					data: 'query=' + query,            
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
						result($.map(data, function (item) {
							return item;
                        }));
                    }
               		});
           		}
        	});
    	});
	</script>

	<!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link rel="stylesheet" href="css/mynavigation.css">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="css/stats.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
	<title>IPL</title>
	<link rel="icon" href="css/images/ipl-logo1.jpg">
</head>

<body>
<!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">

			<div class="search-bar">
				<form action="#" method="post">
					<!--<label>Search by Name:</label>-->
					
					<div class="col-md-6 " >
							
						<div class="bgcolor">
							<label class="demo-label">Search Player:</label><br/> 
							<input type="text" placeholder="Player Name" name="byname" id="txtPlayer" class="typeahead" autocomplete="off">
							<button type="submit" name="action" value="bynamebutton" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>Search</button>
							
						</div>
					</div>
					<!--<label>Search by Team:</label>-->
					<div class="col-md-6 bgcolor">
						<label class="demo-label">Search Player by team:</label><br/> 
						<input type="text" placeholder="Team Name" name="byteam" class="myhead" autocomplete="off">
						<input type="text" placeholder="Player type" name="ptype" class="myhead" autocomplete="off">
						<input type="text" placeholder="Sort by" name="sorttype" class="myhead" autocomplete="off">
						<button type="submit" name="action" value="byteambutton" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>Search</button>
					</div>
				</form>
			</div>

			<?php 
				$mysqli=mysqli_connect("localhost","root","","ipldb");
				$touch=0;

				$types=array("","Batsman","All-Rounder","Bowler");

				$teams=array("","Mumbai Indians","Chennai Super Kings","Royal Challengers Banglore","Kolkata Knight Riders","Sunrisers Hyderabad","Rajasthan Royals","Kings XI Punjab","Delhi Daredevils");

				if(!empty($_POST['byname'])){
					if($_POST['action']=='bynamebutton')
					{
						$name=$_POST['byname'];

						$sql="select * from players where name='".$name."' ";

						$result=mysqli_query($mysqli,$sql);

						if(mysqli_num_rows($result)>0){
							$touch=1;
							$values=mysqli_fetch_array($result,MYSQLI_NUM);
						}
					}
				}
				elseif(!empty($_POST['byteam']) and !empty($_POST['ptype']) and !empty($_POST['sorttype'])){
					if($_POST['action']=='byteambutton'){
						$team=array_search(strtolower($_POST['byteam']),array_map('strtolower', $teams));
						$type=array_search(strtolower($_POST['ptype']),array_map('strtolower',  $types));
						$sort=$_POST['sorttype'];

						$sql="select * from players where fid_team=$team and type=$type order by $sort ";

						$values=array();

						$result=mysqli_query($mysqli,$sql);

						$num=mysqli_num_rows($result);

						if($num>0){
							$touch=2;
							while($row=mysqli_fetch_array($result,MYSQLI_NUM)){
								$values[]=$row;
							}
						}
					}
				}
				
			?>

			<div class="col-md-10 main">

			<?php if($touch==1){ ?>

				<table class="table table-bordered table-striped table-hover">

					<tr>
						<thead>
							<th>Name</th>
							<th>Team</th>
							<th>Type</th>
							<th>Runs</th>
							<th>Wickets</th>
						</thead>
					</tr>

					<tr>
						<td><?= $values[1] ?></td>
						<td><?php $image="css/images/".$values[2].".png" ?><img src="<?php echo $image ?>" class="miimage"><span class="tab"><?= $teams[$values[2]] ?></span></td>
						<td><?= $types[$values[3]] ?></td>
						<td><?= $values[4] ?></td>
						<td><?= $values[5] ?></td>
					</tr>
				</table>

			<?php } 
			elseif($touch==2){ ?>

				<table class="table table-bordered table-hover">

					<tr>
						<thead>
							<th>Name</th>
							<th>Team</th>
							<th>Type</th>
							<th>Runs</th>
							<th>Wickets</th>
						</thead>
					</tr>

					<?php for($i=0;$i<$num;$i++){ ?>
						<tr>
							<td><?= $values[$i][1] ?></td>
							<td><?php $image="css/images/".$values[$i][2].".png" ?><img src="<?php echo $image ?>" class="miimage"><span class="tab"><?= $teams[$values[$i][2]] ?></span></td>
							<td><?= $types[$values[$i][3]] ?></td>
							<td><?= $values[$i][4] ?></td>
							<td><?= $values[$i][5] ?></td>
						</tr>
					<?php }


				} ?>
				</table>

			</div>
		</div>
	</div>

</body>

</html>

