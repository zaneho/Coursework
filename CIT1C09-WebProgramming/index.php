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
				</h3>
				<?php date_default_timezone_set("Singapore");
				if (isset($_SESSION['userid'])){
					echo '<h3><li style="float:right"><a href="logout.php">Log Out</a></li></h3>';
					echo '<b><p class="alignright">'.date("d/m/Y")."&nbsp&nbsp".date("h:i:sa").'</p></b>';
				}
				else {echo '<h3><li style="float:right"><a href="login.php">Log In</a></li></h3>';}
				?>
			</ul>
			
			<div id="content" >
				
				<h1>Welcome to Paws & Claws Pet Shop!</h1>
				Do Enjoy Your Stay Here!
				<?php 
				if (!isset($_SESSION['userid'])){	
				echo '	
				<br><br><br>
				<b>For Existing Customers,</b>
				 please click <a href="login.php"> here </a>to login. 
				<br>
				<b>If you are not a member yet</b>, please click <a href="registervisitor.php">here </a> to register. <br>
				';
				}
				else {echo "";}
				?>			
				<br><br>
				<table class="indextable">
				<tr> <th>LATEST ITEMS</th> </tr>
					<?php 
					$dbconnect = new mysqli("localhost","root",null,"petshopdb");
					$stmt = $dbconnect->prepare("SELECT itemid, itemname, itembrand, imagefile FROM items ORDER BY itemid DESC LIMIT 4");
					$stmt->execute();	
					$stmt->bind_result($itemid,$itemname,$itembrand,$imagefile);
					
					echo "<tr>";
					
					while($stmt->fetch()) {
						
						echo "<td><a style='text-decoration:none;color:black;' href='itemdetail.php?itemid=$itemid'><img src='images/shop/$imagefile'> $itemname - $itembrand </a></td>";

					}
	
	
					echo "</tr></table>";

				$stmt->close();
				$dbconnect->close();
					?>
					
					<!--<tr>						
						<td> <a href="itemdetail.php?itemID=4"><img src="images/shop/dogclothes_dressapet.png"></a> <br><br> <b>DRESS A PET</b> <br> Blue Penguin Costume</td>
						<td> <a href="itemdetail.php?itemID=7"><img src="images/shop/dogtoy_afp.png"></a> <br><br>  <b>AFP</b> <br> BBQ HAM SHANK TOY RAW  </td>
						<td> <a href="itemdetail.php?itemID=12"><img src="images/shop/catfood_meowingheads.png"></a> <br><br>  <b>MEOWING HEADS</b><br>ADULT HEY LOOKING GOOD (CHICKEN)</td>
						<td> <a href="itemdetail.php?itemID=20"><img src="images/shop/turtlefilter_hagen.png"></a> <br><br> <b>HAGEN</b> <br> Turtle Cliff (filter and rock)   </td>
					</tr>
				</table>	-->
			
			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>
