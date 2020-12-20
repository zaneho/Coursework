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
    
    //$query    = "SELECT userid, deviceid, attendance FROM joinevent JOIN user_participant ON user_participant.userid=joinevent.userid WHERE eventname = '$eventname' order by userid";
    $query = "SELECT
                    joinevent.userid as id,
                    joinevent.deviceid,
                    joinevent.attendance,
                    user_participant.name as userid,
                    YEAR(CURDATE()) -YEAR(user_participant.dob) as age
                FROM
                    joinevent
                JOIN
                    user_participant
                ON
                    user_participant.userid = joinevent.userid
                WHERE
                    eventname = '$eventname'
                ORDER BY
                    userid";
    $result   = $conn->query($query);
    $outp = "[";    
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) { 
        if   ($outp != "[") {
            $outp .= ",";
        } 
        $outp .= '{"userid":"' . $rs["userid"] . '",';
        $outp .= '"id":"' . $rs["id"] . '",';
        $outp .= '"deviceid":"' . $rs["deviceid"] . '",';
        $outp .= '"age":"' . $rs["age"] . '",';
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