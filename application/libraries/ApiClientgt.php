<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ApiClientgt
 *
 * @author zhangjun
 */
class ApiClientgt {
       public $http_code; 
       public $http_header;
       public $http_info;
       public $url;
       public $timeout = 10;
       public $connecttimeout = 300;
    
   	function http($url, $method,$postdata = '') { 
        $this->http_info = array(); 
        $ci = curl_init(); 
        curl_setopt($ci, CURLOPT_USERAGENT, 'BFAPI'); 
        curl_setopt($ci, CURLOPT_CONNECTTIMEOUT, $this->connecttimeout); 
        curl_setopt($ci, CURLOPT_TIMEOUT, $this->timeout); 
        curl_setopt($ci, CURLOPT_RETURNTRANSFER, TRUE); 
        curl_setopt($ci, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
        curl_setopt($ci, CURLOPT_SSL_VERIFYPEER, false);  
        curl_setopt($ci, CURLOPT_HEADER, FALSE); 
		
        switch ($method) { 
        case 'POST': 
            curl_setopt($ci, CURLOPT_POST, TRUE); 
            if (!empty($postdata)) { 
                if(is_array($postdata)){
                    $postdata = http_build_query($postdata);
                }
                curl_setopt($ci, CURLOPT_POSTFIELDS, $postdata); 
            }
            break; 
        } 
        curl_setopt($ci, CURLINFO_HEADER_OUT, FALSE ); 

        curl_setopt($ci, CURLOPT_URL, $url); 

        $response = curl_exec($ci);
        $this->http_code = curl_getinfo($ci, CURLINFO_HTTP_CODE); 
        $this->http_info = array_merge($this->http_info, curl_getinfo($ci)); 
        $this->url = $url; 
        curl_close ($ci); 
        return $response; 
    }
}

?>
