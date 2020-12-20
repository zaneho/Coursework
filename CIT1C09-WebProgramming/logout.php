<?php session_start(); ?>
<!DOCTYPE html>
<html>
	<head>
		<title> Paws & Claws Pet Store </title>
		<link rel="stylesheet" href="stylesheet.css">
	</head>

	<body>
		<div id="container">
			<div id="header">
			
				<a href="index.php"><img border="0" src="images/logo.png" alt="Paws And Claws" width="400" height="100"></a>

			</div>
		
			<ul id="nav">
				<h3>
				<li><a href="index.php">Home</a></li>
				<li>
				<?php if (isset($_SESSION['userid'])){
							echo '<a href="intropage.php">Shop</a>';
							}
						else {echo '<a href="login.php">Shop</a>';}
				?>
				</li>
				<li><a href="about.php">About</a></li>
				<li><a href="contact.php">Contact</a></li>
				<li><a href="adopt.php">Adopt</a></li>
				<li><a href="donate.php">Donate</a></li>
				
				
			</ul>
		
			<div id="content";> 
			<br><br><h3>
				You Have Successfully Logged Out
			</h3><br>
			<?php 
			unset($_SESSION['userid']);
			session_destroy(); 
			header( "refresh:3;url=index.php" ); 
			echo 'You\'ll be redirected in about 3 secs. Or, click <a href="index.php">here</a> to go back to the homepage.'
			?>
			</div>

			
		</div>
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		
	</body>
</html>