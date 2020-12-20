<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");



try {
    $conn        = new mysqli(server, dbuser, dbpw, db);

    $id      = $_GET["id"];
    $status = $_GET["status"];
            
            $selectStatusQuery = "SELECT status, helperid FROM AssignedHelper WHERE AssignmentId = '$id'";
            $selectStatus = $conn->query($selectStatusQuery);
             while($rs = $selectStatus->fetch_array(MYSQLI_ASSOC)) {
                 $selectStatus = $rs["status"]; 
                 $selectHelperId = $rs["helperid"]; 
                 //echo "This is selectstatus" .$selectStatus;
                 
                if ($status == "acknowledged" && $selectStatus == "completed" 
                    || $status == "acknowledged" && $selectStatus == "acknowledged"
                    ){
                    $json_out = "[" . json_encode(array(
                                "result" => -1
                            )) . "]";
                }
                else
                {
                    $query = "UPDATE AssignedHelper SET status = '$status' WHERE AssignmentId = '$id'";
                   
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
            }
            
            
            
            $conn->close();
}
catch (Exception $e) {
   $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    echo $json_out;
}
?>