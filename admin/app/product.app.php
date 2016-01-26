<?php

/**
 *    产品控制器
 *
 *    @author    Hyber
 *    @usage    none
 */
class ProductApp extends BackendApp
{
    var $_pro_mod;

    function __construct()
    {
        $this->ProductApp();
    }

    function ProductApp()
    {
        parent::BackendApp();

        $this->_pro_mod =& m('product');
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
        $sort  = 'pro_id';
        $order = 'desc';
        $pros = $this->_pro_mod->find(array(
        'order'         => "$sort $order",
        'count'         => true
        ));
        /*foreach ($pros as $key => $ad)
        {
            $ad['pro_img']&&$pros[$key]['pro_img'] = dirname(site_url()) . '/' . $ad['pro_img'];
        }*/
        /* 导入jQuery的表单验证插件 */
        $this->import_resource(array(
            'script' => 'jqtreetable.js,inline_edit.js',
            'style'  => 'res:style/jqtreetable.css'
        ));
        $this->assign('pros', $pros);
        $this->display('product.index.html');
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
            $this->display('product.form.html');
        }
        else
        {
            $data = array();
            $data['cate_id']     = $_POST['cate_id'];
            $data['pro_name']     = $_POST['pro_name'];
            $data['fabric']     = $_POST['fabric'];
            $data['color']     = $_POST['color'];
            $data['size']     = $_POST['size'];
            $data['pdt_no']     = $_POST['pdt_no'];
            $data['add_time'] = time();
            if (!$pro_id = $this->_pro_mod->add($data))  //获取pro_id
            {
                $this->show_warning($this->_pro_mod->get_error());

                return;
            }
            $this->show_message('添加成功！',
                'back_list',    'index.php?app=product',
                'continue_prod', 'index.php?app=product&amp;act=add'
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
            $this->show_warning('产品不存在');
            return;
        }
         if (!IS_POST)
        {
            $find_data     = $this->_pro_mod->find($pro_id);
            if (empty($find_data))
            {
                $this->show_warning('产品不存在');

                return;
            }
            $product    =   current($find_data);
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->assign('product', $product);
            $this->display('product.form.html');
        }
        else
        {
            $data = array();
            //$data['cate_id']     = $_POST['cate_id'];
            $data['pro_name']     = $_POST['pro_name'];
            $data['fabric']     = $_POST['fabric'];
            $data['color']     = $_POST['color'];
            $data['size']     = $_POST['size'];
            $data['pdt_no']     = $_POST['pdt_no'];
            $rows=$this->_pro_mod->edit($pro_id, $data);
            if ($this->_pro_mod->has_error())
            {
                $this->show_warning($this->_pro_mod->get_error());

                return;
            }

            $this->show_message('修改成功',
                'back_list',        'index.php?app=product',
                'edit_again',    'index.php?app=product&amp;act=edit&amp;id=' . $pro_id);
        }
    }  

    function drop()
    {
        $pro_ids = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$pro_ids)
        {
            $this->show_warning('没有该产品！');

            return;
        }
        $pro_ids=explode(',',$pro_ids);
        $this->_pro_mod->drop($pro_ids);
        if ($this->_pro_mod->has_error())    //删除
        {
            $this->show_warning($this->_pro_mod->get_error());

            return;
        }

        $this->show_message('删除成功！');
    }
}

?>