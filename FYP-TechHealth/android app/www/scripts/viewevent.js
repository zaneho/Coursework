
(function () {
    // for ORGANISER/ADMIN
     var userid = localStorage.getItem('userid');
     var password = localStorage.getItem('password');
     //var organiser = localStorage.getItem('organiser');
     var usertype = localStorage.getItem('usertype');

     var userid1;
     var eventname;
     var datetime;
     var location1;
    var emergencyperson;
    var emergencyno;
    var eventpw;
    var eventstatus;
    var startevent;
    var endevent;

    var joinedParticipant;
    var joinedHelper;

    ///  $(document).on("pagebeforecreate", function () { printheader(); })

    $(document).ready(function () {
        $(".ui-grid-a").hide();
        $(".ui-grid-b").hide();
        

        setInterval(function () {
            getHelperLocation();
        }, 300000); //updateHelperLoc every 3min
        

        if (usertype === "participant") {
            document.getElementById("navUser").style.display = "block";
            document.getElementById("navUser").style.visibility = "visible";
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
            viewdetail0();

            document.getElementById("button1").style.display = "none";
            document.getElementById("button1").style.visibility = "hidden";
        }
        else if (usertype === "organiser") {
            document.getElementById("navAdmin").style.display = "block";
            document.getElementById("navAdmin").style.visibility = "visible";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
            
            viewdetail();
        }
        else if (usertype === "helper") {
            document.getElementById("navHelper").style.display = "block";
            document.getElementById("navHelper").style.visibility = "visible";
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";

            viewdetail1();

            document.getElementById("button1").style.display = "none";
            document.getElementById("button1").style.visibility = "hidden";

        }
        else {
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
            document.getElementById("button1").style.display = "none";
            document.getElementById("button1").style.visibility = "hidden";
        }

        $("#btnSubmit").bind("click", function () {
            //if ($("#LoginForm").valid()) {
                submit();
            //}
        });

        $("#btnSubmitHelper").bind("click", function () {
            //if ($("#LoginForm").valid()) {
            submitHelper();
            //}
        });
        
        
    });

    // FOR ORGANISERS
    function viewdetail(eventname) {
        var url = serverURL() + "/geteventdetail.php";
        eventname = decodeURIComponent(getUrlVars()["eventname"]);
        var JSONObject = {
            "eventname": decodeURIComponent(getUrlVars()["eventname"])
        };
        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getEventdetailResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }
    
   function _getEventdetailResult(arr) {

              eventname = arr[0].eventname;
              datetime = arr[0].datetime;
             location1 = arr[0].location1;
            emergencyperson = arr[0].emergencyperson;
            emergencyno = arr[0].emergencyno;
            eventpw = arr[0].eventpw;
            eventstatus = arr[0].eventstatus;
            startevent = arr[0].startevent;
            endevent = arr[0].endevent;
        

       
           //  $("#userid").html("user id: " + userid); 
              $("#eventname").html("<b>Event Name: </b>" + eventname); 
               $("#datetime").html("<b>Date & Time: </b>" + datetime);
               $("#location").html("<b>Location: </b>" + location1); 
               $("#emergencyperson").html("<b>Emergency Person: </b>" + emergencyperson);
               $("#emergencyno").html("<b>Emergency No: </b>" + emergencyno);   
               $("#eventpw").html("<b>Event Password: </b>" + eventpw);   


              // $("#startevent").html("<b>Start time:</b>" + startevent);
            //   $("#endevent").html("<b>End time:</b>" + endevent);

               if (startevent == "") {
                   document.getElementById("btnUpdatestart").disabled = false;
               }
               else {
                   document.getElementById("btnUpdatestart").disabled = true;
           
               }

               if (endevent == "" && startevent !== "") {
                   document.getElementById("btnUpdateend").disabled = false;
               }
               else {
                   document.getElementById("btnUpdateend").disabled = true;
               }


               if (eventstatus === "Past") {

                   document.getElementById("button1").style.visibility = "hidden";  
              

                   startevent = arr[0].startevent;
                   endevent = arr[0].endevent;

                  
                 //  document.getElementById("btnUpdatestart").style.display = "block";
                  // if (endevent !== "" && startevent !== "") {

                       
                     
                
                       showPastEventDetails();
                       $("#startevent").html("<b>Start Time: </b>" + startevent);
                       $("#endevent").html("<b>End Time: </b>" + endevent);
                       
                   //}


               }
               else if (eventstatus === "Current") {
                   startevent = arr[0].startevent;
                   endevent = arr[0].endevent;

                   $("#startevent").html("<b>Start Time: </b>" + startevent);
                   $("#endevent").html("<b>End Time: </b>" + endevent);
                   getJoinedParticipant();
                   getJoinedHelper();
               }    

               else {
                   document.getElementById("button1").style.visibility = "hidden";  
                   getJoinedParticipant();
                   getJoinedHelper();
               }
    }

    // FOR PARTICIPANTS
   function viewdetail0(eventname) {
       var url = serverURL() + "/geteventdetail.php";
       eventname = decodeURIComponent(getUrlVars()["eventname"]);
       var JSONObject = {
           "eventname": decodeURIComponent(getUrlVars()["eventname"])
       };
       $.ajax({
           url: url,
           type: 'GET',
           data: JSONObject,
           dataType: 'json',
           contentType: "application/json; charset=utf-8",
           success: function (arr) {
               _getEventdetail0Result(arr);
           },
           error: function () {
               validationMsg();
           }
       });
   }
    
   function _getEventdetail0Result(arr) {

       eventname = arr[0].eventname;
       datetime = arr[0].datetime;
       location1 = arr[0].location1;
       emergencyperson = arr[0].emergencyperson;
       emergencyno = arr[0].emergencyno;
         userid1 = arr[0].userid;

       //  $("#userid").html("user id: " + userid); 
       $("#eventname").html("<b>Event Name:</b> " + eventname);
       $("#datetime").html("<b>Date & Time: </b>" + datetime);
       $("#location").html("<b>Location: </b>" + location1);
       //$("#emergencyperson").html("<b>Emergency Person: </b>" + emergencyperson);
       //$("#emergencyno").html("<b>Emergency No: </b>" + emergencyno);
       $("#organisername").html("<b>Organiser Name: </b>" + userid1);

   }



   // FOR HELPERS
   function viewdetail1(eventname) {
       var url = serverURL() + "/geteventdetail.php";
       eventname = decodeURIComponent(getUrlVars()["eventname"]);
       var JSONObject = {
           "eventname": decodeURIComponent(getUrlVars()["eventname"])
       };
       $.ajax({
           url: url,
           type: 'GET',
           data: JSONObject,
           dataType: 'json',
           contentType: "application/json; charset=utf-8",
           success: function (arr) {
               _getEventdetail1Result(arr);
           },
           error: function () {
               validationMsg();
           }
       });
   }

   function _getEventdetail1Result(arr) {

       eventname = arr[0].eventname;
       datetime = arr[0].datetime;
       location1 = arr[0].location1;
       emergencyperson = arr[0].emergencyperson;
       emergencyno = arr[0].emergencyno;
       userid1 = arr[0].userid;

       $("#eventname").html("<b>Event Name:</b> " + eventname);
       $("#datetime").html("<b>Date & Time: </b>" + datetime);
       $("#location").html("<b>Location: </b>" + location1);
       $("#organisername").html("<b>Organiser Name: </b>" + userid1);

   }



   function getJoinedParticipant() {
       var url = serverURL() + "/getJoinedParticipant.php";
       eventname = decodeURIComponent(getUrlVars()["eventname"]);
       var JSONObject = {
           "eventname": eventname
       };
       $.ajax({
           url: url,
           type: 'GET',
           data: JSONObject,
           dataType: 'json',
           contentType: "application/json; charset=utf-8",
           success: function (arr) {
               _getJoinedParticipant(arr);
           },
           error: function () {
               validationMsg();
           }
       });
   }

   function _getJoinedParticipant(arr) {
       var arrayLength = arr.length;
       if (arr.length > 0) {

           var tablearea;
           var table;
           var thead;
           var tr;
           var th;

           var data = ["Participant Name", "Device ID", "Attendance"];

           tablearea = document.getElementById('devicelist');
           table = document.createElement('table');
           thead = document.createElement('thead');
           tr = document.createElement('tr');

           for (var h = 0; h < data.length; h++) { //add header
               var headerTxt = document.createTextNode(data[h]);
               th = document.createElement('th');
               th.appendChild(headerTxt);
               tr.appendChild(th);
               thead.appendChild(tr);
           }

           table.appendChild(thead);

           var counter = 1;
           for (i = 0; i < arrayLength; i++) { //add tr & td
               tr = document.createElement('tr');
               tr.appendChild(document.createElement('td'));
               tr.appendChild(document.createElement('td'));
               tr.appendChild(document.createElement('td')); //Added for checkbox

               var lblParticipantName = document.createElement("LABEL");
               lblParticipantName.id = "lblParticipantName_" + counter;
               lblParticipantName.innerHTML = arr[i].userid + " ("+arr[i].age+")";

               var drpDeviceId = document.createElement("SELECT");
               drpDeviceId.id = "drpDeviceId" + counter;

               var cbAttendance = document.createElement("INPUT"); //Added for checkbox
               cbAttendance.type = "checkbox"; //Added for checkbox
               cbAttendance.id = "cbAttendance" + counter;

               counter += 1;


               tr.cells[0].appendChild(lblParticipantName);
               tr.cells[1].appendChild(drpDeviceId);
               tr.cells[1].style.textAlign = "right";
               tr.cells[2].appendChild(cbAttendance);
               table.appendChild(tr);

               var dbAttendance = arr[i].attendance;
               if (dbAttendance === "1") {
                   cbAttendance.checked = true;
               }

              
           }
           tablearea.appendChild(table);

           var numOfDrp = document.getElementById("frmDeviceList").getElementsByTagName('select');
           for (var z = 0; z < numOfDrp.length; z++) { //populate data into <select>

               drpDeviceId = document.getElementById(numOfDrp[z].id);

               var arrDeviceId = ["-", "2C3192", "2C30E1","3A1234","4B1234"];

               for (var j = 0; j < arrDeviceId.length; j++) { //add <option> to each <select>
                   var opt = arrDeviceId[j];
                   var el = document.createElement("option");
                   el.textContent = opt;
                   el.value = opt;
                   drpDeviceId.appendChild(el);
               }
           }


           counter = 1;
           for (i = 0; i < arrayLength; i++) {
               drpDeviceId = document.getElementById("drpDeviceId" + counter);

               var dbDeviceId = arr[i].deviceid;
               if (dbDeviceId === " " || dbDeviceId === "" ) {
                   drpDeviceId.value = "-";
               } else { drpDeviceId.value = dbDeviceId; }

               counter += 1;
           }



           $(".ui-grid-a").show();
       }
       else {
           var lblNoParticipant = document.createElement("LABEL");
           lblNoParticipant.innerHTML = "0 participant joined the event";

           document.getElementById("devicelist").append(lblNoParticipant);

           $(".ui-grid-a").hide();
       }
   }

   function getJoinedHelper() {
       var url = serverURL() + "/getJoinedHelper.php";
       eventname = decodeURIComponent(getUrlVars()["eventname"]);
       var JSONObject = {
           "eventname": eventname
       };
       $.ajax({
           url: url,
           type: 'GET',
           data: JSONObject,
           dataType: 'json',
           contentType: "application/json; charset=utf-8",
           success: function (arr) {
               _getJoinedHelper(arr);
           },
           error: function () {
               validationMsg();
           }
       });
   }

   function _getJoinedHelper(arr) {
       var arrayLength = arr.length;
       if (arr.length > 0) {

           var tablearea;
           var table;
           var thead;
           var tr;
           var th;

           var data = ["Helper Name", "Attendance"];

           tablearea = document.getElementById('helperlist');
           table = document.createElement('table');
           thead = document.createElement('thead');
           tr = document.createElement('tr');

           for (var h = 0; h < data.length; h++) { //add header
               var headerTxt = document.createTextNode(data[h]);
               th = document.createElement('th');
               th.appendChild(headerTxt);
               tr.appendChild(th);
               thead.appendChild(tr);
           }

           table.appendChild(thead);

           var counter = 1;
           for (i = 0; i < arrayLength; i++) { //add tr & td
               tr = document.createElement('tr');
               tr.appendChild(document.createElement('td'));
               tr.appendChild(document.createElement('td'));
               //tr.appendChild(document.createElement('td')); //Added for checkbox

               var lblHelperName = document.createElement("LABEL");
               lblHelperName.id = "lblHelperName_" + counter;
               lblHelperName.innerHTML = arr[i].userid;

               //var drpDeviceId = document.createElement("SELECT");
               //drpDeviceId.id = "drpDeviceId" + counter;

               var cbAttendanceHelper = document.createElement("INPUT"); //Added for checkbox
               cbAttendanceHelper.type = "checkbox"; //Added for checkbox
               cbAttendanceHelper.id = "cbAttendanceHelper" + counter;

               counter += 1;


               tr.cells[0].appendChild(lblHelperName);
               //tr.cells[1].appendChild(drpDeviceId);
               //tr.cells[1].style.textAlign = "right";
               tr.cells[1].appendChild(cbAttendanceHelper);
               table.appendChild(tr);

               var dbAttendanceHelper = arr[i].attendance;
               if (dbAttendanceHelper === "1") {
                   cbAttendanceHelper.checked = true;
               }


           }
           tablearea.appendChild(table);


           $(".ui-grid-b").show();
       }
       else {
           var lblNoHelper = document.createElement("LABEL");
           lblNoHelper.innerHTML = "0 helper joined the event";

           document.getElementById("helperlist").append(lblNoHelper);

           $(".ui-grid-b").hide();
       }
   }


  

 })();

