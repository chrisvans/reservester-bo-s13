
var renderReservedDate;

$(document).ready(function(){
	// var template = $('#reservedOn').html();
	renderReservedDate = function(dateText){
	    var fullData = {
	    	dateData: dateText	
	    	};
		var template = "{{dateData}}";
		var content = Mustache.render(template, fullData);
        $('#reservedOnBox').html(content);
	};
	
});
