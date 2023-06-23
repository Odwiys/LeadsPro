// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener("DOMContentLoaded", () {
	const popupLinks = document.querySelectorAll(".popup-link");
	const popupOverlays = document.querySelectorAll(".popup-overlay");
	const closeButton = document.querySelectorAll(".close-button");
  
	popupLinks.forEach((link) {
	  link.addEventListener("click", () {
		event.preventDefault();
		const popupOverlay = this.parentNode.querySelector(".popup-overlay");
		popupOverlay.style.display = "block";
	  });
	});
  
	closeButton.forEach((button) {
	  button.addEventListener("click", () {
		const popupOverlay = this.closest(".popup-overlay");
		popupOverlay.style.display = "none";
	  });
	});
});  