<?php
session_start();
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);

date_default_timezone_set('Asia/Singapore');

    const server="43.229.85.45";
    const dbuser="mp05";
    const dbpw="137talkm0re";
    const db="mp05_techealth";
   
   
    const global_app_id = "dc1774ff-bb67-4d04-b844-bdd2101f142b"; 
   const global_rest_id = "NThmZWIxM2MtOGI4My00YzhhLWIxODgtMWNlOWE2NWUzZGVm";

$conn = new mysqli(server, dbuser, dbpw, db);
 $eventname = $_GET['eventname'];
 $userid   = $_GET['userid'];
 
     $result = $conn->query("Select datetime FROM events WHERE eventname = '$eventname'");
     
     while ($rs = $result->fetch_array(MYSQLI_ASSOC)) {
         $datetime = $rs["datetime"];
        $_SESSION['date'] = $datetime;
        $datetime2 = date('Y-m-d H:i:s', strtotime($datetime));
     }
     $conn->close();
     
    
 //$datetime1 = strtotime('$datetime +3 days');
    
//send onesignal notification to mobile user
function sendMessage($email, $message, $arrayfull){
	$content = array(
		"en" => $message
	);
	$datetime = $_SESSION['date'];
	$datetime2 = date('Y-m-d H:i:s', strtotime($datetime));
	$datetime3 = date('Y-m-d H:i:s', strtotime('-24 hours', strtotime($datetime2)));
    $datetime1 = $datetime3 . " GMT+0800";	
    
	$fields = array(
		'app_id' => global_app_id,
		'filters' => $arrayfull,
		'data' => array("foo" => "bar"),
		'contents' => $content,
		'send_after' => $datetime1 //"2018-02-01 23:45:00 GMT+0800" //(2018-01-30 09:45:00 GMT+0800)
	);
		
	$fields = json_encode($fields);
		
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8','Authorization: Basic '. global_rest_id));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_HEADER, FALSE);
	curl_setopt($ch, CURLOPT_POST, TRUE);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	$response = curl_exec($ch);
	curl_close($ch);
		
	return $response;
	 
}

    //search the database for the email address based on sigfox equipment ID
    //$conn = new mysqli(server, dbuser, dbpw, db);
   // $eventname = $_GET['eventname'];
   // $userid   = $_GET['userid'];
  //  $result = $conn->query("Select eventname FROM events WHERE datetime > NOW() - INTERVAL 8 HOUR and DATEDIFF(datetime, now()-INTERVAL 8 hour) between 0 and 1");
  //   while ($rs = $result->fetch_array(MYSQLI_ASSOC)) {
   //      if ($rs["eventname"] == $eventname){
   //         $eventname2 = $eventname;
   //         $result = $conn->query("select userid from joinevent where eventname = '$eventname2' union all select userid from events where eventname = '$eventname2'");
   //         while ($rs = $result->fetch_array(MYSQLI_ASSOC)) {
   //             if ($rs["userid"] == $userid){
   //             $userid1 = $userid;
    //            }
     //       }
    //    }
  //  }

     
   //   $conn->close();
      
      $email = $userid;
     
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
    
     $response = sendMessage($email, "Hi $userid, please be reminded that you have an event tomorrow at $datetime2 ", $arrayfull);
     

?>