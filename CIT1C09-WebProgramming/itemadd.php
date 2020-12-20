<?php session_start(); 
	if(isset($_SESSION['userid']) == false) {
		header("location:login.php");
	}
?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : Add Item </title>
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
			
			$submitted = isset($_POST['add']);
			
			if ($submitted == true) {
				echo "<br><font color='#ff0000'>";
						if(!empty($_POST["category"])) {
							$category = $_POST["category"] ;					
						}
						else {
							$category = null ;
							echo "Please enter a Category<br>" ;
						}
						
						if(!empty($_POST["pettype"])) {
							$pettype = $_POST["pettype"] ;
						}
						else {
							$pettype = null ;
							echo "Please enter a Pet Type <br>" ;
						}
						
						if(!empty($_POST["itembrand"])) {
							$itembrand = $_POST["itembrand"] ;
						}
						else {
							$itembrand = null ;
							echo "Please enter the Item Brand <br>" ;
						}
						
						if(!empty($_POST["itemname"])) {
							$itemname = $_POST["itemname"] ;
						}
						else {
							$itemname = null ;
							echo "Please enter the Item Name <br>" ;
						}
				
						if(!empty($_POST["price"])) {
							$price = $_POST["price"] ;
						}
						else {
							$price = null ;
							echo "Please enter Item Price <br>" ;
						}
						
						if(!empty($_POST["imagefile"])) {
							$imagefile = $_POST["imagefile"] ;
						}
						else {
							$imagefile = null ;
							echo "Please select Image File <br>" ;
						}
						
						if(!empty($_POST["description"])) {
							$description = $_POST["description"] ;
						}
						else {
							$description = null ;
							echo "Please enter Item Description <br>" ;
						}
				echo "</font>";
			
				if($category && $pettype && $itembrand && $itemname && $price && $imagefile && $description) {
							
							$dbconnect = new mysqli("localhost", "root", null, "petshopdb")or exit("Error connecting to database");
							$stmt=$dbconnect->prepare("SELECT MAX(itemid) from items");
							$stmt->execute();
							$stmt->bind_result($lastid);
							$stmt->fetch();
							$itemid = $lastid + 1;
							$stmt->close();
						
							
							
							$stmt=$dbconnect->prepare("INSERT INTO items(itemid, userid, itembrand, itemname, description, pettype, category, imagefile, price) VALUES (?,?,?,?,?,?,?,?,?)");

							$stmt->bind_param("issssssss",$itemid, $_SESSION['userid'],$itembrand,$itemname,$description,$pettype,$category,$imagefile,$price);

							$result=$stmt->execute();
							if ($result == true && $stmt->affected_rows>0) {
							echo "<font color='#33cc33'><h3><br>Thank you!<br> You have successfully added the item.<br><br></h3></font>
									<a href='itemdetail.php?itemid=".$itemid."'>View Item </a>";}
							else{ echo "<font color='#ff0000'><h3>Unsuccessful, please try again.<br><br></h3></font>";}

							$stmt->close();
							$dbconnect->close();
							
							$category=null;
							$pettype=null;
							$itembrand=null;
							$itemname=null;
							$price=null;
							$imagefile=null;
							$description=null;
				}
			}
			?>
			
			<form action="itemadd.php" method="post">
			<br><h2>Fill in the form to Add an Item</h2><br>
			Category: &nbsp&nbsp<input type="text" name="category" value=<?php if(!empty($category)) echo $category;?>><br>
			Pet Type: &nbsp&nbsp<input type='text' name='pettype'value=<?php if(!empty($pettype)) echo"$pettype";?>><br>
			Item Brand: <input type='text' name='itembrand' value=<?php if(!empty($itembrand)) echo"$itembrand";?>><br>
			Item Name: <input type='text' name='itemname' value=<?php if(!empty($itemname)) echo"$itemname";?>><br>
			Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='number' name='price' step='0.01' value=<?php if(!empty($price)) echo"$price";?>><br>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Image File: <input type='file' name='imagefile'><br>
			</br><br>Product Description:<br><textarea rows="16" cols="65" name="description"><?php if(!empty($description)) echo"$description";?></textarea><br>
			
			<input type='submit' name='add' value='Add'>
			<input type='reset' value='Reset'>
		
			
			</form>
			
			<br><br>
			
			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>