<?php header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken'); 

header("Content-Type: application/json; charset=UTF-8"); 
 include("global.php"); 
 
 $conn = new mysqli(server, dbuser, dbpw, db); 
 $userid = $_GET['userid']; 
 
 $result = $conn->query("select * from user where userid = '$userid'"); 
 
 $outp = "["; 
 while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
     if ($outp != "[") {$outp .= ",";}  
     $outp .= '{"userid":"'  . $rs["userid"]. '",'; 
      $outp .= '"password":"' . $rs["password"] . '",'; 
     $outp .= '"usertype":"' . $rs["usertype"]
     
. '"}';
}
$outp .="]"; 
 $conn->close(); 
 echo($outp); 
 
?> 
 