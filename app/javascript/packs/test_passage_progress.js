document.addEventListener('turbolinks:load', function(){
  var full_progress = 100
  var almost_full = 99
  var elem = document.getElementById("progress_bar")
  if(elem) {
    var current = elem.dataset.current
    var amount = elem.dataset.amount
    var progress = (full_progress / amount) * current
    if(progress == almost_full) {
      progress = full_progress
    } 
    elem.style.width = progress + "%"
  }
})
