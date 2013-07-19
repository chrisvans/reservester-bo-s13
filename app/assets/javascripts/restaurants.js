// This is a shortcut for jQuery.ready(function(){});
// !!!!
$(function(){
  if ($("#recommendation").length) {
    // This is simple an ajax GET request.
    // Returns:
    //   data = Response body,
    //   textStatus = HTTP Status Code,
    //   xhr = XHR object
    $.get("/restaurants.json", function(data, textStatus, xhr){

      var featuredRestaurant = highTechRecommendationEnginesRecommendation(data);
      // Let's create a paragraph
      var featuredRestaurantElement = $("<a></a>", {
        "class": "restaurant",
        "href": "/restaurants/" + featuredRestaurant.id,
        "text": featuredRestaurant.name
      });
      var recommendationElement = $("<p></p>", {
        "class": "recommendationContent",
        "html": "Be sure to check out "
      });
      recommendationElement.append(featuredRestaurantElement);
      $("#recommendation").empty().append(recommendationElement);

    });

    // Let's create a high-tech recommendation™ from our recommendation engine™
    // this is our secret sauce.

    // Don't use variable names like this:
    function highTechRecommendationEnginesRecommendation(restaurants){
      var index = Math.floor(Math.random()*(restaurants.length));
      return restaurants[index];
    }
  }
});

