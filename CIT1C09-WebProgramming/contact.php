<?php session_start(); ?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : Contact</title>
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
				<?php if (isset($_SESSION['userid'])) {
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
			
			<div id="content">
				<div class ="rightcolumn">
					<b>Email:</b> pawsandclaws@gmail.com
					<br><br>
					<b>Address:</b>
				<br>Tampiness Mall
				<br>4 Tampines Central 5
				<br>#01-27/29
				<br>Singapore 529510
					<br><br>
					<b>Telephone:</b> (+65) 6789 4326
					<br><br>
					<b>Opening Hours:</b>
				<br>Monday - Saturday: 10am - 8pm
				<br>Sundays & Public Holidays : CLOSED

				
				</div>
				
				
				<div class="contacttable" class="nopadding">
				<?php			
					
					$submitted = isset($_POST['submit']);
					
					if ($submitted == true) {
						$name = $_POST["name"] ;
						
						if (filter_input(INPUT_POST, "email", FILTER_VALIDATE_EMAIL)) {
						$email = $_POST["email"];}
						else { $email = ""; 
								echo "<font color='red'><b>Please enter a valid email address</font></b>";}
						
						$subject = $_POST["subject"];
						$message = $_POST["message"];	
						
						if(!empty($_POST["contactno"])) {
							if(is_numeric($_POST["contactno"])) {
							$contactno = $_POST["contactno"] ;	
							}	
							else{ $contactno = null ;
								echo "<br><font color='red'><b>Please enter a valid contact number</font></b>";
							}
						}
						else {
							$contactno = null ;
						}
						
						
						if($name && $email && $subject && $message && $contactno) {
							
							$dbconnect = new mysqli("localhost", "root", null, "petshopdb") or exit("Error connecting to database");
							$stmt=$dbconnect->prepare("SELECT MAX(qid) from question");
							$stmt->execute();
							$stmt->bind_result($qid);
							$stmt->fetch();
							$qid = $qid + 1;
							$stmt->close();
							
							
							$stmt=$dbconnect->prepare("INSERT into question(qid, name, email, contactno, subject, message) VALUES (?,?,?,?,?,?)");
							$stmt-> bind_param("ississ", $qid, $name, $email, $contactno, $subject, $message);
							$result = $stmt->execute();
							if ($result == true && $stmt->affected_rows>0) {
							echo "<font color='#408000'> Thank you for your feedback.<br> We will contact you within 3 working days. </font> ";
							$name = null;
							$email = null;
							$subject = null;
							$message = null;
							}
							$stmt->close();
							$dbconnect->close();
							
							
						}
						else { echo "<font color='red'><b><br>Message not sent.</font></b>" ;
						}
					}
					
					
					 
					
					?>
					
					<form action="contact.php" method="post">
					<table>
						<tr>
							<th>Name </th> 
							<td><input type="text" name="name" placeholder="Your Name" size="35" required value="<?php if (!empty($name)) echo $name;?>"> </td>
						</tr>
						<tr>
							<th>Email  </th>
							<td><input type="email" name="email" placeholder="Your Email Address" size="35" required value="<?php if (!empty($email)) echo $email;?>" ></td>
						</tr>
						<tr>
							<th>Contact No </th>
							<td><input type="text" name="contactno" placeholder="Your Contact Number" size="35" required> </td>
						</tr>
						<tr>
							<th>Subject </th>
							<td><input type="text" name="subject" placeholder="Subject of your message"  size="35" required value="<?php if (!empty($subject)) echo $subject;?>" ></td>
						</tr>
						<tr>
							<th style="vertical-align:top">Message </th>
							<td><textarea name="message" rows="7" cols="50" placeholder="Your message..."  required><?php if (!empty($message)){echo $message;}?></textarea></td>
						</tr>
						<tr>
							
							<td>              </td><td><input id="submit" type="submit" name="submit" value="Send"><td>
						</tr>
					</table>
					</form>
									
				</div>
				
				


			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
		

	</body>
</html>