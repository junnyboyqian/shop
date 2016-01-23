<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>温馨提示-<?php echo $sys_web_name?></title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=810"/>
<link rel="stylesheet" href="<?php echo base_res_style() ?>style.css">
<script language="javascript" type="text/javascript" src="<?php base_res_script()?>jquery-1.8.3.min.js"></script>

<?php

     switch ($type)
		{
             case "1":
             	$state	=	"status_suc";
             	break;
             case "2":
             	$state	=	"status_fai";
             	break;
             case "3":
             	$state	=	"status_men";
             	break;
          }
?>

<div id="usercenter">

            <div class="center_div loading_block">

             <div class="loading">
             <ul class="ula"> <li><span class="zd"></span></li></ul>

            <!--
            loading_status status_suc>对的
            loading_status status_fai>错的
            loading_status status_men>感叹号
            -->
             <ul class="ulb"><li class="loading_status <?php echo $state;?>"></li></ul>
             <ul class="jd">
             <li style="padding-top:15px;"><font size="3"><?php echo $msg;?></font></li>
             </ul>
             </div>
             <div class="ts"></div>

        </div>
 </div>