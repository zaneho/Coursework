
 (function () {

    var userid;

    ///  $(document).on("pagebeforecreate", function () { printheader(); })
    // RETRIVE USERID from login
    //  $(document).on("pagebeforecreate", function () { printheader(); });
    $(document).ready(function () {
        getUserid();
    });
    function getUserid() {
        var url = serverURL() + "/getuserid.php";
        var JSONObject = { "userid": localStorage.getItem("userid") };
        $.ajax({ url: url, type: 'GET', data: JSONObject, dataType: 'json', contentType: "application/json; charset=utf-8", success: function (arr) { _getUseridResult(arr); }, error: function () { validationMsg(); } });
    }
    function _getUseridResult(arr) {
        userid = arr[0].userid;
        $("#txtuserid").html("User ID: " + userid);
    }



    // END

})(); 

    
    var eventname;
    var datetime;
    var location1;
    var emergencyperson;
    var emergencyno;
    var dateToday = new Date();
    var eventpw;
    var eventpw1;
  //  var userid;


    //var a = /^[a-zA-Z\s]+$/;
    var a = /^[0-9a-zA-Z-!@#$%&*?-a-zA-Z-0-9!@#$%&*?]+$/
    var dt = /^(\d{4,})-(\d\d)-(\d\d)T(\d\d):(\d\d)(?::(\d\d)(\.\d{1,3})?)?$/;
    //var dt1 = /^([0]\d | [1][0 - 2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$/;
    var dt1 = /^\d{4}-[0-1][0-2]-[0-3]\d\s([0-1][0-9]|2[0-3]):[0-5]\d$/;
    // var a = /^[0-9-!@#$%*?]/;
    //   (/^[0-9,\+-]+$/);

// RETRIVE USERID from login
//  $(document).on("pagebeforecreate", function () { printheader(); });
  /*  $(document).ready(function () {
        getUserid();
    });
    function getUserid() {
        var url = serverURL() + "/getuserid.php";
        var JSONObject = { "userid": localStorage.getItem("userid") };
        $.ajax({ url: url, type: 'GET', data: JSONObject, dataType: 'json', contentType: "application/json; charset=utf-8", success: function (arr) { _getUseridResult(arr); }, error: function () { validationMsg(); } });
    }
    function _getUseridResult(arr) {
        userid = arr[0].userid;
        $("#txtuserid").html("User ID: " + userid);
    }
*/

// END


        $(function () {
            $("#datetime").datetimepicker({
                minDate: dateToday,
               // minDate: 0,
                step: 5
              //  
               
            });
                
         });


              //  $("#datetime").datetimepicker(
                       // step: 5
                        // dateFormat: 'yyyy-mm-dd'
                        //  format: 'yyyy-mm-dd hh:ii'
                        //format: 'yyyy-mm-dd hh:ii'

                 //   );
                

        $(document).ready(function () {

            jQuery.validator.addMethod("noSpace", function (value, element) {
                return value.indexOf(" ") < 0 && value != "";
            }, "No space is allowed");

        $("#CreateEvent").validate({

            rules: {
                eventname: {
                    minlength: 8,
                    maxlength: 8, 
                     noSpace: true,
                    
                },
                emergencyno: {
                    minlength: 8,
                    maxlength: 8
                },
                eventpw: {
                    minlength: 8
                },
                eventpw1: {
                    equalTo: "#eventpw"
                }
            }, 
            messages: {
                eventname: {
                    required: "Event Name is required",
                    minlength: "Event Name must be 8 characters",
                    maxlength: "Event Name must be 8 characters",
                    
                },
                datetime: "Date & time is required",
                location: "Location is required",
                emergencyperson: "Emergency Person is required",
                emergencyno: {
                    required: "Emergency No is required",
                    minlength: "Contact number 8 digits"
                },
                eventpw: {
                    required: "Password is required",
                    minlength: "Password minimum character is 8."
                },
                eventpw1: {
                    required: "Re-enter password is required",
                    equalTo: "Password does not match"
                }
            }, 
            // rules: { emergencyno: { required: true, matches: "^(\\d|\\s)+$", minlength: 10, maxlength: 20 }},
            focusInvalid: false, submitHandler: function () { return false; },errorPlacement: function (error, element) { error.appendTo(element.parent().parent().after()); },});
        //$("#btnSelectImg").bind("click", function () { capturePhoto(); });
        $("#create1").bind("click", function () { create(); });
    });  


    function create() {
        if ($("#CreateEvent").valid()) {
            
            eventname = $("#eventname").val();
            datetime = $("#datetime").val();
            location1 = $("#location1").val();
            emergencyperson = $("#emergencyperson").val();
            emergencyno = $("#emergencyno").val(); 
            userid = localStorage.getItem("userid");
            eventpw = $("#eventpw").val();
            eventpw1 = $("#eventpw1").val();

            if (validate()) {
                //var xmlhttp = new XMLHttpRequest();
                var url = serverURL() + "/createevents.php";

                var JSONObject = { "eventname": eventname, "datetime": datetime, "location1": location1, "emergencyperson": emergencyperson, "emergencyno": emergencyno, "userid": localStorage.getItem("userid"), "eventpw": eventpw };
                $.ajax({ url: url, type: 'GET', data: JSONObject, dataType: 'json', contentType: "application/json; charset=utf-8", success: function (arr) {getCreateEventResult(arr); }, error: function () { validationMsg(); } }); 
          

             /*   xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status ==
                        200) {
                        getCreateEventResult(xmlhttp.responseText);
                    }
                }
                xmlhttp.open("GET", url, true);
                xmlhttp.send(); */
            }
        }
    }

setInterval(function () {
    $('#test').load(serverURL() + "/createevents.php").fadeIn("slow")
}, 1000 * 60 * 60)


    function validate() {
        var validate = true;
        if (eventname == "") {
            validationMsgs("Event Name is required", "Validation", "OK"); 
            //alert("Event ID is required.");
            //$("#eventname").focus();
            validate = false;
        } else if (datetime == "") {
            validationMsgs("Date & time is required", "Validation", "OK"); 
            // alert("Date & Time is required.");
           //$("#datetime").focus();
            validate = false;
        } else if (datetime.match(dt1)) {
            validationMsgs("Date & time is required", "Validation", "OK");
            // alert("Date & Time is required.");
            //$("#datetime").focus();
            validate = false;
        } else if (location1 == "") {
            validationMsgs("Location is required", "Validation", "OK"); 
            // alert("Location is required.");
            //$("#location").focus();
            validate = false;

        } else if (emergencyperson == "") {
            validationMsgs("Emergency person is required", "Validation", "OK"); 
            // alert("Emergency person is required.");
            //$("#emergencyperson").focus();
            validate = false;
        } else if (emergencyperson.match(a)) {
         
                validationMsgs("Only alphabets are allowed & Surname is required", "Validation", "OK");
                validate = false;
         
        } else if (emergencyno == "") {
            validationMsgs("Emergency contact is required", "Validation", "OK"); 
            //alert("Emergency Contact is required.");
           // $("#emergencyno").focus();
            validate = false;
        } else if (isNaN(emergencyno)) {
        validationMsgs("Emergency contact in numeric", "Validation", "OK");
        //alert("Emergency Contact is required.");
        // $("#emergencyno").focus();
        validate = false;
        } else if (eventpw != eventpw1) {
            validationMsgs("Password not match", "Validation", "OK");
            //alert("Emergency Contact is required.");
            // $("#emergencyno").focus();
            validate = false;
        } 



          /*else if(!val.match(/^[a-zA-Z]+$/)) {
            validationMsgs("Only in alphabetical", "Validation", "OK");
            validate = false;
        } */

        return validate;
    }


    function getCreateEventResult(arr) {
      //  var arr = JSON.parse(response);
        if (arr[0].result == "1") {
            
            localStorage.setItem("eventname", eventname);
            localStorage.setItem("datetime", datetime);
            localStorage.setItem("location1", location1);
            localStorage.setItem("emergencyperson", emergencyperson);
            localStorage.setItem("emergencyno", emergencyno);
            localStorage.setItem("userid", userid);
            localStorage.setItem("eventpw", eventpw);
            validationMsgs("New Event successfully created", "Validation", "OK");
            clearForm();

            // window.location = "me.html";
        } else {
            //alert("Event Name already exists.");
            //$("#eventname").focus();
            validationMsgs("Event Name already exist", "Validation", "OK")
        }
    }



    function clearForm() {
    
        var frm = document.getElementsByName('CreateEvent')[0];
        frm.reset();  // Reset all form data
        return false; // Prevent page refresh
    }

function goBack() {
    window.history.back();
}
 


