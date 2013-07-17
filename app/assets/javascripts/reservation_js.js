var renderRestaurantCats;

$(document).ready(function(){
	var template = $('#restaurant_fill').html();
	renderRestaurantCats = function(){
 	    var fullData = {
 	    	cat_ids: [5, 2]	
 	    	};
		var content = Mustache.render(template, fullData);
		$('#restaurants_by_cat').html(content);
	};

	$('#categories').click(function(e, data){
		e.preventDefault();
		renderRestaurantCats();
	})
});

