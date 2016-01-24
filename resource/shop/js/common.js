var movietime = "slow";

$(function() {
	$('a#headBtn').live('click', function() {
		if($(this).hasClass('open')){
			$('#headMenu').fadeIn(movietime);
			$(this).removeClass('open');
			$("img",this).attr('src',$("img",this).attr('src').replace("2", "3"));
		}else{
			$('#headMenu').fadeOut(movietime);
			$(this).addClass('open');
			$("img",this).attr('src',$("img",this).attr('src').replace("3", "2"));
		}
	});
	$('#headMenu').fadeIn(movietime);
	getUpdate("/weblog_j/atom.xml","weblog");
	getUpdate("/news_j/atom.xml","news");
	getUpdate("/delivery_j/atom.xml","delivery");
});

function getUpdate(url,target) {
	$.ajax({
		url:url,
		type:'get',
		dataType:'xml',
		timeout:1000,
		success:function(xml,status) {
			if(status!='success') {
				return;
			}
			$(xml).find('entry').each(function(index) {
				if(index == 0) {
//					var title = $(this).find('title').text();
//					var link = $(this).find('link').attr('href');
					var updated = $(this).find('updated').text();
					updated = updated.replace(/\-/g,".");
					if(!$("#"+target+" p a").size()) {
						$("#"+target+" p img").wrap("<a></a>");
					}
					$("#"+target+" p a").attr("href","/"+target+"_j/");
					$("#"+target+" .date").text("UPDATED:"+updated.replace(/^[0-9]{2}([^T]+)T.*$/,"$1"));
				}
			});
		}
	});
}
