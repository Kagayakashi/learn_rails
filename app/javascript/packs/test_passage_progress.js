document.addEventListener('turbolinks:load', function () {
    const full_progress = 100
    const almost_full = 99
    let elem = document.getElementById("progress_bar")
    if (elem) {
        const current = elem.dataset.current
        const amount = elem.dataset.amount
        const progress = (full_progress / amount) * current
        if (progress == almost_full) {
            progress = full_progress
        }
        elem.style.width = progress + "%"
    }
})
