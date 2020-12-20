<?php session_start(); 
	if(isset($_SESSION['userid']) == false) {
		header("location:login.php");
	}
?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : Products </title>
		<link rel="stylesheet" href="stylesheet.css">
	</head>

	<body>
		<div id="container" style="background-color: white;">
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
				if (isset($_SESSION['userid']) ){
					echo '<h3><li style="float:right"><a href="logout.php">Log Out</a></li></h3>';
					echo '<b><p class="alignright">'.date("d/m/Y")."&nbsp&nbsp".date("h:i:sa").'</p></b>';
				}
				else {echo '<h3><li style="float:right"><a href="login.php">Log In</a></li></h3>';}
				?>
				
			</ul>
			
			
			
			<div id="content" class="nopadding" style="background-color: white;">
			
				
				
<?php $userid = $_SESSION['userid'];
	
	

	if(isset($_GET["itemid"])) {
	$itemid=$_GET["itemid"];}
	else {$itemid = null;}
	
	if(!empty($itemid)) {	
	
	$dbconnect = new mysqli("localhost","root", null, "petshopdb");
	

	
	$stmt = $dbconnect->prepare("SELECT itembrand, itemname, description, pettype, category, price, imagefile FROM items WHERE itemid=?");
	

	$stmt->bind_param("i",$itemid);
 
	$stmt->execute();

	$stmt->bind_result($itembrand, $itemname, $description, $pettype, $category, $price, $imagefile);
 		 
	$stmt->fetch();
	
	echo '<div id="itemdetailpage">';
		echo "<h2>".ucfirst("$pettype")."&nbsp-&nbsp".ucfirst("$category")."<br></h2>";
		echo '<br><span style="float: right; padding-top: 100px;">'.'<img src=images/shop/'.$imagefile.' style="width:160%;height:160%"></span>';
		echo "<b>Item ID: $itemid <br></b>";
		echo "<b>Brand:</b> <input type='text' value='$itembrand' size='40' readonly><br>";
		echo '<b>Name: </b>'.'<input type="text" value="'.$itemname.'" size="40" readonly><br>';
		echo "<b>Price: $ $price</b>";
		echo '</br><br>Product Description:<br><textarea rows="16" cols="65" readonly>'.$description.'</textarea>';
	
	

	$stmt->close();
	$dbconnect->close();
	}
	else {
		$itemid = "No product selected"; 
		$pettype = "No category selected";
		$category = null;
		$imagefile = "paw.png";
		$itembrand = "No product selected";
		$itemname = "No product selected";
		$price = "No product selected";
		$description = "No product selected";
	
		
		echo '<div id="itemdetailpage">';
		echo "<h2>".ucfirst("$pettype")."&nbsp&nbsp".ucfirst("$category")."<br></h2>";
		echo '<br><span style="float: right; padding-top: 100px;">'.'<img src=images/'.$imagefile.' style="width:160%;height:160%"></span>';
		echo "<b>Item ID: $itemid <br></b>";
		echo "<b>Brand:</b> <input type='text' value='$itembrand' size='30' readonly>";
		echo "<br><b>Name:</b> <input type='text' value='$itemname' size=40 readonly><br>";
		echo "<b>Price: $price</b>";
		
		echo '</br><br>Product Description:<br><textarea rows="16" cols="65" readonly>'.$description.'</textarea>';
	}
	
	?>
				
					</p>
				
				</div>	
				
			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>