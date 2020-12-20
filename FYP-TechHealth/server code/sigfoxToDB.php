<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");
date_default_timezone_set('Asia/Singapore');



try {
    $conn         = new mysqli(server, dbuser, dbpw, db);
    $sigfoxLat;
    $sigfoxLng;
    //$msg = decodeMessage($_GET['message'], ['d1']);
    //$mes = implode(' ', $msg);
    
    //############ Hexidecimal to String https://stackoverflow.com/questions/14674834/php-convert-string-to-hex-and-hex-to-string
    function hexToStr($hex){
        $string='';
        for ($i=0; $i < strlen($hex)-1; $i+=2){
            $string .= chr(hexdec($hex[$i].$hex[$i+1]));
        }
        return $string;
    }
    //############ Hexidecimal to String End ######################
    
    $msg = $_GET['message'];
    $mes = hexToStr($msg);

    //Get the first character.
    $mesFirstCharacter = $mes[0];
    
    $deviceid     = $_GET['deviceid'];
    
    $datetime =  date('Y-m-d H:i:s', strtotime(date("Y-m-d H:i:s")) + (date("Z")*-0.987));

    
    $seqNumber = $_GET['seqNumber'];
    echo "This is seqNumber ".$seqNumber. "\xA";

    if ($mesFirstCharacter == "@"){ //Sigfox send regular inflow of bpm
        $mes = explode("@", $mes);
        $mes = $mes[1];
        echo "This is mesRegularBpm ". $mes. "\xA";
        $query = "insert into pulserate (deviceid, bpm, datetime) values ('$deviceid','$mes','$datetime')";    
    } 
    else if ($mesFirstCharacter == "!"){ //Help button pressed
        $mes = explode("!", $mes);
        $mes = $mes[1];
        echo "This is mesSOSbpm". $mes. "\xA";
        $query = "insert into pulserate (deviceid, bpm, sos, datetime) values ('$deviceid','$mes','1','$datetime')";
    } 
    else if ($mesFirstCharacter == "#"){ //Sigfox send lat
        $mes = explode("#", $mes);
        $mes = $mes[1];
        $sigfoxLat = $mes;
        echo "This is mesLat". $mes. "\xA";
        
        $maxDateTimeQuery = "select max(datetime) from pulserate where deviceid = '$deviceid'";
        $maxDateTimeResult = $conn->query($maxDateTimeQuery);
        
        if ($maxDateTimeResult->num_rows > 0) {
            // output data of each row
            while($row = $maxDateTimeResult->fetch_assoc()) {
                $maxDateTime = $row["max(datetime)"];
                echo "maxdate: " . $row["max(datetime)"]. "\xA";
            }
            $query = "update pulserate set latitude = '$mes' where deviceid = '$deviceid' AND datetime = '$maxDateTime'";    
        } else {
            break;
        }
        
        //$differenceInSeconds = $time - $maxDateTime;
        //if ($differenceInSeconds < 180) { //3 min
            //$query = "update pulserate set latitude = '$mes' where deviceid = '$deviceid' AND datetime = '$maxDateTime'";    
        //}
        //else{
         //   break; 
        //}
    } 
    else if ($mesFirstCharacter == "$"){ //Sigfox send lng
        $mes = explode("$", $mes);
        $mes = $mes[1];
        $sigfoxLng = $mes;
        echo "This is mesLng". $mes. "\xA";
        
        $maxDateTimeQuery = "select max(datetime) from pulserate where deviceid = '$deviceid'";
        $maxDateTimeResult = $conn->query($maxDateTimeQuery);
        
        if ($maxDateTimeResult->num_rows > 0) {
            // output data of each row
            while($row = $maxDateTimeResult->fetch_assoc()) {
                $maxDateTime = $row["max(datetime)"];
                echo "maxdate: " . $row["max(datetime)"]. "\xA";
            }
            $query = "update pulserate set longitude = '$mes' where deviceid = '$deviceid' AND datetime = '$maxDateTime'";
        } else {
            break; 
        }
        
        //$differenceInSeconds = $time - $maxDateTime;
        //if ($differenceInSeconds < 180) { //3 min
        //    $query = "update pulserate set longitude = '$mes' where deviceid = '$deviceid' AND datetime = '$maxDateTime'";
        //}
        //else{
        //   break; 
        //}
    } 
    else {
        echo "No special character found";
        break; 
    }
    $result       = $conn->query($query);
    
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
    
    echo "\xA"."This is HexToString function". hexToStr($_GET["message"]). "\xA";
    echo "This is mes " .$mes. "\xA";
}
catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    echo $json_out;
}

 //search the database for the email address based on sigfox equipment ID
    $conn = new mysqli(server, dbuser, dbpw, db);
    $deviceid = $_GET['deviceid'];
    $userid   = $_GET['userid'];
    $result = $conn->query("select userid from device where status = 'Ongoing'");
    $sos = hexToStr($msg);

    
    //Get the first character.
    $sosFirstCharacter = $sos[0];
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
	    $outp = $rs["userid"];
    }
    
    $result = $conn->query("SELECT eventname FROM events where startevent IS NOT NULL and endevent IS NULL");
    //$query1 = "SELECT eventname FROM events where startevent IS NOT NULL and endevent IS NULL";
    while ($rs = $result->fetch_array(MYSQLI_ASSOC)) {
     
        $eventname = $rs["eventname"];
        $result2 = $conn->query("SELECT userid FROM joinevent where eventname='$eventname' and deviceid = '$deviceid'");
        //$query2 = "SELECT userid FROM joinevent where eventname='$eventname' and deviceid = '$deviceid'";
        while ($rs2 = $result2->fetch_array(MYSQLI_ASSOC)) {
           $userid = $rs2["userid"];
           $participantUserId = $rs2["userid"];
        }
    }
    
    $conn->close();

    $result = decodeMessage($_GET['message'], ['d1']);

	$email = $outp;
	$message = implode(" ",$result); 
        
	$arrayfull = [];

	$arrayhead = array("field" => "tag", "key" => "email", "relation" => "=");
	$emailArray = explode(',', $email);

	if (count($emailArray) == 1) {
		$arrNew = array('value' => $emailArray[0]);
		$arrayhead = $arrayhead + $arrNew;
		array_push($arrayfull, $arrayhead);
	}
	else {
		foreach ($emailArray as &$value) {
			$arrOr = array('operator' => 'OR');
			$arrNew = $arrayhead + array("value" => $value);
			array_push($arrayfull, $arrayNew);
			array_push($arrayfull, $arrOr);
		}
	}
    
    //Participant holding device ' .$deviceid. ' has a bpm of '. $mes



        
        if ($sosFirstCharacter == "!"){
    	$response = sendMessage($email, "sos from $userid wearing deviceid: $deviceid", $arrayfull);
    //	$response = sendMessage($email, "sos", $arrayfull);
    	$return["allresponses"] = $response;
    	$return = json_encode( $return);
        }
        elseif ($sosFirstCharacter == "@"){
        $response = sendMessage($email, "$userid wearing deviceid: $deviceid has a bpm of $mes and requires immediate medical attention" , $arrayfull);
    //	$response = sendMessage($email, $mes , $arrayfull);
    	$return["allresponses"] = $response;
    	$return = json_encode( $return); 
        }
    
    
	//find the end of the recipient string in the response
	$pos = strpos($return, '"recipients":');
	$posend = $pos + 15;

	$lastchunk = substr($return, $posend, strlen($return)-$posend+1);
	$commapos = strpos($lastchunk, ",");
	$bracketpos = strpos($lastchunk, "}");

	if ($commapos != null){
		$num = substr($lastchunk, 0, $commapos);
	}
	else {
		$num = substr($lastchunk, 0, $bracketpos);
	}

	$json_out = "[" . json_encode(array("result"=>(int)$num)) . "]";
	echo $json_out;
	
	
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ZANE: Send noti to helper START

    $conn = new mysqli(server, dbuser, dbpw, db);
    $deviceid = $_GET['deviceid'];
    $userid   = $_GET['userid'];
    
    //$today =  date('Y-m-d', strtotime(date("Y-m-d")) + (date("Z")*-0.987));
    //echo $today;
    $today = date("Y-m-d"); 
    
    //#RETRIEVE participant lat from DB
    if ($sigfoxLng !== NULL){
        $getSigfoxLat = $conn -> query("SELECT bpm, latitude FROM pulserate WHERE deviceid = '$deviceid' AND longitude = '$sigfoxLng'");
        $sigfoxLat = '0.000000';
        while($rs = $getSigfoxLat->fetch_array(MYSQLI_ASSOC)) {
    	    $sigfoxLat = $rs["latitude"];
    	    $getBpm = $rs["bpm"];
    	   // echo "This is getSigfoxLat".$rs["latitude"]. "\xA";
        }
        
        if ($sigfoxLat !== '0.000000')
        {
            //which event the deviceid is used
            $getEventWhereDeviceUsed = $conn -> query("SELECT * FROM joinevent 
                                                        JOIN events ON joinevent.eventname=events.eventname 
                                                        WHERE events.startevent IS NOT NULL AND events.endevent IS NULL
                                                        AND joinevent.deviceid = '$deviceid'");
                                                        
            while($rs = $getEventWhereDeviceUsed->fetch_array(MYSQLI_ASSOC)) {
        	    $EventWhereDeviceUsed = $rs["eventname"];
        	    echo $EventWhereDeviceUsed. "\xA";
            }                                        
            
            //see if deviceid already assigned to a helper
            $searchDeviceIdWithAssignedHelper = $conn -> query("SELECT DISTINCT deviceid from AssignedHelper 
                                                        WHERE eventname='$EventWhereDeviceUsed' AND date(datetime) = '$today' 
                                                        AND helperid IS NOT NULL AND status != 'completed' OR status IS NULL");
    
                while($rs = $searchDeviceIdWithAssignedHelper->fetch_array(MYSQLI_ASSOC)) {
        	        $deviceIdWithAssignedHelper = $rs["deviceid"];
        	        echo "This is deviceIdwithAssignedHelper" .$deviceIdWithAssignedHelper. "\xA";
        	        if ($deviceid == $deviceIdWithAssignedHelper){
        	            $alreadyAssignHelperToDevice = 1;
        	        }
                }        
            //echo "This is alreadyAssignHelperToDevice ". $alreadyAssignHelperToDevice. "\xA";
            if ($alreadyAssignHelperToDevice == 0) //if device not assigned to helper, proceed
            {
                //Search busy helper today in the event
                
                $searchBusyHelper = $conn -> query("SELECT DISTINCT helperid from AssignedHelper WHERE eventname='$EventWhereDeviceUsed' AND date(datetime) = '$today' AND status != 'completed' OR status IS NULL");
                $row_cnt = $searchBusyHelper->num_rows;
                
                $searchBusyHelperArray = array();
                if ($row_cnt > 0){ //if have busy helper for that event, add AND userid NOT IN ($implodeBusyHelperArray) in query for nearest helper
                    while($rs = $searchBusyHelper->fetch_array(MYSQLI_ASSOC)) {
            	        $useridOfBusyHelper = $rs["helperid"];
            	        $searchBusyHelperArray[] = "'".$useridOfBusyHelper."'";
            	        echo "This is useridOfBusyHelper: ".$useridOfBusyHelper. "\xA";
                    }
                    
                    foreach ($useridOfBusyHelper as $value) {
                         echo "this is Value:". $value. "\xA";
                    }
                    
                    $implodeBusyHelperArray = implode(', ', $searchBusyHelperArray);
                    echo $implodeBusyHelperArray;
                    
                    $queryNearestHelper = "SELECT *, 
                                    ( 6371 * ACOS( COS(RADIANS('$sigfoxLat')) * COS(RADIANS(latitude)) * COS( RADIANS(longitude) - RADIANS('$sigfoxLng') ) + SIN(RADIANS('$sigfoxLat')) * SIN(RADIANS(latitude)) ) ) AS distance 
                                    FROM helperevent 
                                    WHERE eventname = '$EventWhereDeviceUsed' 
                                    AND userid NOT IN ($implodeBusyHelperArray)
                                    AND attendance = 1
                                    ORDER BY distance ASC
                                    Limit 1";
            
                }
                else{ //no busy helper in event
                    $queryNearestHelper = "SELECT *, 
                                    ( 6371 * ACOS( COS(RADIANS('$sigfoxLat')) * COS(RADIANS(latitude)) * COS( RADIANS(longitude) - RADIANS('$sigfoxLng') ) + SIN(RADIANS('$sigfoxLat')) * SIN(RADIANS(latitude)) ) ) AS distance 
                                    FROM helperevent 
                                    WHERE eventname = '$EventWhereDeviceUsed' 
                                    AND attendance = 1
                                    ORDER BY distance ASC
                                    Limit 1";
                }
        
                //#SEARCH NEAREST HELPER, compare retrieve participant coordinates compare with all helper with current
                
                //https://stackoverflow.com/questions/2234204/latitude-longitude-find-nearest-latitude-longitude-complex-sql-or-complex-calc
                //'SELECT *, ( 6371 * ACOS( COS(RADIANS(@originlat)) * COS(RADIANS(latitude)) * COS( RADIANS(longitude) - RADIANS(@originlng) ) + SIN(RADIANS(@originlat)) * SIN(RADIANS(latitude)) ) ) AS distance FROM helperevent HAVING distance < 10 ORDER BY distance';
                echo $queryNearestHelper. "\xA";;
                $getNearestHelper = $conn-> query($queryNearestHelper);
                
                while($rs = $getNearestHelper->fetch_array(MYSQLI_ASSOC)) {
            	    $useridOfHelperToSendNoti = $rs["userid"];
            	    
            	    echo $rs["eventname"]. "\xA";;
            	    echo "This is rs['distance']".$rs["distance"]. "\xA";
            	    echo "This is useridOfHelperToSendNoti: ".$rs["userid"]. "\xA";
                }
        
        
                if ($useridOfHelperToSendNoti !== NULL){ //if there is helper available
                    $insertAssignedHelper = $conn -> query("INSERT INTO AssignedHelper(helperid, eventname, deviceid, datetime)  
                                                            VALUES ('$useridOfHelperToSendNoti','$EventWhereDeviceUsed', '$deviceid', '$datetime')");
                }else
                {
                    $insertAssignedHelper = $conn -> query("INSERT INTO AssignedHelper(eventname, deviceid, datetime)  
                                                            VALUES ('$EventWhereDeviceUsed', '$deviceid', '$datetime')");
                }
                
            //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                $result = decodeMessage($_GET['message'], ['d1']);
            
             	$email = $useridOfHelperToSendNoti;
                echo "This is useridOfHelperToSendNoti ". $useridOfHelperToSendNoti; 
            	$message = implode(" ",$result); 
                    
            	$arrayfull = [];
            
            	$arrayhead = array("field" => "tag", "key" => "email", "relation" => "=");
            	$emailArray = explode(',', $email);
            
            	if (count($emailArray) == 1) {
            		$arrNew = array('value' => $emailArray[0]);
            		$arrayhead = $arrayhead + $arrNew;
            		array_push($arrayfull, $arrayhead);
            	}
            	else {
            		foreach ($emailArray as &$value) {
            			$arrOr = array('operator' => 'OR');
            			$arrNew = $arrayhead + array("value" => $value);
            			array_push($arrayfull, $arrayNew);
            			array_push($arrayfull, $arrOr);
            		}
            	}
                
                //Participant holding device ' .$deviceid. ' has a bpm of '. $mes
        
        
        
            $sos = hexToStr($msg);
            
                
                //Get the first character.
                $sosFirstCharacter = $sos[0];
                
                if ($sosFirstCharacter == "!"){
            	$response = sendMessage($email, "sos from $participantUserId wearing deviceid: $deviceid", $arrayfull);
            	$return["allresponses"] = $response;
            	$return = json_encode( $return);
                }
                else{
                $response = sendMessage($email, "$participantUserId wearing deviceid: $deviceid has a bpm of $getBpm and requires immediate medical attention" , $arrayfull);
            	$return["allresponses"] = $response;
            	$return = json_encode( $return); 
                }
                
                echo "This is participantUserId". $participantUserId;
                
            	//find the end of the recipient string in the response
            	$pos = strpos($return, '"recipients":');
            	$posend = $pos + 15;
            
            	$lastchunk = substr($return, $posend, strlen($return)-$posend+1);
            	$commapos = strpos($lastchunk, ",");
            	$bracketpos = strpos($lastchunk, "}");
            
            	if ($commapos != null){
            		$num = substr($lastchunk, 0, $commapos);
            	}
            	else {
            		$num = substr($lastchunk, 0, $bracketpos);
            	}
            
            	$json_out = "[" . json_encode(array("result"=>(int)$num)) . "]";
            	echo $json_out;
            }
        }
    }
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ZANE send noti to helper END
?>