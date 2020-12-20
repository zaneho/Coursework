<?php session_start(); 
	if(isset($_SESSION['userid']) == false) {
		header("location:login.php");
	}

?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : IntroPage </title>
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
			
			<div id="content"  class="nopadding" style="background-color:white;">
				<?php
				
				
		
				if(empty($_GET['userid'])){ 
					$userid=$_SESSION['userid'];}
				else { $userid = $_GET['userid'];}
				
				echo "<br><p style='font-size:35px;font-family:Georgia;'> <b>Welcome, ".$_SESSION['userid']."!</b></p><br>";
				echo "<h2 style='float:right; padding-right:120px;'><a href='itemadd.php'> Add Items</a><br><br></h2>";	
				
				
				$dbconnect = new mysqli("localhost","root",null,"petshopdb");
				
				$stmt=$dbconnect->prepare("SELECT userid FROM users");
				$stmt->execute();
				$stmt->bind_result($userdb);
				echo '<p style="text-align:left; padding-left:70px; float:left;">';
				echo "<span align='left'>Users:</span>&nbsp&nbsp&nbsp&nbsp";
				while($stmt->fetch()){
					echo "<a href=intropage.php?userid=$userdb>$userdb</a></span>&nbsp&nbsp&nbsp&nbsp";
				}
				echo '</p><br><br>';
				$stmt->close();
				
				
				echo "<form action='intropage.php' method='post'>";
				echo '<p style="text-align:left; padding-left:70px; float:left;"><input type="text" name="search" placeholder="Search for...">
						<select name="searchtype">
						<option value="product">Product Name</option>
						<option value="pettype">Pet Type</option>
						</select>
						<input type="submit" name="submit" value="SEARCH"></p>';
				echo "</form>";
				
				if(isset($_POST['submit'])) {
				$submitted = isset($_POST['submit']);

					if ($submitted == true) {
						if(!empty($_POST["search"])) {
							$search = $_POST["search"] ;
						

						$dbconnect = new mysqli("localhost","root",null,"petshopdb");
						if($_POST['searchtype']== "product"){
							$stmt = $dbconnect->prepare("SELECT itemid, itemname, itembrand, imagefile, pettype FROM items WHERE itemname LIKE '%$search%' ORDER BY pettype");
						}
						else {
							$stmt = $dbconnect->prepare("SELECT itemid, itemname, itembrand, imagefile, pettype FROM items WHERE pettype LIKE '%$search%' ORDER BY pettype");
						}
							$stmt->execute();
							$stmt->bind_result($itemid, $itemname, $itembrand, $imagefile, $pettype);
						
						echo "<br><br><br><table class='intropagetable'>";
						echo "<h2>Search Result(s)</h2>";
						while($stmt->fetch()) {
						
						echo "<tr>";
						echo "<th> $pettype </th>";
						echo "<td style='border-bottom: 1px solid #e6ad00'>&nbsp&nbsp&nbsp <img src='images/shop/$imagefile'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								$itemname - $itembrand </td>";

						echo "<td style='border-bottom: 1px solid #e6ad00'>";						
						echo "<a href='itemdetail.php?itemid=$itemid'> View </a>&nbsp";						
						echo "</td></tr>";
						}
						echo "</table>";
						
							if(count($itemid) == 0) {
						
							echo "- ".count($itemname)." results found -";
							}
						}
						
						else {
							$search = null ;
							echo "<br><br><p style='color:red;'> Please type in product name!</p><br>" ;
						}
					}
				}
				
				
				
				
			
				
				else {
				
				$stmt = $dbconnect->prepare("SELECT itemid, itemname, itembrand, pettype, imagefile FROM items WHERE userid=? ORDER BY pettype");
				$stmt->bind_param("s",$userid);
				$stmt->execute();	
				$stmt->bind_result($itemid,$itemname,$itembrand,$pettype,$imagefile);
				echo "<br><br><br><table class='intropagetable'>";
					while($stmt->fetch()) {
						echo "<tr>";
						echo "<th> $pettype </th>";
						echo "<td style='border-bottom: 1px solid #e6ad00'>&nbsp&nbsp&nbsp <img src='images/shop/$imagefile'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								$itemname - $itembrand </td>";

						echo "<td style='border-bottom: 1px solid #e6ad00'>";						
						echo "<a href='itemdetail.php?itemid=$itemid'> View </a>&nbsp";
						if($userid == $_SESSION['userid']){
							echo "<a href='itemedit.php?itemid=$itemid'> Edit </a>&nbsp";
							echo "<a href='itemdelete.php?itemid=$itemid'> Delete </a>";	
						}
						
						echo "</td></tr>";
						}

					echo "</table>";

				$stmt->close();
				$dbconnect->close();
	
	
	
				if($itemid == null)	{
					echo "<br><br><p style='color:red;'>- User $userdb has not added any item -</p><br><br>";
				}
				}
?>
						
			</div>
		</div>	
		
			<div id="footer">
				Copyright &copy; Paws and Claws Online
			</div>
		

	</body>
</html>