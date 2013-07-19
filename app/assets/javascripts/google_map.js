
//      var restaurant_location = [
//       ['Bondi Beach', -33.890542, 151.274856, 4],
//       ['Coogee Beach', -33.923036, 151.259052, 5],
//       ['Cronulla Beach', -34.028249, 151.157507, 3],
//       ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
//       ['Maroubra Beach', -33.950198, 151.259302, 1]
//     ];

// var restaurant_location;

//   var myLatlng = new google.maps.LatLng(-33.890542, 151.274856);
//   var mapOptions = {
//     zoom: 10,
//     center: myLatlng,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   }
//   var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

// //Adding the info bubble
// var contentString = '<div id="content">'+
//       '<div id="siteNotice">'+
//       '</div>'+
//       '<h1 id="firstHeading" class="firstHeading">Restaurant</h1>'+
//       '<div id="bodyContent">'+
//       '<p><b>The beach shack</b> is absolutely the best reataurant you can find!</p>'+
//       '<p>Attribution: Beach Shack, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
//       'Beach Shack</a></p>'+
//       '</div>'+
//       '</div>';

//   var infowindow = new google.maps.InfoWindow({
//       content: contentString
//   });

// //starting the loop to run through restaurant_location
// var marker, i;

// for (i = 0; i < restaurant_location.length; i++) {

//   var marker = new google.maps.Marker({
//       position: new google.maps.LatLng(restaurant_location[i][1], restaurant_location[i][2]),
//       map: map,
//       title: restaurant_location[i][0]
//   });

//   google.maps.event.addListener(marker, 'click', function() {
//     infowindow.open(map,marker);
//   });
// }

// google.maps.event.addDomListener(window, 'load', initialize);













// //test stuff


// function initialize() {
//   var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
//   var mapOptions = {
//     zoom: 4,
//     center: myLatlng,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   }

//   var map = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions);

//   var contentString = '<div id="content">'+
//       '<div id="siteNotice">'+
//       '</div>'+
//       '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
//       '<div id="bodyContent">'+
//       '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
//       'sandstone rock formation in the southern part of the '+
//       'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
//       'south west of the nearest large town, Alice Springs; 450&#160;km '+
//       '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
//       'features of the Uluru - Kata Tjuta National Park. Uluru is '+
//       'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
//       'Aboriginal people of the area. It has many springs, waterholes, '+
//       'rock caves and ancient paintings. Uluru is listed as a World '+
//       'Heritage Site.</p>'+
//       '<p>Attribution: Uluru, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
//       'http://en.wikipedia.org/w/index.php?title=Uluru</a> '+
//       '(last visited June 22, 2009).</p>'+
//       '</div>'+
//       '</div>';

//   var infowindow = new google.maps.InfoWindow({
//       content: contentString
//   });

//   var marker = new google.maps.Marker({
//       position: myLatlng,
//       map: map,
//       title: 'Uluru (Ayers Rock)'
//   });
//   google.maps.event.addListener(marker, 'click', function() {
//     infowindow.open(map,marker);
//   });
// }

// google.maps.event.addDomListener(window, 'load', initialize);




// // old map function
// var map;
// function initialize() {
// 	  var mapOptions = {
// 	    zoom: 10,
// 	    center: new google.maps.LatLng(21.1824, -157.5129),
// 	    mapTypeId: google.maps.MapTypeId.HYBRID
// 	  };
// 	  map = new google.maps.Map(document.getElementById('map-canvas2'), mapOptions);
// }

// google.maps.event.addDomListener(window, 'load', initialize);
