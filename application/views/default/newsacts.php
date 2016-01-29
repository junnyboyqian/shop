<?php include_once('header.php');?>
<link rel="stylesheet" href="<?php echo base_url()?>resource/shop/news_j/styles-site.tpl.css" type="text/css" />
<link href="<?php echo base_url()?>resource/shop/css/item_2.css?20150826" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/catalog.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo base_url()?>resource/shop/css/catalog_top.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
  a[href="#item_container"] {
	background: url('<?php echo base_url()?>resource/shop/image/item/navi_pagetop.jpg') no-repeat 100% 0;
	padding: 0 14px 18px 0;
	text-align: right;
	vertical-align: middle;
	line-height: 48px;
	display: inline-block;
	font-size: 11px
  }
</style>
<br />
<img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="15" /><br />

<table width="924" border="0" cellspacing="0" cellpadding="0" class="celGray">
<tr>

<td><!-- ヘッダタイトル -->
<table width="680" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="680" height="30" align="left" valign="top"><div class="mainTitleImg">
<img src="<?php echo base_url()?>resource/shop/templates/img/weblog/img_ttl_news.jpg" width="274" height="35" />
</div></td>
</tr>
</table>
<!-- ヘッダタイトル　ここまで -->
<img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="15" />
<table width="680" border="0" cellspacing="0" cellpadding="0">
<tr>
<!-- 左エントリーズ -->
<td width="740" align="left" valign="top">
<img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="10" />
<?php
	if($news) {
	foreach ($news as $key => $val) {
?>
<!-- 最新エントリー -->
<table width="740" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="left" valign="top">
<table width="740" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="left" valign="bottom"><h3><span class="entryTitleName"><a href="<?php echo $val['link'];?>"><?php echo $val['title'];?></a></span></h3></td>
<td align="right" valign="bottom"><h3><span class="entryDate"><?php echo date('Y-m-d H:i:s',$val['add_time']);?></span></h3></td>
</tr>
</table>
</td>
</tr>
<tr>
<td width="740" height="1" align="left" valign="top" class="celLine"><img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="1" /></td>
</tr>
<tr>
<td align="left" valign="top">
<div class="entryBody">
<?php echo $val['content'];?>
</div>
</td>
</tr>
<tr>
<td align="left" height="20"><img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="20" /></td>
</tr>
<tr>
<td width="740" height="1" align="left" valign="top" class="celLine"><img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="1" /></td>
</tr>
<tr>
<td height="48" align="right" valign="top"><a href="#item_container">PAGETOP</a></td>
</tr>
</table>
<?php }}?>
<?php echo $news ? $pager : '';?>
<!-- 1&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_2.html">2</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_3.html">3</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_4.html">4</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_5.html">5</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_6.html">6</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_7.html">7</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_8.html">8</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_9.html">9</a>&nbsp;|&nbsp;<a href="<?php echo base_url()?>resource/shop/news_j/index_10.html">10</a>
<span><a href="<?php echo base_url()?>resource/shop/news_j/index_2.html">Next&raquo;</a></span> -->
</td>

<td width="15" align="left" valign="top"><img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="15" height="1" /></td>
</tr>
</table>
<img src="<?php echo base_url()?>resource/shop/news_j/img/spacer.gif" width="1" height="15" />
<?php include_once('footer.php');?>