// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery3
//= require jquery_ujs
//= require popper
//= require activestorage
//= require leaflet
//= require home
//= require new_event_map
//= require show_event_map
//= require main_map






$(document).ready(function(){

  window.onbeforeunload = function () {
    window.scrollTo(0, 0);
  };

});
