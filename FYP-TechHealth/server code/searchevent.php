<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken');
header("Content-Type: application/json; charset=UTF-8");
include ("global.php");

$conn = new mysqli(server, dbuser, dbpw, db);
$eventname = $_GET['eventname'];
$search = $_GET['search'];
$query = "select userid, eventname, datetime from events where (eventname = '".$search."') and eventstatus != 'Past' and startevent is null ";
$result = $conn->query($query);
$outp = "[";

while ($rs = $result->fetch_array(MYSQLI_ASSOC))
	{
	if ($outp != "[")
		{
		$outp.= ",";
		}

	$outp.= '{"eventname":"' . $rs["eventname"] . '",';
	$outp.= '"datetime":"' . $rs["datetime"] . '",';
	$outp.= '"userid":"' . $rs["userid"] . '"}';
	}

$outp.= "]";
$conn->close();
echo ($outp); 

?>
