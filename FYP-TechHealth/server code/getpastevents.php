<?php header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken'); 

header("Content-Type: application/json; charset=UTF-8"); 
 include("global.php"); 
 
 $conn = new mysqli(server, dbuser, dbpw, db); 
 $userid = $_GET['userid']; 
// $eventid = $_GET['eventid']; 
 
 $result = $conn->query("select eventname, datetime, location, userid from events where userid = '$userid' and eventstatus = 'Past'"); 
 // $result = $conn->query("select userid from user where userid = '$userid' "); 
// where  eventstatus = 'Past' and
  
 $outp = "["; 
 while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
     if ($outp != "[") {$outp .= ",";}  
     
     $outp .= '{"eventname":"'  . $rs["eventname"] . '",'; 
     $outp .= '"datetime":"' . $rs["datetime"] . '",'; 
     $outp .= '"location1":"' . $rs["location"] . '",';
  //   $outp .= '"emergencyperson":"' . $rs["emergencyperson"] . '",';
   //  $outp .= '"emergencyno":"' . $rs["emergencyno"] . '",'; 
     $outp .= '"userid":"'  . $rs["userid"]
. '"}';
}
$outp .="]"; 
 $conn->close(); 
 echo($outp); 
 
?> 