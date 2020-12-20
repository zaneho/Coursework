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

    $eventname = $_GET['eventname'];
    $userid = $_GET['userid'];
    
  //  $query = "INSERT INTO joinevent (eventname, userid) SELECT * FROM joinevent WHERE NOT EXISTS (SELECT * FROM joinevent WHERE eventname = '$eventname' and userid = '$userid') LIMIT 1;";
   //$query ="Insert into joinevent (eventname, userid) values ('$eventname', '$userid')"; 
   
   $query = "INSERT INTO joinevent (eventname, userid) SELECT * FROM (SELECT '$eventname', '$userid') AS tmp WHERE NOT EXISTS ( SELECT * FROM joinevent WHERE eventname = '$eventname' and userid ='$userid') LIMIT 1;";
    $result = $conn->query($query);
   // $results = mysql_query($query);
  //  $numResults = mysql_num_rows($results);

//$numResults = mysql_num_rows($results);










 /*   if(!$result){
          $json_out = "[" . json_encode(array(
            "result" => 0
        )) . "]";
    }

    if (conn_num_rows($result)>0){
        $row = mysql_fetch_array($result);
        
                $json_out = "[" . json_encode(array(
            "result" => 1
        )) . "]";

    }

    else{
        echo "not found!";
    }

    $conn->close();
} */

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

    
   /* if(mysql_num_rows($result) > 0)
    while($row = mysql_fetch_array($result))
    {
        $json_out = "[" . json_encode(array(
            "result" => 1
        )) . "]";
    }
else {
            $json_out = "[" . json_encode(array(
            "result" => 1
        )) . "]";
    
}
    echo $json_out;
    $conn->close();
}   */

 catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    echo $json_out;
} 

?>