var slides = document.querySelectorAll('#container > img');
var prev = document.querySelector('#prev');
var next = document.querySelector('#next');
var current = 0;

function showSlide(n) {
	for(var i=0; i<slides.length; i++) {
		slides[i].style.display = 'none';
	}
	slides[n].style.display = 'block';
} 
showSlide(current);

function prevSlide() {
	if(current > 0) {
		current--;
	} else {
		current = slides.length - 1;
	}
	showSlide(current);
}
prev.onclick = prevSlide;

function nextSlide() {
	if(current < slides.length - 1) {
		current++;
	} else {
		current = 0;
	}
	showSlide(current);
}
next.onclick = nextSlide;

function autoSlide() {
	current++;
	if(current > slides.length - 1) {
		current = 0;
	}
	showSlide(current);
}
setInterval(autoSlide, 3000);