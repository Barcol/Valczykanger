import "flatpickr"

$(document).on("turbo:load", () => {
    $('[data-behaviour="flatpickr"]').flatpickr({
            enableTime: true,
            dateFormat: "Y-m-d H:i",
        }
    )
})
