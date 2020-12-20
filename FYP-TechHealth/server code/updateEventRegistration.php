<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");



try {
    $conn        = new mysqli(server, dbuser, dbpw, db);
    
    /* disable autocommit */
    $conn->autocommit(FALSE);

    $eventname      = $_GET["eventname"];
    $stringDrpValue = $_GET["stringDrpValue"];
    $stringCbValue = $_GET["stringCbValue"];
    $stringPartName = $_GET["stringPartName"];
    
    $arrDrpValue = explode(',',$stringDrpValue);
    $arrCbValue = explode(',',$stringCbValue);
    $arrStringName = explode(',',$stringPartName);
    
    for($i=0; $i < count($arrStringName); $i++){
        //echo $arrStringName[$i] . "#" . $arrDrpValue[$i] . "#" . $arrCbValue[$i];
        $deviceid = $arrDrpValue[$i];
        $attendance = $arrCbValue[$i];
        //$name = $arrStringName[$i];
        $userid = $arrStringName[$i];
        
        
            // $getUserid = "SELECT * from user_participant where name = '$name'";
            // $useridResult = $conn->query($getUserid);

            // while ($rs = $useridResult->fetch_array(MYSQLI_ASSOC)) {
            //     $userid = $rs["userid"];
            //     //echo $userid;
            // }
        $result   = $conn->query("SELECT * FROM user_participant WHERE name = '$userid'");
        while($rs = $result->fetch_array(MYSQLI_ASSOC)) { 
                    $outp =$rs["userid"];
        }
        
        if($attendance == 1){
            
            
            $oneQuery = "UPDATE joinevent SET deviceid = '$deviceid', attendance = b'1' where userid = '$outp' AND eventname = '$eventname';";
        }else
        {
            $oneQuery = "UPDATE joinevent SET deviceid = '$deviceid', attendance = b'0' where userid = '$outp' AND eventname = '$eventname';";
        }
        $query .= $oneQuery;
        
    }
    //echo $query;
    $result      = $conn->multi_query($query);
    
   if (!$result) {
            $conn->rollback();
            
            $json_out = "[" . json_encode(array(
                "result" => 0
            )) . "]";
        } else {
            $conn->commit();
            
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