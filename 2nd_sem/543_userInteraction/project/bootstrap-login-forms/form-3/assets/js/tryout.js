
"use strict";
function mydate(){
	    alert("mydate");
		document.getElementById("dt").hidden=false;
		document.getElementById("ndt").hidden=true;
}
function mydate1(){
	d=new Date(document.getElementById("dt").value);
	dt=d.getDate();
	mn=d.getMonth();
	mn++;
	yy=d.getFullYear();
	document.getElementById("ndt").value=dt+"/"+mn+"/"+yy
	document.getElementById("ndt").hidden=false;
	document.getElementById("dt").hidden=true;
}
(function(){
	if(document.getElementById("signUp")){
		document.getElementById("signUp").onclick = function(){
			window.location.href = "signup.html";
		}
	}
	if(document.getElementById("signupSubmit")){
		document.getElementById("signupSubmit").onclick = function(){
			
			window.location.href = "main.html";
		}
	}
})();