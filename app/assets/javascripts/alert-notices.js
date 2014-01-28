$(function(){
  $("#alerts-notices").delay(5000).slideUp();


  $.fn.showNoticesAlerts = function(notice, alert)
  {
  	$('#notice').html(notice);
  	$('#alert').html(alert);
  	$('#alerts-notices').show();
  };

});