<?php session_start(); ?>
<!DOCTYPE html>
<html>
	<head> 
		<title> Paws & Claws Pet Store : Register Account </title>
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
				<li style="float:right"><a href="login.php">Log In</a></li>
				</h3>
			</ul>

			<div id="content" >
				<h2>Visitor Registration Page</h2>
				<h4>Thank you for your visit, register with us to receive updates.</h4><br><br>

				<div class="errormsg">
				<?php
				
				$submitted = isset($_POST['submit']);

				if ($submitted == true) {
						if(!empty($_POST["userid"])) {
							$userid = $_POST["userid"] ;
							
							
						}
						else {
							$userid = null ;
							echo "Please enter your User ID<br>" ;
						}
				
						if(!empty($_POST["pwd"])) {
							$pwd = $_POST["pwd"] ;

						}
						else {
							$pwd = null ;
							echo "Please enter your Password <br>" ;
						}
						
						if(!empty($_POST["name"])) {
							$name = $_POST["name"] ;
							
						}
						else {
							$name = null ;
							echo "Please enter your Name <br>" ;
						}
				
						if(!empty($_POST["gender"])) {
							$gender = $_POST["gender"] ;
						}
						else {
							$gender = null ;
							echo "Please select your Gender <br>" ;
						}
						
						if(!empty($_POST["day"] )) {
							$DOBday = $_POST["day"] ;
						}
						else {
							$DOBday = null ;
							echo "Please enter Day for DOB<br>" ;
						}
						
						if(!empty($_POST["month"])) {
							$DOBmonth = $_POST["month"] ;
						}
						else {
							$DOBmonth = null ;
							echo "Please enter Month for DOB<br>" ;
						}

						$currentdate=getdate();
				
						if(!empty($_POST["year"])) {
							if(is_numeric($_POST["year"])) {
								if($_POST["year"]< "$currentdate[year]"){
								$DOByear = $_POST["year"] ;}
								else { $DOByear = null;
										echo "Please enter a valid Year less than $currentdate[year]<br>";}
							}	
							else{ $DOByear = null ;
								echo "Please enter valid <u>numbers</u> for Year(DOB) <br>";
							}
						}
						else {
							$DOByear = null ;
							echo "Please enter Year for DOB<br>" ;
						}
						
						if($DOBday && $DOBmonth && $DOByear) {
							if(checkdate($DOBmonth,$DOBday,$DOByear)== "true"){
							$dob = "$DOBday/$DOBmonth/$DOByear" ;
							}
							else {$dob = null;
								echo "Please enter a valid DOB<br>";}
						}
						else{ $dob =null ;}
					
						if(!empty($_POST["address"])) {
							$address = $_POST["address"];
						}
						else {
							echo "Please enter your Address <br>";
						}
						
						if(!empty($_POST["email"])) {
							if (filter_input(INPUT_POST, "email", FILTER_VALIDATE_EMAIL)) {
							$email = $_POST["email"] ;
							}
							else { $email = null;
								echo "Please enter a valid Email address <br>";}
						}
						else {
							$email = null ;
							echo "Please enter your Email address <br>" ;
						}
						
						
						if(isset($_POST["petown"])) {
							$pet = $_POST["petown"];
							$_SESSION["petown"] = $pet; 
							$pet = implode(",",$_POST["petown"]) ;
							
						}
						else {
							$pet = null ;
							echo "Please indicate the type(s) of pets you own <br>" ;
						}
						

						if( $userid && $pwd && $name && $gender && $dob && $address && $email && $pet ) {
							 $_SESSION["userid"] = $userid ;
							 $_SESSION["name"] = $name;
							 //1: Connect to database
							 $dbconnect = new mysqli("localhost", "root", null, "petshopdb");

							//2: Prepare the statement
							
							$stmt=$dbconnect->prepare("INSERT into users(userid, password, name, gender, dateofbirth, address, email, typesofpetsown ) VALUES (?,?,?,?,?,?,?,?)");
							
							//3: Bind the values
							$stmt-> bind_param("ssssssss",$userid,$pwd, $name, $gender, $dob, $address, $email, $pet);
							
							//4: Execute the statement
							$result = $stmt->execute();
							
							
							
							//6: close the statement
							$stmt->close();

							//7: close database connection
							$dbconnect->close();

							
							
							
							header('Location:visitorprofile.php');
							
						}
				}
				
				
				?>
				
				</div>
				<br>
				<form class="regformborder" action="registervisitor.php" method="post">
				<b>User ID:&nbsp&nbsp&nbsp</b> <input type="text" name="userid" value="<?php if (!empty($userid)) echo $userid; ?>">
				<br><br>
				
				<b>Password: </b><input type="password" name="pwd">
				<br><br>
				
				<b>Name:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b> <input type="text" name="name" value="<?php if (!empty($name)) echo $name; ?>">
				<br><br>
				
				<b>Gender:</b> <input type="radio" name="gender" value="Female" <?php if(!empty($gender) && $gender=='Female')echo 'checked';?> > Female
				<input type="radio" name="gender" value="Male" <?php if(!empty($gender) && $gender=='Male')echo 'checked';?> > Male
				<br><br>
				
				<b>Date Of Birth:</b>
					<select name="day">
								<option class="hideoption" selected disabled>Day</option>
						<option value="01" <?php if(!empty($DOBday) && $DOBday=='1') echo 'selected' ;?> >1</option>
						<option value="02" <?php if(!empty($DOBday) && $DOBday=='2') echo 'selected' ;?> >2</option>
						<option value="03" <?php if(!empty($DOBday) && $DOBday=='3') echo 'selected' ;?> >3</option>
						<option value="04" <?php if(!empty($DOBday) && $DOBday=='4') echo 'selected' ;?> >4</option>
						<option value="05" <?php if(!empty($DOBday) && $DOBday=='5') echo 'selected' ;?> >5</option>
						<option value="06" <?php if(!empty($DOBday) && $DOBday=='6') echo 'selected' ;?> >6</option>
						<option value="07" <?php if(!empty($DOBday) && $DOBday=='7') echo 'selected' ;?> >7</option>
						<option value="08" <?php if(!empty($DOBday) && $DOBday=='8') echo 'selected' ;?> >8</option>
						<option value="09" <?php if(!empty($DOBday) && $DOBday=='9') echo 'selected' ;?> >9</option>
						<option value="10" <?php if(!empty($DOBday) && $DOBday=='10') echo 'selected' ;?> >10</option>
						<option value="11" <?php if(!empty($DOBday) && $DOBday=='11') echo 'selected' ;?> >11</option>
						<option value="12" <?php if(!empty($DOBday) && $DOBday=='12') echo 'selected' ;?> >12</option>
						<option value="13" <?php if(!empty($DOBday) && $DOBday=='13') echo 'selected' ;?> >13</option>
						<option value="14" <?php if(!empty($DOBday) && $DOBday=='14') echo 'selected' ;?> >14</option>
						<option value="15" <?php if(!empty($DOBday) && $DOBday=='15') echo 'selected' ;?> >15</option>
						<option value="16" <?php if(!empty($DOBday) && $DOBday=='16') echo 'selected' ;?> >16</option>
						<option value="17" <?php if(!empty($DOBday) && $DOBday=='17') echo 'selected' ;?> >17</option>
						<option value="18" <?php if(!empty($DOBday) && $DOBday=='18') echo 'selected' ;?> >18</option>
						<option value="19" <?php if(!empty($DOBday) && $DOBday=='19') echo 'selected' ;?> >19</option>
						<option value="20" <?php if(!empty($DOBday) && $DOBday=='20') echo 'selected' ;?> >20</option>
						<option value="21" <?php if(!empty($DOBday) && $DOBday=='21') echo 'selected' ;?> >21</option>
						<option value="22" <?php if(!empty($DOBday) && $DOBday=='22') echo 'selected' ;?> >22</option>
						<option value="23" <?php if(!empty($DOBday) && $DOBday=='23') echo 'selected' ;?> >23</option>
						<option value="24" <?php if(!empty($DOBday) && $DOBday=='24') echo 'selected' ;?> >24</option>
						<option value="25" <?php if(!empty($DOBday) && $DOBday=='25') echo 'selected' ;?> >25</option>
						<option value="26" <?php if(!empty($DOBday) && $DOBday=='26') echo 'selected' ;?> >26</option>
						<option value="27" <?php if(!empty($DOBday) && $DOBday=='27') echo 'selected' ;?> >27</option>
						<option value="28" <?php if(!empty($DOBday) && $DOBday=='28') echo 'selected' ;?> >28</option>
						<option value="29" <?php if(!empty($DOBday) && $DOBday=='29') echo 'selected' ;?> >29</option>
						<option value="30" <?php if(!empty($DOBday) && $DOBday=='#30') echo 'selected' ;?> >30</option>
						<option value="31" <?php if(!empty($DOBday) && $DOBday=='31') echo 'selected' ;?> >31</option>
					</select>
				  
					<select name="month">
						<option class="hideoption" selected disabled>Month</option>
						<option value="01" <?php if(!empty($DOBmonth) && $DOBmonth=='1') echo 'selected' ;?> >January</option>
						<option value="02" <?php if(!empty($DOBmonth) && $DOBmonth=='2') echo 'selected' ;?> >February</option>
						<option value="03" <?php if(!empty($DOBmonth) && $DOBmonth=='3') echo 'selected' ;?> >March</option>
						<option value="04" <?php if(!empty($DOBmonth) && $DOBmonth=='4') echo 'selected' ;?> >April</option>
						<option value="05" <?php if(!empty($DOBmonth) && $DOBmonth=='5') echo 'selected' ;?> >May</option>
						<option value="06" <?php if(!empty($DOBmonth) && $DOBmonth=='6') echo 'selected' ;?> >June</option>
						<option value="07" <?php if(!empty($DOBmonth) && $DOBmonth=='7') echo 'selected' ;?> >July</option>
						<option value="08" <?php if(!empty($DOBmonth) && $DOBmonth=='8') echo 'selected' ;?> >August</option>
						<option value="09" <?php if(!empty($DOBmonth) && $DOBmonth=='9') echo 'selected' ;?> >September</option>
						<option value="10" <?php if(!empty($DOBmonth) && $DOBmonth=='10') echo 'selected' ;?> >October</option>
						<option value="11" <?php if(!empty($DOBmonth) && $DOBmonth=='11') echo 'selected' ;?> >November</option>
						<option value="12" <?php if(!empty($DOBmonth) && $DOBmonth=='12') echo 'selected' ;?> >December</option>
					</select>
				
					<input type="text" name="year" placeholder="Year(YYYY)"  maxlength="4" size="6" pattern="[0-9]{4}" value="<?php if (!empty($DOByear)) echo $DOByear; ?>">
					
					
				
				
				<br><br>
				<b>Address:</b> <input type="text" name="address" size="35" value="<?php if(!empty($address)) echo $address; ?>">
				
				<br><br>
				<b>Email:</b> <input type="email" name="email" size="40" value="<?php if (!empty($email)) echo $email; ?>">
				<br><br>
				
				<b>Type(s) of pets own: </b>
				<?php 
				
				   
				$dbconnect = new mysqli("localhost", "root", null, "petshopdb");
				$stmt = $dbconnect->prepare("SELECT * FROM pets");
				$stmt->execute();
				$stmt->bind_result($pet);
				while($stmt->fetch()) {
					echo '<input type="checkbox" name="petown[]" value='.$pet.' >'.ucfirst("$pet").'&nbsp' ;
					
				}
				
				$stmt->close();
				$dbconnect->close();
				
				/*function isCheckboxSelected($checkedPet)
					{
					   if(isset($_POST['petown'])) {
						 foreach ($_POST['petown'] as $value) {
							if($value==$checkedPet){
							   return "checked";
							}
						 }
					   }
					   else {return ""; }
					}*/
					/* <?php if(isset($_POST['petown'])) echo isCheckboxSelected("Dog");?> */
			
				?>

				
				
				<br><br><br>
				<input type="submit" name="submit" value="Register">
				<input type="reset" name="reset">
				<br><br>
				Already have an account? Click <a href="login.php">here</a> to login.
				</form>
			
			
			
			</div>
		</div>	
		
		<div id="footer">
			Copyright &copy; Paws and Claws Online
		</div>
	
	
	
	
	
	</body>
</html>