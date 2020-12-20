<?php session_start(); ?>
<!DOCTYPE html>
<html>

	<head>
		<title> Paws & Claws Pet Store : Log In </title>
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
			</ul>
			
			
			<div id="content">
				<h2>User Login Page</h2>
				<h4>Welcome Back, Sign In to continue.</h4><br><br>
			
			
				<span class="errormsg">
				<?php 
					$submitted = isset($_POST['submit']);

					
					if ($submitted == true) { 
						if(!empty($_POST['userid'])) {
							$userid = $_POST['userid'] ;
						}
					
						else{
							$userid = null;
							echo "<br>Please enter your User ID ! " ;
						}
					
						if(!empty($_POST['pwd'])) {
							$pwd = $_POST['pwd'] ;
							
						}
						else{
							$pwd = null;
							echo "<br>Please enter your Password !";
						}
						
						if ($userid && $pwd ) {
							//1: Connect to database
							$dbconnect = new mysqli("localhost","root", null, "petshopdb");
							//2: Prepare the statement
							$stmt=$dbconnect->prepare("SELECT password FROM users WHERE userid=?");
							//3: Bind the values
							$stmt->bind_param("s",$userid);
							//4: Execute the statement
							$stmt->execute();
							//5: Bind the result into $p
							$stmt->bind_result($p);
							//6: Fetch the result
							$stmt->fetch();
							//6: Process result: Compare database values with user’s input
							//7: close the statement
							$stmt->close();
							//8: close database connection
							$dbconnect->close();
							
							if($p == $pwd) {
								$_SESSION['userid']=$userid;
								header('Location:intropage.php');
								
							}
							else {echo "<br><br>Login is not successful, please try again.<br><br>"; }
							}
					
		


					}

				?>
				
				
				</span>
				
				
					<form class="loginformborder" action="login.php" method="post" >
						
							<b>User ID:</b>  &nbsp&nbsp&nbsp
							<input type="text" name="userid">
							<br><br>
							<b>Password:</b> <input type="password" name="pwd">
							<br><br><br>
							
							
							<input type="submit" name="submit" value="Login" /> 
							<input type="reset" value="Reset" />
					<br><br>
					Not registered? Click <a href="registervisitor.php">here</a>
					</form>
					
					
				</div>
			</div>
		</div>
		
		<div id="footer">
			Copyright &copy; School of IIT
		</div>
		
</body>
</html>