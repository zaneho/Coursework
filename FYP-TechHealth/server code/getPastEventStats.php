<?php header('Access-Control-Allow-Origin: *'); 
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-AuthToken'); 

header("Content-Type: application/json; charset=UTF-8"); 
 include("global.php"); 
 
 
try {
    $rowcountAll    = "";
    $rowcountPresent    = "";
    $rowcountSos    = "";
    
   $conn = new mysqli(server, dbuser, dbpw, db); 
   $eventname = $_GET['eventname']; 
 
   $joinedParticipant = "SELECT * FROM joinevent WHERE eventname = '$eventname'";
 
    $resultAllParticipant = $conn->query($joinedParticipant);
    $rowcountAll=mysqli_num_rows($resultAllParticipant);
    //echo "This is total participant: ".$rowcountAll;
    
    
    $presentParticipant = "SELECT * FROM joinevent WHERE eventname = '$eventname' AND attendance = '1'";
    $resultPresent = $conn->query($presentParticipant);
    $rowcountPresent=mysqli_num_rows($resultPresent);
    //echo "this is present ".$rowcountPresent;
    
    $eventQuery = "SELECT * FROM events WHERE eventname = '$eventname'";
    $result = $conn->query($eventQuery);
    while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
     $startevent = $rs["startevent"];
     $endevent = $rs["endevent"];
    }
    
    //echo "Start: ".$startevent . "  End: ". $endevent;
    $sosQuery = "SELECT * FROM pulserate WHERE sos = '1' AND datetime BETWEEN '$startevent' AND '$endevent'";
    $resultSos = $conn->query($sosQuery);
    $rowcountSos=mysqli_num_rows($resultSos);
    
    //echo "This is sos: ".$rowcountSos;
    
    $outp     = "[";
    
    if ($rowcountAll !== "" && $rowcountPresent !== "" && $rowcountSos !== "")
    {
        $outp .= '{"ParticipantTotal":"' . $rowcountAll . '",';
        $outp .= '"ParticipantPresent":"' . $rowcountPresent . '",';
        $outp .= '"TotalSos":"' . $rowcountSos . '"}';
    }
    else
    {
        $outp .= '{"result":"' . 0 . '"}';
    }
    
$outp .= "]";
$conn -> close();
echo($outp); 

}
catch (Exception $e) {
    $json_out = "[" . json_encode(array(
        "result" => 0
    )) . "]";
    echo $json_out;
} 
?> 