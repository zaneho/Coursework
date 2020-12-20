<?php session_start(); ?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : About </title>
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
			
				<h3>About Us</h3>
				<br>
				Paws & Claws is a Singapore pet store established in 2015. 
				<br><br>
				We offer premium pet supplies catering to the needs of dogs, cats, birds and turtles.
				We have the best valued products compared to any other stores.
				<br><br>
				We aim to be the leading pet shop in Singapore, by providing customers high quality products and best customer service through our caring heart. 
				We are a family of pet-lovers and all our employees are well trained and knowledgeable so rest assured your pet is well taken care of!
				<br><br>
			</div>		
			
			<div class="aboutus_img">
				<img  src="images/aboutus_pets.png" width="400" height="200">
				<img  src="images/aboutus_happystaff.png" width="400" height="200">
				
			</div>
			
				
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>



