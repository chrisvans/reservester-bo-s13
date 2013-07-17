var renderRestaurantCats;

$(document).ready(function(){
	var template = $('#restaurant_fill').html();
	renderRestaurantCats = function(){
		console.log('click event2')
		var content = Mustache.render(template);
		$('#restaurants_by_cat').html(content);
	};

	$('#categories').click(function(e){
		e.preventDefault();
		renderRestaurantCats();
		console.log('click event');
	})
});

