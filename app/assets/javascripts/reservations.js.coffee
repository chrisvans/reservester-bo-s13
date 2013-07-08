# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#reservation_reserved_on').datepicker
    dateFormat: 'yy-mm-dd'
    onSelect: (dateText, inst)=> 
        renderReservedDate(dateText)
        dateData = dateText

