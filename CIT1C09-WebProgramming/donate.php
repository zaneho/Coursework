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
				if (isset($_SESSION['userid'])) {
					echo '<h3><li style="float:right"><a href="logout.php">Log Out</a></li></h3>';
					echo '<b><p class="alignright">'.date("d/m/Y")."&nbsp&nbsp".date("h:i:sa").'</p></b>';
				}
				else {echo '<h3><li style="float:right"><a href="login.php">Log In</a></li></h3>';}
				?>
			</ul>
			
			<div id="content" class="alignleft">
				<h2>Donation</h2>
				<img style="float:right; padding-right:100px;" src="images/donate.png" width="200" height="200">
				<br>
				Still have usable pet supplies unneeded? Dont throw, Donate them!
				<br><br>
				Have a heart and money for pet?
				<br>Even the smallest amount can make a big difference in saving a life. 
				<br><br>
				Check out the link and start saving lifes.
				
				<br><br><br>
				<a href="http://www.spca.org.sg/helpus.asp" target="_blank">SPCA - Society for the Prevention of Cruelty to Animals</a>
				<br> (Assist the operations of animal shelter, clinic, support the work of our Inspectorate and animal rescue services)
				<br><br>
				<a href="http://asdsingapore.com/wp/help-us/" target="_blank">ASD - Action for Singapore Dogs</a> 
				<br>(Defray the costs of vaccinations, medical care, food and supplies)
				<br><br>
				<a href="http://www.animalloversleague.com/feed-a-fur-baby.html" target="_blank">ALL - Animal Lovers League</a> 
				<br> (Funds are used to buy special diets for our sick animals and the necessary everyday food items such as kibbles and canned food)
				
			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>
