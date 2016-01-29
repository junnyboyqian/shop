<?php

/**
 *    产品图片控制器
 *
 *    @author    Hyber
 *    @usage    none
 */
class PimageApp extends BackendApp
{
    var $_pimg_mod;

    function __construct()
    {
        $this->PimageApp();
    }

    function PimageApp()
    {
        parent::BackendApp();

        $this->_pimg_mod =& m('pimage');
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
        $sort  = 'sort_order';
        $order = 'desc';
        $pro_id = $_GET['id'] ? $_GET['id'] : 0;
        $conditions = 'and pro_id = '.$pro_id;
        $pros = $this->_pimg_mod->find(array(
        'conditions'    => '1=1 ' . $conditions,
        'order'         => "$sort $order",
        'count'         => true
        ));
        foreach ($pros as $key => $val) {
            $val['image_url']&&$pros[$key]['image_url'] = site_url() . '/' . $val['image_url'];
        }
        /* 导入jQuery的表单验证插件 */
        $this->import_resource(array(
            'script' => 'jqtreetable.js,inline_edit.js',
            'style'  => 'res:style/jqtreetable.css'
        ));
        $this->assign('pros', $pros);
        $this->display('pimage.index.html');
    }
     /**
     *    新增商品品牌
     *
     *    @author    Hyber
     *    @return    void
     */
    function add()
    {
        $pro_id = $_GET['pro_id'] ? $_GET['pro_id'] : 0;
        if (!IS_POST)
        {
            /* 显示新增表单 */
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->display('pimage.form.html');
        }
        else
        {
            $data = array();
            $data['pro_id']     = $pro_id;
            $data['sort_order']     = $_POST['sort_order'];
            if (!$ad_id = $this->_pimg_mod->add($data))  //获取ad_id
            {
                $this->show_warning($this->_pimg_mod->get_error());

                return;
            }
            /* 处理上传的图片 */
            $adimg       =   $this->_upload_adimg($ad_id);
            if ($adimg === false)
            {
                return;
            }
            $adimg && $this->_pimg_mod->edit($ad_id, array('image_url' => $adimg)); //将adimg地址记下
            $this->show_message('添加成功！',
                '返回图片列表',    'index.php?app=pimage&amp;id='.$pro_id,
                '继续添加', 'index.php?app=pimage&amp;act=add&amp;pro_id='.$pro_id
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
        $pro_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        $pimg_id = isset($_GET['pimg_id']) ? intval($_GET['pimg_id']) : 0;
        if (!$pro_id)
        {
            $this->show_warning('产品不存在');
            return;
        }
         if (!IS_POST)
        {
            $find_data     = $this->_pimg_mod->find($pimg_id);
            if (empty($find_data))
            {
                $this->show_warning('图片不存在');

                return;
            }
            $product    =   current($find_data);
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->assign('pimage', $product);
            $this->display('pimage.form.html');
        }
        else
        {
            $data = array();
            $data['pro_id']     = $_POST['pro_id'];
            $data['sort_order']     = $_POST['sort_order'];
            $adimg               =   $this->_upload_adimg($pimg_id);
            $adimg && $data['image_url'] = $adimg;
            if ($adimg === false)
            {
                return;
            }
            $rows=$this->_pimg_mod->edit($pimg_id, $data);
            if ($this->_pimg_mod->has_error())
            {
                $this->show_warning($this->_pimg_mod->get_error());

                return;
            }
            $this->show_message('修改成功',
                'back_list',        'index.php?app=pimage',
                'edit_again',    'index.php?app=pimage&amp;act=edit&amp;id=' . $pro_id .'&pimg_id='.$pimg_id);
        }
    }  
    //异步修改数据
   function ajax_col()
   {
       $id     = empty($_GET['id']) ? 0 : intval($_GET['id']);
       $column = empty($_GET['column']) ? '' : trim($_GET['column']);
       $value  = isset($_GET['value']) ? trim($_GET['value']) : '';
       $data   = array();

       if (in_array($column ,array('sort_order')))
       {
           $data[$column] = $value;
           $this->_pimg_mod->edit($id, $data);
           if(!$this->_pimg_mod->has_error())
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
    function drop()
    {
        $pro_ids = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$pro_ids)
        {
            $this->show_warning('图片不存在！');

            return;
        }
        $pro_ids=explode(',',$pro_ids);
        $this->_pimg_mod->drop($pro_ids);
        if ($this->_pimg_mod->has_error())    //删除
        {
            $this->show_warning($this->_pimg_mod->get_error());

            return;
        }

        $this->show_message('删除成功！');
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
        $file = $_FILES['pro_img'];
        if ($file['error'] == UPLOAD_ERR_NO_FILE) // 没有文件被上传
        {
            return '';
        }
        import('uploader.lib');             //导入上传类
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE); //限制文件类型
        $uploader->addFile($_FILES['pro_img']);//上传adimg
        if (!$uploader->file_info())
        {
            $this->show_warning($uploader->get_error() , 'go_back', 'index.php?app=pimage&amp;act=edit&amp;id=' . $ad_id);
            return false;
        }
        /* 指定保存位置的根目录 */
        $uploader->root_dir(ROOT_PATH);

        /* 上传 */
        if ($file_path = $uploader->save('data/files/mall/product', $ad_id))   //保存到指定目录，并以指定文件名$ad_id存储
        {
            return $file_path;
        }
        else
        {
            return false;
        }
    }
}

?>