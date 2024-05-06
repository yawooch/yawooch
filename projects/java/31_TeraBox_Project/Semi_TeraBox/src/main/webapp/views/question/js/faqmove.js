$(document).ready(function () {
  
    
    $('.qt-awn-by').hide();
    $('.qt-qut-by').click(function(e){
			$(e.target).parents('li').children('.qt-awn-by').toggle();
		console.log($(e.target).parents('li').children('.qt-awn-by').attr('class'));
	})

});