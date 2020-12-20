<?php header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken'); 

header("Content-Type: application/json; charset=UTF-8"); 
 include("global.php"); 
 date_default_timezone_set('Asia/Singapore');
 
 $conn = new mysqli(server, dbuser, dbpw, db); 
 $userid = $_GET['userid']; 
 $usertype = $_GET['usertype']; 

 //$datetime =  date('Y-m-d H:i:s', strtotime(date("Y-m-d H:i:s")) + (date("Z")*-0.987));
 $yesterday = date('Y-m-d h:i:s',strtotime("-3 days"));
 
//echo $datetime;
//echo $yesterday;
 if($usertype == 'helper'){
    $query = "SELECT * FROM AssignedHelper WHERE helperid = '$userid' AND date(datetime) >= '$yesterday' ORDER BY datetime DESC"; 
    
    $getNotification = $conn->query($query);
                     $outp = "["; 
                     while($rs = $getNotification->fetch_array(MYSQLI_ASSOC)) {
                         if ($outp != "[") {$outp .= ",";} 
                            $eventname = $rs["eventname"];
                            $deviceid = $rs["deviceid"];
                            $getParticipantName = $conn->query("SELECT joinevent.userid as id, user_participant.name as userid FROM joinevent JOIN user_participant ON joinevent.userid=user_participant.userid WHERE eventname='$eventname' AND deviceid='$deviceid' AND attendance='1'");
                            while($rsParticipantName = $getParticipantName->fetch_array(MYSQLI_ASSOC)) {
                            
                            $outp .= '{"helperid":"'  . $rs["helperid"] . '",'; 
                            $outp .= '"id":"' . $rs["AssignmentId"] . '",'; 
                            $outp .= '"eventname":"' . $rs["eventname"] . '",'; 
                            $outp .= '"deviceid":"' . $rs["deviceid"] . '",';
                            $outp .= '"userid":"' . $rsParticipantName["userid"] . '",';
                            $outp .= '"datetime":"' . $rs["datetime"] . '",';
                            $outp .= '"status":"'  . $rs["status"]. '"}';
                         }
                    }
                    $outp .="]"; 
 }
 elseif($usertype == 'organiser'){
     $getOrganiserEvent = $conn->query("SELECT DISTINCT eventname FROM events where userid = '$userid' AND date(startevent) >= '$yesterday'");
     $row_cnt = $getOrganiserEvent->num_rows;
     
     
     $searchTodayEventArray = array();
                if ($row_cnt > 0){ //if today have event
                    while($rs = $getOrganiserEvent->fetch_array(MYSQLI_ASSOC)) {
            	        $todayEventName = $rs["eventname"];
            	        $searchTodayEventArray[] = "'".$todayEventName."'";
            	        //echo "This is todayEventName: ".$todayEventName. "\xA";
                    }
                    
                    // foreach ($searchTodayEventArray as $value) {
                    //      echo "this is Value:". $value. "\xA";
                    // }
                    
                    $implodeTodayEventArray = implode(', ', $searchTodayEventArray);
                    //echo $implodeTodayEventArray;
                    
                    $query ="SELECT * FROM AssignedHelper WHERE  date(datetime) >= '$yesterday' AND eventname IN ($implodeTodayEventArray) ORDER BY datetime DESC";
                    //echo $query;
                    $getNotification = $conn->query($query);
                     $outp = "["; 
                     while($rs = $getNotification->fetch_array(MYSQLI_ASSOC)) {
                         if ($outp != "[") {$outp .= ",";} 
                            $eventname = $rs["eventname"];
                            $deviceid = $rs["deviceid"];
                            $getParticipantName = $conn->query("SELECT joinevent.userid as id, user_participant.name as userid FROM joinevent JOIN user_participant ON joinevent.userid=user_participant.userid WHERE eventname='$eventname' AND deviceid='$deviceid' AND attendance='1'");
                            while($rsParticipantName = $getParticipantName->fetch_array(MYSQLI_ASSOC)) {
                            
                            $outp .= '{"helperid":"'  . $rs["helperid"] . '",'; 
                            $outp .= '"id":"' . $rs["AssignmentId"] . '",'; 
                            $outp .= '"eventname":"' . $rs["eventname"] . '",'; 
                            $outp .= '"deviceid":"' . $rs["deviceid"] . '",';
                            $outp .= '"userid":"' . $rsParticipantName["userid"] . '",';
                            $outp .= '"datetime":"' . $rs["datetime"] . '",';
                            $outp .= '"status":"'  . $rs["status"]. '"}';
                         }
                    }
                    $outp .="]";  
                }
                else{$outp = "[]";}
 }
 else{$outp = "[]";}
 $conn->close(); 
 echo($outp); 
 
?> 