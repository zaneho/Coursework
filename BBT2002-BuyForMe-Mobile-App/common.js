  	function serverURL(){
		return "http://1505874f.projectsbit.org/buyforme";
		}
  	
  	function getUrlVars() {
  	    var vars = {};
  	    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
  	        function(m, key, value) {
  	            vars[key] = value;
  	        });
  	    return vars;
  	}
  	
  	function newuser(){
  		window.location = "newuser.html";
  		}
  	
  	function home() {
  	    window.location = "home.html";
  	}

  	function locationPage() {
  	    window.location = "location.html";
  	}

  	function profilePage() {
  	    window.location = "profile.html";
  	}

  	function searchPage() {
  	    window.location = "search.html";
  	}
  	
  	function topup() {
  	    window.location = "topup.html";
  	}
  	
  	function friends() {
  	    window.location = "friends.html";
  	}
  	
  	function buyForMe() {
  	    window.location = "buyforme.html";
  	}

  	function logout() {
  		//remove userid and password from localstrorage
  	    localStorage.removeItem("userid");
  	    localStorage.removeItem("password");
  	    
  	    //kick the user back to index.html
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
    	 } catch (e) { }
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
	
	function changepicture(){
  		window.location = "changepicture.html";
  		}
	
	function updateme(){
  		window.location = "updateme.html";
  		}
	
	function updatepassword(){
  		window.location = "updatepassword.html";
  		}
