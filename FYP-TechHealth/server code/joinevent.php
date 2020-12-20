<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");

try {
    $conn  = new mysqli(server, dbuser, dbpw, db);
    
//Check connection
    if ($conn->connect_error) {
       die("Connection failed: " . $conn->connect_error);
    } 

    $eventname = $_GET['eventname'];
  //  $userid = $_GET['userid'];
    $userid1 = $_GET['userid1'];
     $eventpw = $_GET['eventpw'];
   
$result = $conn->query("INSERT INTO joinevent (eventname, userid) SELECT * FROM (SELECT '$eventname', '$userid1') AS tmp WHERE NOT EXISTS ( SELECT * FROM joinevent WHERE eventname = '$eventname' and userid ='$userid1') LIMIT 1");

//printf("Affected rows (INSERT): %d\n", $conn->affected_rows);

    
/* $sql = "UPDATE joinevent
INNER JOIN events ON joinevent.eventname = events.eventname
SET joinevent.datetime = events.datetime, joinevent.location = events.location, joinevent.emergencyperson = events.emergencyperson,joinevent.emergencyno = events.emergencyno,joinevent.orguserid = events.userid,joinevent.status = events.eventstatus
WHERE events.eventname = joinevent.eventname";

if ($conn->query($sql) === TRUE) {
   // echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
} */


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

 // $query = "INSERT INTO joinevent (eventname, userid) SELECT * FROM (SELECT '$eventname', '$userid1') AS tmp WHERE NOT EXISTS ( SELECT * FROM joinevent WHERE eventname = '$eventname' and userid ='$userid1') LIMIT 1;";
   
    //$result1 = mysql_query($query);
   // $result = $conn->query($query);
//printf("Affected rows (INSERT): %d\n", $conn->affected_rows);




  //printf("records affect: %d\n", mysql_affected_rows());
//mysqli_query($conn, "INSERT INTO joinevent (eventname, userid) SELECT * FROM (SELECT '$eventname', '$userid1') AS tmp WHERE NOT EXISTS ( SELECT * FROM joinevent WHERE eventname = '$eventname' and userid ='$userid1') LIMIT 1");
//printf("Affected rows (INSERT): %d\n", mysqli_affected_rows($conn));


     /*  $link = mysql_connect(server, dbuser, dbpw);
   if (!$link) 
   {
       die('Could not connect: ' . mysql_error());
   }
   mysql_select_db('db');

    this should return the correct numbers of deleted records 
      $query = "INSERT INTO joinevent (eventname, userid) SELECT * FROM (SELECT '$eventname', '$userid') AS tmp WHERE NOT EXISTS ( SELECT * FROM joinevent WHERE eventname = '$eventname' and userid ='$userid') LIMIT 1;";

   mysql_query($query);
   printf("records affect: %d\n", mysql_affected_rows()); */
   
     //  $query = "INSERT INTO joinevent (eventname, userid) SELECT * FROM joinevent WHERE NOT EXISTS (SELECT * FROM joinevent WHERE eventname = '$eventname' and userid = '$userid') LIMIT 1;";
   //$query ="Insert into joinevent (eventname, userid) values ('$eventname', '$userid')"; 
   
   //$result = mysql_query($query, $conn);
//$num_rows = mysql_num_rows($result);

//echo "$num_rows Rows\n";


?>