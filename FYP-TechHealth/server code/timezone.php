<!DOCTYPE html>
<html>
<body>

<?php

// AARON
/*select pulserate.*, events.eventname, events.startevent, events.endevent, joinevent.userid, joinevent.eventname, joinevent.deviceid, user_participant.bmi 
from pulserate,events, joinevent,user_participant where 
events.startevent is not null and events.endevent is not null
and pulserate.datetime between events.startevent and events.endevent and 
events.eventname = joinevent.eventname and pulserate.deviceid = joinevent.deviceid and user_participant.userid = joinevent.userid and user_participant.bmi < 18 */

//FAICIA
/*
SELECT joinevent.userid FROM pulserate, events, joinevent, user_participant 
                                WHERE events.startevent is not null and events.endevent is not null 
                                AND pulserate.datetime between events.startevent and events.endevent 
                                AND events.eventname = joinevent.eventname 
                                AND pulserate.deviceid = joinevent.deviceid 
                                AND user_participant.userid = joinevent.userid 
                                AND user_participant.bmi BETWEEN 18.5 AND 24.99
*/

date_default_timezone_set('Asia/Singapore');
//$date = new DateTime();
//$date = (date("Z")*-0.987);
$date = date('Y-m-d H:i:s', strtotime(date("Y-m-d H:i:s")) + (date("Z")*-0.987));
//echo $date;
//echo "Today is " . date("Y/m/d");
//print('Next Date ' . current_date('Y-m-d', strtotime('-1 day', strtotime($date_raw))));

//echo date('Y-m-d', $date);

$ts   = strtotime($date);
$date1= date('Y-m-d', $ts);

echo $date;
echo $date1;


$timezone = date_default_timezone_get();
echo "The current server timezone is: " . $timezone;

//date_default_timezone_set('Australia/Melbourne');
//$date = date('m/d/Y h:i:s a', time());

//echo $date;
 
 $date3= date('Y-m-d h:i:s a') ;
echo $date3;



 $DateTime = new DateTime();
 $DateTime->modify('-8 hours');
 echo $DateTime->format("Y-m-d");
 
//= date("Y-m-d H:i:s", $date);

//strtotime(date("Y-m-d")) + (date("Z")*-1));


/*

//echo date_default_timezone_get();

/* $t=time();
echo($t . "<br>");
echo(date("Y-m-d",$t));


$date=date_create();
 echo date_timestamp_get($date); 

date_default_timezone_set('Asia/Kolkata'); 

$dt2=date("Y-m-d H:i:s");
echo $dt2; */





/* date_default_timezone_set('Asia/Singapore');
echo 'Local time : '.date("r").'<br>'; // local time
echo 'Offset : '.date("Z").'<br>'; // time zone offset from UTC in seconds 
echo 'UTC time : '.date('Y-m-d H:i:s', strtotime(date("Y-m-d")) + (date("Z")*-1)); echo '<br><br>'; // this is utc time converted from Local time */

/* date_default_timezone_set('Asia/Singapore');
 'Local time : '.date("r").'<br>'; // local time
'Offset : '.date("Z").'<br>'; // time zone offset from UTC in seconds 
echo date('Y-m-d H:i:s', strtotime(date("Y-m-d H:i:s")) + (date("Y-m-d H:i:s")*-0.987)); // this is UTC time converted from Local time */

/* date_default_timezone_set('Asia/Singapore');
 'Local time : '.date("r").'<br>'; // local time
'Offset : '.date("Z").'<br>'; // time zone offset from UTC in seconds */
//$date =  date('r', strtotime(date("r")) + (date("Z")*-0.987)); // this is UTC time converted from Local time

//echo $date->format('Y-m-d H:i:s');
 

//$date = new DateTime();
//echo $date->format('Y-m-d H:i:s'); 


// AARON: SELECT p.bpm,p.datetime, e.startevent, e.endevent , e.eventname from pulserate p, events e WHERE p.datetime BETWEEN e.startevent AND e.endevent
?>

</body>
</html>