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
        $field = 'pro_name';
        $conditions = $this->_get_query_conditions(array(array(
                'field' => $field,       //按用户名,店铺名,支付方式名称进行搜索
                'equal' => 'LIKE',
                'name'  => 'pro_name',
            )
        ));
        $page = $this->_get_page(); // 方法中参数为 每页显示的记录数
        $pros = $this->_pro_mod->find(array(
            'conditions'    => '1=1 ' . $conditions,
            'limit'         => $page['limit'],  //获取当前页的数据
            'order'         => "$sort $order",
            'count'         => true             //允许统计
        ));
        $sql = "select cate_id,cate_name from sh_gcategory where parent_id = 5";
        $arr_cates = $this->_pro_mod->getAll($sql);
        $cates = array();
        foreach ($arr_cates as $key => $val) {
            $cates[$val[cate_id]] = $val['cate_name'];
        }
        foreach ($pros as $key => $val) {
          $pros[$key]['cate'] = $cates[$val[cate_id]];
        }
        $page['item_count'] = $this->_pro_mod->getCount();
        $this->_format_page($page);
        $this->assign('page_info', $page);
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
            $sql = "select cate_id,cate_name from sh_gcategory where parent_id = 5";
            $arr_cates = $this->_pro_mod->getAll($sql);
            $cates = array();
            foreach ($arr_cates as $key => $val) {
                $cates[$val[cate_id]] = $val['cate_name'];
            }
            $this->assign('cates', $cates);
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
                '返回产品列表',    'index.php?app=product',
                '继续添加', 'index.php?app=product&amp;act=add'
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
            $sql = "select cate_id,cate_name from sh_gcategory where parent_id = 5";
            $arr_cates = $this->_pro_mod->getAll($sql);
            $cates = array();
            foreach ($arr_cates as $key => $val) {
                $cates[$val[cate_id]] = $val['cate_name'];
            }
            $this->assign('cates', $cates);
            $this->assign('product', $product);
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
            $rows=$this->_pro_mod->edit($pro_id, $data);
            if ($this->_pro_mod->has_error())
            {
                $this->show_warning($this->_pro_mod->get_error());

                return;
            }

            $this->show_message('修改成功',
                '返回产品列表',        'index.php?app=product',
                '继续修改',    'index.php?app=product&amp;act=edit&amp;id=' . $pro_id);
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