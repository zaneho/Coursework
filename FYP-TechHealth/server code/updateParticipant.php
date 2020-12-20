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
    $height = $_GET["height"];
    $weight = $_GET["weight"];
    
    $query       = "select count(*) as found from user where BINARY userid = '$userid'";
    
    $result      = $conn->query($query);
    $count       = $result->fetch_array(MYSQLI_NUM);
    $found       = $count[0];
    
    if ($found == 0) {
        $json_out = "[" . json_encode(array(
            "result" => -1
        )) . "]";
    } else {
        $query  = "update user_participant set height = '$height', weight = '$weight', bmi = $weight/ (($height/100) * ($height/100))  where BINARY userid = '$userid'";
       
       //$query1 = "update user_participant SET bmi = $weight/ (($height/100) * ($height/100))";
        
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