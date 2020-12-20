<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");

function begin(){
    mysql_query("BEGIN");
}

function commit(){
    mysql_query("COMMIT");
}

function rollback(){
    mysql_query("ROLLBACK");
}

try {
    $conn         = new mysqli(server, dbuser, dbpw, db);
    $deviceid     = $_GET['deviceid'];
    
    $userid     = $_GET['userid'];
    //$password     = $_GET['password'];
    //$password = md5($password); 
    $usertype     = $_GET['usertype'];
    $password     = md5($_GET['password']);
    
    //$EncryptPassword = md5($password);
    
   // $password = md5($_GET['password']);
  
    $query        = "insert into user (userid, password, usertype) values ('$userid', '$password','$usertype');";
    
    if ($usertype == "organiser") {
        $orgname     = $_GET['orgname'];
        $orgemail     = $_GET['orgemail'];
        
        $query        .= "insert into user_organiser (userid, orgname, orgemail) values ('$userid','$orgname','$orgemail');";
        //$query        .= "insert into device (email) values ('organiser');";
    } 
    else if($usertype == "helper"){
        $helperName     = $_GET['helperName'];
        $helperEmail    = $_GET['helperEmail'];
        
        $query        .= "insert into user_helper (userid, name, email) values ('$userid','$helperName','$helperEmail');";
    }
    else {

        $name     = $_GET['name'];
        $nric     = $_GET['nric'];
        $email     = $_GET['email'];
        $dob     = $_GET['dob'];
        $height    = $_GET['height'];
        $weight    = $_GET['weight'];
        $bmi = $weight/ (($height/100) * ($height/100));
        
        $query        .= "insert into user_participant (userid, name, nric, email, dob, height, weight, bmi) values ('$userid','$name','$nric','$email','$dob','$height','$weight','$bmi')";
        // $query1 = "UPDATE user_participant SET bmi = weight/ ((height/100) * (height/100))";

    }
    
   
    
    begin();
    $result       = $conn->multi_query($query);
    
   
    if (!$result) {
        $json_out = "[" . json_encode(array(
            "result" => 0
        )) . "]";
        
        rollback();
        
    } else {
        $json_out = "[" . json_encode(array(
            "result" => 1
        )) . "]";
        
        commit();
        
         $query1 = "UPDATE user_participant SET bmi = weight/ ((height/100) * (height/100)) where bmi = 0.00";
         
    }
    echo $json_out;
    
    $conn->close();
}
catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    
    echo $json_out;
    rollback();
}
?>