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
            $this->_set_data($data);
			$this->_set_view('index',$this->_DATA);
        }
        /**
		 * 商品搜索页面
		 * style 品牌  item 款式(街拍 视频)
        */
        public function searchGoods()
		{
			$data = array();
			$this->_set_data($data);
			$this->_set_view('searchgoods',$this->_DATA);
		}
		//商品详情
		public function goodsDetail() {
			$data = array();
			$this->_set_data($data);
			$this->_set_view('goodsdetail',$this->_DATA);
		}
		/**
		 * 经销商 1 淘宝 2 微博 微信  3 实体
		*/
		public function dealer(){
			$data = array();
			$this->_set_data($data);
			$this->_set_view('dealers',$this->_DATA);
		}
		//新闻企划
		public function newsPlan() {
			$data = array();
			$this->_set_data($data);
			$this->_set_view('newsplan',$this->_DATA);
		}
		//新闻活动
		public function newsActs() {
			$data = array();
			$this->_set_data($data);
			$this->_set_view('newsacts',$this->_DATA);
		}
		public function aboutUs() {
			$data = array();
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
