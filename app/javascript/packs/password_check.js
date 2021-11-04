$( document ).on("turbolinks:load", function() {
    // При клике на h4 -> тесты менять сортировку и показывать стрелку вверх/вниз
  $(".register_password").change(function() {
  
    var circle = $(".password-success")
    var circle_slash = $(".password-failed")
      
    var min = 6
    var max = 20
    if($( this ).val().length < min || $( this ).val().length > max) {
      console.log(false)
      circle_slash.removeClass("d-none")
      circle.addClass("d-none")
    }
    else {
      console.log(true)
      circle.removeClass("d-none")
      circle_slash.addClass("d-none")
    }
  })

  $(".register_password_confirmation").change(function() {
  
    var circle = $(".password-confirmation-success")
    var circle_slash = $(".password-confirmation-failed")

    if($( this ).val() !== $(".register_password").val()) {
      console.log(false)
      circle_slash.removeClass("d-none")
      circle.addClass("d-none")
    }
    else {
      console.log(true)
      circle.removeClass("d-none")
      circle_slash.addClass("d-none")
    }
  })
})