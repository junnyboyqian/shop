<?php include_once('header.php');?>
   <div id="gnavi_tex">
         <br /><br />
         <img src="<?php echo base_url()?>resource/shop/img/header/img_ttl_contact.jpg" width="341" height="11" />
         <br />
<br />
<table width="924" height="387" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
<tr>
<tr>
<td align="left" valign="top" class="graysmall">
商品に関するお問い合わせは<a class="graysmall" target="_self" href="#">DEALER LIST</a>より取り扱い店舗まで直接お問い合わせ下さい。<br>
press,webstore,その他に関するお問い合わせに関しては、以下のフォームからご希望の内容を選択し必要事項（<span class="star">*</span>）を全てご記入してご利用下さい。</td>
</tr>

<td width="924" height="387" align="left" valign="top">
<form name="SendForm" action="<?php echo site_url('center/doContact');?>" method="post" style="margin: 0px;">
<table width="680" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="15"><img src="<?php echo base_url()?>resource/shop/templates//img/spacer.gif" width="1" height="15"></td>
</tr>

<tr>
<td height="20"><img src="<?php echo base_url()?>resource/shop/templates//img/spacer.gif" width="1" height="20"></td>
</tr>
<tr>
<td align="center" valign="top">
                        <table width="620" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="190" align="left" valign="top"><table width="190" border="0" cellpadding="0" cellspacing="0">
<tr>
                                  <td height="20" align="left" valign="bottom"><span class="star">*</span><span class="graysmall">Subject 
                                    :</span></td>
</tr>
<tr>
<td height="25" align="left" valign="middle">
<select name="contact_send" id="subject">
<option label="PRESS" value="PRESS">PRESS</option>
<option label="OTHER" value="OTHER">OTHER</option>

</select>
</td>
</tr>
<tr>
                                  <td height="20" align="left" valign="bottom"><span class="star">*</span><span class="graysmall">Name 
                                    :</span></td>
</tr>
<tr>
<td height="25" align="left" valign="middle"><input name="contact_name" type="text" size="30" value=""></td>
</tr>
<tr>
                                  <td height="20" align="left" valign="bottom"><span class="star">*</span><span class="graysmall">Mail 
                                    address :</span></td>
</tr>
<tr>
<td height="25" align="left" valign="middle"><input name="contact_mail" type="text" size="30" value=""></td>
</tr>
<tr>
                                  <td height="20" align="left" valign="bottom"><span class="star">*</span><span class="graysmall">Phone 
                                    :<span class="eg"> (e.g. 0123456789)</span></span></td>
</tr>
<tr>
<td height="25" align="left" valign="middle"><input name="contact_phone" type="text" size="30" value=""></td>
</tr>
</table></td>
<td width="50">&nbsp;</td>
<td width="380" align="left" valign="top"><table width="380" border="0" cellpadding="0" cellspacing="0">
<tr>
                                  <td height="20" align="left" valign="bottom" class="graysmall"><span class="star">*</span>Message 
                                    :</td>
</tr>
<tr>
<td height="25" align="left" valign="middle"><textarea name="contact_txt" cols="60" rows="12"></textarea></td>
</tr>
</table></td>
</tr>
<tr>
<td width="190" height="55"></td>
<td width="50" height="55">&nbsp;</td>
<td width="380" height="55" align="left" valign="middle"><a href='Javascript:document.SendForm.submit();'><img src="<?php echo base_url()?>resource/shop/templates//img/contact/img_contact_send_btn.jpg" width="50" height="18" border="0"></a></td>
</tr>
</table></td>
</tr>
</table></form></td>
</tr>
</table>



      </div>
<?php include_once('footer.php');?>