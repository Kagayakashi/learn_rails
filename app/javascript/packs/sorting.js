$( document ).on("turbolinks:load", function() {
  // При клике на h4 -> тесты менять сортировку и показывать стрелку вверх/вниз
  $("#sort-by-title").click(function() {

    var arrow_up = $(".octicon-arrow-up")
    var arrow_dn = $(".octicon-arrow-down")

    if(arrow_up.hasClass("d-none")) {
      arrow_up.removeClass("d-none")
      arrow_dn.addClass("d-none")

      $(".list li").sort(desc_sort).appendTo(".list")
    }
    else if(arrow_dn.hasClass("d-none")) {
      arrow_dn.removeClass("d-none")
      arrow_up.addClass("d-none")

      $(".list li").sort(asc_sort).appendTo(".list")
    }
  })
})

// Специфика (A > a). Поэтому toUpperCase()

function asc_sort(a, b) {
  return ($(b).text().toUpperCase()) < ($(a).text().toUpperCase()) ? 1 : -1;    
}

function desc_sort(a, b) {
  return ($(b).text().toUpperCase()) > ($(a).text().toUpperCase()) ? 1 : -1;    
}
