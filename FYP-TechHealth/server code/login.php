<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ERROR);
include("global.php");
try {
    $organiser     = $_GET['organiser'];//sk
    $found    = 0;
    $conn     = new mysqli(server, dbuser, dbpw, db);
    $userid   = $_GET['userid'];
     //$password = $_GET['password'];
     //$password = md5($password);
    $password     = md5($_GET['password']);
    
   // $password=md5($_GET['password']);
    
  /*  $password = md5($_POST['password']);
    $password = stripcslashes($password);
    $password = mysql_real_escape_string($password);
    $password = htmlspecialchars($password); */
    
    $query    = "SELECT usertype from user where BINARY userid ='$userid' and BINARY password = '$password'";
    
//$query=  "SELECT usertype FROM user WHERE userid='$userid' AND password = '$password'";
 
 
    $result   = $conn->query($query);
  

  
  

  
  
  
    $outp     = "[";
    while ($rs = $result->fetch_array(MYSQLI_ASSOC)) {
        if ($outp != "[") {
            $outp .= ",";
        }
        $outp .= '{"result":"' . $rs["usertype"] . '"}';
        $found = 1;

        
    }
    
    
  

    
    if ($organiser == "1") {//sk
      // $result = $conn->query("INSERT INTO device (tag,userid) SELECT eventname, userid FROM events where eventstatus='Current' and userid='$userid'"); //fal
     // $result = $conn->query("UPDATE device SET tag = 'organiser' WHERE userid = '$userid'");
     // $result = $conn->query("insert into device (email) values ('organiser')");//sk
    
       // $query1 = "SELECT userid FROM events where eventstatus='Current' and userid='$userid' and startevent IS NOT NULL and endevent IS NULL";
       // $result1 = $conn->query($query1);
       // $row_cnt = $result1->num_rows;
        
        // if (($row_cnt) > 0){
       //  $result = $conn->query("INSERT INTO device (userid,status) values ('$userid','Active')");  
       //  }
         

    
    
}



    if ($found == 0) {
        $outp .= '{"result":"-1"}';
    }
    $outp .= "]";
    echo $outp;
    $conn->close();
}

catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => -1
    )) . "]";
    echo $json_out;
}
?>