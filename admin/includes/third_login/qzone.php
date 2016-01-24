<?php

class Qzone
{
	//申请API的QQ号码：1149502217
	public $appid    = 101211991;
	//申请到的appkey
	public $appkey   = "cf0878b181de1c0c02dcda8eee54b064"; 
	
	//QQ登录成功后跳转的地址,请确保地址真实可用，否则会导致登录失败。
	//http://sinogo.hk/index.php?app=member&act=qq_login_callback
	public $callback = "http://sinogo.hk/index.php?app=member&act=qq_login_callback";
	
	//QQ授权api接口.按需调用
	public $scope = "get_user_info";
	
	public function __construct()
	{
			@session_start();		
	}

	public function qq_login()
	{
		$this->setParam('state',md5(uniqid(rand(), TRUE))); //CSRF protection
		$login_url = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id="
		. $this->appid . "&redirect_uri=" . urlencode($this->callback)
		. "&state=" . $this->getParam('state')
		. "&scope=".$this->scope;
		header("Location:$login_url");
	}
		
	/**
	 * 获取qq空间授权uri
	 * 
	 */
	public function get_qq_zone_auth_url()
	{
		$this->setParam('state',md5(uniqid(rand(), TRUE))); //CSRF protection
		$login_url = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id="
		. $this->appid . "&redirect_uri=" . urlencode($this->callback)
		. "&state=" . $this->getParam('state')
		. "&scope=".$this->scope;	
		return $login_url;
	}	
	
	public function do_post($url, $data)
	{
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); 
	    curl_setopt($ch, CURLOPT_POST, TRUE); 
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $data); 
	    curl_setopt($ch, CURLOPT_URL, $url);
	    $ret = curl_exec($ch);
	    curl_close($ch);
	    return $ret;
	}
	
	public function get_url_contents($url)
	{
	    if (ini_get("allow_url_fopen") == "1")
	        return file_get_contents($url);
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	    curl_setopt($ch, CURLOPT_URL, $url);
	    $result =  curl_exec($ch);
	    curl_close($ch);
	    return $result;
	}

	/**
     * 获取access_token值
     * @return array 返回包含access_token,过期时间的数组
     * 
     */
	public function get_token($code,$state){
        if($state !== $this->getParam('state')) {
			return false;
			exit();
        }
        $url = "https://graph.qq.com/oauth2.0/token";
        $param = array(
            "grant_type"    =>    "authorization_code",
            "client_id"     =>    $this->appid,
            "client_secret" =>    $this->appkey,
            "code"          =>    $code,
            "state"         =>    $state,
            "redirect_uri"  =>    $this->callback
        );
        $response = $this->do_post($url, $param);
        if($response == false) {
            return false;
        }
        $params = array();
        parse_str($response, $params);
        $this->setParam('qzone_access_token',$params["access_token"]);
        return $params["access_token"];
	}

	public  function get_openid($access_token) {
        $url = "https://graph.qq.com/oauth2.0/me"; 
        $param = array(
            "access_token"    => $access_token
        );
        $response  = $this->do_post($url, $param);
        if($response == false) {
            return false;
        }
        if (strpos($response, "callback") !== false) {
            $lpos = strpos($response, "(");
            $rpos = strrpos($response, ")");
            $response  = substr($response, $lpos + 1, $rpos - $lpos -1);
        }
        $user = json_decode($response);
        if (isset($user->error) || $user->openid == "") {
            return false;
        }
        $this->setParam('qzone_openid',$user->openid);
        return $user->openid;
    }

	public function get_user_info()
	{
	    $get_user_info = "https://graph.qq.com/user/get_user_info?"
	        . "access_token=" . $this->getParam('qzone_access_token')
	        . "&oauth_consumer_key=" . $this->appid
	        . "&openid=" . $this->getParam("qzone_openid")
	        . "&format=json";
	
	    $info = $this->get_url_contents($get_user_info);
	    $arr = json_decode($info, true);
	
	    return $arr;
	}

	public function setParam( $key , $val=null)
	{
		//return 0;
		if( null === $val)
		{
			$_SESSION[$key] = '';
			return ;
		}
		$_SESSION[$key] = $val;
	}
	
	public function getParam( $key )
	{	
		return $_SESSION[$key];	
	}	
}