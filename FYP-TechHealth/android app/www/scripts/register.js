(function () {
    "use strict";

    var userid, password, usertype;    
    var name, nric, email, dob, height, weight;
    var orgname, orgemail;
    var helperName, helperEmail;
    var radioValue;

    $(document).ready(function () {
        $("input[name=radio-choice-h-2]").click(function () {
            radioValue = $("input[name='radio-choice-h-2']:checked").val();
            if (radioValue === "participant") {
                document.getElementById("RegisterParticipantForm").style.visibility = "visible";
                document.getElementById("RegisterParticipantForm").style.display = "block";

                document.getElementById("RegisterOrganiserForm").style.visibility = "hidden";
                document.getElementById("RegisterOrganiserForm").style.display = "none";

                document.getElementById("RegisterHelperForm").style.visibility = "hidden";
                document.getElementById("RegisterHelperForm").style.display = "none";
            }
            else if (radioValue === "organiser") {
                document.getElementById("RegisterParticipantForm").style.visibility = "hidden";
                document.getElementById("RegisterParticipantForm").style.display = "none";

                document.getElementById("RegisterOrganiserForm").style.visibility = "visible";
                document.getElementById("RegisterOrganiserForm").style.display = "block";

                document.getElementById("RegisterHelperForm").style.visibility = "hidden";
                document.getElementById("RegisterHelperForm").style.display = "none";
            }
            else if (radioValue === "helper") {
                document.getElementById("RegisterParticipantForm").style.visibility = "hidden";
                document.getElementById("RegisterParticipantForm").style.display = "none";
                
                document.getElementById("RegisterOrganiserForm").style.visibility = "hidden";
                document.getElementById("RegisterOrganiserForm").style.display = "none";

                document.getElementById("RegisterHelperForm").style.visibility = "visible";
                document.getElementById("RegisterHelperForm").style.display = "block";
            }
            else {
                document.getElementById("RegisterParticipantForm").style.visibility = "hidden";
                document.getElementById("RegisterParticipantForm").style.display = "none";
                
                document.getElementById("RegisterOrganiserForm").style.visibility = "hidden";
                document.getElementById("RegisterOrganiserForm").style.display = "none";

                document.getElementById("RegisterHelperForm").style.visibility = "hidden";
                document.getElementById("RegisterHelperForm").style.display = "none";
            }
        });

        $("#btnResetParticipant").bind("click", function () {
            $("#RegisterParticipantForm").trigger('reset');
        });

        $("#btnResetOrganiser").bind("click", function () {
            $("#RegisterOrganiserForm").trigger('reset');
        });

        $("#btnResetHelper").bind("click", function () {
            $("#RegisterHelperForm").trigger('reset');
        });

        $('#txtDOBP').dateDropper();

        $("#RegisterParticipantForm").validate({
            rules: {
                txtPasswordP: {
                    minlength: 8
                },
                txtPassword1P: {
                    equalTo: "#txtPasswordP"
                },
                txtNRICP: {
                    maxlength: 9,
                    minlength: 9
                },
                txtEmailP: {
                    email: true
                },
                txtHeightP: {
                    maxlength: 3,
                    minlength: 2,
                    number: true
                },
                txtWeightP: {
                    maxlength: 3,
                    minlength: 2,
                    number: true
                }
            },
            messages: {
                txtIdP: "User ID is required",
                txtPasswordP: {
                    required: "Password is required",
                    minlength: "Password minimum character is 8."
                },
                txtPassword1P: {
                    required: "Re-enter password is required",
                    equalTo: "Password does not match"
                },
                txtNameP: "Name is required",
                txtNRICP: {
                    required: "NRIC is required",
                    minlength: "Incorrect format (S1234567A)",
                    maxlength: "Incorrect format (S1234567A)"

                },
                txtEmailP: {
                    required: "Email is required",
                    email: "Incorrect format (eg. name@domain.com)"
                },
                txtHeightP: {
                    required: "Height is required",
                    number: "Height must be in numbers."
                },
                txtWeightP: {
                    required: "Weight is required",
                    number: "Weight must be in numbers."
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

        $("#RegisterOrganiserForm").validate({
            rules: {
                txtPasswordO: {
                    minlength: 8
                },
                txtPassword1O: {
                    equalTo: "#txtPasswordO"
                },
                txtEmailO: {
                    email: true
                }
            },
            messages: {
                txtIdO: "User ID is required",
                txtPasswordO: {
                    required: "Password is required",
                    minlength: "Password minimum character is 8."
                },
                txtPassword1O: {
                    required: "Re-enter password is required",
                    equalTo: "Password does not match"
                },
                txtNameO: "Name is required",
                txtEmailO: {
                    required: "Email is required",
                    email: "Incorrect format (eg. name@domain.com)"
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

        $("#RegisterHelperForm").validate({
            rules: {
                txtPasswordH: {
                    minlength: 8
                },
                txtPassword1H: {
                    equalTo: "#txtPasswordH"
                },
                txtEmailH: {
                    email: true
                }
            },
            messages: {
                txtIdH: "User ID is required",
                txtPasswordH: {
                    required: "Password is required",
                    minlength: "Password minimum character is 8."
                },
                txtPassword1H: {
                    required: "Re-enter password is required",
                    equalTo: "Password does not match"
                },
                txtNameH: "Name is required",
                txtEmailH: {
                    required: "Email is required",
                    email: "Incorrect format (eg. name@domain.com)"
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
        



        $("#btnSubmitParticipant").bind("click", function () {
            if ($("#RegisterParticipantForm").valid()) {
                registerUser();
            }
        });

        $("#btnSubmitOrganiser").bind("click", function () {
            if ($("#RegisterOrganiserForm").valid()) {
                registerUser();
            }
        });

        $("#btnSubmitHelper").bind("click", function () {
            if ($("#RegisterHelperForm").valid()) {
                registerUser();
            }
        });

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
    });

    function registerUser() {
        var url = serverURL() + "/registerUser.php";
        var JSONObject;
        if (radioValue === "participant") {
            userid = $("#txtIdP").val();
            password = $("#txtPasswordP").val();
            usertype = 'participant';

            name = $("#txtNameP").val();
            nric = $("#txtNRICP").val();
            email = $("#txtEmailP").val();
            var date = $("#txtDOBP").val();
            dob = date.split("-").reverse().join("-");
            //dob = $("#txtDOBP").val();
            height = $("#txtHeightP").val();
            weight = $("#txtWeightP").val();

            JSONObject = {
                "userid": userid,
                "password": password,
                "usertype": usertype,
                "name": name,
                "nric": nric,
                "email": email,
                "dob": dob,
                "height": height,
                "weight": weight
            };
        }
        else if (radioValue === "organiser") {
            userid = $("#txtIdO").val();
            password = $("#txtPasswordO").val();
            usertype = 'organiser';

            orgname = $("#txtNameO").val();
            orgemail = $("#txtEmailO").val();

            JSONObject = {
                "userid": userid,
                "password": password,
                "usertype": usertype,
                "orgname": orgname,
                "orgemail": orgemail

            };
        }
        else if (radioValue === "helper") {
            userid = $("#txtIdH").val();
            password = $("#txtPasswordH").val();
            usertype = 'helper';

            helperName = $("#txtNameH").val();
            helperEmail = $("#txtEmailH").val();

            JSONObject = {
                "userid": userid,
                "password": password,
                "usertype": usertype,

                "helperName": helperName,
                "helperEmail": helperEmail

            };
        }
        else { alert("Please select user type"); }
        
        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getRegisterUserResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getRegisterUserResult(arr) {
        if (arr[0].result === 1) {
            navigator.notification.alert("User registration success", function () { window.location = "index.html"; }, "Success", "Proceed to login");

            //validationMsgs("User registration success", "Success", "Proceed to login");
            //window.location = "index.html";
        } else {
            navigator.notification.alert("Failed to register user", function () { indow.location = "register.html"; }, "Error", "Try Again");

            //validationMsgs("Failed to register user", "Error", "Try Again");

            //window.location = "register.html";
        }
    }
})();