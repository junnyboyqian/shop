<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of model_utils
 *
 * @author zhangjun
 */
class Model_Utils extends MY_Model{
        
        public function __construct()
	{
		parent::__construct();
	}
        
        /**
	 * 将字符串转换为数组
	 *
	 * @param	string	$data	字符串
	 * @return	array	返回数组格式，如果，data为空，则返回空数组
	 */
	public function string2array($data) {
		if($data == '') return array();
		@eval("\$array = $data;");
		return $array;
	}
	/**
	 * 将数组转换为字符串
	 *
	 * @param	array	$data		数组
	 * @param	bool	$isformdata	如果为0，则不使用new_stripslashes处理，可选参数，默认为1
	 * @return	string	返回字符串，如果，data为空，则返回空
	 */
	public function array2string($data, $isformdata = 1) {
		if($data == '') return '';
		if($isformdata) $data = new_stripslashes($data);
		return addslashes(var_export($data, TRUE));
	}

	public function logFile($file,$log){
		
		$fileDir = "log/";
		if (!file_exists("$fileDir")){
			mkdir($fileDir);
		}
		$file = $fileDir.$file;	
		file_put_contents($file, $log,FILE_APPEND);
	}
	
	public function logError($msg){
		$filename="log_error_".date(Ymd).".txt";
		$msgnow = date("Y-m-d H:i:s") . ":" . $msg ."\n";
		$this->logFile($filename, $msgnow);
	}
	
	public function logCron($msg){
		$filename="log_cron_".date(Ymd).".txt";
		$msgnow = date("Y-m-d H:i:s") . ":" . $msg ."\n";
		$this->logFile($filename, $msgnow);
	}
        
}

?>
