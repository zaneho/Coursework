<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");

try {
    $conn        = new mysqli(server, dbuser, dbpw, db);
    $userid      = $_GET["userid"];
    $helperLat = $_GET["helperLat"];
    $helperLng = $_GET["helperLng"];
    
    $retrieveEventName;
    
    $query       = "SELECT helperevent.eventname FROM helperevent INNER JOIN events ON events.eventname = helperevent.eventname WHERE BINARY helperevent.userid = '$userid' AND attendance = 1 AND events.startevent IS NOT NULL AND events.endevent IS NULL";
    
   $eventnameResult = $conn->query($query);

            while ($rs = $eventnameResult->fetch_array(MYSQLI_ASSOC)) {
                $retrieveEventName = $rs["eventname"];
                
            }
    
    if ($retrieveEventName === NULL) {
        $json_out = "[" . json_encode(array(
            "result" => -1
        )) . "]";
    } else {
        $query  = "update helperevent set latitude = '$helperLat', longitude = '$helperLng' WHERE userid='$userid' AND eventname ='$retrieveEventName'";
        
        $result = $conn->query($query);
        if (!$result) {
            $json_out = "[" . json_encode(array(
                "result" => 0
            )) . "]";
        } else {
            $json_out = "[" . json_encode(array(
                "result" => 1
            )) . "]";
        }
    }
    echo $json_out;
    $conn->close();
}
catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    echo $json_out;
}
?>