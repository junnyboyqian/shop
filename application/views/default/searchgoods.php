<?php include_once('header.php');?>
<link href="<?php echo base_url()?>resource/shop/css/item_v2.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/catalog.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/catalog_top.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>resource/shop/css/catalog2015.css">
<div id="item_topHeader">
<div class="clearfix">
<div id="item_Title"><img src="<?php echo base_url()?>resource/shop/catalog/2015aw/upload/item_ttl_2015_aw.gif" alt="2015aw" width="208" height="35" /></div>
</div>
<div id="gnavi">
<ul>
<li><a href="<?php echo site_url('center/searchGoods');?>" class="is-active"><span>形象目录</span></a></li>
<li><a href="<?php echo site_url('center/goodsDetail');?>"><span>产品专辑</span></a></li>
</ul>
<div class="">
<ul id="gnavi_Line" class="style__nav-list">
<?php
	foreach ($cates as $key => $val) {
?>
<li class="style__nav-item">
<a <?php if($_GET['cate_id'] == $key){?>class="is-active"<?php }?> href="<?php echo site_url('center/searchGoods?cate_id='.$key)?>"><span><?php echo $val;?></span></a>
<!-- <ul class="sub style__sub-nav-list">
<li class="style__sub-nav-item">
<a href="<?php echo base_url()?>resource/shop/catalog/2015aw/line/basic/jackets/index.html"><span>JACKETS</span></a>
</li>
<li class="style__sub-nav-item">
<a href="<?php echo base_url()?>resource/shop/catalog/2015aw/line/basic/shirts/index.html"><span>SHIRTS</span></a>
</li>
</ul> -->
</li>
<?php }?>
</ul>
</div>
</div><!--/gnavi/-->
</div><!--/item_topHeader/-->
<div id="contents" class="clearfix">
<div class="catalog__body style-index">
<div class="catalog__block">
<ul class="style-index__list">
<?php
	foreach ($alldress as $key => $val) {
?>
<li class="style-index__item item <?php if(($key+1) % 3 == 2){?>is-center<?php }?>">
<a href="javascript:;" style="cursor:default" class="style-index__item-link">
<img src="<?php echo $val['image_url'];?>" alt="<?php echo $val['dress_name'];?>" class="style-index__img">
</a>
</li>
<?php }?>
</ul>
</div><!-- /.catalog__block -->
</div><!-- /.catalog__body -->
</div><!--/contents/-->
<?php include_once('footer.php');?>