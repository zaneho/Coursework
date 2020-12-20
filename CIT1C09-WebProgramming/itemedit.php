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
				$itemid=$_GET["itemid"];
			}
			
			
			
			$submitted = isset($_POST['edit']);
			
			if ($submitted == true) {
				echo "<br>";
						$itemid=$_POST["itemid"];
						
						if(!empty($_POST["category"])) {
							$category = $_POST["category"] ;					
						}
						else {
							$category = null ;
							echo "<font color='red'>Please enter a Category<br></font>" ;
						}
						
						if(!empty($_POST["pettype"])) {
							$pettype = $_POST["pettype"] ;
						}
						else {
							$pettype = null ;
							echo "<font color='red'>Please enter a Pet Type <br></font>" ;
						}
						
						if(!empty($_POST["itembrand"])) {
							$itembrand = $_POST["itembrand"] ;
						}
						else {
							$itembrand = null ;
							echo "<font color='red'>Please enter the Item Brand <br></font>" ;
						}
						
						if(!empty($_POST["itemname"])) {
							$itemname = $_POST["itemname"] ;
						}
						else {
							$itemname = null ;
							echo "<font color='red'>Please enter the Item Name <br></font>" ;
						}
				
						if(!empty($_POST["price"])) {
							$price = $_POST["price"] ;
						}
						else {
							$price = null ;
							echo "<font color='red'>Please enter Item Price <br></font>" ;
						}
						
						if(!empty($_POST["newimagefile"])) {
							$imagefile = $_POST['newimagefile'] ;
						}
						else {
							$imagefile = $_POST["imagefile"] ;
						}
						
						if(!empty($_POST["description"])) {
							$description = $_POST["description"] ;
						}
						else {
							$description = null ;
							echo "<font color='red'>Please enter Item Description <br></font>" ;
						}
						
					if ($category && $pettype && $itembrand && $itemname && $price && $imagefile && $description) {
						$dbconnect = new mysqli("localhost","root", null, "petshopdb")or exit("Error connecting to database");
						
						$stmt=$dbconnect->prepare("UPDATE items SET category='$category', pettype='$pettype', itembrand='$itembrand', itemname='$itemname'
											,price='$price', imagefile='$imagefile', description='$description' WHERE itemid=$itemid");
						
						$result=$stmt->execute();
						if ($result == true && $stmt->affected_rows>0) {
						echo '<br><font color="#33cc33"><h3>You have succesfully edited the item</h3></font>';
						
						}
						else{"<font color='red'><h3> Error editing, please try again.</h3></font>";}
						$stmt->close();
						$dbconnect->close();
						
					}
						
						
						
						
						
						
			}
			
			
			
			
	
			
			$dbconnect = new mysqli("localhost","root", null, "petshopdb");
	
			
			$stmt = $dbconnect->prepare("SELECT itembrand, itemname, description, pettype, category, imagefile, price FROM items WHERE itemid=?");
  
				
			$stmt->bind_param("i",$itemid);
  
			
			$stmt->execute();

			
			$stmt->bind_result($itembrand,$itemname,$description,$pettype,$category,$imagefile,$price);
 		 
			
			$stmt->fetch();
			
			
			$stmt->close();

			
			$dbconnect->close();
			
			
			echo "<form action='itemedit.php' method='post'>";
			
			echo "<br><br><h2>Edit Your Item</h2><br>";
			echo "<input type='hidden' name='itemid' value='$itemid'>";
			echo "Category: &nbsp&nbsp&nbsp"."<input type='text' name='category' value='$category'><br>";
			echo "Pet Type: &nbsp&nbsp&nbsp"."<input type='text' name='pettype' value='$pettype'><br>";
			echo "Item Brand: "."<input type='text' name='itembrand' value='$itembrand'><br>";
			echo "Item Name: "."<input type='text' name='itemname' value='$itemname'><br>";
			echo "Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"."<input type='number' name='price' value='$price' step='0.01'><br><br>";
			
			echo "Existing Image File: <input type='text' name='imagefile' value='$imagefile' readonly><br>";
			echo "Choose New Image File: &nbsp&nbsp&nbsp&nbsp"."<input type='file' name='newimagefile'>";
			echo '</br><br><br>Product Description:<br><textarea rows="16" cols="80" name="description">'.$description.'</textarea><br>';
			
			echo "<br><input type='submit' name='edit' value='Edit' style='height: 30px; width:80px;'> &nbsp&nbsp";
			echo "<input type='reset' value='Reset' style='height: 30px; width:80px;'><br><br>";

			echo "</form>";





			?>

			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>