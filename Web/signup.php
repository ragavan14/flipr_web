<?php
session_start();
$_SESSION['onpage'] = 'home';
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

    <link rel="stylesheet" href="css/signup.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    

    <title>IPL</title>
    <link rel="icon" href="css/images/ipl-logo1.jpg">
</head>
<body>

   
  <!-- always include one </div> elements before </body> -->
    <?php include 'mynavigation.php';?>

        <div id='content' class="col-md-10 main">
          <div class="container">
      <div class="row main">
        <div class="main-login main-center">
        <h5>Sign up once and update scorecard</h5>
          <form  method="post" action="home.php">
            
            <div class="form-group">
              <label for="name" class="cols-sm-2 control-label">Your Name</label>
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="email" class="cols-sm-2 control-label">Your Email</label>
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="username" class="cols-sm-2 control-label">Username</label>
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                  <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username"/>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="password" class="cols-sm-2 control-label">Password</label>
              <div class="cols-sm-10">
                <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                  <input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
                </div>
              </div>
            </div>

            <div class="form-group ">

              <input type="submit" id="button" class="btn btn-primary btn-lg btn-block login-button" name="Submit"/>
            </div>
            
          </form>
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

