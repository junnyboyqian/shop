<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 俞恺 收入数据服务器传输接口
 *
 * @author zhangjun
 */
class ykjk extends MY_Controller{
    
        public function __construct() {
            parent::__construct();
            $this->load->library('ApiClientgt');
        }
        
        public function sendData(){
                $accountID = (int)$this->input->get('numberid');
                $currencyAmount = (int)$this->input->get('amount') ;
               
                $orderno = str_replace("-", "", date("Y-m-dH-i-s")).rand(1000,2000); 
                // msgID  OS accountID  orderID  currencyAmount currencyTpye virtualCurrencyAmount status  
                $client = new ApiClientgt();
                header('Content-Type: text/html; charset=UTF-8');
                $post_data = array();
                $post_data[0]['msgID'] = '1001';
                $post_data[0]['OS'] = 'android';
                $post_data[0]['accountID'] = $accountID;
                $post_data[0]['orderID'] = $orderno;
                $post_data[0]['currencyAmount'] = $currencyAmount;
                $post_data[0]['currencyType'] = 'CNY';
                $post_data[0]['virtualCurrencyAmount'] = $currencyAmount * 10;
                $post_data[0]['status'] = 'success';
                $post_data = json_encode($post_data,true);
                $json_post_data = gzencode($post_data);
                $url = "http://api.talkinggame.com/api/charge/637639BC93446F8E4D1A6F26C28DDEB7";
                $ret = $client->http($url, "POST", $json_post_data);
                $ret = $this->gzdecode($ret);
                $ret = json_decode($ret,true); 
                $flag = false;
                switch($ret['code']){
                   case 101: $words =  '发送数据的ip被允许';break;
                   case 102: $words =  '请求url中携带的appId在平台中不存在';break; 
                   case 103: $words =  '数据不是json格式';break; 
                   case 104: $words =  '数据没有经过gzip压缩,解包失败';break; 
                   case 105: $words =  '服务器内部有错误';break; 
                   case 100: $flag = true;break; 
                   default : $ret['code'] = 999;$words = '请求超时,请重新尝试';break;
                }
                if (!$flag){
                        echo json_encode(
                                array(
                                        'code' => $ret['code'],
                                        'msg' =>  urlencode($words)
                                )	
                        );	
                        exit;
                }
                if ($ret['dataStatus'][0]['code'] == 2){
                    $str_words = '发送的字段不完整';
                } elseif ($ret['dataStatus'][0]['code'] == 3) {
                    $str_words = '字段格式有误';
                } elseif ($ret['dataStatus'][0]['code'] == 1) {
                    $str_words = 'success';
                }
                echo json_encode(
                    array(
                            'code' => $ret['dataStatus'][0]['code'],
                            'msg' =>  urlencode($str_words)
                    )	
                );	
                exit;
        }
        
       function gzdecode ($data) {     
        $flags = ord(substr($data, 3, 1));     
        $headerlen = 10;     
        $extralen = 0;     
        $filenamelen = 0;     
        if ($flags & 4) {     
            $extralen = unpack('v' ,substr($data, 10, 2));     
            $extralen = $extralen[1];     
            $headerlen += 2 + $extralen;     
        }     
        if ($flags & 8) // Filename     
            $headerlen = strpos($data, chr(0), $headerlen) + 1;     
        if ($flags & 16) // Comment     
            $headerlen = strpos($data, chr(0), $headerlen) + 1;     
        if ($flags & 2) // CRC at end of file     
            $headerlen += 2;     
        $unpacked = @gzinflate(substr($data, $headerlen));     
        if ($unpacked === FALSE)     
              $unpacked = $data;     
        return $unpacked;     
     }      
}

?>
