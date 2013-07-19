
     var restaurant_location = [
      ['Bondi Beach', -33.890542, 151.274856, 4],
      ['Coogee Beach', -33.923036, 151.259052, 5],
      ['Cronulla Beach', -34.028249, 151.157507, 3],
      ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
      ['Maroubra Beach', -33.950198, 151.259302, 1]
    ];


  var myLatlng = new google.maps.LatLng(-33.890542, 151.274856);
  var mapOptions = {
    zoom: 10,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

//starting the loop to run through restaurant_location

var marker, i;

for (i = 0; i < restaurant_location.length; i++) {

  var marker = new google.maps.Marker({
      position: new google.maps.LatLng(restaurant_location[i][1], restaurant_location[i][2]),
      map: map,
      title: restaurant_location[i][0]
  });
}





// old map function
var map;
function initialize() {
	  var mapOptions = {
	    zoom: 10,
	    center: new google.maps.LatLng(21.1824, -157.5129),
	    mapTypeId: google.maps.MapTypeId.HYBRID
	  };
	  map = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);
