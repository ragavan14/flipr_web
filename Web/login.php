<?php 
session_start();
?>

<?php
   session_start();
   session_unset();
   
   $_SESSION['FBID'] = NULL;
   $_SESSION['FULLNAME'] = NULL;
   $_SESSION['EMAIL'] =  NULL;
   header("Location: home.php");        
?>

<script type="text/javascript">
	function myFunction() {
    var x = document.getElementById("exampleInputPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
	}
</script>

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
    <link rel="stylesheet" href="css/login.css">

	<link rel="icon" href="css/images/ipl-logo1.jpg">
	<title>IPL</title>
</head>

<body>

	
	<!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>
    		<div id='content' class="col-md-10 main">

			<div class="col-md-4 col-sm-4 col-xs-12">
			</div>

			<div class="col-md-4 col-sm-4 col-xs-12">
				
				<form method="post" class="form-container" action = "home.php" autocomplete="off">
				<!-- <form class = "form-signin" role = "form" 
            action = "<?php echo htmlspecialchars($_SERVER['PHP_SELF']); 
            ?>" method = "post"> -->
					
					
					<!--<center><h1>Administrator Login</h1></center>-->

					<div class="form-group">
						<label for="exampleInputUsername">Username</label>
						<input type="text" class="form-control" id="exampleInputUsername" placeholder="username" name="username" required>

						<label for="exampleInputPassword">Password</label>
						<input type="password" class="form-control" id="exampleInputPassword" placeholder="password" name="password" required>

						<!--<label for="exampleInputFile">File Input</label>
						<input type="file" id="exampleInputFile">*/-->
						<br>
						<center><a href="forgot.php" class="help-block">Forgot Password</a></center>
					</div>

					<input type="checkbox" onclick="myFunction()">Show Password

					<div class="checkbox">
						<label>
							<input type="checkbox">Remember me
						</label>
					</div>

					<center><button type="submit" class="btn btn-success btn-block" name="Login">Log In</button></center>

				</form>

<form name="frmUser" method="post" action="">
	<div class="tblLogin">
		<?php 
			if(!empty($success == 1)) { 
		?>
		<div class="tableheader">Enter OTP</div>
		<p style="color:#31ab00;">Check your email for the OTP</p>
			
		<div class="tablerow">
			<input type="text" name="otp" placeholder="One Time Password" class="login-input" required>
		</div>
		<div class="tableheader"><input type="submit" name="submit_otp" value="Submit" class="btnSubmit"></div>
		<?php 
			} else if ($success == 2) {
        ?>
		<p style="color:#31ab00;">Welcome, You have successfully loggedin!</p>
		<?php
			}
			else {
		?>
		
		<div class="tableheader">Enter Your Login Email</div>
		<div class="tablerow"><input type="text" name="email" placeholder="Email" class="login-input" required></div>
		<div class="tableheader"><input type="submit" name="submit_email" value="Submit" class="btnSubmit"></div>
		<?php 
			}
		?>
	</div>
</form>

			</div>

			<div class="col-md-4 col-sm-4 col-xs-12">
			</div>

		</div>
	</div>
	</div>

	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

</body>

</html>