// royce part



function updatestart() {

    var url = serverURL() + "/updatestartevent.php";
    userid = localStorage.getItem('userid');
    
    eventname = decodeURIComponent(getUrlVars()["eventname"]);
    var dt = new Date();

    // Display the month, day, and year. getMonth() returns a 0-based number.  
    var month = dt.getMonth() + 1;
    var day = dt.getDate();
    var year = dt.getFullYear();
    var hour = dt.getHours();
    var minutes = dt.getMinutes();
    var seconds = dt.getSeconds();


    if (day < 10) {day = "0" + day;}
    if (minutes < 10) { minutes = "0" + minutes; }
    if (seconds < 10) { seconds = "0" + seconds; }
    if (month < 10) { month = "0" + month; }

    var date = year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
   // alert(date);

    
    var JSONObject = {
        "date": date,
        "eventname": eventname,
        "userid": userid
    };

    $.ajax({
        url: url,
        type: 'GET',
        data: JSONObject,
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (arr) {
        },
        error: function () {
            
        }
    });
    window.location.reload();
}

function updateend() {

    var url = serverURL() + "/updateendevent.php";
    userid = localStorage.getItem('userid');
    eventname = decodeURIComponent(getUrlVars()["eventname"]);
    var dt = new Date();

    // Display the month, day, and year. getMonth() returns a 0-based number.  
    var month = dt.getMonth() + 1;
    var day = dt.getDate();
    var year = dt.getFullYear();
    var hour = dt.getHours();
    var minutes = dt.getMinutes();
    var seconds = dt.getSeconds();

    if (day < 10) { day = "0" + day; }
    if (minutes < 10) { minutes = "0" + minutes; }
    if (seconds < 10) { seconds = "0" + seconds; }
    if (month < 10) { month = "0" + month; }

    var date = year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
    //alert(date);




    var JSONObject = {
        "date": date,
        "eventname": eventname,
        "userid": userid
    };

    $.ajax({
        url: url,
        type: 'GET',
        data: JSONObject,
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (arr) {
        },
        error: function () {
        }
    });
    window.location.reload();
}




