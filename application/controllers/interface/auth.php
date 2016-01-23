<?php if ( !defined('BASEPATH')) exit('No direct script access allowed');

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of auth
 *
 * @author zhangjun
 */
class auth extends MY_Controller {
    
        public static function sessionAuth(){
		$sessionID = $this->get->input('sessionID');
		$numid = $this->get->input('numid');
		$areaid = $this->get->input('areaid');
		$channelid = $this->get->input('channelid');

		$key = 'ptsl'.$areaid.'_'.$numid.'_'.$channelid;
		
		$memcache_server = "61.152.98.37";
		$d = new memcache();
		$d->connect($memcache_server,11211);
		$temp = $d->get($key);
		
		if($sessionID == $temp){
			return "success";
		}else{
			return "fail";
		}
	}
	
	public static function setSession(){
		$numid = $_POST['numid'];
		$areaid = $_POST['areaid'];
		
		if (empty($numid) || empty($areaid)) {
			$result = array('error'=>-3,
					'data'=>false,
					'msg'=>urlencode('参数不正确')
			);
			return json_encode($result);
		}

		$numidInDB = DB::getInt("select numid from UserAccount where numid=$numid and areaid=$areaid");
		
		if($numidInDB === 0){
			$result = array('error'=>-4,
					'data'=>false,
					'msg'=>urlencode('用户名不存在')
			);
			return json_encode($result);
		}
		
		$str_key = uniqid(rand());
		
		$sessionID =  substr(md5($str_key), 0, 16);
		
		$oldkey = "psc" . $areaid . "_" . $numid;
		$newkey = "pscd" . $areaid . "_" . $numid;
		
		$memcache_server = "61.152.98.37";
		$d = new memcache();
		$isConnected = $d->connect($memcache_server,11211);
		if(!$isConnected){
			$result = array('error'=>-1,
							'data'=>false,
							'msg'=>urlencode('memcache连接失败')
			);
			return json_encode($result);
		}
		
		$ret1 = $d->set($oldkey, $sessionID);
		$ret2 = $d->set($newkey, $sessionID."0000"."0");
		
		if(!$ret1 || !$ret2){
			$result = array('error'=>-2,
					'data'=>false,
					'msg'=>urlencode('memcache写入失败')
			);
			return json_encode($result);
		}
		
		$result = array('error'=>0,
				'data'=>$sessionID,
				'msg'=>urlencode('memcache写入成功')
		);
		return json_encode($result);
	}
	
	public static function deleteSession(){
		$userid = $_POST['userid'];
		$areaid = $_POST['areaid'];
		$numid = $_POST['numid'];
		
		if (empty($userid) || empty($areaid) || empty($numid)){
			$result = array('error'=>-3,
					'data'=>false,
					'msg'=>urlencode('参数不正确')
			);
			return json_encode($result);
		}
		
		$numidInDB = DB::getInt("select numid from UserAccount where numid=$numid and areaid=$areaid");
		
		if($numidInDB === 0){
			$result = array('error'=>-4,
					'data'=>false,
					'msg'=>urlencode('用户名不存在')
			);
			return json_encode($result);
		}
		
		$key1 = acc.$areaid."_".$userid;
		
		$memcache_server = "61.152.98.37";
		$d = new memcache();
		$isConnected = $d->connect($memcache_server,11211);
		if(!$isConnected){
			$result = array('error'=>-1,
							'data'=>false,
							'msg'=>urlencode('memcache连接失败')
			);
			return json_encode($result);
		}
		
		$ret1 = $d->delete($key1);
		
		if(!$ret1){
			$result = array('error'=>-2,
					'data'=>false,
					'msg'=>urlencode('memcache删除失败')
			);
			return json_encode($result);
		}
		
		$result = array('error'=>0,
				'data'=>false,
				'msg'=>urlencode('memcache删除成功')
		);
		return json_encode($result);

	}
}

?>
