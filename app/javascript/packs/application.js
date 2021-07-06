// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import ('bootstrap')
//import 'bootstrap/dist/js/bootstrap'
//import "bootstrap/dist/css/bootstrap";
require 'stripe'
Rails.start()
Turbolinks.start()
ActiveStorage.start()




$(document).on('turbolinks:load', function() {
  // $('jquery_selector').mailgun_validator({
  //      api_key: 'pubkey-0a77b43de694aff71f2cf0838c62efd6',
  //      in_progress: in_progress_callback, // called when request is made to validator
  //      success: success_callback,         // called when validator has returned
  //      error: validation_error,           // called when an error reaching the validator has occured
  //  });
//  $('.ui.dropdown').dropdown();
//  $('.message .close').on('click', function() {
//    $(this).closest('.message').transition('fade');
//  });
})
