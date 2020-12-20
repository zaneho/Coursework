

    var userid = localStorage.getItem('userid');
    var password = localStorage.getItem('password');
    //var organiser = localStorage.getItem('organiser');
    var usertype = localStorage.getItem('usertype');


    $(document).ready(function () {
        setInterval(function () {
            getHelperLocation();
        }, 300000); //updateHelperLoc every 3min

        if (usertype === "participant") {
            document.getElementById("homeUser").style.display = "block";
            document.getElementById("homeUser").style.visibility = "visible";
            document.getElementById("homeAdmin").style.display = "none";
            document.getElementById("homeAdmin").style.visibility = "hidden";
            document.getElementById("homeHelper").style.display = "none";
            document.getElementById("homeHelper").style.visibility = "hidden";
        }
        else if (usertype === "organiser") {
            document.getElementById("homeAdmin").style.display = "block";
            document.getElementById("homeAdmin").style.visibility = "visible";
            document.getElementById("homeHelper").style.display = "none";
            document.getElementById("homeHelper").style.visibility = "hidden";
            document.getElementById("homeUser").style.display = "none";
            document.getElementById("homeUser").style.visibility = "hidden";
        }
        else if (usertype === "helper") {
            document.getElementById("homeHelper").style.display = "block";
            document.getElementById("homeHelper").style.visibility = "visible";
            document.getElementById("homeAdmin").style.display = "none";
            document.getElementById("homeAdmin").style.visibility = "hidden";
            document.getElementById("homeUser").style.display = "none";
            document.getElementById("homeUser").style.visibility = "hidden";
        }
        else {
            document.getElementById("homeAdmin").style.display = "none";
            document.getElementById("homeAdmin").style.visibility = "hidden";
            document.getElementById("homeUser").style.display = "none";
            document.getElementById("homeUser").style.visibility = "hidden";
        }


    });




function route() {
    window.location = "Route.html";
}

function profile() {
    window.location = "profile.html";
}

function notification() {
    window.location = "notification.html";
}

function join() {
    window.location = "searchevent.html";
}

function create() {
    window.location = "create.html";
}

function current() {
    window.location = "current.html";
}

function upcoming() {
    window.location = "upcoming.html";
}

function hist() {
    window.location = "history.html";
}

function logout() {
    window.location = "logout.html";
}