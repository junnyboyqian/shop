<?php if ( !defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Description of login
 *
 * @author zhangjun
 */
class order extends MY_Controller {
    
        public function __construct() {
            parent::__construct();
            $this->load->model('model_utils');
        }
        /**
         * 查看充值详细
         * return pageSize  totalPage
         */
        public function getOrderInfo(){
            $sql = "select DATE(gmt_create) as time,count(DISTINCT numid) as count1, count(*) as count,sum(dealerPrice) as sum from trade_temp u where u.gmt_create>'2013-09-18' GROUP BY DATE(gmt_create)";
            $list = $this->model_init->get_item($sql,'all');
            $sql = "select sum(dealerPrice) from trade_temp where gmt_create>'2013-09-18'";
            $sum = $this->model_init->get_one($sql);
            $data = array(
                'list' => $list,
                'sum' => $sum
            );
            $this->_interface_output( $data , '登陆成功！');
        }
        /**
         * 每日充值统计
         * return pageSize totalPage
         */
        public function chargeStatisticsByDay(){
            $admin_id = $this->input->get_post('admin_id') ? $this->input->get_post('admin_id') : 0;
            $pwd = $this->input->get_post('pwd') ? $this->input->get_post('pwd') : 0;
            $sign = $this->input->get_post('sign') ? $this->input->get_post('sign') : '';
            //md5校验 
            $key = get_config_item('order_key');
            if (!$admin_id || !$pwd ||!$sign) {
                $this->_interface_error('缺失必要参数');
            }
            $com_sign = md5($admin_id.'|'.$pwd.'|'.$key);
            if ($com_sign != $sign) {
                $this->_interface_error('签名不匹配');
            }
            //todo
            //$sql = "select DATE(gmt_create) as time,count(DISTINCT numid) as count1, count(*) as count,sum(dealerPrice) as sum from trade_temp u where u.gmt_create>'2013-09-18' GROUP BY DATE(gmt_create)";
        }
        /**
         * 添加充值成功记录
         * return  status 1 成功  其他错误, msg 'succ' 成功  'false' 失败 
         */
        public function addTradeRecord(){
            $numid = $this->input->get_post('numid') ? $this->input->get_post('numid') : 0;
            parent::check_user_exist($numid);
            $tradeid = $this->input->get_post('tradeid') ? $this->input->get_post('tradeid') : 0;
            $areaid = $this->input->get_post('areaid') ? $this->input->get_post('areaid') : 0;
            $sign = $this->input->get_post('sign') ? $this->input->get_post('sign') : '';
            $uid = $this->input->get_post('uid') ? urldecode(mb_convert_encoding($this->input->get_post('uid'),"GB2312","UTF-8")) : 0;
            $sr = $this->input->get_post('sr') ? $this->input->get_post('sr') : 0;
            $reatailprice = $this->input->get_post('reatailprice') ? $this->input->get_post('reatailprice') : 0;
            $dealerPrice = $this->input->get_post('dealerPrice') ? $this->input->get_post('dealerPrice') : 0;
            $channel = $this->input->get_post('channel') ? $this->input->get_post('channel') : '';
            $channel_no = $this->input->get_post('channel_no') ? $this->input->get_post('channel_no') : 0;
            $ip = $this->input->get_post('ip') ? $this->input->get_post('ip') : '';
            $depTime = $this->input->get_post('depTime') ? $this->input->get_post('depTime') : '';
            $gameid = $this->input->get_post('gameid') ? $this->input->get_post('gameid') : 0;
            //md5校验 
            $key = get_config_item('order_key');
            if (!$numid || !$tradeid || !$areaid || !$sign || !$uid || !$sr || !$reatailprice || !$dealerPrice || !$channel || !$channel_no ||!$gameid) {
                $this->_interface_error('缺失必要参数');
            }
            $com_sign = md5($numid.'|'.$tradeid.'|'.$key);
            if ($com_sign != $sign) {
                $this->_interface_error('签名不匹配');
            }
            try{
                $sql = "INSERT INTO trade(tradeid,numid,areaid,uid,sr,reatailprice,dealerPrice,gmt_create,gmt_finish,channel,channel_no,ip,trade_status,depTime,gameid)
                VALUES ('$tradeid', $numid, $areaid, '$uid', $sr, $reatailprice,$dealerPrice,now(),null,'$channel', $channel_no, '$ip',1,'$depTime',$gameid)";
                $this->model_init->init_query($sql);
            } catch (Exception $e){
                $this->_interface_error('数据库执行出错');
            }
            $this->_interface_output(1 , 'succ'); 
    }
    /**
     * 检测是否存在记录
     * return data 0 记录不存在 1 记录已存在  777 签名错误 888 参数错误 999 系统错误
     */
    public function checkExistRecord(){
        $numid = $this->input->get_post('numid') ? $this->input->get_post('numid') : 0;
        if (!$numid || !$recordid ||!$sign) {
            $this->_interface_error('888');
        }
        $com_sign = md5($numid.'|'.$recordid.'|'.$key);
        if ($com_sign != $sign) {
            $this->_interface_error('777');
        }
        try{
            $sql = "select count(*) as num from trade where tradeid = '{$recordid}' and numid = '{$numid}'";
            $num = 0;
            $num = $this->model_init->get_one($sql);
            if ($num){
                 $this->_interface_output( '1' );
            }
        } catch(Exception $e){
            $this->_interface_error('999');
        }
        $this->_interface_output( '0' );
    }
}

?>
