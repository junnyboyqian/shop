 	$(function() {
 		var
 		item_gallery = $('#item-gallery');
 		item_main_img = $('#item-main-img');

 		item_gallery.find('img').mouseenter(function() {
 			item_main_img.attr('src', $(this).attr('src'));
 		});

 	});