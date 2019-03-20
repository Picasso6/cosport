var map = L.map('new-event-map').setView([50.639,3.0706414],15);
L.tileLayer('https://{s}.tile.openstreetmap.se/hydda/full/{z}/{x}/{y}.png',{maxZoom :100}).addTo(map);


//temporary maker

var theMarker = {};

map.on('click',function(e){
 lat = e.latlng.lat;
 lon = e.latlng.lng;

 console.log("You clicked the map at LAT: "+ lat+" and LONG: "+lon );


     if (theMarker != undefined) {
           map.removeLayer(theMarker);
     };


  theMarker = L.marker([lat,lon]).addTo(map);
  document.getElementById("lat-form").value = lat;
  document.getElementById("lgn-form").value = lon;
});


//
