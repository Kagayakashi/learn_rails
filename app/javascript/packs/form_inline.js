$(document).on("turbolinks:load", function () {
    $('.form-inline-link').click(onClickEvent)

    if ($('.resource-errors')) {
        inlineFormManage($('.resource-errors').data('resourceId'))
    }
})

function onClickEvent(event) {
    event.preventDefault()
    var test_id = $(this).data('testId')
    inlineFormManage(test_id)
}

function inlineFormManage(test_id) {
    var title_inline = $('.admin-test-title[data-test-id=' + test_id + ']');
    var form_inline = $('.form-inline[data-test-id=' + test_id + ']');
    var link_inline = $('.form-inline-link[data-test-id=' + test_id + ']');

    if (form_inline.hasClass("d-none")) {
        console.log('Форма скрыта')
        title_inline.addClass("d-none")
        form_inline.removeClass("d-none")
        link_inline.text('Отменить')
    } else {
        title_inline.removeClass("d-none")
        form_inline.addClass("d-none")
        link_inline.text('Изменить')
    }
}