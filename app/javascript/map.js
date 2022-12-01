//initialize map
var myLatLng = { lat: 42.3163, lng: -72.6403 };
var mapOptions = {
    center: myLatLng,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP

};

//create a map
var map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);

let markerOptions = {
  position: new google.maps.LatLng(42.3163,-72.6403),
  zoom:12,
  mapTypeControlOptions: {
            mapTypeIds: ["roadmap"]
          }
}

//set up marker 
let marker = new google.maps.Marker(markerOptions);
marker.setMap(map)

//set up popup information window
const infoWindowOptions = {
  content: 'Information about the Location, including nearest bike station',
  position: myLatLng,
  maxWidth: 300
}
const infoWindow = new google.maps.InfoWindow(infoWindowOptions)
const infoWindowOpenOptions = {
  map: map,
  anchor: marker,
  shouldFocus: false
}

//can take html inside the info window to format
infoWindow.setContent(`
  <h3>Name of the Location</h3>
  <div class='alert-info'><br>From: </br> <br>To: </br> <br>Biking distance: </br> <br>Duration : </br><br></br></div>      
  <%=link_to "Ride", checkout_path, class: 'btn btn-info btn-lg' %>
  <button class="btn btn-info btn-lg "><i class="fas fa-map-signs"></i>QR Code</button>
`);

infoWindow.open(infoWindowOpenOptions)



//initialize DirectionsService for route method
var directionsService = new google.maps.DirectionsService();

//create DirectionsRenderer for display
var directionsDisplay = new google.maps.DirectionsRenderer();

//put DirectionsRenderer on the map
directionsDisplay.setMap(map);


//function for calculating the routes and displaying it on the map
// function calcRoute() {
//     //create request
//     var request = {
//         origin: document.getElementById("from").value,
//         destination: document.getElementById("to").value,
//         travelMode: google.maps.TravelMode.BICYCLING, //DRIVING,WALKING, BYCYCLING, TRANSIT
//         unitSystem: google.maps.UnitSystem.IMPERIAL
//     }

//     //pass the request to the route method
//     directionsService.route(request, function (result, status) {
//         if (status == google.maps.DirectionsStatus.OK) {

//             //Get distance and time
//             const output = document.querySelector('#output');
//             output.innerHTML = "<div class='alert-info'>From: " + document.getElementById("from").value + ".<br />To: " + document.getElementById("to").value + ".<br /> Biking distance <i class='fas fa-road'></i> : " + result.routes[0].legs[0].distance.text + ".<br />Duration <i class='fas fa-hourglass-start'></i> : " + result.routes[0].legs[0].duration.text + ".</div>";

//             //display route
//             directionsDisplay.setDirections(result);
//         } else {
//             //delete route from map
//             directionsDisplay.setDirections({ routes: [] });
//             //center map in London
//             map.setCenter(myLatLng);

//             //show error message
//             output.innerHTML = "<div class='alert-danger'><i class='fas fa-exclamation-triangle'></i> Error occured. Please Try Again.</div>";
//         }
//     });

// }

//create autocomplete for the inputs
var input1 = document.getElementById("from");
var autocomplete1 = new google.maps.places.Autocomplete(input1);

var input2 = document.getElementById("to");
var autocomplete2 = new google.maps.places.Autocomplete(input2);



// function getMyLocation(){
      //     console.log('Entering getMyLocation');
      //     if(navigator.geolocation){
      //         navigator.geolocation.getCurrentPosition(displayCurrentLocation, displayError, {
      //             maximumAge: 3000, 
      //             // timeout: 5000, 
      //             enableHighAccuracy: true 
      //         });
      //     }
      //     console.log('Exiting getMyLocation');
      // }
      // function displayCurrentLocation(position){
      //     console.log('Entering getCurrentLocation ' );
      //     console.log(position.coords);
      //     var lat = position.coords.latitude;
      //     var lng = position.coords.longitude;
      //     var mapOptions = {
      //         center: new google.maps.LatLng(lat, lng),
      //         zoom: 17
      //     };
      //     var map = new google.maps.Map(document.getElementById("map"),
      //     mapOptions);
      //     var latLng = new google.maps.LatLng(lat, lng);
      //     var marker = new google.maps.Marker({
      //                     position: latLng,
      //                     map: map,
      //                     title: 'Current location'
      //                 });
      //     marker.setMap(map);
      //     console.log('Exiting getCurrentLocation');
          
      // }
    //   function displayError(error){
    //       console.log('Error in getting location');
    //       console.log(error);
    //   }
    // google.maps.event.addDomListener(window, 'load', getMyLocation);

    //   function initMap(position){
    //     let mapOptions = {
    //       // center: {lat: lat,lng: lng},
    //       center: {lat: 41.881832,lng:-87.623177},
    //       zoom: 12
    //     }

    //     let map = new google.maps.Map(document.getElementById('map'), mapOptions);

    //   }