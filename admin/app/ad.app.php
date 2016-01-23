<?php

/**
 *    广告控制器
 *
 *    @author    Hyber
 *    @usage    none
 */
class AdApp extends BackendApp
{
    var $_ad_mod;

    function __construct()
    {
        $this->AdApp();
    }

    function AdApp()
    {
        parent::BackendApp();

        $this->_ad_mod =& m('ad');
    }

    /**
     *    商品品牌索引
     *
     *    @author    Hyber
     *    @return    void
     */
    function index()
    {
        //更新排序
        $sort  = 'ad_id';
        $order = 'desc';
        $ads = $this->_ad_mod->find(array(
        'order'         => "$sort $order",
        'count'         => true
        ));
        foreach ($ads as $key => $ad)
        {
            $ad['ad_img']&&$ads[$key]['ad_img'] = dirname(site_url()) . '/' . $ad['ad_img'];
        }
        /* 导入jQuery的表单验证插件 */
        $this->import_resource(array(
            'script' => 'jqtreetable.js,inline_edit.js',
            'style'  => 'res:style/jqtreetable.css'
        ));
        $this->assign('ads', $ads);
        $this->display('ad.index.html');
    }
     /**
     *    新增商品品牌
     *
     *    @author    Hyber
     *    @return    void
     */
    function add()
    {
        if (!IS_POST)
        {
            /* 显示新增表单 */
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->display('ad.form.html');
        }
        else
        {
            $data = array();
            $data['ad_name']     = $_POST['ad_name'];
            $data['link']     = $_POST['link'];
            $data['position']     = $_POST['position'];
            $data['add_time'] = time();
            if (!$ad_id = $this->_ad_mod->add($data))  //获取ad_id
            {
                $this->show_warning($this->_ad_mod->get_error());

                return;
            }

            /* 处理上传的图片 */
            $adimg       =   $this->_upload_adimg($ad_id);
            if ($adimg === false)
            {
                return;
            }
            $adimg && $this->_ad_mod->edit($ad_id, array('ad_img' => $adimg)); //将adimg地址记下
            $this->show_message('添加成功！',
                'back_list',    'index.php?app=ad',
                'continue_add', 'index.php?app=ad&amp;act=add'
            );
        }
    }

     /**
     *    编辑广告
     *
     *    @author    Hyber
     *    @return    void
     */
    function edit()
    {
        $ad_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (!$ad_id)
        {
            $this->show_warning('no_such_ad');
            return;
        }
         if (!IS_POST)
        {
            $find_data     = $this->_ad_mod->find($ad_id);
            if (empty($find_data))
            {
                $this->show_warning('no_such_ad');

                return;
            }
            $ad    =   current($find_data);
            if ($ad['ad_img'])
            {
                $ad['ad_img']  =   dirname(site_url()) . "/" . $ad['ad_img'];
            }
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->assign('ad', $ad);
            $this->display('ad.form.html');
        }
        else
        {
            $data = array();
            $data['ad_name']     =   $_POST['ad_name'];
            $data['link']     =   $_POST['link'];
            $data['position'] = $_POST['position'];
            $adimg               =   $this->_upload_adimg($ad_id);
            $adimg && $data['ad_img'] = $adimg;
            if ($adimg === false)
            {
                return;
            }
            $rows=$this->_ad_mod->edit($ad_id, $data);
            if ($this->_ad_mod->has_error())
            {
                $this->show_warning($this->_ad_mod->get_error());

                return;
            }

            $this->show_message('edit_ad_successed',
                'back_list',        'index.php?app=ad',
                'edit_again',    'index.php?app=ad&amp;act=edit&amp;id=' . $ad_id);
        }
    }  

    function drop()
    {
        $ad_ids = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$ad_ids)
        {
            $this->show_warning('没有该广告！');

            return;
        }
        $ad_ids=explode(',',$ad_ids);
        $this->_ad_mod->drop($ad_ids);
        if ($this->_ad_mod->has_error())    //删除
        {
            $this->show_warning($this->_ad_mod->get_error());

            return;
        }

        $this->show_message('删除成功！');
    }
          //异步修改数据
   function ajax_col()
   {
       $id     = empty($_GET['id']) ? 0 : intval($_GET['id']);
       $column = empty($_GET['column']) ? '' : trim($_GET['column']);
       $value  = isset($_GET['value']) ? trim($_GET['value']) : '';
       $data   = array();

       if (in_array($column ,array('ad_name','position', 'link')))
       {
           $data[$column] = $value;
           $this->_ad_mod->edit($id, $data);
           if(!$this->_ad_mod->has_error())
           {
               echo ecm_json_encode(true);
           }
       }
       else
       {
           return ;
       }
       return ;
   }
        /**
     *    处理上传标志
     *
     *    @author    Hyber
     *    @param     int $ad_id
     *    @return    string
     */
    function _upload_adimg($ad_id)
    {
        $file = $_FILES['ad_img'];
        if ($file['error'] == UPLOAD_ERR_NO_FILE) // 没有文件被上传
        {
            return '';
        }
        import('uploader.lib');             //导入上传类
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE); //限制文件类型
        $uploader->addFile($_FILES['ad_img']);//上传adimg
        if (!$uploader->file_info())
        {
            $this->show_warning($uploader->get_error() , 'go_back', 'index.php?app=ad&amp;act=edit&amp;id=' . $ad_id);
            return false;
        }
        /* 指定保存位置的根目录 */
        $uploader->root_dir(ROOT_PATH);

        /* 上传 */
        if ($file_path = $uploader->save('data/files/mall/ad', $ad_id))   //保存到指定目录，并以指定文件名$ad_id存储
        {
            return $file_path;
        }
        else
        {
            return false;
        }
    }
    
    /**
     * 更新字段
     *
     */
    function update()
    {
        $allow_cols=array(
        'recommended',  //允许更新的字段
        );
        $col    =   trim($_GET['col']);
        $value  =   trim($_GET['value']);
        if (!in_array($col, $allow_cols))
        {
            $this->show_warning('Hacking attempt');
            return;
        }
        $ad_ids = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$ad_ids)
        {
            $this->show_warning('no_such_ad');

            return;
        }
        $ad_ids=explode(',',$ad_ids);
        $data = array();
        $data[$col] = $value;

        $rows=$this->_ad_mod->edit($ad_ids, $data);
        if ($this->_ad_mod->has_error())
        {
            $this->show_warning($this->_ad_mod->get_error());

            return;
        }
        $this->show_message('update_' . $col . '_successed');
    }
}

?>