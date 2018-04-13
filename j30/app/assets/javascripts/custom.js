$(document).ready(function(){
	$("#presentation").click(function(){
	    $("#presentation-content").show();
	    $("#menu-content").hide();
	    $("#lorem-content").hide();
	});

	$("#menu").click(function(){
	    $("#menu-content").show();
	    $("#presentation-content").hide();
	    $("#lorem-content").hide();
	});

	$("#lorem").click(function(){
	    $("#lorem-content").show();
	    $("#presentation-content").hide();
	    $("#menu-content").hide();
	});

// Carousel
var intervalId;
var a = function(){    
        $(".slider ul li:first-child").animate({"margin-left": -350}, 800, function(){    
	$(this).css("margin-left",0).appendTo(".slider ul");    
	})
};

$(function(){ 
	intervalId = setInterval(a,5000);
	
	$("#next").click(function(){
		clearInterval(intervalId);
			$(".slider ul li:first-child").animate({"margin-left": -350}, 800, function(){    
				$(this).css("margin-left",0).appendTo(".slider ul");
			}) 
		intervalId = setInterval(a,5000);
	});
	
	$("#prev").click(function(){
		clearInterval(intervalId);
			$(".slider ul li:last-child").prependTo(".slider ul").css("margin-left","-350px").animate({"margin-left": 0}, 800, function(){    		
			})
		intervalId = setInterval(a,5000);
	});	
});
});

// // Dots
// var slideIndex = 1;
// showSlides(slideIndex);

// // Next/previous controls
// function plusSlides(n) {
//   showSlides(slideIndex += n);
// }

// // Thumbnail image controls
// function currentSlide(n) {
//   showSlides(slideIndex = n);
// }

// function showSlides(n) {
//   var i;
//   var slides = document.getElementsByClassName("mySlides");
//   var dots = document.getElementsByClassName("dot");
//   if (n > slides.length) {slideIndex = 1} 
//   if (n < 1) {slideIndex = slides.length}
//   for (i = 0; i < slides.length; i++) {
//       slides[i].style.display = "none"; 
//   }
//   for (i = 0; i < dots.length; i++) {
//       dots[i].className = dots[i].className.replace(" active", "");
//   }
//   slides[slideIndex-1].style.display = "block"; 
//   dots[slideIndex-1].className += " active";
// }


