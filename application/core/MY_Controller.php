<?php if ( !defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of MY_Controller
 *
 * @author Administrator
 */
class MY_Controller extends CI_Controller{
    
        protected $_UID = 0;
        protected $_U_NAME = '';
        protected $_U_INFO = array();
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
            //检测cookie
            $login_user_id = get_cookie('user_id');
            $login_account = get_cookie('user_name');
            $cookie_user_id = get_cookie('user_id_name');
            $cookie_encrypt = get_config_item('cookie_encrypt');

            //获取当前域名
            $web_host = get_config_item('web_host');

            if($web_host){
                $this->_WEB_HOST = $web_host;
            }

            //查看当前用户ID与保存在cookie中的用户ID是否一致
            if ($cookie_user_id && $login_user_id && ($cookie_user_id == md5($login_user_id . $login_account . $cookie_encrypt))) {
                $this->_UID = $login_user_id;
            } else {
                $user_id = 0;
                //清除登录状态cookie
                $this->__clean_login_staus_cookie();
            }

            //登录验证
            //if ($this->_UID) {
                //$sql = "SELECT a.* FROM `wkf_user` a  WHERE a.user_id = " . $this->_UID;
                //$user_row = $this->model_init->get_item($sql, 'one');
                //if ($user_row) {
                    //$sql = "SELECT * FROM wkf_user_profile WHERE user_id = " . $this->_UID;
                    //$user_data = $this->model_init->get_item($sql, 'one');
                    //$this->_U_INFO = $user_row;
                    //$this->_U_DATA = $user_data;
                    //$this->_U_NAME = $user_row['user_name'];
                //} else {
                  //  $this->_UID = '';
                  //  $this->_U_INFO = '';
                  //  $this->_LOGIN_TYPE = '';
                //}
            //}
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
        public function _set_view($view, $vars = array(), $return = FALSE) {
            $view = get_config_item('base_skin') . '/' . $view;
            $this->load->view($view, $vars, $return);
        }

        public function _set_data($data = array()) {
            // 追加全局变量
            $data['_UID'] = $this->_UID;
            $data['_U_NAME'] = $this->_U_NAME; 
            $data['_U_INFO'] = $this->_U_INFO;
            $data['_WEB_HOST'] = $this->_WEB_HOST;
            $data['current_class'] = $this->router->class;
            $cur_directory = $this->uri->segment(1, 0); //当前文件名
            $data['cur_file'] = $cur_directory;
            $data['sys_web_name'] = get_config_item('sys_web_name'); //网站名称
            $this->_DATA = $data;
        }
        public function check_login() {
            if (!$this->_UID) {
                //redirect(site_url('login'));exit;
                $_message = "请您先登录!";
                $_uri = site_url('login');
                $this->show_message($_message, $_uri, 3);
            }
        }
        //清除前台登录状态cookie/session数据
        public function __clean_login_staus_cookie()
        {
            delete_cookie('user_id');
            delete_cookie('user_name');
            delete_cookie('user_id_name');
        }
        public function show_message($str, $uri, $type = 1) { //1 成功 2失败 3警告
            $str = urlencode($str);
            $uri = urlencode($uri);
            redirect(site_url('home/message?type=' . $type . '&str=' . $str . '&uri=' . $uri));
            exit();
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
