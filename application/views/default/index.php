<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>NEIGHBORHOOD</title>
<meta name="description" content="NEIGHBORHOOD BRAND SITE : CATALOG COLLECTION DEALERS BLOG" />
<meta name="keywords" content="" />
<meta name="robots" content="index,follow">
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!--[if lte IE 9]>
<link rel="Shortcut Icon" type="<?php echo base_url()?>resource/shop/image/x-icon" href="favicon.ico">
<link rel="icon" type="<?php echo base_url()?>resource/shop/image/x-icon" href="favicon.ico" />
<![endif]-->
<link rel="stylesheet" href="<?php echo base_url()?>resource/shop/css/top.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php echo base_url()?>resource/shop/css/theme/supersized.shutter.css" type="text/css" media="screen" />
<link href="<?php echo base_url()?>resource/shop/css/item.css?20150826" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/css/theme/supersized.shutter.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/common.js"></script>
<script type="text/javascript">
			var slides = <?php echo $slides;?>; //不能加双引号 否则变为字符串
			jQuery(function($){
				$.supersized({
				
					// Functionality
					<!--slide_interval          :   1000,		// Length between transitions-->
					transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
					transition_speed		:	1500,		// Speed of transition
															   
					// Components							
					new_window				:	0,
					slide_links				:	'num',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
					/*slides 					:  	[			// Slideshow Images
                            {image : '<?php echo base_url()?>resource/shop/image/top/2015aw/top_02-1.jpg', title : 'Image Credit: svg', thumb : '', url : 'catalog/2015aw/item/jackets/nb_b-10_cn-jkt.html'},
                            {image : '<?php echo base_url()?>resource/shop/image/top/2015aw/top_02-2.jpg', title : 'Image Credit: svg', thumb : '', url : ''}								 
						]*/
					slides : slides,
					
				});
		    });
		    
		</script>

</head>

<style type="text/css">
ul#demo-block {
	margin:0 15px 15px 15px;
}
ul#demo-block li {
	margin:0 0 10px 0;
	padding:10px;
	display:inline;
	float:left;
	clear:both;
	color:#aaa;
	background:url('img/bg-black.png');
	font:11px Helvetica, Arial, sans-serif;
}
ul#demo-block li a {
	color:#eee;
	font-weight:bold;
}
</style>


<body>

<div id="item_container">



<!--/ GHEADER INC /-->
<script type="text/javascript">
$(document).ready(function() {
	if (navigator.userAgent.indexOf('iPhone') > 0 || navigator.userAgent.indexOf('iPad') > 0 || navigator.userAgent.indexOf('iPod') > 0 || navigator.userAgent.indexOf('Android') > 0) {

		$('#R-gheader .lower-column .nav-Mainmenu > li:has(span)').click(function() {
			if($(this).hasClass('navhover')) {
				$(this).removeClass('navhover').addClass('navhoveroff').find('ul').hide();
			} else {
				$(this).removeClass('navhoveroff').addClass('navhover').find('ul').show();
			}
		});
		
	}
	if (navigator.platform.indexOf("Win") != -1) {
		$('#R-gheader .lower-column').css('font-weight','bold');
	}
})
</script>
<div id="R-gheader" data-uri="" data-replace-uri="?lang=EN" data-deleat-str="">
	<div class="upper-column">
		<a href=""><img src="<?php echo base_url()?>resource/shop/image/item/neighborhood_logo3.jpg" alt="NEIGHBORHOOD" width="200" height="75" /></a>
		<!-- <ul class="nav-Lang">
			<li class="nowactive"><a href="">JAPANESE</a></li>
			<li><a href="?lang=EN">ENGLISH</a></li>
		</ul> -->
	</div>
	<div class="lower-column">
		<ul class="nav-Mainmenu">
			<li><span>集合</span>
				<ul>
					<li><a href="<?php echo site_url('center/searchGoods')?>">形象目录</a></li>
					<li><a href="#">形象视频</a></li>
					<li><a href="<?php echo site_url('center/searchGoods')?>">产品专辑</a></li>
					<!-- <li><a href="<?php echo site_url('center/download')?>">下载</a></li> -->
				</ul>
			</li>
			<li><a href="<?php echo site_url('center/newsPlan')?>">新闻企划</a></li>
			<li><a href="<?php echo site_url('center/newsActs')?>">新闻活动</a></li>
			<!-- <li><a href="news_j/">NEWS & PRESS</a></li> -->
			<li><a href="<?php echo site_url('center/dealer')?>">经销商</a></li>
			<li><span>更多</span>
				<ul>
					<li><a href="<?php echo site_url('center/aboutUs')?>">关于我们</a></li>
					<li><a href="<?php echo site_url('center/contact')?>">联系我们</a></li>
					<li><a href="#">地址</a></li>
					<li><a href="#">账户</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<!--/ GHEADER INC /-->

	<div id="gnavi2" style="width:924px; margin:0 auto 0 auto;" align="right">
		<img src="<?php echo base_url()?>resource/shop/image/item/copyright.gif" alt="" width="254" height="11" />
	</div>

</div>


<!--Thumbnail Navigation-->
<!--
<div id="prevthumb"></div>
<div id="nextthumb"></div>
-->



</body>
</html>

