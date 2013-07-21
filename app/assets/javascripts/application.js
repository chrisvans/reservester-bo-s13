// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui-bootstrap
//= require_tree .
//= require parsley
//= require jquery-ui-timepicker-addon
//= require chosen-jquery
$(function () {
    $( "#bookingTime" ).datetimepicker({
    	dateFormat: "yy-mm-dd",
    	timeFormat: "hh:mm tt",
    	stepMinute: 5,
    	hourMin: 8,
    	hourMax: 22
    });
    $('#restaurant_category_ids').chosen();
  }); 


