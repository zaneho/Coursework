<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");

try {
    $conn         = new mysqli(server, dbuser, dbpw, db);
    
//Check connection
    if ($conn->connect_error) {
       die("Connection failed: " . $conn->connect_error);
    } 

    $eventname    = $_GET['eventname'];
    $datetime     = $_GET['datetime'];
    $location1     = $_GET['location1'];
  //  $eventstatus   = $_GET['eventstatus'];
    $emergencyperson  = $_GET['emergencyperson'];
    $emergencyno   = $_GET['emergencyno'];
    $userid = $_GET['userid'];
    $eventpw = $_GET['eventpw'];
    
    $query        = "insert into events (eventname, datetime, location, emergencyperson, emergencyno, userid, eventpw) values ('$eventname','$datetime','$location1', '$emergencyperson', '$emergencyno', '$userid', '$eventpw')";
    $result       = $conn->query($query);
    
   
  /*  date_default_timezone_set('Asia/Singapore');
$date = date('Y-m-d H:i:s', strtotime(date("Y-m-d H:i:s")) + (date("Z")*-0.987));
$ts   = strtotime($date);
$date1 =  date('Y-m-d', $ts); */

date_default_timezone_set('Asia/Singapore');

/* $DateTime = new DateTime();
 $DateTime->modify('-8 hours');
 $DateTime->format("Y-m-d");
*/
//Date('Y-m-d') current_date
   // (DATE_FORMAT(CURRENT_DATE - 1 , '%Y-%m-%d'))
   
  $sql = "UPDATE events
SET eventstatus =
  CASE
    WHEN (DATE_FORMAT(datetime, '%Y-%m-%d')) =  date_format((NOW() - INTERVAL 8 HOUR), '%Y-%m-%d')
      THEN 'Current'
    WHEN datetime > now()
      THEN 'Upcoming'
    ELSE 'Past'
  END";

if ($conn->query($sql) === TRUE) {
   // echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
} 



if ($conn->affected_rows==0 || $conn->affected_rows==-1 ){
    
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