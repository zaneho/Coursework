(function () {
    $(document).ready(function () {
   
        $("#JoinEvent").validate({
            messages: {
                txtSearchEvent: "Enter search term"
            },
            focusInvalid: false,
            submitHandler: function () {
                return false;
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().after());
            }
        });
        $("#btnSearchEvent").bind("click", function () {
            if ($("#JoinEvent").valid()) {
                searchEvent();
            }
        });
    });

    function searchEvent() {
        var url = serverURL() + "/searchevent.php";
        var JSONObject = {
            "eventname": localStorage.getItem("eventname"),
            "search": $("#txtSearchEvent").val()
        };
        $.ajax({
            url: url,
            type: 'GET',
            data: JSONObject,
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            success: function (arr) {
                _getSearchEventResult(arr);
            },
            error: function () {
                validationMsg();
            }
        });
    }

    function _getSearchEventResult(arr) {
        var t;
        if ($.fn.dataTable.isDataTable('#searchresult')) {
            t = $('#searchresult').DataTable();
        } else {
       
            t = $('#searchresult').DataTable({
                "searching": false,
                "lengthChange": false
            });
        }
        t.clear();
        for (var i = 0; i < arr.length; i++) {
            t.row.add([arr[i].eventname, arr[i].datetime, arr[i].userid,"<a href='#' class='ui-btn' id='btn" + arr[i].eventname + "'>View</a>"]).draw(false);

            $("#btn" + arr[i].eventname).bind("click", { id: arr[i].eventname }, function (event) {
                var data = event.data;
                showevent(data.id);

            });
        }
        $("#searchresult").show();
    }

    function showevent(eventname) {
        window.location = "showevent.html?eventname=" + eventname;
        clearForm();
    }

})();

    function goBack() {
        window.history.back();
    }

    function clearForm() {

        var frm = document.getElementsByName('JoinEvent')[0];
        frm.reset();  // Reset all form data
        return false; // Prevent page refresh
    }
