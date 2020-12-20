﻿
(function () {

     var userid = localStorage.getItem('userid');
     var password = localStorage.getItem('password');
     var organiser = localStorage.getItem('organiser');
     var usertype = localStorage.getItem('usertype');




    // var userid;
     var eventname;
     var datetime;
     var location1;
   // var emergencyperson;
    // var emergencyno;

    ///  $(document).on("pagebeforecreate", function () { printheader(); })

    $(document).ready(function () {
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
            getCurrentforp();
        }
        else if (usertype === "organiser") {
            document.getElementById("navAdmin").style.display = "block";
            document.getElementById("navAdmin").style.visibility = "visible";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
            getCurrentevents();
        }

        else if (usertype === "helper") {
            document.getElementById("navHelper").style.display = "block";
            document.getElementById("navHelper").style.visibility = "visible";
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            getCurrentforh();
        }

        else {
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
        }

       
     });



    // FOR ORGANISERS
   function getCurrentevents() {
        var url = serverURL() + "/getcurrentevents.php";
        var JSONObject = { "userid": localStorage.getItem("userid") };
        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getCurrenteventsResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

   function _getCurrenteventsResult(arr) {

        var t;
        if ($.fn.dataTable.isDataTable('#currentresult')) { t = $('#currentresult').DataTable(); } else {
            t = $('#currentresult').DataTable({
                "searching": false,
                "lengthChange": false
            });
        }
        t.clear(); for (var i = 0; i < arr.length; i++) {
            t.row.add([
                arr[i].eventname, arr[i].datetime, arr[i].location1, "<a href='#' class='ui-btn'id='btn" + arr[i].eventname + "'>View</a>" 
            ])
                .draw(false);

            $("#btn" + arr[i].eventname).bind("click", { id: arr[i].eventname }, function (event) {
                var data = event.data;
                viewdetail(data.id);
                
            });
        

            /*  eventid = arr[0].eventid;
              datetime = arr[0].datetime;
             location1 = arr[0].location1;
            emergencyperson = arr[0].emergencyperson;
            emergencyno = arr[0].emergencyno;
             userid = arr[0].userid;
       
           //  $("#userid").html("user id: " + userid); 
              $("#eventid").html("Event ID: " + eventid); 
               $("#datetime").html("Date & Time: " + datetime);
               $("#location").html("Location: " + location1); 
               $("#emergencyperson").html("Emergency Person: " + emergencyperson);
               $("#emergencyno").html("Emergency No: " + emergencyno); 
             alert("Test");  */
        }

        $("#currentresult").show(); 
   } 

    // FOR PARTICIPANTS
   function getCurrentforp() {
       var url = serverURL() + "/getcurrentforp.php";
       var JSONObject = { "userid": localStorage.getItem("userid") };
       $.ajax({
           url: url,
           type: 'GET',
           data: JSONObject,
           dataType: 'json',
           contentType: "application/json; charset=utf-8",
           success: function (arr) {
               _getCurrentforpResult(arr);
           },
           error: function () {
               validationMsg();
           }
       });
   }

   function _getCurrentforpResult(arr) {

       var t;
       if ($.fn.dataTable.isDataTable('#currentresult')) { t = $('#currentresult').DataTable(); } else {
           t = $('#currentresult').DataTable({
               "searching": false,
               "lengthChange": false
           });
       }
       t.clear(); for (var i = 0; i < arr.length; i++) {
           t.row.add([
               arr[i].eventname, arr[i].datetime, arr[i].location1, "<a href='#' class='ui-btn'id='btn" + arr[i].eventname + "'>View</a>"
           ])
               .draw(false);

           $("#btn" + arr[i].eventname).bind("click", { id: arr[i].eventname }, function (event) {
               var data = event.data;
               viewdetail0(data.id);

           });
       }

       $("#currentresult").show();
   } 



   // FOR HELPERS
   function getCurrentforh() {
       var url = serverURL() + "/getcurrentforh.php";
       var JSONObject = { "userid": localStorage.getItem("userid") };
       $.ajax({
           url: url,
           type: 'GET',
           data: JSONObject,
           dataType: 'json',
           contentType: "application/json; charset=utf-8",
           success: function (arr) {
               _getCurrentforhResult(arr);
           },
           error: function () {
               validationMsg();
           }
       });
   }

   function _getCurrentforhResult(arr) {

       var t;
       if ($.fn.dataTable.isDataTable('#currentresult')) { t = $('#currentresult').DataTable(); } else {
           t = $('#currentresult').DataTable({
               "searching": false,
               "lengthChange": false
           });
       }
       t.clear(); for (var i = 0; i < arr.length; i++) {
           t.row.add([
               arr[i].eventname, arr[i].datetime, arr[i].location1, "<a href='#' class='ui-btn'id='btn" + arr[i].eventname + "'>View</a>"
           ])
               .draw(false);

           $("#btn" + arr[i].eventname).bind("click", { id: arr[i].eventname }, function (event) {
               var data = event.data;
               viewdetail1(data.id);

           });
       }

       $("#currentresult").show();
   } 

 })();


setInterval(function () {
    $('#test').load(serverURL() + "/createevents.php").fadeIn("slow")
}, 1000 * 60 * 60)


// FOR ORGANISER
function viewdetail(eventname)
{ window.location = "viewevent.html?eventname=" + eventname; } 


// FOR PARTICIPANTS
function viewdetail0(eventname)
{ window.location = "viewevent.html?eventname=" + eventname; } 

// FOR HELPERS
function viewdetail1(eventname)
{ window.location = "viewevent.html?eventname=" + eventname; } 


function goBack() {
    window.history.back();
}



    








  
 


