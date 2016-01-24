$(function(){
	$(".alertmodalbox").fancybox({
		'overlayColor': '#222',
		'padding': 0,
		'margin': 40,
		'autoScale': true,
		'centerOnScroll': true,
		'hideOnOverlayClick': true,
		'hideOnContentClick': true,
		'overlayOpacity': 0.9,
		'onComplete' : function(){$('#fancybox-overlay,#fancybox-content').click(function(){
							var clifetime = new Date();
							clifetime.setTime(clifetime.getTime()+(24*60*60*1000));//24時間
							jQuery.cookie('nhcautioninfo','Checked',{
								expires: clifetime,
								path: '/'
							});
						})}
	});
	
	var nhcautioninfo = jQuery.cookie('nhcautioninfo');
	if(nhcautioninfo !== "Checked"){
		confirm();
	}
	
});

function confirm(){
	
	$(".alertmodalbox").trigger('click');
	
}