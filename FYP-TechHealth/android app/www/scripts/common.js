$(document).on("pagecontainertransition", adjustContentHeight);
$(window).on("resize", adjustContentHeight);
$(window).on("orientationchange", adjustContentHeight);

 function adjustContentHeight() {
    var headerHeights = 0;

    $('.ui-header').each(function (index, obj) {
        var itm = $(this);
        if (itm) {
            headerHeights = headerHeights + itm.outerHeight();
        }
    });

    var screen = $.mobile.getScreenHeight();
    var footer = $(".ui-footer").hasClass("ui-footer-fixed") ? $(".ui-footer").outerHeight() - 1 : $(".ui-footer").outerHeight();
    var contentCurrent = $(".ui-content").outerHeight() - $(".ui-content").height();

    var content = screen - headerHeights - footer - contentCurrent;
    $(".ui-content").height(content);
} 

function serverURL() {
    return "http://mp05.mybitmp.org/techhealth";
}

function validationMsgs(message, title, button) {
    navigator.notification.alert(message, function () { }, title, button);
}

function validationMsg() {
    validationMsgs("Unable to connect to server. Please try again later.", "Connection Problem", "OK");
}

function getRadioValue(groupName) {
    var _result;
    try {
        var o_radio_group = document.getElementsByName(groupName);
        for (var a = 0; a < o_radio_group.length; a++) {
            if (o_radio_group[a].checked) {
                _result = o_radio_group[a].value;
                break;
            }
        }
    } catch (e) { 
        alert(e);
    }
    return _result;
}

$(function () {
    $('a#logout').click(function () {
        if (confirm('Are you sure to logout?')) {

            //remove the userid and password from localstorage
            //since user is no longer logged in 
            localStorage.removeItem("userid");
            localStorage.removeItem("password");
            window.plugins.OneSignal.sendTag("email", "");
            //kick the user back to the login index page
            window.location = "index.html";
            return true;
        }
        return false;
    });
}); 

/*$("#logout").bind("click", function () {

    localStorage.removeItem("userid");
    localStorage.removeItem("password");

    //kick the user back to the login index page
    window.location = "index.html";
}); */



function getUrlVars() {
    var vars = {};

    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
        //key = decodeURIComponent(key);
        // value = decodeURIComponent(value);
   
        vars[key] = value;
    });
    return vars;

    
}
/*function getUrlVars() {
var urlParams;
(window.onpopstate = function () {
    var match,
        pl = /\+/g,  // Regex for replacing addition symbol with a space
        search = /([^&=]+)=?([^&]*)/g,
        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
        query = window.location.search.substring(1);

    urlParams = {};
    while (match = search.exec(query))
        urlParams[decode(match[1])] = decode(match[2]);
})();
    } */



//setInterval(function () { getHelperLocation(); }, 300000); //3 minute interval update to DB
//setInterval(function () { getHelperLocation(); }, 20000);


(function getHelperLocation() {
    var usertype = localStorage.getItem('usertype');
    if (usertype === "helper")
    {
        getLocation();
    }    
})();

var helperLat = '', helperLng = '';
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
    helperLat = position.coords.latitude;
    helperLng = position.coords.longitude;
    if (helperLat != '' && helperLng != '') {
        updateHelperLoc();
    }
}

function updateHelperLoc() {
    var url = serverURL() + "/updateHelperLoc.php";
    var JSONObject = {
        "userid": localStorage.getItem("userid"),
        "helperLat": helperLat,
        "helperLng": helperLng
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
            alert("Geolocation not available.");
        }
    });
}
