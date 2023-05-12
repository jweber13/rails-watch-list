// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


document.querySelector(".card-hello img")
  .addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("tapped");
  });

document.querySelector(".item-drawer-button")
  .addEventListener("click", (event) => {
    document.querySelector(".item-drawer").classList.toggle("active");
  });
