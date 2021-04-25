<?php
   session_start(); 
?>
<html xmlns:fb = "http://www.facebook.com/2008/fbml">
   
   <head>
      <title>Login with Facebook</title>
      <link 
         href = "http://www.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" 
         rel = "stylesheet">
   </head>
   
   <body>
      <?php if ($_SESSION['FBID']): ?>      <!--  After user login  -->
         
         <div class = "container">
            
            <div class = "hero-unit">
               <h1>Hello <?php echo $_SESSION['USERNAME']; ?></h1>
               <p>Welcome to "facebook login" tutorial</p>
            </div>
            
            <div class = "span4">
				
               <ul class = "nav nav-list">
                  <li class = "nav-header">Image</li>
						
                  <li><img src = "https://graph.facebook.com/<?php 
                     echo $_SESSION['FBID']; ?>/picture"></li>
                  
                  <li class = "nav-header">Facebook ID</li>
                  <li><?php echo  $_SESSION['FBID']; ?></li>
               
                  <li class = "nav-header">Facebook fullname</li>
						
                  <li><?php echo $_SESSION['FULLNAME']; ?></li>
               
                  <li class = "nav-header">Facebook Email</li>
						
                  <li><?php echo $_SESSION['EMAIL']; ?></li>
               
                  <div><a href="logout.php">Logout</a></div>
						
               </ul>
					
            </div>
         </div>
         
         <?php else: ?>     <!-- Before login --> 
         
         <div class = "container">
            <h1>Login with Facebook</h1>
            Not Connected
            
            <div>
               <a href = "fbconfig.php">Login with Facebook</a>
            </div>
            
            <div>
               <a href = "http://www.tutorialspoint.com"  
                  title = "Login with facebook">More information about Tutorialspoint</a>
            </div>
         </div>
         
      <?php endif ?>
      
   </body>
</html>

<?php
session_start();
if(empty($_SESSION['isLoggedIn']))
  $_SESSION['isLoggedIn'] = false;
$_SESSION['onpage'] = 'home';
?>
<?php

$mysqli = mysqli_connect("localhost","root","","ipldb");
if (!empty($_POST['username']) 
               && !empty($_POST['password'])) {
  
  $_SESSION['user']=$_POST['username'];
  $_SESSION['pass']=$_POST['password'];


  $sql="select * from users where username='".$_SESSION['user']."' and password='".$_SESSION['pass']."'  ";

  $result=mysqli_query($mysqli,$sql);

  if($row=mysqli_fetch_array($result,MYSQLI_NUM)){
    $_SESSION['isLoggedIn'] = true;
    $_SESSION['username'] = $row['name'];
    header('Location: '.$_SERVER['REQUEST_URI']);

  }
  else{
    echo "You have entered wrong credentials";

  }
}
if (!empty($_POST['name']) ) {
  
  $uname1=$_POST['username'];
  $pass1=$_POST['password'];
  $name1=$_POST['name'];
  $email1=$_POST['email'];

  $sql="insert into users(username,password,name,email) values('".$uname1."','".$pass1."','".$name1."','".$email1."')";

  mysqli_query($mysqli,$sql);

  
    $_SESSION['isLoggedIn'] = true;
    $_SESSION['user'] = $_POST['name'];
    header('Location: '.$_SERVER['REQUEST_URI']);

  
}

$yep=mt_rand(1,8);

$sql1="select * from teams where pid_teams='".$yep."' ";

$result1=mysqli_query($mysqli,$sql1);

$values=mysqli_fetch_array($result1);

$image="css/images/".$values[0].".png";

$yep2=mt_rand(1,56);

$status=array("Not-Happened","Already-Happened");

$sql2="select * from matches where pid_matches='".$yep2."' ";

$result2=mysqli_query($mysqli,$sql2);

$values1=mysqli_fetch_array($result2);

$teams=array("","Mumbai Indians","Chennai Super Kings","Royal Challengers Bangalore","Kolkata Knight Riders","Sunrisers Hyderabad","Rajasthan Royals","Kings XI Punjab","Delhi Daredevils");


