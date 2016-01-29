<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of hone
 *
 * @author Administrator
 */
class center extends MY_Controller {
        
        public function __construct() {
            parent::__construct();
        }
           
        public function index()
        {		
        	//轮播图
        	$sql = "select * from sh_ad order by sort_order desc";
        	$all_carousels = $this->model_init->get_all($sql);
        	$json_carousels = array();
        	foreach ($all_carousels as $key => $val) {
        		$json_carousels[$key]['image'] = base_url().'admin/'.$val['ad_img'];
        		$json_carousels[$key]['title'] = $val['ad_name'];
        		$json_carousels[$key]['url'] = $val['link'];
        		$json_carousels[$key]['thumb'] = '';
        	}
        	$data['slides'] = json_encode($json_carousels);
            $this->_set_data($data);
			$this->_set_view('index',$this->_DATA);
        }
        /**
		 * 商品搜索页面
		 * style 品牌  item 款式(街拍 视频)
        */
        public function searchGoods()
		{
			$cate_id = $this->input->get('cate_id') ? $this->input->get('cate_id') : 0;
			$sql = "select cate_id,cate_name from sh_gcategory where parent_id = 4";
	        $arr_cates = $this->model_init->get_all($sql);
	        $cates = array();
	        foreach ($arr_cates as $key => $val) {
	            $cates[$val[cate_id]] = $val['cate_name'];
	        }
	        $where = "1 = 1";
	        if ($cate_id) {
	        	$where .= " and cate_id = ".$cate_id;
	        }
			$sql = "select * from sh_dress where {$where} order by sort_order desc";
        	$all_dress = $this->model_init->get_all($sql);
        	foreach ($all_dress as $key => $val) {
        		$all_dress[$key]['image_url'] = base_url() . 'admin/' .$val['image_url'];
        	}
			$data = array();
			$data['cates'] = $cates;
			$data['alldress'] = $all_dress;
			$this->_set_data($data);
			$this->_set_view('searchgoods',$this->_DATA);
		}
		//商品详情
		public function goodsDetail() {
			$pro_id = $this->input->get('pro_id') ? $this->input->get('pro_id') : 0;
			$cate_id = $this->input->get('cate_id') ? $this->input->get('cate_id') : 0;
			$sql = "select cate_id,cate_name from sh_gcategory where parent_id = 5";
	        $arr_cates = $this->model_init->get_all($sql);
	        $curProduct = array();
	        $cates = array();
	        foreach ($arr_cates as $key => $val) {
	            $cates[$val[cate_id]] = $val['cate_name'];
	        }
	        $where = "1 = 1";
	        if ($cate_id) {
	        	$where .= " and cate_id = ".$cate_id;
	        }
	        $all_product = array();
			$sql = "select * from sh_product where {$where} order by pro_id desc";
        	$all_product = $this->model_init->get_all($sql);
        	foreach ($all_product as $key => $val) {
        		$sql = "select image_url from sh_product_image where pro_id = ".$val['pro_id']." order by sort_order desc";
        		$curAllImages = $this->model_init->get_all($sql);
        		$all_product[$key]['defaultimg'] = base_url().'admin/'.$curAllImages[0]['image_url'];
        		$all_product[$key]['images'] = $curAllImages;
        		if ($pro_id && $pro_id == $val['pro_id']) {
        			$curProduct = $all_product[$key];
        		}
        	}
        	if (!$curProduct) {
        		$curProduct = $all_product[0];
        	}
			$data = array();
			$data['cates'] = $cates;
			$data['curProduct'] = $curProduct;
			$data['allproduct'] = $all_product;
			$this->_set_data($data);
			$this->_set_view('goodsdetail',$this->_DATA);
		}
		/**
		 * 经销商 1 淘宝 2 微博 微信  3 实体
		*/
		public function dealer(){
			$sql = "select article_id,title,cate_id,content,add_time,link from sh_article where if_show = 1 and cate_id = 3 {$str_article} order by sort_order desc";
			$arr_news = $this->model_init->get_all($sql);
			foreach ($arr_news as $key => $val) {
				preg_match('/<img.*src=[\"](.*?)[\"].*?>/im' , $val['content'],$match);
				$img = $match[1];
				$arr_news[$key]['image_url'] = $img; 
				$arr_news[$key]['content'] = preg_replace("/<img.*src=[\"](.*?)[\"].*?>/im"," ",$val['content']);
				unset($val['link']);
			}
			$data = array();
			$data['dealers'] = $arr_news;
			$this->_set_data($data);
			$this->_set_view('dealers',$this->_DATA);
		}
		//新闻企划
		public function newsPlan() {
			$this->load->library('pager');
			$sql = "select count(*) from sh_article where if_show = 1 and cate_id = 1";
            $totalItems = $this->model_init->get_one($sql);
            $totalItems = $totalItems ? $totalItems : 0; 
            $pageSize=4;
            $pager = new Pager($totalItems, $pageSize, "/center/newsPlan?");
            $page = $_GET['pageId'] ? ($_GET['pageId']-1)*$pageSize : 0;
			$article_id = $this->input->get('article_id') ? $this->input->get('article_id') : 0;
			$str_article = '';
			if ($article_id) $str_article = ' and article_id = '.$article_id;
			$sql = "select article_id,title,cate_id,content,add_time,link from sh_article where if_show = 1 and cate_id = 1 {$str_article} order by sort_order desc";
			$arr_news = $this->model_init->get_all($sql);
			foreach ($arr_news as $key => $val) {
				!$val['link'] and $arr_news[$key]['link'] = site_url('center/newsPlan?article_id='.$val['article_id']);
			}
			$str = "";
            //$str .= "<br>";
            $str .= "<div class='page'>";
            //$str .= "<span>显示:" . $listStart = $pager->listStart() . "-" . $listEnd = $pager->listEnd() . "条记录<span>";
            $str .= $pageStart = $pager->pageStart();
            $str .= ' '.$upPage = $pager->upPage();
            $str .= ' '.$listPage = $pager->listPage();
            $str .= $downPage = $pager->downPage();
            $str .= ' '.$pageEnd = $pager->pageEnd();
            //$str .= $jumpPage = $pager->jumpPage();
            $str .= "</div>";
			$data = array();
			$data['pager'] = $str;
			$data['news'] = $arr_news;
			$this->_set_data($data);
			$this->_set_view('newsplan',$this->_DATA);
		}
		//新闻活动
		public function newsActs() {
			$this->load->library('pager');
			$sql = "select count(*) from sh_article where if_show = 1 and cate_id = 2";
            $totalItems = $this->model_init->get_one($sql);
            $totalItems = $totalItems ? $totalItems : 0; 
            $pageSize=4;
            $pager = new Pager($totalItems, $pageSize, "/center/newsActs?");
            $page = $_GET['pageId'] ? ($_GET['pageId']-1)*$pageSize : 0;
			$article_id = $this->input->get('article_id') ? $this->input->get('article_id') : 0;
			$str_article = '';
			if ($article_id) $str_article = ' and article_id = '.$article_id;
			$sql = "select article_id,title,cate_id,content,add_time,link from sh_article where if_show = 1 and cate_id = 2 {$str_article} order by sort_order desc";
			$arr_news = $this->model_init->get_all($sql);
			foreach ($arr_news as $key => $val) {
				!$val['link'] and $arr_news[$key]['link'] = site_url('center/newsActs?article_id='.$val['article_id']);
			}
			$str = "";
            //$str .= "<br>";
            $str .= "<div class='page'>";
            //$str .= "<span>显示:" . $listStart = $pager->listStart() . "-" . $listEnd = $pager->listEnd() . "条记录<span>";
            $str .= $pageStart = $pager->pageStart();
            $str .= ' '.$upPage = $pager->upPage();
            $str .= ' '.$listPage = $pager->listPage();
            $str .= $downPage = $pager->downPage();
            $str .= ' '.$pageEnd = $pager->pageEnd();
            //$str .= $jumpPage = $pager->jumpPage();
            $str .= "</div>";
			$data = array();
			$data['pager'] = $str;
			$data['news'] = $arr_news;
			$this->_set_data($data);
			$this->_set_view('newsacts',$this->_DATA);
		}
		public function aboutUs() {
			$sql = "select content from sh_article where article_id = 9";
			$aboutus = $this->model_init->get_one($sql);
			$data = array();
			$data['content'] = $aboutus ? $aboutus : '';
			$this->_set_data($data);
			$this->_set_view('aboutus',$this->_DATA);
		}
		public function contact() {
			$data = array();
			$this->_set_data($data);
			$this->_set_view('contact',$this->_DATA);
		}
		//提交联系方式
		public function doContact() {
			//header('Location:'.site_url('center/contact'));
		}
		public function address() {

		}
		public function login() {

		}
		public function dologin() {

		}
		public function download() {
			$data = array();
			$this->_set_data($data);
			$this->_set_view('download',$this->_DATA);
		}
}

?>
