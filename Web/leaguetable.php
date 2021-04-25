<?php 
session_start();
$_SESSION['onpage'] = 'leaguetable';

$mysqli=mysqli_connect("localhost","root","","ipldb");

$sql="select * from leaguetable order by points desc";

$result=mysqli_query($mysqli,$sql);

$values=array();

while($row=mysqli_fetch_array($result,MYSQLI_NUM)){
	$values[]=$row;

}
?>

<!DOCTYPE html>

<html>

<head>

	<!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.css">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link rel="stylesheet" href="css/mynavigation.css">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="css/leaguetable.css">

	<title>IPL</title>
	<link rel="icon" href="css/images/ipl-logo1.jpg">
</head>

<body>

	<!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">

					<table class="table table-bordered table-hover">

						<tr>
						<thead>
							<th>Position</th>
							<th>Name</th>
							<th>MatchesPlayed</th>
							<th>Wins</th>
							<th>Losses</th>
							<th>Draws</th>
							<th>Points</th>
						</thead>
						</tr>

						<tr >
							<td>1</td>
							<td class="name"><?php $image1="css/images/".$values[0][7].".png" ; ?><img src="<?php echo $image1 ; ?>" class="miimage"><span class="tab"><?= $values[0][1]?></span></img></td>
							<td><?= $values[0][2] ?></td>
							<td><?= $values[0][3] ?></td>
							<td><?= $values[0][4] ?></td>
							<td><?= $values[0][5] ?></td>
							<td><?= $values[0][6] ?></td>
						</tr>

						<tr >
							<td>2</td>
							<td class="name"><?php $image2="css/images/".$values[1][7].".png" ; ?><img src="<?php echo $image2 ; ?>" class="miimage"><span class="tab"><?= $values[1][1] ?></span></img></td>
							<td><?= $values[1][2] ?></td>
							<td><?= $values[1][3] ?></td>
							<td><?= $values[1][4] ?></td>
							<td><?= $values[1][5] ?></td>
							<td><?= $values[1][6] ?></td>
						</tr>

						<tr >
							<td>3</td>
							<td class="name"><?php $image3="css/images/".$values[2][7].".png" ; ?><img src="<?php echo $image3 ; ?>" class="miimage"><span class="tab"><?= $values[2][1] ?></span></img></td><
							<td><?= $values[2][2] ?></td>
							<td><?= $values[2][3] ?></td>
							<td><?= $values[2][4] ?></td>
							<td><?= $values[2][5] ?></td>
							<td><?= $values[2][6] ?></td>
						</tr>

						<tr >
							<td>4</td>
							<td class="name"><?php $image4="css/images/".$values[3][7].".png" ; ?><img src="<?php echo $image4 ; ?>" class="miimage"><span class="tab"><?= $values[3][1] ?></span></img></td>
							<td><?= $values[3][2] ?></td>
							<td><?= $values[3][3] ?></td>
							<td><?= $values[3][4] ?></td>
							<td><?= $values[3][5] ?></td>
							<td><?= $values[3][6] ?></td>
						</tr>

						<tr >
							<td>5</td>
							<td class="name"><?php $image5="css/images/".$values[4][7].".png" ; ?><img src="<?php echo $image5 ; ?>" class="miimage"><span class="tab"><?= $values[4][1] ?></span></img></td>
							<td><?= $values[4][2] ?></td>
							<td><?= $values[4][3] ?></td>
							<td><?= $values[4][4] ?></td>
							<td><?= $values[4][5] ?></td>
							<td><?= $values[4][6] ?></td>
						</tr>

						<tr >
							<td>6</td>
							<td class="name"><?php $image6="css/images/".$values[5][7].".png" ; ?><img src="<?php echo $image6 ; ?>" class="miimage"><span class="tab"><?= $values[5][1] ?></span></img></td>
							<td><?= $values[5][2] ?></td>
							<td><?= $values[5][3] ?></td>
							<td><?= $values[5][4] ?></td>
							<td><?= $values[5][5] ?></td>
							<td><?= $values[5][6] ?></td>
						</tr>

						<tr >
							<td>7</td>
							<td class="name"><?php $image7="css/images/".$values[6][7].".png" ; ?><img src="<?php echo $image7 ; ?>" class="miimage"><span class="tab"><?= $values[6][1] ?></span></img></td>
							<td><?= $values[6][2] ?></td>
							<td><?= $values[6][3] ?></td>
							<td><?= $values[6][4] ?></td>
							<td><?= $values[6][5] ?></td>
							<td><?= $values[6][6] ?></td>
						</tr>

						<tr >
							<td>8</td>
							<td class="name"><?php $image8="css/images/".$values[7][7].".png" ; ?><img src="<?php echo $image8 ; ?>" class="miimage"><span class="tab"><?= $values[7][1] ?></span></img></td>
							<td><?= $values[7][2] ?></td>
							<td><?= $values[7][3] ?></td>
							<td><?= $values[7][4] ?></td>
							<td><?= $values[7][5] ?></td>
							<td><?= $values[7][6] ?></td>
						</tr>
					</table>
				
			</div>
	</div>


</body>

</html>