setInterval(function () {
    $('#test').load(serverURL() + "/createevents.php").fadeIn("slow");
}, 1000 * 60 * 60);


function goBack() {
    window.history.back();
}




//@@@@@@@@@@@@@@@@@@@@ CONCAT & UPDATE Participant info START
var stringDrpValue = "";
var stringCbValue = "";
var stringPartName = "";

function submit() { //concat participant name, device id, attendance for update to db
    stringDrpValue = "";
    stringCbValue = "";
    stringPartName = "";

    var numOfDrp = document.getElementById("frmDeviceList").getElementsByTagName('select');
    

    for (var z = 0; z < numOfDrp.length; z++) { //loop each <select>

        drpDeviceId = document.getElementById(numOfDrp[z].id);

        if (stringDrpValue === "") {
            if (drpDeviceId.value === "-") {
                stringDrpValue = " ";
            } else {
                stringDrpValue = drpDeviceId.value;
            }
        }
        else {
            if (drpDeviceId.value === "-") {
                stringDrpValue += "," + " ";
            } else {
                if (stringDrpValue === drpDeviceId.value) {
                    validationMsgs("Please assign one device id to one participant only.", "Validation Error", "Try Again");
                    return;
                }
                stringDrpValue += "," + drpDeviceId.value;
            }
        }
    }

    var numOfCb = document.getElementById("frmDeviceList").getElementsByTagName('input');
    

    for (var i = 0; i < numOfCb.length; i++) { //loop each cb
        if (numOfCb[i].type === 'checkbox') {
            if (numOfCb[i].checked === true) {
                if (stringCbValue === "") {
                    stringCbValue = "1";
                }
                else {
                    stringCbValue += "," + "1";
                }
            }
            else {
                if (stringCbValue === "") {
                    stringCbValue = "0";
                }
                else {
                    stringCbValue += "," + "0";
                }
            }  
        }
    }

    var numofLabel = document.getElementById("frmDeviceList").getElementsByTagName('label');
   
    for (var l = 0; l < numofLabel.length; l++) {
        var lblid = numofLabel[l].id;
        lblid = lblid.split("_");
        lblid = lblid[0];
        if (lblid === 'lblParticipantName') {
            lblid = numofLabel[l].id;
            if (stringPartName === "") {
                stringPartName = document.getElementById(lblid).innerHTML.split("(")[0];
                }
                else {
                stringPartName += "," + document.getElementById(lblid).innerHTML.split("(")[0];
                }
        }
    }



    if (stringDrpValue !== "" && stringCbValue !== "" && stringPartName !== "") {
        updateEventRegistration();
    }
    else {
        validationMsg();
    }
}

