function gocalculator(){
	window.location = "form.html";
}

function gohome()
{
	window.location = "index.html";
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
    } catch (e) {}
    return _result;
}

function isInt(value) {
	return !isNaN(value) && 
	parseInt(Number(value)) == value &&
	!isNaN(parseInt(value, 10));
}

function round(number, decimals) {
	return +(Math.round(number + "e+" + decimals) + "e-" + decimals);
	}
