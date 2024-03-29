// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "bootstrap";
import "bootstrap/scss/bootstrap.scss";
import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "controllers";
import "startbootstrap-sb-admin-2/js/sb-admin-2.min";
import "./sweetalert";
import "./flatpickr";
import "@fortawesome/fontawesome-free/css/all";

Rails.start();
ActiveStorage.start();

var jQuery = require("jquery");

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

$(document).on("turbo:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
});
