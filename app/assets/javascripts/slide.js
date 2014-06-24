$(function(){

	
	var i = 1;

	$("#slide_2").hide();
	$("#slide_3").hide();	

	aux = 0;
	var slide_ids = [];
	$('.slide').each(function(){
		slide_ids.push(this.id);
	});


	if(slide_ids.length > 1){
		setInterval(function()
		{
			aux+=1;
			if(aux==slide_ids.length)
			{
				aux = 0;
			}
			$('.slide').hide();
			$("#"+slide_ids[aux]).fadeIn(2000);
		}, 5000)
	}

});