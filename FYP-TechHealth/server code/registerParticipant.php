<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");

try {
    $conn         = new mysqli(server, dbuser, dbpw, db);
    
    $userid     = $_GET['userid'];
    $name     = $_GET['name'];
    $nric     = $_GET['nric'];
    $email     = $_GET['email'];
    $dob     = $_GET['dob'];
    $height    = $_GET['height'];
    $weight    = $_GET['weight'];
  //  $bmi = $_GET['bmi'];
    
    
    $query        = "insert into user_participant (userid, name, nric, email, dob, height, weight) values ('$userid','$name','$nric','$email','$dob','$height','$weight')";
    
    $result       = $conn->query($query);
    
   
    if (!$result) {
        $json_out = "[" . json_encode(array(
            "result" => 0
        )) . "]";
    } else {
        $json_out = "[" . json_encode(array(
            "result" => 1
        )) . "]";
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