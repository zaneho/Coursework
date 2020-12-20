(function () {

     var userid = localStorage.getItem('userid');
     var password = localStorage.getItem('password');
     var organiser = localStorage.getItem('organiser');
     var usertype = localStorage.getItem('usertype');

     var helperid, eventname, deviceid, datetime, status;

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

        getNotification();

       
     });

    function getNotification() {
        var url = serverURL() + "/getNotification.php";

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
                _getNotificationResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getNotificationResult(arr) {
        var arrayLength = arr.length;
        if (arr.length > 0) {
            var tablearea, table, tr, th;
            var helperid, eventname, deviceid, datetime, status;

                tablearea = document.getElementById('notification');
                table = document.createElement('table');

                var counter = 1;
                for (i = 0; i < arrayLength; i++) { //add tr & td
                    tr = document.createElement('tr');
                    tr.appendChild(document.createElement('td'));
                    
                     row2 = document.createElement('tr');
                     row2.appendChild(document.createElement('td'));
                     row2.appendChild(document.createElement('td'));


                    helperid = arr[i].helperid.trim();
                    eventname = arr[i].eventname.trim();
                    deviceid = arr[i].deviceid.trim();
                    userid = arr[i].userid.trim();
                    datetime = arr[i].datetime.trim();
                    status = arr[i].status.trim();
                    dbId = arr[i].id;
                    

                    var useridDeviceidLbl = document.createElement("A");
                    var useridDeviceidText = document.createTextNode(userid + " using " + deviceid + " in " + eventname + " require medical assistance!");
                    useridDeviceidLbl.appendChild(useridDeviceidText);
                    useridDeviceidLbl.setAttribute("id", "useridDeviceid_" + dbId);
                    useridDeviceidLbl.id = "useridDeviceid_" + dbId;
                   

                    useridDeviceidLbl.style.fontSize = "medium";
                    useridDeviceidLbl.style.fontWeight = "bold";
                    useridDeviceidLbl.style.textDecoration = "none";
                    useridDeviceidLbl.style.color = "black";

                    var statusLbl = document.createElement("LABEL");                        
                    statusLbl.style.fontSize = "small";
                    if (status === "" || status === "otw" || status === "attending") {
                        statusLbl.style.color = "#dd7a00";
                    } else if (status === "completed") {
                        statusLbl.style.color = "green";
                    }

                    if (usertype === "helper") {
                        statusLbl.innerHTML = status;
                    } else if (usertype === "organiser") {
                        if (helperid !== "") {
                            statusLbl.innerHTML = "Assigned to: " + helperid + " " + status;                            
                        } else {
                            statusLbl.innerHTML = "unassigned";
                            statusLbl.style.color = "red";
                            if (status === "completed") {
                                statusLbl.innerHTML = "unassigned - completed";
                                statusLbl.style.color = "green";
                            } else if (status === "attending") {
                                statusLbl.innerHTML = "unassigned - attending";
                                statusLbl.style.color = "#dd7a00";
                            } else if (status === "otw") {
                                statusLbl.innerHTML = "unassigned - otw";
                                statusLbl.style.color = "#dd7a00";
                            }
                        }
                    }
                    

                    var datetimeLbl = document.createElement("LABEL");
                    datetimeLbl.innerHTML = datetime;
                    datetimeLbl.style.fontSize = "small";

                    counter += 1;


                    tr.cells[0].appendChild(useridDeviceidLbl);
                    tr.cells[0].colSpan = "2";
 
                    row2.cells[0].appendChild(statusLbl);
                    row2.cells[0].style.textAlign = "left";
                    row2.cells[0].style.borderBottom = "thin solid grey";

                    row2.cells[1].appendChild(datetimeLbl);
                    row2.cells[1].style.textAlign = "right";
                    row2.cells[1].style.borderBottom = "thin solid grey";

                    table.appendChild(tr);
                    table.appendChild(row2);

                }
                tablearea.appendChild(table);

                

                //var id;
                for (a = 0; a < arrayLength; a++) {

                    $("#useridDeviceid_" + arr[a].id).bind("click", { id: arr[a].id }, function (id) {
                        var data = id.data;
                        goRoute(data.id);
                        

                    });
                }
            }
         else {
            document.getElementById("notification").innerHTML = "- No Notification -";
            document.getElementById("notification").style.textAlign = "center";
        }

        

        function goRoute(id)
        { window.location = "Route.html?id=" + id; } 


}

 })();

     
    // END


    








  
 


