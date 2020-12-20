<?php header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken'); 

header("Content-Type: application/json; charset=UTF-8"); 
 include("global.php"); 
 
 $conn = new mysqli(server, dbuser, dbpw, db); 
 $userid = $_GET['userid']; 
 $eventname = $_GET['eventname']; 
 
 $result = $conn->query("select eventname, datetime, location, emergencyperson, emergencyno, userid, eventpw, eventstatus, startevent, endevent from events where eventname = '$eventname'"); 

  
 $outp = "["; 
 while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
     if ($outp != "[") {$outp .= ",";}  
     
     $outp .= '{"eventname":"'  . $rs["eventname"] . '",'; 
     $outp .= '"datetime":"' . $rs["datetime"] . '",'; 
     $outp .= '"location1":"' . $rs["location"] . '",';
     $outp .= '"emergencyperson":"' . $rs["emergencyperson"] . '",';
     $outp .= '"emergencyno":"' . $rs["emergencyno"] . '",'; 
     $outp .= '"eventpw":"' . $rs["eventpw"] . '",'; 
     $outp .= '"eventstatus":"' . $rs["eventstatus"] . '",'; 
     $outp .= '"startevent":"' . $rs["startevent"] . '",'; 
     $outp .= '"endevent":"' . $rs["endevent"] . '",'; 
     $outp .= '"userid":"'  . $rs["userid"]
. '"}';
}
$outp .="]"; 
 $conn->close(); 
 echo($outp); 
 
?> 