<?php include_once('header.php');?>
<link href="<?php echo base_url()?>resource/shop/css/item.css?20150826" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/dealers_mod.css" rel="stylesheet" type="text/css" media="all" />
<div id="item_topHeader">
<div id="group_1"><img src="<?php echo base_url()?>resource/shop/image/item/img_dl_ttl_hoods.jpg" alt="" width="924" height="75" /></div>
</div>


<div id="contents" class="clearfix">
<?php
  if($dealers) {
  foreach ($dealers as $key => $val) {
?>
<div class="items">
<ul class="clearfix">
  <li><img src="<?php echo $val['image_url'];?>" alt="" width="170" height="105" /></li>
  <b><?php echo $val['title'];?></b><br />
  <?php echo $val['content'];?>
  </ul>
</div>
<?php }}?>
</div>         
      
            
<!-- <div id="item_topHeader">
            <div id="group_7"><img src="image/item/img_dl_ttl_spacer.gif" alt="" width="924" height="25" /></div>
                        <div id="item_Logo3"><img src="image/item/img_dl_ttl_tokai.jpg" alt="" width="37" height="9" /></div>
                        <div id="dealer_textbox">
                        <font size="2"><b>FIGURE</b></font><br />
                        Brands: NH, SVG, KIDS<br />1-5-1F Shichikencho Aoi-ku, Shizuoka Shizuoka 420-0035 P・054-221-6005 
                        <a href="http://goo.gl/maps/kblgu" target="_blank"><img src="image/item/img_dl_maps.gif" alt="" width="25" height="16" /></a>
                        <a href="http://star-j.net/" target="_blank"><img src="image/item/img_dl_web.gif" alt="" width="25" height="16" /></a>
                        </div><div id="dealer_textbox">
                        <font size="2"><b>DOUBLEDUTCH PARK SIDE</b></font><br />
                        Brands: NH, SVG, KIDS<br />9-2 Hachimancho, Gifu Gifu 500-8838 P・058-266-1868 
                        <a href="http://goo.gl/maps/c6Bb" target="_blank"><img src="image/item/img_dl_maps.gif" alt="" width="25" height="16" /></a>
                        <a href="http://www.doubledutch-jp.com/" target="_blank"><img src="image/item/img_dl_web.gif" alt="" width="25" height="16" /></a>
                        </div>
            
            </div>    -->            

<div id="item_Logo"><img src="<?php echo base_url()?>resource/shop/image/item/img_dl_ttl_spacer.gif" alt="" width="924" height="25" /></div>
<?php include_once('footer.php');?>