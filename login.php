<?php
session_start();

if(isset($_SESSION['login']) && $_SESSION['login']==1)
{
	header("location:index.php");
}
require_once("admin/include/db.php");
?>

<!DOCTYPE html>
<html>
<head>
<title>atWorks</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Atwork" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
	<!-- main -->
		<div class="figure">
			<img src="images/administrator.png" alt="Logo"/>
			<div class="main">	
				<div class="head">
					<h1 style="color: lightwhite;">atWorks</h1>
				</div>
				<div class="input_form">
					<form method="post" action="admin/login_proses.php">
						<input type="text"  name="user" title="username" required="" placeholder="Input Username" />
						<input type="password" name="pass" title="password" required="" placeholder="Input Password" />
						<input type="submit" value="Login" name="submit" />
					</form>
				</div>
			</div>
			<div class="footer">
				<p>&copy 2017  atWorks Profile Widget. All rights reserved | Design by <a href="#">atWorks.</a></p>
			</div>
		</div>
	<!-- //main -->
</body>
</html>