$image1="css/images/".array_search(strtolower($values1[2]),array_map('strtolower', $teams)).".png";
$image2="css/images/".array_search(strtolower($values1[3]),array_map('strtolower', $teams)).".png";

?>

<?php
$success = "";
$error_message = "";
$conn = mysqli_connect("localhost","root","","blog_samples");
if(!empty($_POST["submit_email"])) {
	$result = mysqli_query($conn,"SELECT * FROM registered_users WHERE email='" . $_POST["email"] . "'");
	$count  = mysqli_num_rows($result);
	if($count>0) {
		// generate OTP
		$otp = rand(100000,999999);
		// Send OTP
		require_once("mail_function.php");
		$mail_status = sendOTP($_POST["email"],$otp);
		
		if($mail_status == 1) {
			$result = mysqli_query($conn,"INSERT INTO otp_expiry(otp,is_expired,create_at) VALUES ('" . $otp . "', 0, '" . date("Y-m-d H:i:s"). "')");
			$current_id = mysqli_insert_id($conn);
			if(!empty($current_id)) {
				$success=1;
			}
		}
	} else {
		$error_message = "Email not exists!";
	}
}
if(!empty($_POST["submit_otp"])) {
	$result = mysqli_query($conn,"SELECT * FROM otp_expiry WHERE otp='" . $_POST["otp"] . "' AND is_expired!=1 AND NOW() <= DATE_ADD(create_at, INTERVAL 24 HOUR)");
	$count  = mysqli_num_rows($result);
	if(!empty($count)) {
		$result = mysqli_query($conn,"UPDATE otp_expiry SET is_expired = 1 WHERE otp = '" . $_POST["otp"] . "'");
		$success = 2;	
	} else {
		$success =1;
		$error_message = "Invalid OTP!";
	}	
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

    <link rel="stylesheet" href="css/home.css">
    

    <title>IPL</title>
    <link rel="icon" href="css/images/ipl-logo1.jpg">
</head>
<body>

   
  <!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>

        <div id='content' class="col-md-10 main">
            <div class="row" >


              <div class="col-md-12">
                <div class="card cd" >
                    <div class="row" style="margin-left: 10vw">
      	          	  <div class="col-md-4">
      	               	<img class="card-img-top" style="text-align: right;" src="<?php echo $image1 ?>" >
      	              </div>
      	              <div class="col-md-1 vstext" >
      	               	 <b>v/s</b> 
      	              </div>
      	              <div class="col-md-7">
    	                  <img class="card-img-top" style="text-align: left;" src="<?php echo $image2 ?>" >
                      </div>
                    </div>
                    <div class="card-body row text-center" style="margin-right: 5vw;">
                      <h4 class="card-title team-name"><?= $values1[2] ?> v/s <?= $values1[3] ?>
                      <h4 class="card-title team-name"><?= $values1[1] ?>
                      <h4 class="card-title team-name"><?= $values1[4] ?>
                      <h4 class="card-title team-name"><?= $status[$values1[5]] ?>
                    </div>
                </div>
              </div>

            </div>

            <div class="row">

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/1zfSKRqh1Vs" width="420" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of MI
                  </div>
                </div>
              </div>

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/igSHFeysDXo" width="400" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of CSK
                  </div>
                </div>
              </div>

            </div>

            <div class="row">

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/aIjpJPDCIaI" width="420" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of RCB
                  </div>
                </div>
              </div>

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/fz7w_K0akxk" width="400" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of KKR
                  </div>
                </div>
              </div>

              <div class="row">

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/ygSfV9uh5NA" width="420" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of SRH
                  </div>
                </div>
              </div>

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/vPGkqGszzGs" width="400" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of RR
                  </div>
                </div>
              </div>

            </div>

            <div class="row">

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/asOKH8_8Eac" width="420" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of KXIP
                  </div>
                </div>
              </div>

              <div class="col-md-5 cd">
                <div class="card text-center">
                  <iframe src="https://www.youtube.com/embed/isZA9PeTrWg" width="400" height="315"></iframe>
                  <div class="card-body">
                    <h5 class="card-title team-name">Probable Playing XI of DD
                  </div>
                </div>
              </div>

            </div>

          
      </div>
    </div>
  </div>
  
    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    

</body>
</html>
