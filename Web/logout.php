<?php 
   session_start();.
   session_unset();
   
   $_SESSION['FBID'] = NULL;
   $_SESSION['FULLNAME'] = NULL;
   $_SESSION['EMAIL'] =  NULL;
   header("Location: home.php");        
?>

<?php
   session_start();
   session_unset();
   session_destroy();
   header('Refresh: 0; URL = home.php');
?>