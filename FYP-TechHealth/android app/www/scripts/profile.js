(function () {
    "use strict";
    var userid = localStorage.getItem('userid');
    var password = localStorage.getItem('password');
    //var organiser = localStorage.getItem('organiser');
    var usertype = localStorage.getItem('usertype');

    var name, NRIC, Email, DOB, height, weight;
    var oldPw, newPw, heightP, weightP;
    
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


            document.getElementById("ParticipantProfile").style.display = "block";
            document.getElementById("ParticipantProfile").style.visibility = "visible";
            document.getElementById("OrganiserProfile").style.display = "none";
            document.getElementById("OrganiserProfile").style.visibility = "hidden";
            document.getElementById("HelperProfileForm").style.display = "none";
            document.getElementById("HelperProfileForm").style.visibility = "hidden";
        }
        else if (usertype === "organiser") {
            document.getElementById("navAdmin").style.display = "block";
            document.getElementById("navAdmin").style.visibility = "visible";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";

            document.getElementById("OrganiserProfile").style.display = "block";
            document.getElementById("OrganiserProfile").style.visibility = "visible";
            document.getElementById("ParticipantProfile").style.display = "none";
            document.getElementById("ParticipantProfile").style.visibility = "hidden";
            document.getElementById("HelperProfileForm").style.display = "none";
            document.getElementById("HelperProfileForm").style.visibility = "hidden";
        }
        else if (usertype === "helper") {
            document.getElementById("navHelper").style.display = "block";
            document.getElementById("navHelper").style.visibility = "visible";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";


            document.getElementById("ParticipantProfile").style.display = "none";
            document.getElementById("ParticipantProfile").style.visibility = "hidden";
            document.getElementById("OrganiserProfile").style.display = "none";
            document.getElementById("OrganiserProfile").style.visibility = "hidden";
            document.getElementById("HelperProfileForm").style.display = "block";
            document.getElementById("HelperProfileForm").style.visibility = "visible";
        }
        else {
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";

            document.getElementById("ParticipantProfile").style.display = "none";
            document.getElementById("ParticipantProfile").style.visibility = "hidden";
            document.getElementById("OrganiserProfile").style.display = "none";
            document.getElementById("OrganiserProfile").style.visibility = "hidden";
            document.getElementById("HelperProfileForm").style.display = "none";
            document.getElementById("HelperProfileForm").style.visibility = "hidden";
        }

        getUserProfile();

        jQuery('#txtHeightP').on('input', function () {
            if (document.getElementById("txtHeightP").value && document.getElementById("txtWeightP").value) {
                document.getElementById("txtBMIP").value = document.getElementById("txtWeightP").value / (document.getElementById("txtHeightP").value / 100 * document.getElementById("txtHeightP").value / 100);
            }
        });
        jQuery('#txtWeightP').on('input', function () {
            if (document.getElementById("txtHeightP").value && document.getElementById("txtWeightP").value) {
                document.getElementById("txtBMIP").value = document.getElementById("txtWeightP").value / (document.getElementById("txtHeightP").value / 100 * document.getElementById("txtHeightP").value / 100);
            }
        });


        $("#ParticipantProfileForm").validate({
            messages: {
                txtHeightP: "Height is required",
                txtWeightP: "Weight is required"
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });
        
        $("#ParticipantProfileFormPw").validate({
            rules: {
                txtReNewPasswordP: {
                    equalTo: "#txtNewPasswordP"
                },
                txtNewPasswordP: {
                    minlength: 8
                }
            },
            messages: {
                txtOldPasswordP: "Old Password is required",
                txtNewPasswordP: {
                    required: "New password is required",
                    minlength: "Password minimum character is 8"
                },
                txtReNewPasswordP: {
                    required: "Re-enter new password is required",
                    equalTo: "New password does not match"
                    }
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });

        $("#OrganiserProfileForm").validate({
            rules: {
                txtReNewPasswordO: {
                    equalTo: "#txtNewPasswordO"
                },
                txtNewPasswordO: {
                    minlength: 8
                }
            },
            messages: {
                txtOldPasswordO: "Old Password is required",
                txtNewPasswordO: {
                    required: "New password is required",
                    minlength: "Password minimum character is 8"
                },
                txtReNewPasswordO: {
                    required: "Re-enter new password is required",
                    equalTo: "New password does not match"
                }
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });

        $("#HelperProfileForm").validate({
            rules: {
                txtReNewPasswordH: {
                    equalTo: "#txtNewPasswordH"
                },
                txtNewPasswordH: {
                    minlength: 8
                }
            },
            messages: {
                txtOldPasswordH: "Old Password is required",
                txtNewPasswordH: {
                    required: "New password is required",
                    minlength: "Password minimum character is 8"
                },
                txtReNewPasswordH: {
                    required: "Re-enter new password is required",
                    equalTo: "New password does not match"
                }
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });

        $("#btnUpdateP").bind("click", function () {
            if ($("#ParticipantProfileForm").valid()) {
                updateParticipant();
            }
        });

        $("#btnUpdatePwP").bind("click", function () {
            if ($("#ParticipantProfileFormPw").valid()) {
            updatePw("participant");
            }
        });

        $("#btnUpdatePwO").bind("click", function () {
            if ($("#OrganiserProfileForm").valid()) {
            updatePw("organiser");
            }
        });

        $("#btnUpdatePwH").bind("click", function () {
            if ($("#HelperProfileForm").valid()) {
                updatePw("helper");
            }
        });
        


    });
    function getUserProfile() {
        var url = serverURL() + "/getUserProfile.php";

        var JSONObject = {
            "userid": userid,
            "usertype": usertype
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getUserProfileResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getUserProfileResult(arr) {
        if (usertype === "participant") { //participant
            if (arr[0].name.trim()) {
                name = arr[0].name.trim();
                document.getElementById("lblNameP").innerHTML = name;
            }

            if (arr[0].NRIC.trim()) {
                NRIC = arr[0].NRIC.trim();
                NRIC = NRIC.charAt(0) + "xxx" + NRIC.slice(-5);
                document.getElementById("lblNRICP").innerHTML = NRIC;
            }
            if (arr[0].Email.trim()) {
                Email = arr[0].Email.trim();
                document.getElementById("lblEmailP").innerHTML = Email;
            }
            if (arr[0].DOB.trim()) {
                DOB = arr[0].DOB.trim();
                document.getElementById("lblDOBP").innerHTML = DOB;
            }

            if (arr[0].height.trim()) {
                height = arr[0].height.trim();
                document.getElementById("txtHeightP").value = height;
            }
            if (arr[0].weight.trim()) {
                weight = arr[0].weight.trim();
                document.getElementById("txtWeightP").value = weight;
            }

            calculateBMI();

        }
        else if (usertype === "organiser") { //organiser
            if (arr[0].name.trim()) {
                name = arr[0].name.trim();
                document.getElementById("lblNameO").innerHTML = name;
            }

            if (arr[0].Email.trim()) {
                Email = arr[0].Email.trim();
                document.getElementById("lblEmailO").innerHTML = Email;
            }

        }
        else if (usertype === "helper") { //helper
            if (arr[0].name.trim()) {
                name = arr[0].name.trim();
                document.getElementById("lblNameH").innerHTML = name;
            }

            if (arr[0].Email.trim()) {
                Email = arr[0].Email.trim();
                document.getElementById("lblEmailH").innerHTML = Email;
            }

        }
        else {
            validationMsgs("Error. Please try again.", "Update failed", "Try Again");
        }
    }

    function calculateBMI() {
        if (document.getElementById("txtHeightP").value  && document.getElementById("txtWeightP").value){
            document.getElementById("txtBMIP").value = document.getElementById("txtWeightP").value / (document.getElementById("txtHeightP").value/100 * document.getElementById("txtHeightP").value/100);
        }
    }

    function updateParticipant() {
        var url = serverURL() + "/updateParticipant.php";
        userid = localStorage.getItem('userid');
        heightP = $("#txtHeightP").val();
        weightP = $("#txtWeightP").val();

        var JSONObject = {
            "userid": userid,
            "height": heightP,
            "weight": weightP
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getUpdateResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });

    }

    function _getUpdateResult(arr) {
        if (arr[0].result == "-1") {
            validationMsgs("Profile not found.", "Update Failed", "Try Again");
        }
        else if (arr[0].result == "1") { 
            validationMsgs("Update success", "Update Success", "Close");
        }
        else {
            validationMsgs("An error occured.", "Update Failed", "Try Again");
        }
    }

    function updatePw(userType) {
        var url = serverURL() + "/updatePw.php";
        userid = localStorage.getItem('userid');

        if (userType == "participant") {
            oldPw = $("#txtOldPasswordP").val();
            newPw = $("#txtNewPasswordP").val();
        }
        else if(userType == "organiser"){
            oldPw = $("#txtOldPasswordO").val();
            newPw = $("#txtNewPasswordO").val();
        }
        else if (userType == "helper") {
            oldPw = $("#txtOldPasswordH").val();
            newPw = $("#txtNewPasswordH").val();
        }
        else { return false; }
        
        
        var JSONObject = {
            "userid": userid,
            "oldPw": oldPw,
            "newPw": newPw
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getUpdatePw(arr);
            },
            error: function () {
                validationMsg();
            }
        });

        function _getUpdatePw(arr) {
            if (arr[0].result == "-1") {
                validationMsgs("Incorrect password.", "Update Failed", "Try Again");
            }
            else if (arr[0].result == "1") {
                validationMsgs("Update success", "Update Success", "Close");
                $("#ParticipantProfileForm").trigger('reset');
                $("#ParticipantProfileFormPw").trigger('reset');
                $("#OrganiserProfileForm").trigger('reset');
                $("#HelperProfileForm").trigger('reset');
                getUserProfile();
            }
            else {
                validationMsgs("An error occured.", "Update Failed", "Try Again");
            }
        }
    }

 

    

})();

function goBack() {
    window.history.back();
}