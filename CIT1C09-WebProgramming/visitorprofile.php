<?php session_start();
if(isset($_SESSION['userid']) == false) {
		header("location:login.php");
	}
 ?>
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
				if (isset($_SESSION['userid']) ){
					echo '<h3><li style="float:right"><a href="logout.php">Log Out</a></li></h3>';
					echo '<b><p class="alignright">'.date("d/m/Y")."&nbsp&nbsp".date("h:i:sa").'</p></b>';
				}
				else {echo '<h3><li style="float:right"><a href="login.php">Log In</a></li></h3>';}
				?>
				
			</ul>
			
			<div id="content" style="background-color:white;">
				
				<h3>Hello <?php echo $_SESSION["name"]?>! Thank you for registering with us.</h3><br> Take a look at the recommended items below or <a href="intropage.php">view our whole range.</a>
				<br><br>
						
				<table class="intropagetable">
					<tr><td style="text-align:left"><h3><b> Recommended</b></h3><td></tr>
					<?php 
					
					
							foreach($_SESSION["petown"] as $value) {		
								
							$dbconnect = new mysqli("localhost", "root", null, "petshopdb");
							$stmt = $dbconnect->prepare("SELECT itemid, itembrand, itemname, imagefile FROM items WHERE pettype=?");
							$stmt->bind_param("s",$value);
							$stmt->execute();


							$stmt->bind_result($itemid, $itembrand, $itemname, $imagefile);
								 
							 
							while($stmt->fetch()) {
							
							echo "<tr><td style='border-bottom: 1px solid #e6ad00' >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
							echo "<a href=itemdetail.php?itemid=$itemid><img src='images/shop/".$imagefile."'></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
							echo $itembrand." - ".$itemname;
							echo "</td></tr>";
							}
							
							
							
							$stmt->close();
							$dbconnect->close();

							}

				?>
				</table>
		
			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>