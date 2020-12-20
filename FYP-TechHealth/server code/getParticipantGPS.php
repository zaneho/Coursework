<?php header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken'); 

header("Content-Type: application/json; charset=UTF-8"); 
 include("global.php"); 
 date_default_timezone_set('Asia/Singapore');
 
 $conn = new mysqli(server, dbuser, dbpw, db); 
 $id = $_GET['id']; 
try{
    $query = "SELECT * FROM AssignedHelper WHERE AssignmentId = '$id'"; 
    
    $getAssignmentHelper = $conn->query($query);
                     $outp = "["; 
                     while($rs = $getAssignmentHelper->fetch_array(MYSQLI_ASSOC)) {
                         $deviceid = $rs["deviceid"];
                         $datetime = $rs["datetime"];
                         
                         $GPSquery = "SELECT * FROM pulserate WHERE deviceid = '$deviceid' AND date(datetime) = date('$datetime')"; 
                         $getGPS = $conn->query($GPSquery);
                         
                         while($rsGPS = $getGPS->fetch_array(MYSQLI_ASSOC)) {
                             $latitude = $rsGPS["latitude"];
                             $longitude = $rsGPS["longitude"];
                         }
                         
                         if ($outp != "[") {$outp .= ",";} 
                            $eventname = $rs["eventname"];
                            $deviceid = $rs["deviceid"];
                            $getParticipantName = $conn->query("SELECT joinevent.userid as id, user_participant.name as userid FROM joinevent JOIN user_participant ON joinevent.userid=user_participant.userid WHERE eventname='$eventname' AND deviceid='$deviceid' AND attendance='1'");
                            while($rsParticipantName = $getParticipantName->fetch_array(MYSQLI_ASSOC)) {
                                $helperid = $rs["helperid"];
                                
                                if ($helperid == ""){
                                    
                                    $outp .= '{"helperid":"'  . $rs["helperid"] . '",'; 
                                            $outp .= '"id":"' . $rs["AssignmentId"] . '",'; 
                                            $outp .= '"eventname":"' . $rs["eventname"] . '",'; 
                                            $outp .= '"deviceid":"' . $rs["deviceid"] . '",';
                                            $outp .= '"userid":"' . $rsParticipantName["userid"] . '",';
                                            $outp .= '"latitude":"' . $latitude . '",';
                                            $outp .= '"longitude":"' . $longitude . '",';
                                            
                                            $outp .= '"helperlatitude":"' . "" . '",';
                                            $outp .= '"helperlongitude":"' . "" . '",';
                                            $outp .= '"datetime":"' . $rs["datetime"] . '",';
                                            $outp .= '"status":"'  . $rs["status"]. '"}';    
                                    
                                }
                                else{
                                                $getHelperGPS = $conn->query("SELECT latitude, longitude FROM helperevent WHERE eventname='$eventname' AND userid = '$helperid'");
                                            while($rsHelperGPS = $getHelperGPS->fetch_array(MYSQLI_ASSOC)) {
                                            
                                            $outp .= '{"helperid":"'  . $rs["helperid"] . '",'; 
                                            $outp .= '"id":"' . $rs["AssignmentId"] . '",'; 
                                            $outp .= '"eventname":"' . $rs["eventname"] . '",'; 
                                            $outp .= '"deviceid":"' . $rs["deviceid"] . '",';
                                            $outp .= '"userid":"' . $rsParticipantName["userid"] . '",';
                                            $outp .= '"latitude":"' . $latitude . '",';
                                            $outp .= '"longitude":"' . $longitude . '",';
                                            
                                            $outp .= '"helperlatitude":"' . $rsHelperGPS["latitude"] . '",';
                                            $outp .= '"helperlongitude":"' . $rsHelperGPS["longitude"] . '",';
                                            $outp .= '"datetime":"' . $rs["datetime"] . '",';
                                            $outp .= '"status":"'  . $rs["status"]. '"}';    
                                            }
                                    
                                }
                                
                                
                                
                                
                         }

                    $outp .="]"; 
                }
    $conn->close(); 
    echo($outp); 
}
catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => -1
    )) . "]";
    echo $json_out;
}
    

 
 
?> 