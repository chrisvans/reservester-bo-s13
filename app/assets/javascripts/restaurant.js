    

function initialize() {
    

      var myLatlng = new google.maps.LatLng(21.3069, -157.8583);
      var mapOptions = {
        zoom: 10,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    //Adding the info bubble
    var contentString = '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
          '<h1 id="firstHeading" class="firstHeading">Restaurant</h1>'+
          '<div id="bodyContent">'+
          '<p><b>The beach shack</b> is absolutely the best reataurant you can find!</p>'+
          '<p>Attribution: Beach Shack, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
          'Beach Shack</a></p>'+
          '</div>'+
          '</div>';

      var infowindow = new google.maps.InfoWindow({
          content: contentString
      });

    //starting the loop to run through restaurant_location
    var marker, i;

    for (i = 0; i < restaurant_location.length; i++) {

      var marker = new google.maps.Marker({
          position: new google.maps.LatLng(restaurant_location[i][1], restaurant_location[i][2]),
          map: map,
          title: restaurant_location[i][0]
      });

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      });
    }
}

google.maps.event.addDomListener(window, 'load', initialize);