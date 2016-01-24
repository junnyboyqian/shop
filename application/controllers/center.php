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

		}
		//新闻企划
		public function newPlan() {

		}
		//新闻活动
		public function newActs() {

		}
		public function aboutUs() {

		}
		public function contact() {

		}
		public function address() {

		}
		public function login() {

		}
		public function dologin() {

		}
		public function download() {

		}
}

?>
