window.is_nav_open = false;

window.open_nav = function() {
  document.getElementById("side_nav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
  
  window.addEventListener('click', nav_open_listener, true);
}

window.close_nav = function() {
  document.getElementById("side_nav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.body.style.backgroundColor = "white";
  
  window.removeEventListener('click', nav_open_listener);
}

var nav_open_listener = function(e) {
  if(document.getElementById('side_nav').contains(e.target)) {
    // Nothing
  }
  else {
    // Click outside @side_nav
    close_nav();
  }
};