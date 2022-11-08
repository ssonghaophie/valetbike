function getMyLocation(){
    console.log('Entering getMyLocation');
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(displayCurrentLocation, displayError, {
            maximumAge: 3000, 
            timeout: 5000, 
            enableHighAccuracy: true 
        });
    }
    console.log('Exiting getMyLocation');
}
function displayCurrentLocation(position){
    console.log('Entering getCurrentLocation ' );
    console.log(position.coords);
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    var mapOptions = {
        center: new google.maps.LatLng(lat, lng),
        zoom: 17
    };
    var map = new google.maps.Map(document.getElementById("map"),
    mapOptions);
    var latLng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    title: 'Current location'
                });
    marker.setMap(map);
    console.log('Exiting getCurrentLocation');
    
}
function displayError(error){
    console.log('Error in getting location');
    console.log(error);
}
google.maps.event.addDomListener(window, 'load', getMyLocation);

function initMap(position){
  let mapOptions = {
    // center: {lat: lat,lng: lng},
    center: {lat: 41.881832,lng:-87.623177},
    zoom: 12
  }

  let map = new google.maps.Map(document.getElementById('map'), mapOptions);

}
