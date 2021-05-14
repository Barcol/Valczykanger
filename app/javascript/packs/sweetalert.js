import Swal from "sweetalert2";
import Rails from "@rails/ujs";

window.Swal = Swal;

const confirmed = (element, result) => {
    if (result.value) {
        element.removeAttribute("data-confirm-swal");
        element.click();
    }
};

const showConfirmationDialog = (element) => {
    const message = element.getAttribute("data-confirm-swal");
    const text = element.getAttribute("data-swal-text");
    const icon = element.getAttribute("data-swal-icon");
    const yes = element.getAttribute("data-swal-yes");
    const no = element.getAttribute("data-swal-no");

    Swal.fire({
        title: message || "Are you sure?",
        text: text || "",
        icon: icon || "question",
        showCancelButton: true,
        cancelButtonColor: "#d33",
        confirmButtonText: yes || "Yes",
        cancelButtonText: no || "No",
    }).then((result) => confirmed(element, result));
};

const allowAction = (element) => {
    if (element.getAttribute("data-confirm-swal") === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}

Rails.delegate(document, "a[data-confirm-swal]", "click", handleConfirm);
Rails.delegate(document, "input[data-confirm-swal]", "click", handleConfirm);
