var selectTag = document.getElementById("city_id");
var cityValue = selectTag.value;
var map;

var theMarker = {};

map.on('click',function(e){
 lat = e.latlng.lat;
 lon = e.latlng.lng;

     if (theMarker != undefined) {
           map.removeLayer(theMarker);
     };


  theMarker = L.marker([lat,lon]).addTo(map);
  document.getElementById("lat-form").value = lat;
  document.getElementById("lgn-form").value = lon;
});
