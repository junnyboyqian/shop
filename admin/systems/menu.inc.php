<?php

return array(
    'dashboard' => array(
        'text'      => Lang::get('dashboard'),
        'subtext'   => Lang::get('offen_used'),
        'default'   => 'user_manage',
        'children'  => array(
            /*'welcome'   => array(
                'text'  => Lang::get('welcome_page'),
                'url'   => 'index.php?act=welcome',
            ),*/
            'user_manage' => array(
                'text'  => '管理员',
                'url'   => 'index.php?app=user',
            ),
            /*'admin_manage' => array(
                'text' => Lang::get('admin_manage'),
                 'url'   => 'index.php?app=admin',
             ),*/
            'gcategory' => array(
                'text'  => Lang::get('gcategory'),
                'url'   => 'index.php?app=gcategory',
            ),
            'ad' => array(
                'text'  => '轮播图管理',
                'url'   => 'index.php?app=ad',
            ),
            'dress' => array(
                'text'  => '形象目录',
                'url'   => 'index.php?app=dress',
            ),
            'product' => array(
                'text'  => '产品专辑',
                'url'   => 'index.php?app=product',
            ),
            'dealer' => array(
                'text'  => '经销商管理',
                'url'   => 'index.php?app=dealer',
            ),
            'download' => array(
                'text'  => '下载管理',
                'url'   => 'index.php?app=download',
            ),
            'contact' => array(
                'text'  => '客户建议',
                'url'   => 'index.php?app=contact',
            ),
            'acategory' => array(
                'text'  => Lang::get('acategory'),
                'url'   => 'index.php?app=acategory',
            ),
            'article' => array(
                'text'  => Lang::get('article'),
                'url'   => 'index.php?app=article',
            ),
            /*'aboutus'   => array(
                'text'  => Lang::get('aboutus_page'),
                'url'   => 'index.php?act=aboutus',
            ),*/
            /*'base_setting'  => array(
                'parent'=> 'setting',
                'text'  => Lang::get('base_setting'),
                'url'   => 'index.php?app=setting&act=base_setting',
            ),*/
            
            /*'store_manage'  => array(
                'text'  => Lang::get('store_manage'),
                'parent'=> 'store',
                'url'   => 'index.php?app=store',
            ),
            'order_manage' => array(
                'text'  => Lang::get('order_manage'),
                'parent'=> 'trade',
                'url'   => 'index.php?app=order'
            ),*/
        ),
    ),
    // 设置
    /*'setting'   => array(
        'text'      => Lang::get('setting'),
        'default'   => 'base_setting',
        'children'  => array(
            'base_setting'  => array(
                'text'  => Lang::get('base_setting'),
                'url'   => 'index.php?app=setting&act=base_setting',
            ),
            'payment' => array(
                'text'  => Lang::get('payment'),
                'url'   => 'index.php?app=payment',
            ),
            'theme' => array(
                'text'  => Lang::get('theme'),
                'url'   => 'index.php?app=theme',
            ),
            'template' => array(
                'text'  => Lang::get('template'),
                'url'   => 'index.php?app=template',
            ),
            'mailtemplate' => array(
                'text'  => Lang::get('noticetemplate'),
                'url'   => 'index.php?app=mailtemplate',
            ),
        ),
    ),*/
    // 商品
    'goods' => array(
        'text'      => '产品',
        'default'   => 'goods_manage',
        'children'  => array(
            'gcategory' => array(
                'text'  => Lang::get('gcategory'),
                'url'   => 'index.php?app=gcategory',
            ),
            'ad' => array(
                'text'  => '轮播图管理',
                'url'   => 'index.php?app=ad',
            ),
            /*'brand' => array(
                'text'  => Lang::get('brand'),
                'url'   => 'index.php?app=brand',
            ),*/
            'goods_manage' => array(
                'text'  => '产品专辑',
                'url'   => 'index.php?app=goods',
            ),
            /*'recommend_type' => array(
                'text'  => LANG::get('recommend_type'),
                'url'   => 'index.php?app=recommend'
            ),*/
        ),
    ),
    // 店铺
    /*'store'     => array(
        'text'      => Lang::get('store'),
        'default'   => 'store_manage',
        'children'  => array(
            'sgrade' => array(
                'text'  => Lang::get('sgrade'),
                'url'   => 'index.php?app=sgrade',
            ),
            'scategory' => array(
                'text'  => Lang::get('scategory'),
                'url'   => 'index.php?app=scategory',
            ),
            'store_manage'  => array(
                'text'  => Lang::get('store_manage'),
                'url'   => 'index.php?app=store',
            ),
        ),
    ),*/
    // 会员
    'user' => array(
        'text'      => Lang::get('user'),
        'default'   => 'user_manage',
        'children'  => array(
            'user_manage' => array(
                'text'  => Lang::get('user_manage'),
                'url'   => 'index.php?app=user',
            ),
            'admin_manage' => array(
                'text' => Lang::get('admin_manage'),
                 'url'   => 'index.php?app=admin',
             ),
             /*'user_notice' => array(
                'text' => Lang::get('user_notice'),
                'url'  => 'index.php?app=notice',
             ),*/
			 /*'user_card' => array(
				'text'	=>'身份证审核',
				'url'	=> 'index.php?app=card',
			 ),*/
        ),
    ),
    // 交易
    /*'trade' => array(
        'text'      => Lang::get('trade'),
        'default'   => 'order_manage',
        'children'  => array(
            'order_manage' => array(
                'text'  => Lang::get('order_manage'),
                'url'   => 'index.php?app=order'
            ),
        ),
    ),*/
    // 网站
    'website' => array(
        'text'      => Lang::get('website'),
        'default'   => 'acategory',
        'children'  => array(
            'acategory' => array(
                'text'  => Lang::get('acategory'),
                'url'   => 'index.php?app=acategory',
            ),
            'article' => array(
                'text'  => Lang::get('article'),
                'url'   => 'index.php?app=article',
            ),
            'partner' => array(
                'text'  => Lang::get('partner'),
                'url'   => 'index.php?app=partner',
            ),
            'navigation' => array(
                'text'  => Lang::get('navigation'),
                'url'   => 'index.php?app=navigation',
            ),
            /*'db' => array(
                'text'  => Lang::get('db'),
                'url'   => 'index.php?app=db&amp;act=backup',
            ),
            'groupbuy' => array(
                'text' => Lang::get('groupbuy'),
                'url'  => 'index.php?app=groupbuy',
            ),
            'consulting' => array(
                'text'  =>  LANG::get('consulting'),
                'url'   => 'index.php?app=consulting',
            ),*/
            'share_link' => array(
                'text'  =>  LANG::get('share_link'),
                'url'   => 'index.php?app=share',
            ),
            'region' => array(
                'text'  => Lang::get('region'),
                'url'   => 'index.php?app=region',
            ),
        ),
    ),
    // 扩展
    /*'extend' => array(
        'text'      => Lang::get('extend'),
        'default'   => 'plugin',
        'children'  => array(
            'plugin' => array(
                'text'  => Lang::get('plugin'),
                'url'   => 'index.php?app=plugin',
            ),
            'module' => array(
                'text'  => Lang::get('module'),
                'url'   => 'index.php?app=module&act=manage',
            ),
            'widget' => array(
                'text'  => Lang::get('widget'),
                'url'   => 'index.php?app=widget',
            ),
        ),
    ),*/
);

?>
