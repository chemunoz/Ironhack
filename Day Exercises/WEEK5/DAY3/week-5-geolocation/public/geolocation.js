var map;

if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}


function onLocation(position){
  // We can't just directly feed the position into our google map
  // The objects are formatted differently, google maps is looking for
  // an object with "lat" and "lng" keys.
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };

  createMap(myPosition);
  setupAutocomplete();
  loadLocations();
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

function createMap(position){
  var mapOptions = {
    center: position,
    zoom: 17
  };
  map = new google.maps.Map($('#map')[0], mapOptions);
  createMarker(position);
}

function createMarker(position, description) {

  var marker = new google.maps.Marker({
   position: position,
   map: map
 });
 console.log(marker);
 var infowindow = new google.maps.InfoWindow({
    content: description
  });
 marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}

function setupAutocomplete(){
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);

  autocomplete.addListener('place_changed', function(){
   var place = autocomplete.getPlace();
   if (place.geometry.location) {
     map.setCenter(place.geometry.location);
     map.setZoom(17);
     //console.log(place.geometry.location);
     createMarker(place.geometry.location, place.formatted_address);
     saveLocations(place.geometry.location);
   } else {
     alert("The place has no location...?")
   }
 });
}

function saveLocations(place){
  var tmp = localStorage.getItem('user-locations');
  tmp = (tmp === null) ? [] : JSON.parse(tmp);
  tmp.push(place);

  localStorage.setItem('user-locations', JSON.stringify(tmp));
  //localStorage.setItem('user-locations', place);
}

function loadLocations()
{
  var locations=localStorage.getItem('user-locations');
  $.each(JSON.parse(locations), function(key,val){
    createMarker(val);
  })
}


//createMarker({lat: 40.4425012, lng: -3.681632});
