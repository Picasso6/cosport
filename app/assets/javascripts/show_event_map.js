//Création of the map
var map = L.map('show-event-map').setView([50.639,3.0706414],15);
L.tileLayer('https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png',{maxZoom :100}).addTo(map);

//Event Marker
// var marker = L.marker([50.6305089,3.0706414]).addTo(map);
// marker.bindPopup("<h3>ICI C'EST LILLE BOLOSS!!</h3>");
