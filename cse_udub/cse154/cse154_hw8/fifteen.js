/*

ZHANG, YANG
This the js file for puzzle game
*/


 "use strict";

 // module pattern avoid global variables
(function(){
	var tiles = [];
	window.onload = function(){
		setTiles();
		showTiles();
		var sbutton = document.getElementById("shufflebutton");
		sbutton.onclick = shuffle;
		for(var i = 1; i<16; i++){
			var play = document.getElementById(i+"");
			play.onclick = slide;
			play.onmouseover = cover;
			play.onmouseout = recover;
		}
	};

	//function for performing behavior when cursor covers a tile 
	function cover(){
		var indexs = checkmove(this.id);
		this.style.cursor="pointer";
		console.log("this tile r is: "+indexs[0]+"    this tile c is: "+indexs[1]);
		if(indexs[3]){
			this.classList.add("cover");
		}
	}

	function recover(){
		this.classList.remove("cover");
	}

	//function for shuffle tiles
	function shuffle(){
		for(var i = 0; i<1000; i++){
			var index = getIndexById("blank");
			var r = index[0]; var c = index[1];
			var neigbor = [];
			checkvaild(r,c,neigbor,true);
			var random = parseInt(Math.random()*(neigbor.length));
			random = neigbor[random].split(".");
			var r1 = random[0]; var c2 = random[1];
			swap(r1,c2,r,c);
		}
		showTiles();
	}

	//function for putting tiles on the screen in sequence
	function showTiles(){
		
		var whole = document.getElementById("puzzlearea");
		var x = 0;
		var y = 0;
		for(var r=0; r<4; r++){
			for(var c=1; c<5; c++){
				//tiles[r][c].style.position = "static";
				
				tiles[r][c].style.left = x + 'px';
				tiles[r][c].style.top = y + 'px';
				whole.appendChild(tiles[r][c]);
				x += 100;
			}
			x = 0;
			y += 100;
		}
		/*
		for(var r=0; r<4; r++){
			for(var c=1; c<5; c++){
				var x = tiles[r][c].style.offsetLeft;
				var y = tiles[r][c].style.offsetTop;
				console.log("this tile r is: "+x);
				tiles[r][c].style.position = "absolute";
				tiles[r][c].style.left = x;
				tiles[r][c].style.top = y;
				//whole.appendChild(tiles[r][c]);
				//tiles[r][c].style.left = x + 'px';
				//tiles[r][c].style.top = y + 'px';
			}
		}
		*/
	}

	//function for performing the move action
	function slide(){
		var indexs = checkmove(this.id);
		if(indexs[3]){
			swap(indexs[0],indexs[1],indexs[2],indexs[3]);
			showTiles();
		}
	}

	//function for checking vaildty for moving a tile
	function checkmove(thisid){
		var index = getIndexById(thisid);
		var r = index[0];
		var c = index[1];
		checkvaild(r,c,index,false);
		return index;
	}

	//function for checking vaildty for moving and shuffle
	// shullfeMode is true for shuffle check
	function checkvaild(r,c,mylist,shuffleMode){
		// r is row, c is column

		//check down
		if(r > 0){
			if(!shuffleMode){
				if(tiles[r-1][c].id == "blank"){
					mylist[2]=r-1;
					mylist[3]=c;
				}
			}else{
				mylist.push((r-1)+"."+c);
			}
		}
		//check up
		if(r < 3){
			if(!shuffleMode){
				if(tiles[r+1][c].id == "blank"){
					mylist[2]=r+1;
					mylist[3]=c;
				}
			}else{
				mylist.push((r+1)+"."+c);
			}	
		}
		//check left
		if(c > 1){
			if(!shuffleMode){
				if(tiles[r][c-1].id == "blank"){
					mylist[2]=r;
					mylist[3]=c-1;
				}
			}else{
				mylist.push(r+"."+(c-1)); 
			}
		}
		//check right
		if(c < 4){
			if(!shuffleMode){
				if(tiles[r][c+1].id == "blank"){
					mylist[2]=r;
					mylist[3]=c+1;
				}
			}else{
				mylist.push(r+"."+(c+1)); 	
			}
		}
	}

	//function for creating tiles
	function setTiles(){
		var x = 0;
		var y = 0;
		for(var r=0; r<4; r++){
			tiles[r] = [];
			for(var c=1; c<5; c++){
				var index = c+r*4;
				tiles[r][c] = document.createElement("div");
				if(index<16){
					tiles[r][c].classList.add("tile");
					tiles[r][c].innerHTML = index+"";
					tiles[r][c].id = index+"";
					//tiles[r][c].style.backgroundImage="url('{% static "personal/img/background.jpg" %}')";
					//tiles[r][c].style.backgroundImage="url('{{ STATIC_URL }} personal/img/background.jpg ')";
					tiles[r][c].style.backgroundPosition=x+"px "+y+"px";
				}else{
					tiles[r][c].classList.add("blank");
					tiles[r][c].id = "blank";
				}
				x=x-100;
			}
			x=0;
			y=y-100;
		}
	}

	//Returns index of tile by matching passed in id
	function getIndexById(thisid){
		var index=[];
		for(var r=0; r<4; r++){
			for(var c=1; c<5; c++){
				if(tiles[r][c].id == thisid){
					index = [r,c];
					return index;
				}
			}
		}
	}

	//Swap between tiles
	function swap(r1,c1,r2,c2){
		if(r1>r2){ //move up
			var index = c1 + r1*4;
			$(tiles[r1][c1]).animate({top: '-=100px'});
			$(tiles[r2][c2]).animate({top: '+=100px'});
		}
		if(r1<r2){ //move down
			var index = c1 + r1*4;
			$(tiles[r1][c1]).animate({top: '+=100px'});
			$(tiles[r2][c2]).animate({top: '-=100px'});
		}
		if(c1>c2){ //move left
			var index = c1 + r1*4;
			$(tiles[r1][c1]).animate({left: '-=100px'});
			$(tiles[r2][c2]).animate({left: '+=100px'});
		}
		if(c1<c2){ //move right
			var index = c1 + r1*4;
			$(tiles[r1][c1]).animate({left: '+=100px'});
			$(tiles[r2][c2]).animate({left: '-=100px'});
		}
		var temp = tiles[r1][c1];
		tiles[r1][c1] = tiles[r2][c2];
		tiles[r2][c2] = temp;
	}
})();