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
    
    $userid   = $_GET["userid"];
    $usertype = $_GET['usertype'];
    
    if ($usertype == "organiser")
    {
        $query    = "SELECT * from user right join user_organiser on user.userid = user_organiser.userid where BINARY user.userid = '$userid'";
    }
    else if ($usertype == "helper")
    {
        $query    = "SELECT * from user right join user_helper on user.userid = user_helper.userid where BINARY user.userid = '$userid'";
    }
    else {
        $query    = "SELECT * from user right join user_participant on user.userid = user_participant.userid where BINARY user.userid ='$userid'";
    }
    
    
    $result   = $conn->query($query);
    $outp     = "[";
    while ($rs = $result->fetch_array(MYSQLI_ASSOC)) {
        if ($outp != "[") {$outp .= ",";}
        
    if ($usertype == 'organiser')
    {
        $outp .= '{"name":"' . $rs["orgname"] . '",';
        $outp .= '"Email":"' . $rs["orgemail"] . '"}';
    }
    else if ($usertype == 'helper')
    {
        $outp .= '{"name":"' . $rs["name"] . '",';
        $outp .= '"Email":"' . $rs["email"] . '"}';
    }
    elseif ($usertype == 'participant') {
        $outp .= '{"name":"' . $rs["name"] . '",';
        $outp .= '"NRIC":"' . $rs["nric"] . '",';
        $outp .= '"Email":"' . $rs["email"] . '",';
        $outp .= '"DOB":"' . $rs["dob"] . '",';
        $outp .= '"height":"' . $rs["height"] . '",';
        $outp .= '"weight":"' . $rs["weight"] . '"}';
    }
}
$outp .= "]";
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