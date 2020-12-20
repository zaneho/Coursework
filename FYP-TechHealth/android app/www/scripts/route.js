(function () {
    var userid = localStorage.getItem('userid');
    var password = localStorage.getItem('password');
    //var organiser = localStorage.getItem('organiser');
    var usertype = localStorage.getItem('usertype');

    var helperid = "", eventname, deviceid, datetime, status, participantLat = "", participantLng = "";
    var helperLat = "", helperLng = "";

    var latlng, myPosition;
    var map;
    var gmap;
    var myLat, myLng;

    //#btnGo findmyplace();
    var allMarkers = [];
    var infowindow;

    //var destLat = 1.3526, destLng = 103.9447; //hardcoded - to be retrieved from DB
    var assignedHelperId = decodeURIComponent(getUrlVars()["id"]);

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
        }
        else if (usertype === "organiser") {
            document.getElementById("navAdmin").style.display = "block";
            document.getElementById("navAdmin").style.visibility = "visible";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
        }

        else if (usertype === "helper") {
            document.getElementById("navHelper").style.display = "block";
            document.getElementById("navHelper").style.visibility = "visible";
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
        }

        else {
            document.getElementById("navAdmin").style.display = "none";
            document.getElementById("navAdmin").style.visibility = "hidden";
            document.getElementById("navUser").style.display = "none";
            document.getElementById("navUser").style.visibility = "hidden";
            document.getElementById("navHelper").style.display = "none";
            document.getElementById("navHelper").style.visibility = "hidden";
        }

        getPosition();

        function getPosition() {
            if (navigator.geolocation !== null) {
                $("#mapMyHome").height(screen.height - 300);
                navigator.geolocation.getCurrentPosition(onSuccess, onError);
            } else {
                alert("navigator.geolocation == null");
            }
        }
        

        //$("#btnGetRoute").bind("click", function () {
        //    GetRoute();
        //});

        $("#aRefresh").bind("click", function () {
            //whereami();
            //GetRoute();
            getPosition();
        });

        $("#btnNearbyHospital").bind("click", function () {
            findPlaceByType("hospital");
        });

        $("#btnOTW").bind("click", function () {
            updateRouteStatus("otw");
        });
        $("#btnAttending").bind("click", function () {
            updateRouteStatus("attending");
        });
        $("#btnCompleted").bind("click", function () {
            updateRouteStatus("completed");
        });
    });

    function onSuccess(position) {
        myPosition = position;
        //gmap start
        myLat = position.coords.latitude;
        myLng = position.coords.longitude;

        gmap = new GMaps({
            el: '#map',
            lat: myLat,
            lng: myLng
        });
        gmap.addMarker({
            lat: myLat,
            lng: myLng,
            title: 'Your location',
            infoWindow: {
                content: '<p>Your location</p>'
            }
        });
        //gmap end
        drawMap(position.coords.latitude, position.coords.longitude);
        GetRoute();

    }

    function onError(error) {
        console.log('code: ' + error.code + '\n' + 'message: ' + error.message + '\n');
    }

    function drawMap(currentLatitude, currentLongtitude) {
        //Creates a new google maps object
        latlng = new google.maps.LatLng(currentLatitude, currentLongtitude);
        var mapOptions = {
            center: latlng,
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoomControl: true,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL,
                position: google.maps.ControlPosition.LEFT_TOP
            }
        };

        var myLatLng = { lat: currentLatitude, lng: currentLongtitude };

        var marker = new google.maps.Marker({
            position: myLatLng,
            map: latlng,
            title: 'Hello World!'
        });

        map = new google.maps.Map($("#mapMyHome").get(0), mapOptions);
        marker.setMap(map);
    }

    function GetRoute() {
        getParticipantGPS();

        $('#distanceDuration').empty();
        if ($('ul#instructions li').length >= 1)
        { $('#instructions').empty(); }
        
    }

    //function whereami() {
    //    if (navigator.geolocation !== null) {
    //        $("#mapMyHome").height(screen.height - 300);
    //        navigator.geolocation.getCurrentPosition(onSuccess, onError);
    //    } else {
    //        alert("navigator.geolocation == null");
    //    }
    //    updateLocation(myPosition);
    //}

    //function updateLocation(position) {
    //    $('#instructions').empty();

    //    gmap = new GMaps({
    //        el: '#map',
    //        lat: position.coords.latitude,
    //        lng: position.coords.longitude
    //    });
    //    gmap.addMarker({
    //        lat: position.coords.latitude,
    //        lng: position.coords.longitude,
    //        title: 'Your location',
    //        infoWindow: {
    //            content: '<p>Updated location</p>'
    //        }
    //    });
    //}


    function findPlaceByType(placetype) {
        var request = {
            location: latlng,
            radius: '500',
            type: [placetype]
        };

        var service = new google.maps.places.PlacesService(map);
        service.textSearch(request, callback);
    }

    //function findmyplace() {
    //    var request = {
    //        location: latlng,
    //        radius: '500',
    //        query: $("#txtPlace").val()
    //    };
    //    var service = new google.maps.places.PlacesService(map);
    //    service.textSearch(request, callback);
    //    alert("findmyplace");
    //}

    function callback(results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
                var place = results[i];
                createMarker(results[i]);
            }
        }
    }

    function createMarker(place) {
        gmap.addMarker({
            lat: place.geometry.location.lat(),
            lng: place.geometry.location.lng(),
            icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|ABC',
            title: 'Searched location',
            infoWindow: {
                content: place.name
            }
        });


    }

    function getParticipantGPS() {
        var url = serverURL() + "/getParticipantGPS.php";
        
        var JSONObject = {
            "id": assignedHelperId
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getParticipantGPSResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getParticipantGPSResult(arr) {
        if (arr.length > 0) {
                helperid = arr[0].helperid.trim();
                eventname = arr[0].eventname.trim();
                deviceid = arr[0].deviceid.trim();
                userid = arr[0].userid.trim();
                document.getElementById("participantDetail").innerHTML = userid + " wearing " + deviceid + " in " + eventname;
                
                datetime = arr[0].datetime.trim();
                status = arr[0].status.trim();
                dbId = arr[0].id;
                participantLat = arr[0].latitude.trim();
                participantLng = arr[0].longitude.trim();
                helperLat = arr[0].helperlatitude.trim();
                helperLng = arr[0].helperlongitude.trim();

        }
        if (status === "completed") {
            document.getElementById("MapInstruction").style.display = "none";
            document.getElementById("MapInstruction").style.visibility = "hidden";
        }
        if (status !== "") {
            document.getElementById("currentStatus").innerText = "Current Status: " + status;
        }


        if (usertype === "helper" && helperid !== "" || usertype === "organiser" && helperid === "") {
            if (status !== "") {
                document.getElementById("currentStatus").innerText = "Current Status: " + status;

                if (status === "otw") {
                    document.getElementById("btnOTW").style.display = "none";
                    document.getElementById("btnOTW").style.visibility = "hidden";
                    document.getElementById("btnAttending").style.display = "block";
                    document.getElementById("btnAttending").style.visibility = "visible";
                    document.getElementById("btnCompleted").style.display = "none";
                    document.getElementById("btnCompleted").style.visibility = "hidden";
                } else if (status === "attending") {
                    document.getElementById("btnOTW").style.display = "none";
                    document.getElementById("btnOTW").style.visibility = "hidden";
                    document.getElementById("btnAttending").style.display = "none";
                    document.getElementById("btnAttending").style.visibility = "hidden";
                    document.getElementById("btnCompleted").style.display = "block";
                    document.getElementById("btnCompleted").style.visibility = "visible";
                } else if (status === "completed") {
                    document.getElementById("btnOTW").style.display = "none";
                    document.getElementById("btnOTW").style.visibility = "hidden";
                    document.getElementById("btnAttending").style.display = "none";
                    document.getElementById("btnAttending").style.visibility = "hidden";
                    document.getElementById("btnCompleted").style.display = "none";
                    document.getElementById("btnCompleted").style.visibility = "hidden";

                }
            } else {
                document.getElementById("currentStatus").innerText = "Please update status.";
                document.getElementById("btnOTW").style.display = "block";
                document.getElementById("btnOTW").style.visibility = "visible";
                document.getElementById("btnAttending").style.display = "block";
                document.getElementById("btnAttending").style.visibility = "visible";
                document.getElementById("btnCompleted").style.display = "block";
                document.getElementById("btnCompleted").style.visibility = "visible";
            }
        }
        else {
            document.getElementById("btnOTW").style.display = "none";
            document.getElementById("btnOTW").style.visibility = "hidden";
            document.getElementById("btnAttending").style.display = "none";
            document.getElementById("btnAttending").style.visibility = "hidden";
            document.getElementById("btnCompleted").style.display = "none";
            document.getElementById("btnCompleted").style.visibility = "hidden";
        }

        if (participantLat !== "" && participantLng !== "") {
            gmap.travelRoute({
                origin: [myLat, myLng],
                //destination: [destLat, destLng],
                destination: [participantLat, participantLng],
                travelMode: 'driving',
                step: function (e) {
                    $('#instructions').append('<li>' + e.instructions + '</li>');
                    $('#instructions li:eq(' + e.step_number + ')').delay(350 * e.step_number).fadeIn(200, function () {
                        gmap.drawPolyline({
                            path: e.path,
                            strokeColor: '#00e673',
                            strokeOpacity: 0.5,
                            strokeWeight: 5
                        });
                    });
                }
            });
            gmap.addMarker({
                //lat: destLat,
                //lng: destLng,
                lat: participantLat,
                lng: participantLng,
                title: 'Destination',
                infoWindow: {
                    content: '<p>Participant Location</p>'
                }
            });

            if (usertype === "organiser" && helperLat !=="" && helperLng !=="") {
                gmap.addMarker({
                    lat: helperLat,
                    lng: helperLng,
                    title: 'HelperLocation',
                    icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|ABC',
                    infoWindow: {
                        content: '<p>Helper Location</p>'
                    }
                });
            }

            var origin1 = new google.maps.LatLng(myLat, myLng);
            //var destination1 = new google.maps.LatLng(destLat, destLng);
            var destination1 = new google.maps.LatLng(participantLat, participantLng);
            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix(
                {
                    origins: [origin1],
                    destinations: [destination1],
                    travelMode: 'DRIVING',
                    unitSystem: google.maps.UnitSystem.METRIC,
                    avoidHighways: false,
                    avoidTolls: false
                }, callbackDistanceMatrix);
        } else { alert("Unable to retrieve participant GPS. Please try again."); }
    }

    function callbackDistanceMatrix(response, status) {
        if (status === 'OK') {
            var origins = response.originAddresses;
            var destinations = response.destinationAddresses;
            //alert("Origin:" + origins + "@@<br><br>Destination:" + destinations);
            for (var i = 0; i < origins.length; i++) {
                var results = response.rows[i].elements;
                for (var j = 0; j < results.length; j++) {
                    var element = results[j];
                    var distance = element.distance.text;
                    var duration = element.duration.text;
                    var from = origins[i];
                    var to = destinations[j];
                    //alert("Dis:" + distance + "@@Dur:" + duration);

                    var theDiv = document.getElementById("distanceDuration");
                    theDiv.innerHTML = "Distance: " + distance.bold() + " Duration: " + duration.bold();
                }
            }
        }
    }

    function updateRouteStatus(status) {
        var url = serverURL() + "/updateRouteStatus.php";

        var JSONObject = {
            "id": assignedHelperId,
            "status": status
        };

        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _updateRouteStatusResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }
    function _updateRouteStatusResult(arr) {
       if (arr[0].result === 1) {
           validationMsgs("Update success", "Update Success", "Close");
           location.reload();
        }
        else {
            validationMsgs("An error occured.", "Update Failed", "Try Again");
        }
    }
})();