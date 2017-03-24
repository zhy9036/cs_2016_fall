"use strict";
/*
YANG ZHANG
CSE 154 HW9
This the js file for hw9
*/
(function(){	
	var URL = "https://webster.cs.washington.edu/cse154/babynames.php";
	window.onload = function(){
		var search = document.getElementById("search");
		fetchNames();
		// when click the botton fetch all kind of data
		search.onclick= function(){
			document.getElementById("resultsarea").style.display = "";
			document.getElementById("errors").innerHTML="";
			fetchMeaning();
			fetchRank();
			fetchCele();
		};
	};

	// function for fetching names
	function fetchNames(){
		var newReg = new XMLHttpRequest();
		newReg.onload = putNames;
		newReg.open("GET",URL+"?type=list", true);
		newReg.send();
	}
	
	// function for reciving names
	function putNames(){
		var names = this.responseText;
		var name = names.split("\n");
		var options = document.getElementById("allnames");
		
		if(name.length>0){
			options.disabled=false;
			document.getElementById("loadingnames").className="hide";
			document.getElementById("meaning");
			for(var i = 0; i<name.length; i++){
				var option = document.createElement("option");
				option.value = name[i];
				option.innerHTML = name[i];
				options.appendChild(option);
			}
		}
	}

	// function for fetching meaning of names
	function fetchMeaning(){
		var name = document.getElementById("allnames").value;
		document.getElementById("meaning").style.display="none";
		document.getElementById("loadingmeaning").style.display = "block";
		var newReg = new XMLHttpRequest();
		newReg.onload = getMeaning;
		newReg.open("GET",URL+"?type=meaning&name="+name, true);
		newReg.send();
	}

	// function for reciving and processing meaning
	function getMeaning(){

		var meaning = document.getElementById("meaning");
		if(this.status == 200){
			
			meaning.style.display="block";
			meaning.innerHTML=this.responseText;
		//error handling	
		}else{
			var errorMsg = document.createElement("span");
			var continer = document.createElement("p");
			errorMsg.innerHTML = "Cannot't get meaning, HTTP ERROR "+
			this.status+": "+this.responseText;
			continer.appendChild(errorMsg);
			document.getElementById("errors").appendChild(continer);		
		}
		document.getElementById("loadingmeaning").style.display = "none";
	}

	// function for fetching ranking data
	function fetchRank(){
		document.getElementById("graph").style.display = "none";
		document.getElementById("norankdata").style.display = "none";
		document.getElementById("loadinggraph").className = "";
		var newReg = new XMLHttpRequest();
		newReg.onload = getRank;
		var name = document.getElementById("allnames").value;
		var male = document.getElementById("genderm");
		var gender = (male.checked)? "m" : "f";
		newReg.open("GET",URL+"?type=rank&name="+name+"&gender="+gender, true);
		newReg.send();	
	}

	// function for ploting ranking table
	function getRank(){
		if(this.status == 200){
			document.getElementById("graph").style.display = "";
			var xml = this.responseXML.querySelectorAll("rank");
			var table = document.getElementById("graph");
			table.innerHTML = "";
			var trX = document.createElement("tr");
			var trY = document.createElement("tr");		
			for(var i =0; i<xml.length; i++){
				var year = document.createElement("th");
				year.innerHTML=xml[i].getAttribute("year");
				var bar = document.createElement("div");
				var td = document.createElement("td");
				var value = xml[i].textContent;
				bar.className = "bar";
				if(value!=0){
					var height = parseInt((1000-value)/4)+"px";
					bar.style.height = height;
					if(value>0 && value<11){
						bar.style.color = "red";
					}
				}else{
					bar.style.height = 0+"px";
				}
				bar.innerHTML = value;
				td.appendChild(bar);
				trX.appendChild(year);
				trY.appendChild(td);
			}
			table.appendChild(trX);
			table.appendChild(trY);
		//error handling	
		}else{
			if(this.status==410){
				document.getElementById("norankdata").style.display = "";
			}else{
				var errorMsg = document.createElement("span");
				var continer = document.createElement("p");
				errorMsg.innerHTML = "Cannot't get rank, HTTP ERROR "+
				this.status+": "+this.responseText;
				continer.appendChild(errorMsg);
				document.getElementById("errors").appendChild(continer);
			}
		}
		document.getElementById("loadinggraph").className = "hide";
	}

	// function for fetching cele info
	function fetchCele(){
		document.getElementById("celebs").style.display = "none";
	 	document.getElementById("loadingcelebs").className ="";
		var newReg = new XMLHttpRequest();
		newReg.onload = getCele;
		var name = document.getElementById("allnames").value;
		var male = document.getElementById("genderm");
		var gender = (male.checked)? "m" : "f";
		newReg.open("GET",URL+"?type=celebs&name="+name+"&gender="+gender, true);
		newReg.send();
	}

	// function for creating cele list
	function getCele(){
		if(this.status == 200){
			var celes = JSON.parse(this.responseText);
			var list = document.getElementById("celebs");
			list.style.display = "block";
			list.innerHTML = "";
			for(var i = 0; i<celes.actors.length; i++){
				var li = document.createElement("li");
				li.innerHTML = celes.actors[i].firstName+" "+celes.actors[i].lastName+
				" ("+celes.actors[i].filmCount+" films)";
				list.appendChild(li);
			}
		//error handling	
		}else{
			var errorMsg = document.createElement("span");
			var continer = document.createElement("p");
			errorMsg.innerHTML = "Cannot't get celebrities info, HTTP ERROR "+
			this.status+": "+this.responseText;
			continer.appendChild(errorMsg);
			document.getElementById("errors").appendChild(continer);
		}
		document.getElementById("loadingcelebs").className = "hide";
	}
}());








































