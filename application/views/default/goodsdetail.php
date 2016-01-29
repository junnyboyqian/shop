<?php include_once('header.php');?>
<?php $cate_id = isset($_GET['cate_id']) ? $_GET['cate_id'] : 0;?>
<link href="<?php echo base_url()?>resource/shop/css/item_v2.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/catalog.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/catalog_top.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>resource/shop/css/catalog2015.css">
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/smoothscroll.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/common.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resource/shop/js/catalog2015.js"></script>
<div id="item_topHeader">
<div class="clearfix">
<div id="item_Title"><img src="<?php echo base_url()?>resource/shop/catalog/2015aw/upload/item_ttl_2015_aw.gif" alt="2015aw" width="208" height="35" /></div>
</div>
<div id="gnavi">
<ul>
<li><a href="<?php echo site_url('center/searchGoods');?>"><span>形象目录</span></a></li>
<li><a href="<?php echo site_url('center/goodsDetail');?>" class="is-active"><span>产品专辑</span></a></li>
</ul>
<div class="">
<ul id="gnavi_Line" class="style__nav-list">
<?php
	foreach ($cates as $key => $val) {
?>
<li class="style__nav-item">
<a <?php if($_GET['cate_id'] == $key){?>class="is-active"<?php }?> href="<?php echo site_url('center/goodsDetail?cate_id='.$key)?>"><span><?php echo $val;?></span></a>
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
<div class="catalog__body item-single" data-category="NATIVE&HUNTING">
<div class="catalog__block--left">
<img src="<?php echo $curProduct['defaultimg'];?>" alt="<?php echo $curProduct['pro_name'];?>" class="item-single__img" id="item-main-img">
<div class="item-detail__block">
<h1 class="item-detail__head-title"><?php echo $curProduct['pro_name'];?></h1>
<dl class="item-detail__list">
<dt class="item-detail__cat">FABRIC -</dt>
<dd class="item-detail__text"><?php echo $curProduct['fabric'];?></dd>
<dt class="item-detail__cat">COLOR -</dt>
<dd class="item-detail__text"><?php echo $curProduct['color'];?></dd>
<dt class="item-detail__cat">SIZE -</dt>
<dd class="item-detail__text"><?php echo $curProduct['size'];?></dd>
<dt class="item-detail__cat">PDT NO - </dt>
<dd class="item-detail__text"><?php echo $curProduct['pdt_no'];?></dd>
</dl>
</div>
<div class="item-detail__gallery" id="item-gallery">
<?php
	if($curProduct) {
	foreach ($curProduct['images'] as $key => $val) {
?>
<img src="<?php echo base_url().'admin/'.$val['image_url'];?>">
<?php }}?>
<!-- <img src="<?php echo base_url()?>resource/shop/catalog/2015aw/images/152MANH-KNM01-RE.JPG" alt="TOTEM / CW-CREW . LS">
<p>
<img alt="152MANH-KNM01-RE-BACK.JPG" src="<?php echo base_url()?>resource/shop/catalog/2015aw/images/152MANH-KNM01-RE-BACK.JPG" width="387" height="387" class="mt-image-none" />
<img alt="152MANH-KNM01-NY.JPG" src="<?php echo base_url()?>resource/shop/catalog/2015aw/images/152MANH-KNM01-NY.JPG" width="387" height="387" class="mt-image-none" />
</p> -->
</div>
</div>
<div class="catalog__block--right" data-page-genre="native">
<ul class="item__list">
<?php
	foreach ($allproduct as $key => $val) {
?>
<li class="item__list-item">
<a href="<?php echo site_url('center/goodsDetail?pro_id='.$val['pro_id'].'&cate_id='.$cate_id)?>">
<img src="<?php echo $val['defaultimg']?>" alt="<?php echo $val['pro_name']?>" class="item__list-img">
</a>
</li>
<?php }?>
</ul>
<!-- <a href="<?php echo base_url()?>resource/shop/catalog/2015aw/style/152nh_20.html" class="style-single__btn--back">
<img src="<?php echo base_url()?>resource/shop/image/item/btn_back.gif" alt="BACK TO STYLE">
</a> -->
</div>
</div><!-- /.catalog__body -->
</div><!--/contents/-->
<?php include_once('footer.php');?>