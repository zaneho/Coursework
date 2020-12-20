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
    /*$stringDrpValue = $_GET["stringDrpValue"];*/
    $stringCbValue = $_GET["stringCbValue"];
    $stringPartName = $_GET["stringPartName"];
    
    /*$arrDrpValue = explode(',',$stringDrpValue);*/
    $arrCbValue = explode(',',$stringCbValue);
    $arrStringName = explode(',',$stringPartName);
    
    for($i=0; $i < count($arrStringName); $i++){
        //echo $arrStringName[$i] . "#" . $arrDrpValue[$i] . "#" . $arrCbValue[$i];
        /*$deviceid = $arrDrpValue[$i];*/
        $attendance = $arrCbValue[$i];
        $name = $arrStringName[$i];
        
        
            $getUserid = "SELECT * from user_helper where name = '$name'";
            $useridResult = $conn->query($getUserid);

            while ($rs = $useridResult->fetch_array(MYSQLI_ASSOC)) {
                $userid = $rs["userid"];
                //echo $userid;
            }
        
        if($attendance == 1){
            $oneQuery = "UPDATE helperevent SET attendance = b'1' where userid = '$userid' AND eventname = '$eventname';";
        }else
        {
            $oneQuery = "UPDATE helperevent SET attendance = b'0' where userid = '$userid' AND eventname = '$eventname';";
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