function updateEventRegistration() {
    var url = serverURL() + "/updateEventRegistration.php";
    eventname = decodeURIComponent(getUrlVars()["eventname"]);

    var JSONObject = {
        "eventname": eventname,
        "stringDrpValue": stringDrpValue,
        "stringCbValue": stringCbValue,
        "stringPartName": stringPartName
    };
    $.ajax({
        url: url,
        type: 'GET',
        data: JSONObject,
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (arr) {
            _updateEventRegistration(arr);
        },
        error: function () {
            validationMsg();
        }
    });
}
function _updateEventRegistration(arr) {
    document.getElementById("divBtn").style.visibility = "hidden";
    document.getElementById("divBtn").style.display = "none";

    document.getElementById("divSuccess").style.visibility = "visible";
    document.getElementById("divSuccess").style.display = "block";
   
}

//@@@@@@@@@@@@@@@@@@@@ CONCAT & UPDATE Participant info END







//@@@@@@@@@@@@@@@@@@@@ CONCAT & UPDATE HELPER info START
var stringCbHelperValue = "";
var stringHelperName = "";

function submitHelper() { //concat HELPER name, attendance for update to db
    stringCbHelperValue = "";
    stringHelperName = "";

 
    var numOfCb = document.getElementById("frmHelperList").getElementsByTagName('input');


    for (var i = 0; i < numOfCb.length; i++) { //loop each cb
        if (numOfCb[i].type === 'checkbox') {
            if (numOfCb[i].checked === true) {
                if (stringCbHelperValue === "") {
                    stringCbHelperValue = "1";
                }
                else {
                    stringCbHelperValue += "," + "1";
                }
            }
            else {
                if (stringCbHelperValue === "") {
                    stringCbHelperValue = "0";
                }
                else {
                    stringCbHelperValue += "," + "0";
                }
            }
        }
    }

    var numofLabel = document.getElementById("frmHelperList").getElementsByTagName('label');

    for (var l = 0; l < numofLabel.length; l++) {
        var lblid = numofLabel[l].id;
        lblid = lblid.split("_");
        lblid = lblid[0];
        if (lblid === 'lblHelperName') {
            lblid = numofLabel[l].id;
            if (stringHelperName === "") {
                stringHelperName = document.getElementById(lblid).innerHTML;
            }
            else {
                stringHelperName += "," + document.getElementById(lblid).innerHTML;
            }
        }
    }



    if (stringCbHelperValue !== "" && stringHelperName !== "") {
        updateHelperAttandence();
    }
    else {
        validationMsg();
    }
}

