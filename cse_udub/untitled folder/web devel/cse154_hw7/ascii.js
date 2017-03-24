/*
YANG ZHANG
CSE 154 AA
HW7
This is the js file for ascii.html
*/
"use strict";
var timer = null;
var index = 0;
var curAni = null;
var speed = 250;

//This function is to get animation string and display it.
function animation(){
	var textin = document.getElementById("myt");
	var sel = document.getElementById("sel_an").value;
	textin.value = ANIMATIONS[sel];
}

//This function is to start the timer.
function go(){
	timer = setInterval(start, speed);
}

//This function is to show the animation frame by frame.
function start(){
	var textin = document.getElementById("myt");
	if(textin.value != ""){
		var frames = curAni.split("=====\n");
		if(index <= frames.length-1){
			textin.value = frames[index];
			index++;
		}else{
			index = 0;
			textin.value = frames[index];
			index++;
		}
	}
}

//This function is to change the play speed.
function change_speed(){
	var radioArray = document.getElementsByName("haha");
	var start = document.getElementById("start");
	for(var i = 0; i< radioArray.length; i++){
		if(radioArray[i].checked ){
			speed = radioArray[i].value;
			if(start.disabled){
				clearInterval(timer);
				go();
			}			
		}
	}
}

//This function is to change the size of ascii chars.
function change_size(){
	var size = document.getElementById("size").value;
	document.getElementById("myt").style.fontSize = size;
}

//This anonymous function contains all the event logic and will be 
//excuted when the page is fully loaded.
window.onload = function() {
	var sel = document.getElementById("sel_an");
	var start = document.getElementById("start");
	var stop = document.getElementById("stop");
	var size = document.getElementById("size");
	var radioArray = document.getElementsByName("haha");
	var screen = document.getElementById("myt");
	for(var i = 0; i< radioArray.length; i++){
		radioArray[i].onchange = change_speed;
	}
	size.onchange = change_size;
	stop.disabled=true;
	sel.onchange = animation;
	start.onclick = function() {
		var textin = document.getElementById("myt");
		curAni = textin.value;
		go();
		start.disabled=true;
		sel.disabled=true;
		stop.disabled=false;	
	};
	stop.onclick = function() { 
		clearInterval(timer);
		screen.value = curAni;
		start.disabled=false;
		sel.disabled=false;
		stop.disabled=true; 
		index=0;
	};
};
