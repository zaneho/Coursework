<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");


    $conn        = new mysqli(server, dbuser, dbpw, db);
    $userid      = $_GET["userid"];
    $eventname = $_GET["eventname"];
    $date = $_GET["date"];
    
    
    $query  = "update events set startevent = '$date' where eventname = '$eventname'";
    $result = $conn->query($query);
    
    //sk
    $query1 = "SELECT userid FROM events where userid='$userid' and startevent IS NOT NULL and endevent IS NULL";
    $result1 = $conn->query($query1);
    $row_cnt = $result1->num_rows;
        
    if (($row_cnt) > 0){
        $query2 = "SELECT userid FROM device where userid='$userid'";
        $result2 = $conn->query($query2);
        $row_cnt = $result2->num_rows;
        if (($row_cnt) == 0){
            $result3 = $conn->query("INSERT INTO device (userid,status) values ('$userid','Ongoing')"); 
        }
        else{
            $result3 = $conn->query("UPDATE device set status = 'Ongoing' where userid = '$userid'");
        }
    }
    //sk
        
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
    
    echo $json_out;
    $conn->close();


?>