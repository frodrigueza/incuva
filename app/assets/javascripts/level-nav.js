$(function(){

	$('.nav-level-2').hide();
	$('.nav-level').click(function(){

		var str = this.id.split('_');
		var next_level = parseInt(str[1])+1;
		var id = str[str.length-1];

		// que se cierre todo al cambiar de asignatura
		if (next_level == 2)
		{
			$('.div_nav_level').slideUp();
		}

		if ($('.div_level_'+next_level+'_'+id).is(":visible"))
		{
			$('.div_level_'+next_level+'_'+id).slideUp();	
		}
		else
		{
			$('.div_level_'+next_level+'_'+id).slideDown();	
		}


	});






});