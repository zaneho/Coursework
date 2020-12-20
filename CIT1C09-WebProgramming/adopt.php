<?php session_start(); ?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : Adopt</title>
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
				<?php if (isset($_SESSION['userid']) ){
							echo '<a href="intropage.php">Shop</a>';
							}
						else {echo '<a href="login.php">Shop</a>';}
				?>
				</li>
				<li><a href="about.php">About</a></li>
				<li><a href="contact.php">Contact</a></li>
				<li><a href="adopt.php">Adopt</a></li>
				<li><a href="donate.php">Donate</a></li>
				
				</h3>
				<?php date_default_timezone_set("Singapore");
				if (isset($_SESSION['userid']) ){
					echo '<h3><li style="float:right"><a href="logout.php">Log Out</a></li></h3>';
					echo '<b><p class="alignright">'.date("d/m/Y")."&nbsp&nbsp".date("h:i:sa").'</p></b>';
				}
				else {echo '<h3><li style="float:right"><a href="login.php">Log In</a></li></h3>';}
				?>
			</ul>
			
			<div id="content" class="alignleft">
				
				<h2>Adoption</h2>
				<br>
				Looking for a new furry family member?
				<br>Head over to the pet adoption site below to see some of the amazing pets they have that need forever homes!
				
				<br><br><br>
				<a href="http://sosd.org.sg/adopt-a-dog/" target="_blank">SOSD - Save Our Street Dogs</a> (Adoption site for Dogs)
				<img style="float:right; padding-right: 50px;" src="images/adopt.png" width="250" height="250">
				<br><br><br>
				<a href="http://www.adoptadog.sg/" target="_blank"> Adopt A Dog</a> (Adoption site for Dogs)
				<br><br><br>
				<a href="http://asdsingapore.com/wp/adopt-a-dog/" target="_blank">ASD - Action for Singapore Dogs</a> (Adoption site for Dogs)
				<br><br><br>
				<a href="http://www.causesforanimals.com/" target="_blank">CAS - Causes for Animals (Singapore) Limited</a> (Adoption site for Dogs and Cats)
				<br><br><br>
				<a href="http://www.spca.org.sg/" target="_blank">SPCA - Society for the Prevention of Cruelty to Animals</a> (Adoption site for Dogs, Cats and Small Animals)
				
				</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>