<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['base_skin'] = 'default';
$config['base_res_upload']	=	'resource/image/upload/';
$config['base_res_admin_image']	=	'resource/image/admin/';
$config['base_res_default_image']	=	'resource/image/default/';
$config['base_res_dxcz_image']	=	'resource/image/dxcz/';
$config['base_res_image']	=	'resource/image/'.$config['base_skin'].'/';
$config['base_res_style']	=	'resource/style/'.$config['base_skin'].'/';
$config['base_res_kindeditor']  =       'resource/plugin/kindeditor/';
$config['base_res_script']	=	'resource/script/';
$config['base_res_plugin']	=	'resource/plugin/';

$config['web_host']		=	strtolower($_SERVER['HTTP_HOST']);
//$config['cookie_domain']	=	'.weikefang.com';//.wkf.com
$config['cookie_encrypt']	=	md5('www.shop.com.prefixxtt');
//网站名称
$config['sys_web_name']		= 	'';