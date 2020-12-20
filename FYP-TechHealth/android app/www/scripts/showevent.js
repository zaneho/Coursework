

     var userid;
     var eventname;
     var datetime;
     var location1;
    var emergencyperson;
    var emergencyno;
    var eventpw;
    var usertype = localStorage.getItem('usertype');
     
    $(document).ready(function () {
        setInterval(function () {
            getHelperLocation();
        }, 300000); //updateHelperLoc every 3min

        if (usertype === "participant") {
            document.getElementById("navUser").style.display = "block";
            document.getElementById("navUser").style.visibility = "visible";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
            showevent();
        }

        else {
            document.getElementById("navHelper").style.display = "block";
            document.getElementById("navHelper").style.visibility = "visible";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            showevent();
        }
     });


    function showevent(eventname) {
        var url = serverURL() + "/geteventdetail.php";
        eventname = decodeURIComponent(getUrlVars()["eventname"]);
        var JSONObject = {
            "eventname": decodeURIComponent(getUrlVars()["eventname"]),
        };
        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getShoweventResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

var usertype = localStorage.getItem('usertype');
   function _getShoweventResult(arr) {
       

              eventname = arr[0].eventname;
              datetime = arr[0].datetime;
             location1 = arr[0].location1;
            emergencyperson = arr[0].emergencyperson;
            emergencyno = arr[0].emergencyno;
            userid = arr[0].userid;
            eventpw = arr[0].eventpw;
       
            if (usertype === "participant") {
                $("#eventname").html("<b>Event Name:</b> " + eventname);
                $("#datetime").html("<b>Date & Time:</b> " + datetime);
                $("#location").html("<b>Location:</b> " + location1);
                $("#emergencyperson").html("<b>Emergency Person:</b> " + emergencyperson);
                $("#emergencyno").html("<b>Emergency No:</b> " + emergencyno);
                $("#userid").html("<b>Organiser Name:</b> " + userid);
                $("#txtpw").val(eventpw);
            }
            else if (usertype === "helper") {
                $("#eventname").html("<b>Event Name:</b> " + eventname);
                $("#datetime").html("<b>Date & Time:</b> " + datetime);
                $("#location").html("<b>Location:</b> " + location1);
                $("#userid").html("<b>Organiser Name:</b> " + userid);
                $("#txtpw").val(eventpw);
            }
                
    }

/////////////////////////////////////////////////////////////////////

/* $(function () {
   
    $('#btnJoinEvent').click(function () {
       
        if (confirm('To join the event?')) {
                $(document).ready(function () {
                  entereventpw();
                    savejoinevent();

                });

                return true;
           
        }
        return false;
    });
}); */

   var userid1 = localStorage.getItem('userid');

   function savejoinevent() {

       if (usertype === "participant") {
           var url = serverURL() + "/joinevent.php";

           var JSONObject = { "eventname": eventname, "userid1": localStorage.getItem("userid") };
           $.ajax({ url: url, type: 'GET', data: JSONObject, dataType: 'json', contentType: "application/json; charset=utf-8", success: function (arr) { savejoineventResult(arr); }, error: function () { validationMsg(); } });
       }
       else  {
           var url = serverURL() + "/helperjoinevent.php";

           var JSONObject = { "eventname": eventname, "userid1": localStorage.getItem("userid") };
           $.ajax({ url: url, type: 'GET', data: JSONObject, dataType: 'json', contentType: "application/json; charset=utf-8", success: function (arr) { savejoineventResult(arr); }, error: function () { validationMsg(); } });
       }
   }



   function savejoineventResult(arr) {

       if (arr[0].result == "1") {

           localStorage.setItem("userid1", userid1);
           validationMsgs("Successfully joined", "Validation", "OK");
       } else {

           validationMsgs("You have already joined the event", "Validation", "OK")
       }
   }


    $(document).ready(function () {
        $("#enterpw").validate({
       /*     rules: {
                Peventpw: {
                    equalTo: "#txtpw"
                }
            }, */
            messages: {
                Peventpw: "Password is required",
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            },
        });
        $("#btnJoinEvent").bind("click", function () {
            if ($("#enterpw").valid()) {
                entereventpw();
                
            }
        });


    });







    ////////////////////////////////////////////////////////////////////////







    function entereventpw() {
        var url = serverURL() + "/eventpwconfirm.php";
        var result;
        eventpw = $("#Peventpw").val();
        eventname = decodeURIComponent(getUrlVars()["eventname"]);
        var JSONObject = {
            "eventname": eventname,
            "eventpw": eventpw

        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getEntereventpwResult(arr);
               
            },
            error: function () {
                validationMsg();
            }
        });
    }



    function _getEntereventpwResult(arr) {
        if (arr[0].result.trim() !== "0") {
            //   localStorage.setItem("userid", userid);
           // localStorage.setItem("eventname", eventname);
           // localStorage.setItem("eventpw", eventpw);
           // validationMsgs("Event Password correct", "Validation", "OK");
            savejoinevent();
        } else {
            validationMsgs("Error Event Password", "Validation", "Try Again");
        }
    }

setInterval(function () {
    $('#test').load(serverURL() + "/createevents.php").fadeIn("slow")
}, 1000 * 60 * 60)


function goBack() {
    window.history.back();
}










  
 


