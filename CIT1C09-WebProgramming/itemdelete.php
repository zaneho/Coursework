<?php session_start(); 
	if(isset($_SESSION['userid']) == false) {
		header("location:login.php");
	}

?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : Edit Product </title>
		<link rel="stylesheet" href="stylesheet.css">
	</head>

	<body>
		<div id="container" style="background-color:white;">
			<div id="header">
			
				<a href="index.php"><img border="0" src="images/logo.png" alt="Paws And Claws" width="400" height="100"></a>

			</div>
			
			<ul id="nav">
				<h3>
				<li><a href="index.php">Home</a></li>
				<li><a href="intropage.php">Shop</a></li>
				<li><a href="about.php">About</a></li>
				<li><a href="contact.php">Contact</a></li>
				<li><a href="adopt.php">Adopt</a></li>
				<li><a href="donate.php">Donate</a></li>
				</h3>
				
				<?php date_default_timezone_set("Singapore");
				if (isset($_SESSION['userid'])){
					echo '<h3><li style="float:right"><a href="logout.php">Log Out</a></li></h3>';
					echo '<b><p class="alignright">'.date("d/m/Y")."&nbsp&nbsp".date("h:i:sa").'</p></b>';
				}
				else {echo '<h3><li style="float:right"><a href="login.php">Log In</a></li></h3>';}
				?>
			</ul>
			<div id="content" class="nopadding" style="background-color:white;">
			
			
			
			<?php
			if(!empty($_GET['itemid'])){
				$itemid = $_GET['itemid'];
				}
			
			if (isset($_POST['no'])){
				header('Location:intropage.php');
			}
			
			
			if(isset($_POST['yes'])){

				
				
				$dbconnect = new mysqli("localhost","root", null, "petshopdb");
	
				$stmt = $dbconnect->prepare("DELETE FROM items WHERE itemid=?");

				$stmt->bind_param("i",$itemid);
			
				$result= $stmt->execute();
				
				if ($result == true && $stmt->affected_rows>0){
					echo "<h3><br>You have successfully deleted the item!</h3>";
					echo "<br><a href='intropage.php'> Go Back to listing</a>";
				}
				
				$stmt->close();
				$dbconnect->close();
			}
			
			
			else {
				echo '	<br><h3>Are you sure you want to delete this item?</h3><br>';
				
				echo '	<form method="post" action="itemdelete.php?itemid='.$itemid.'">';
						
				echo '		<input type="hidden" name="itemid" value="$itemid">
						
						<input type="submit" name="yes" value="Yes" style="height: 30px; width:80px;">
						<input type="submit" name="no" value="No" style="height: 30px; width:80px;">
						
						</form>';
			}
	
			?>
			
			
			
			
			
			
			
			
			

			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>