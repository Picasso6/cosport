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
//= require leaflet
//= require new_event_map
//= require show_event_map
//= require main_map
//= require turbolinks
//= require bootstrap
//= require popper
//= require activestorage
//= require_tree .

<<<<<<< HEAD

=======
 //DROPDOWN PROFIL Button
 /* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function dropProfilList() {
  document.getElementById("profilDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
>>>>>>> master




$(document).ready(function(){

  window.onbeforeunload = function () {
    window.scrollTo(0, 0);
  };

});