function updateHelperAttandence() {
    var url = serverURL() + "/updateHelperAttandence.php";
    eventname = decodeURIComponent(getUrlVars()["eventname"]);

    var JSONObject = {
        "eventname": eventname,
        "stringCbValue": stringCbHelperValue,
        "stringPartName": stringHelperName
    };
    $.ajax({
        url: url,
        type: 'GET',
        data: JSONObject,
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (arr) {
            _updateHelperAttandence(arr);
        },
        error: function () {
            validationMsg();
        }
    });
}
function _updateHelperAttandence(arr) {
    document.getElementById("btnSubmitHelper").style.visibility = "hidden";
    document.getElementById("btnSubmitHelper").style.display = "none";

    document.getElementById("divSuccessHelper").style.visibility = "visible";
    document.getElementById("divSuccessHelper").style.display = "block";
}
//@@@@@@@@@@@@@@@@@@@@ CONCAT & UPDATE HELPER info END








//@@@@ After Event Show Simple Statistic
function showPastEventDetails() {


    //show Present, Total participant, SOS
    var url = serverURL() + "/getPastEventStats.php";
    eventname = decodeURIComponent(getUrlVars()["eventname"]);

    var JSONObject = {
        "eventname": eventname
    };
    $.ajax({
        url: url,
        type: 'GET',
        data: JSONObject,
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (arr) {
            _showPastEventDetails(arr);
        },
        error: function () {
            validationMsg();
        }
    });
}

