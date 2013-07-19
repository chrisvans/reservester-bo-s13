var renderRestaurantCats;

$(document).ready(function(){
	var template = $('#restaurant_fill').html();
	renderRestaurantCats = function(cat_ids){
 	    // var category_ids = cat_ids;
		// var content = Mustache.render(template, fullData);
		// $('#restaurants_by_cat').html(content);
		$.ajax({
			url:'/restaurants_by_cat.json?cats='+JSON.stringify(cat_ids), 
			success: function(res){
	    		// alert('success');
	    		console.log(res);
	    		var content = Mustache.render(template, {categories:res});
	    		$('#restaurants_by_cat').html(content);

	    	},
	    	failure: function(res){
	    	// alert('failure');

	    	}
	    });

	};



	$('#restaurant_category_ids').change(function(e, data){
		e.preventDefault();
		var cat_ids = [];
		var selected = $('#restaurant_category_ids option:selected');
		$.each(selected, function(){
			cat_ids.push($(this).attr('value'));
		});
		console.log(cat_ids);
		// $($('#restaurant_category_ids option:selected')[0]).attr('value')
		renderRestaurantCats(cat_ids);
	});
	$('#restaurant_category_ids').trigger('change');
});

