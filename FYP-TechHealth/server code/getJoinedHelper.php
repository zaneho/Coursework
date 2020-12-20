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
    
    $eventname   = $_GET["eventname"];
    
    $query    = "SELECT helperevent.userid as id, user_helper.name as userid, attendance FROM helperevent JOIN user_helper ON helperevent.userid=user_helper.userid WHERE eventname = '$eventname' order by userid";
    
    $result   = $conn->query($query);
    $outp = "[";    
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) { 
        if   ($outp != "[") {
            $outp .= ",";
        } 
        $outp .= '{"userid":"' . $rs["userid"] . '",';
        $outp .= '"attendance":"' . $rs["attendance"] . '"';
        
        
        $outp .= '}';
        
    } 
        $outp .="]";
      
$conn -> close();
echo($outp); 
}
catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => -1
    )) . "]";
    echo $json_out;
}
?>