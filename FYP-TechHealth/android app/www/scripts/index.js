/*(function () {
    "use strict";

    var userid;
    var password;

    $(document).ready(function () {

        $("#LoginForm").validate({
            messages: {
                txtLogin: "User ID is required",
                txtPassword: "Password is required"
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });

        $("#btnLogin").bind("click", function () {
            if ($("#LoginForm").valid()) {
                login();
            }
        });

        $("#btnRegister").bind("click", function () {
            window.location = "register.html";
        });
    });

    function login() {
        var url = serverURL() + "/login.php";
        userid = $("#txtLogin").val();
        password = $("#txtPassword").val();

        var JSONObject = {
            "userid": userid,
            "password": password
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getLoginResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getLoginResult(arr) {
        if (arr[0].result.trim() === "0") { //participant
            localStorage.setItem("userid", userid);
            localStorage.setItem("password", password);
            localStorage.setItem("organiser", "0");
            //alert("u r participant");
            window.location = "home.html";
        }
        else if (arr[0].result.trim() === "1") { //organiser
            localStorage.setItem("userid", userid);
            localStorage.setItem("password", password);
            localStorage.setItem("organiser", "1");
            //alert("u r organiser");
            window.location = "home.html";
        }
        else {
            validationMsgs("You have entered an invalid Username or Password.", "Login Failed", "Try Again");
        }
    }
})(); */


﻿document.addEventListener('deviceready', function () {
    // Enable to debug issues.
    // window.plugins.OneSignal.setLogLevel({logLevel: 4, visualLevel: 4});

    var notificationOpenedCallback = function (jsonData) {
        console.log('notificationOpenedCallback: ' + JSON.stringify(jsonData));
    };

    window.plugins.OneSignal
        .startInit("dc1774ff-bb67-4d04-b844-bdd2101f142b")
        .handleNotificationOpened(notificationOpenedCallback)
        .endInit();

    // Call syncHashedEmail anywhere in your app if you have the user's email.
    // This improves the effectiveness of OneSignal's "best-time" notification scheduling feature.
    // window.plugins.OneSignal.syncHashedEmail(userEmail);
}, false);

(function () {
    "use strict";

    var userid;
    var password;
    var organiser;//sk
    var usertype;

    $(document).ready(function () {

        $("#LoginForm").validate({
            messages: {
                txtLogin: "User ID is required",
                txtPassword: "Password is required"
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });

        $("#btnLogin").bind("click", function () {
            if ($("#LoginForm").valid()) {
                login();
            }
        });

        $("#btnRegister").bind("click", function () {
            window.location = "register.html";
        });
    });

    function login() {
        var url = serverURL() + "/login.php";
        userid = $("#txtLogin").val();
        password = $("#txtPassword").val();

        var JSONObject = {
            "userid": userid,
            "password": password
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getLoginResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getLoginResult(arr) {
        if (arr[0].result.trim() === "participant") { //participant
            localStorage.setItem("userid", userid);
            localStorage.setItem("password", password);
            localStorage.setItem("usertype", "participant");
          //  alert("u r participant");
            window.location = "home.html";
        }
        else if (arr[0].result.trim() === "organiser") { //organiser
            var url = serverURL() + "/login.php";//sk //##################### ask: what this for?? START ###################
            organiser = '1';//sk
            userid = $("#txtLogin").val();
            password = $("#txtPassword").val();

            var JSONObject = {//sk
                "organiser": organiser,//sk  
                "userid": userid,
                "password": password
            };

            $.ajax({//sk
                url: url,//sk
                type: 'GET',//sk
                data: JSONObject,//sk
                dataType: 'json',//sk
                contentType: "application/json; charset=utf-8"//sk
            });//sk                             //##################### ask: what this for?? END ###################

            window.plugins.OneSignal.sendTag("email", userid);//sk
            localStorage.setItem("userid", userid);
            localStorage.setItem("password", password);
            localStorage.setItem("usertype", "organiser");
          //  alert("u r organiser");
            window.location = "home.html";

           
        }
        else if (arr[0].result.trim() === "helper") { //helper
            localStorage.setItem("userid", userid);
            localStorage.setItem("password", password);
            localStorage.setItem("usertype", "helper");

            window.plugins.OneSignal.sendTag("email", userid);

            //  alert("u r helper");
            window.location = "home.html";
        }
        else {
            validationMsgs("You have entered an invalid Username or Password.", "Login Failed", "Try Again");
        }
    }
})();

