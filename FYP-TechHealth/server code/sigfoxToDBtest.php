<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");
date_default_timezone_set('Asia/Singapore');



try {
    $conn         = new mysqli(server, dbuser, dbpw, db);
    
    
    $msg = decodeMessage($_GET['message'], ['d1','d2']);
    
    
    
    $mes = implode(' ', $msg);

    
    $deviceid     = $_GET['deviceid'];
    $latitude     = $_GET['latitude'];
    $longitude     = $_GET['longitude'];
    $datetime =  date('Y-m-d H:i:s', strtotime(date("Y-m-d H:i:s")) + (date("Z")*-0.987));
    
    $query        = "insert into pulserate (deviceid, bpm, latitude, longitude, datetime) values ('$deviceid','$mes','$latitude','$longitude', '$datetime')";
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
    
    
    echo "This is msg " .$msg."]";
    echo "This is mes " .$mes;
}



catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    echo $json_out;
}
?>