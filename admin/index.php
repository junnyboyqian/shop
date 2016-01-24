<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
/* 应用根目录 */
define('ROOT_PATH', dirname(__FILE__));   //该常量是ECCore要求的
define('APP_ROOT', dirname(__FILE__)); 
define('IN_BACKEND', true);
include(ROOT_PATH . '/eccore/ecmall.php');

/* 定义配置信息 */
ecm_define(ROOT_PATH . '/data/config.inc.php');

/* 启动MZMall */
ECMall::startup(array(
    'default_app'   =>  'default',
    'default_act'   =>  'index',
    'app_root'      =>  ROOT_PATH . '/app',
    'external_libs' =>  array(
        ROOT_PATH . '/includes/global.lib.php',
        ROOT_PATH . '/includes/libraries/time.lib.php',
        ROOT_PATH . '/includes/ecapp.base.php',
        ROOT_PATH . '/includes/plugin.base.php',
        ROOT_PATH . '/app/backend.base.php',
        ROOT_PATH . '/includes/subdomain.inc.php',
    ),
));

?>