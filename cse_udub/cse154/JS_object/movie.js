function Movie(title, genre, rating){
	this.title = title;
	this.genre = genre;
	this.rating = rating;
	this.mainDiv = document.createElement("div");
	
	this.createHTML = function(){
		var btn = document.createElement("button");
		var pTitle = document.createElement("p");
		var pGenre = document.createElement("p");
		var pRating = document.createElement("p");

		mainDiv.classList.add("movie");
		btn.classList.add("delete");
		btn.innerHTML = "X";
		pRating.classList.add("rating");
		pRating.innerHTML=this.rating;
		pGenre.classList.add("genre");
		pGenre.innerHTML=this.genre;
		pTitle.classList.add("rating");
		pTitle.innerHTML=this.title;
		
		mainDiv.appendChild(btn);
		mainDiv.appendChild(pTitle);
		mainDiv.appendChild(pGenre);
		mainDiv.appendChild(pRating);

	};	

	this.deleteMe=function(){
		this.mainDiv.innerHTML="";
	};
}