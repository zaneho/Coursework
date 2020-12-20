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
    //$password = $_GET["oldPw"];
    //$newpassword = $_GET["newPw"];
    
    $password = $_GET["oldPw"];
    $newpassword = md5($_GET["newPw"]);
    
    $query       = "select count(*) as found from user where BINARY userid = '$userid' and BINARY password = '$password'";
    
    $result      = $conn->query($query);
    $count       = $result->fetch_array(MYSQLI_NUM);
    $found       = $count[0];
    
    if ($found == 0) {
        $json_out = "[" . json_encode(array(
            "result" => -1
        )) . "]";
    } else {
        $query  = "update user set password = '$newpassword' where BINARY userid = '$userid'";
        
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