function _showPastEventDetails(arr) {
    //alert("Total participant" + arr[0].ParticipantTotal + "Present " + arr[0].ParticipantPresent + "SOS " + arr[0].TotalSos);

    var arrayLength = arr.length;
    if (arr.length > 0) {

        var tablearea;
        var table;
        var thead;
        var tr;
        var th;

        var data = ["Participant present", "Total participant", "Number of SOS"];

        tablearea = document.getElementById('PastEventStats');
        table = document.createElement('table');
        thead = document.createElement('thead');
        tr = document.createElement('tr');

        for (var h = 0; h < data.length; h++) { //add header
            var headerTxt = document.createTextNode(data[h]);
            th = document.createElement('th');
            th.appendChild(headerTxt);
            tr.appendChild(th);
            thead.appendChild(tr);
        }

        table.appendChild(thead);

        for (i = 0; i < arrayLength; i++) { //add tr & td
            tr = document.createElement('tr');
            tr.appendChild(document.createElement('td'));
            tr.appendChild(document.createElement('td'));
            tr.appendChild(document.createElement('td'));

            var lblParticipantPresent = document.createElement("LABEL");
            lblParticipantPresent.innerHTML = arr[0].ParticipantPresent;

            var lblParticipantTotal = document.createElement("LABEL");
            lblParticipantTotal.innerHTML = arr[0].ParticipantTotal;

            var lblSos = document.createElement("LABEL");
            lblSos.innerHTML = arr[0].TotalSos;
            
            tr.cells[0].appendChild(lblParticipantPresent);
            tr.cells[0].style.textAlign = "center";
            tr.cells[1].appendChild(lblParticipantTotal);
            tr.cells[1].style.textAlign = "center";
            tr.cells[2].appendChild(lblSos);
            tr.cells[2].style.textAlign = "center";
            table.appendChild(tr);

        }
        tablearea.appendChild(table);
    }
}


     
    // END


    








  
 


