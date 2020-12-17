var nav_open_listener = function(e) {
  if(!document.getElementById('side_nav').contains(e.target)) {
    close_nav();
  }
};

document.addEventListener("turbolinks:load", () => {
  open_nav = function() {
    document.getElementById("side_nav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    
    addEventListener('click', nav_open_listener, true);
  }

  close_nav = function() {
    document.getElementById("side_nav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
    
    removeEventListener('click', nav_open_listener);
  }
});