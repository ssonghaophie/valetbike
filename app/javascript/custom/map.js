//initialize map
var myLatLng = { lat: 42.3163, lng: -72.6403 };
var mapOptions = {
    center: myLatLng,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP

};

const features = [
  {
    position: new google.maps.LatLng(42.335499,-72.673988)
  },
  { position: new google.maps.LatLng(42.3163,-72.6403)
  }

];


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
// let marker = new google.maps.Marker(markerOptions);
// marker.setMap(map)
// Create markers.
for (let i = 0; i < features.length; i++) {
  const marker = new google.maps.Marker({
    position: features[i].position,
    // icon: icons[features[i].type].icon,
    map: map
  });
  // marker.setMap(map)
}

window.initMap = initMap;


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
function calcRoute() {
    //create request
    var request = {
        origin: document.getElementById("from").value,
        destination: document.getElementById("to").value,
        travelMode: google.maps.TravelMode.BICYCLING, //DRIVING,WALKING, BYCYCLING, TRANSIT
        unitSystem: google.maps.UnitSystem.IMPERIAL
    }

    //pass the request to the route method
    directionsService.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {

            //Get distance and time
            const output = document.querySelector('#output');
            output.innerHTML = "<div class='alert-info'>From: " + document.getElementById("from").value + ".<br />To: " + document.getElementById("to").value + ".<br /> Biking distance <i class='fas fa-road'></i> : " + result.routes[0].legs[0].distance.text + ".<br />Duration <i class='fas fa-hourglass-start'></i> : " + result.routes[0].legs[0].duration.text + ".</div>";

            //display route
            directionsDisplay.setDirections(result);
        } else {
            //delete route from map
            directionsDisplay.setDirections({ routes: [] });
            //center map in London
            map.setCenter(myLatLng);

            //show error message
            output.innerHTML = "<div class='alert-danger'><i class='fas fa-exclamation-triangle'></i> Error occured. Please Try Again.</div>";
        }
    });

}

//create autocomplete for the inputs
var input1 = document.getElementById("from");
var autocomplete1 = new google.maps.places.Autocomplete(input1);

var input2 = document.getElementById("to");
var autocomplete2 = new google.maps.places.Autocomplete(input2);