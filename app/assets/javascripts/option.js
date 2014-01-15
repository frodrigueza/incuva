$(function(){

	$('.div_option').hide();
$('.option').click(function optionDivsSlide(){

	var str = this.id.split('_');
	var id = str[str.length-1];

	if ($('#div_option_'+id).is(":visible"))
	{
		$('#div_option_'+id).slideUp();	
	}
	else
	{
		$('#div_option_'+id).slideDown();	
	}


});






});