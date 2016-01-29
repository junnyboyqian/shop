<?php

/**
 *    形象目录控制器
 *
 *    @author    Hyber
 *    @usage    none
 */
class DressApp extends BackendApp
{
    var $_dress_mod;

    function __construct()
    {
        $this->DressApp();
    }

    function DressApp()
    {
        parent::BackendApp();

        $this->_dress_mod =& m('dress');
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
        $field = 'dress_name';
        $conditions = $this->_get_query_conditions(array(array(
                'field' => $field,       //按用户名,店铺名,支付方式名称进行搜索
                'equal' => 'LIKE',
                'name'  => 'dress_name',
            )
        ));
        $page = $this->_get_page(); // 方法中参数为 每页显示的记录数
        $pros = $this->_dress_mod->find(array(
            'conditions'    => '1=1 ' . $conditions,
            'limit'         => $page['limit'],  //获取当前页的数据
            'order'         => "$sort $order",
            'count'         => true             //允许统计
        ));
        /* 导入jQuery的表单验证插件 */
        $this->import_resource(array(
            'script' => 'jqtreetable.js,inline_edit.js',
            'style'  => 'res:style/jqtreetable.css'
        ));
        $sql = "select cate_id,cate_name from sh_gcategory where parent_id = 4";
        $arr_cates = $this->_dress_mod->getAll($sql);
        $cates = array();
        foreach ($arr_cates as $key => $val) {
            $cates[$val[cate_id]] = $val['cate_name'];
        }
        foreach ($pros as $key => $val) {
            $val['image_url']&&$pros[$key]['image_url'] = site_url() . '/' . $val['image_url'];
            $pros[$key]['cate'] = $cates[$val[cate_id]];
        }
        $page['item_count'] = $this->_dress_mod->getCount();
        $this->_format_page($page);
        $this->assign('page_info', $page);
        $this->assign('pros', $pros);
        $this->display('dress.index.html');
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
            $sql = "select cate_id,cate_name from sh_gcategory where parent_id = 4";
            $arr_cates = $this->_dress_mod->getAll($sql);
            $cates = array();
            foreach ($arr_cates as $key => $val) {
                $cates[$val[cate_id]] = $val['cate_name'];
            }
            $this->assign('cates', $cates);
            $this->display('dress.form.html');
        }
        else
        {
            $data = array();
            $data['dress_name']     = $_POST['dress_name'];
            $data['cate_id']     = $_POST['cate_id'];
            $data['sort_order']     = $_POST['sort_order'];
            $data['add_time']     = time();
            if (!$ad_id = $this->_dress_mod->add($data))  //获取ad_id
            {
                $this->show_warning($this->_dress_mod->get_error());

                return;
            }
            /* 处理上传的图片 */
            $adimg       =   $this->_upload_adimg($ad_id);
            if ($adimg === false)
            {
                return;
            }
            $adimg && $this->_dress_mod->edit($ad_id, array('image_url' => $adimg)); //将adimg地址记下
            $this->show_message('添加成功！',
                '返回图片列表',    'index.php?app=dress',
                '继续添加', 'index.php?app=dress&amp;act=add'
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
        if (!$pro_id)
        {
            $this->show_warning('形象不存在');
            return;
        }
         if (!IS_POST)
        {
            $find_data     = $this->_dress_mod->find($pro_id);
            if (empty($find_data))
            {
                $this->show_warning('形象不存在');

                return;
            }
            $dress    =   current($find_data);
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $sql = "select cate_id,cate_name from sh_gcategory where parent_id = 4";
            $arr_cates = $this->_dress_mod->getAll($sql);
            $cates = array();
            foreach ($arr_cates as $key => $val) {
                $cates[$val[cate_id]] = $val['cate_name'];
            }
            $this->assign('cates', $cates);
            $this->assign('dress', $dress);
            $this->display('dress.form.html');
        }
        else
        {
            $data = array();
            $data['dress_name']     = $_POST['dress_name'];
            $data['cate_id']     = $_POST['cate_id'];
            $data['sort_order']     = $_POST['sort_order'];
            $adimg               =   $this->_upload_adimg($pro_id);
            $adimg && $data['image_url'] = $adimg;
            if ($adimg === false)
            {
                return;
            }
            $rows=$this->_dress_mod->edit($pro_id, $data);
            if ($this->_dress_mod->has_error())
            {
                $this->show_warning($this->_dress_mod->get_error());

                return;
            }
            $this->show_message('修改成功',
                '返回图片列表',        'index.php?app=dress',
                '继续修改',    'index.php?app=dress&amp;act=edit&amp;id=' . $pro_id);
        }
    }  
    //异步修改数据
   function ajax_col()
   {
       $id     = empty($_GET['id']) ? 0 : intval($_GET['id']);
       $column = empty($_GET['column']) ? '' : trim($_GET['column']);
       $value  = isset($_GET['value']) ? trim($_GET['value']) : '';
       $data   = array();

       if (in_array($column ,array('sort_order','dress_name')))
       {
           $data[$column] = $value;
           $this->_dress_mod->edit($id, $data);
           if(!$this->_dress_mod->has_error())
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
            $this->show_warning('形象不存在！');

            return;
        }
        $pro_ids=explode(',',$pro_ids);
        $this->_dress_mod->drop($pro_ids);
        if ($this->_dress_mod->has_error())    //删除
        {
            $this->show_warning($this->_dress_mod->get_error());

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
        $file = $_FILES['dress_img'];
        if ($file['error'] == UPLOAD_ERR_NO_FILE) // 没有文件被上传
        {
            return '';
        }
        import('uploader.lib');             //导入上传类
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE); //限制文件类型
        $uploader->addFile($_FILES['dress_img']);//上传adimg
        if (!$uploader->file_info())
        {
            $this->show_warning($uploader->get_error() , 'go_back', 'index.php?app=dress&amp;act=edit&amp;id=' . $ad_id);
            return false;
        }
        /* 指定保存位置的根目录 */
        $uploader->root_dir(ROOT_PATH);

        /* 上传 */
        if ($file_path = $uploader->save('data/files/mall/dress', $ad_id))   //保存到指定目录，并以指定文件名$ad_id存储
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