<?php if ( !defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of MY_Controller
 *
 * @author Administrator
 */
class MY_Controller extends CI_Controller{
    
        protected $_NUMID = 0;
        protected $_PWD = '';
        protected $_DATA;
        public function __construct() {
            parent::__construct();
            $this->__init();
        }
        private function __init() {
            date_default_timezone_set('Asia/Shanghai'); //设置时区
            @session_start();
            $this->load->database();
            $this->load->helper('cookie');
            $this->load->model('model_init');
        }
       
        /**
         * 检测用户是否存在
         * return -1  验证未通过
         */
        public function check_user_exist($account){
            if (empty($account)){
                $this->_interface_error('-1');
            }
             //检测用户名是否存在
            $check_username_exist_url = 'http://121.14.48.177:5002/2.0jk/checkusername.asp?userid='.$account;
            $rs = file_get_contents($check_username_exist_url);
            $rs = json_decode($rs,true);
            $check_rs = $rs['status'];
            if ($check_rs === '1') {
                 $this->_interface_error('-1');
            }
        }
        /**
         * 接口输出
         */
        public function _interface_output( $result ) {
            echo $this->_i_output( $result , '1' ); 
            exit(0);
        }
        
        public function _i_output ( $result , $code  ) {
            return json_encode( array( 'data' => $result ,'status' => $code) );
        }
         /**
         * 接口错误输出
         */
        public function _interface_error ($result) {
            echo $this->_i_output( $result , '0' );
            exit(0);
        }
         //得到当前IP
        public function get_ip_address() {
            $ip_address = $this->input->ip_address();
            return $ip_address;
        }
}

?>
