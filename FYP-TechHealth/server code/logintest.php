<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");
try {
    $found    = 0;
    $conn     = new mysqli(server, dbuser, dbpw, db);
    $userid   = $_GET["userid"];
    $password = $_GET['password'];
    $query    = "SELECT count(*) from wp_users where user_login ='$userid' and user_pass = '$password'";
   $result = $conn->query($query);
	$count = $result->fetch_array(MYSQLI_NUM);
	$json_out = "[" . json_encode(array("result"=>$count[0])) . "]";
	echo $json_out;
 
 
  



    
    if (($row_cnt) > 0){
    
    
    

    $query1 = "SELECT eventname, userid FROM events where eventstatus = 'Current' and BINARY userid = 'jimmy' LIMIT 1";
  $result1 = $conn->query($query1);
   $row_cnt = $result1->num_rows;
   
   
 printf($row_cnt);
 $result = $conn->query("insert into device (email) values ('organiser')");
    /* close result set $result->close(); */
     }
    
    else { echo 'ss' ;}



	$conn->close();
}
catch(Exception $e) {
	$json_out =  "[".json_encode(array("result"=>0))."]";
	echo $json_out;
}
?>