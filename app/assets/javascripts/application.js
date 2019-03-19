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
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .



$(document).ready(function(){

  window.onbeforeunload = function () {
    window.scrollTo(0, 0);
  };

});



  // function randomImage(){
  //   var images = [
  //    'banner.png',
  //    'banner2.png',
  //    'banner3.png'];
  //   var size = images.length;
  //   var x = Math.floor(size * Math.random());
  //   console.log(x);
  //   var element = document.getElementsByClassName('masthead');
  //   console.log(element);
  //   element[0].style["background"] = "url('images[x]')";
  // }
  //
  // document.addEventListener("DOMContentLoaded", randomImage);
