<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('get_config_item') )
{
	function get_config_item($item)
	{
		$CI =& get_instance();
		return $CI->config->item($item);
	}
}

if ( ! function_exists('base_res_image') )
{
	function base_res_image()
	{
		echo base_url() . get_config_item('base_res_image');
	}
}


if ( ! function_exists('base_res_dxcz_image') )
{
	function base_res_dxcz_image()
	{
		echo base_url() . get_config_item('base_res_dxcz_image');
	}
}

if ( ! function_exists('base_res_admin_image'))
{
	function base_res_admin_image()
	{
		echo base_url() . get_config_item('base_res_admin_image');
	}
	
}

if ( ! function_exists('base_res_default_image'))
{
	function base_res_default_image()
	{
		echo base_url() . get_config_item('base_res_default_image');
	}

}

if ( ! function_exists('base_res_upload') )
{
	function base_res_upload()
	{
		echo base_url() . get_config_item('base_res_upload');
	}
}

if ( ! function_exists('base_res_style') )
{
	function base_res_style()
	{
		echo base_url() . get_config_item('base_res_style');
	}
}

if ( ! function_exists('base_res_script') )
{
	function base_res_script()
	{
		echo base_url() . get_config_item('base_res_script');
	}
}

if ( ! function_exists('base_res_plugin') )
{
	function base_res_plugin()
	{
		echo base_url() . get_config_item('base_res_plugin');
	}
}

if ( ! function_exists('base_photo') )
{
	function base_photo()
	{
		echo base_url() . get_config_item('base_photo');
	}
} 

if ( ! function_exists('encrypt') )
{
	function encrypt($string)
	{
		if ( $string )
		{
			$hash	=	'aD#n*7%tybn56gh@)~';
			$key	=	strtoupper(md5($hash));
			$string	=	strtoupper(md5($string));
			$num	=	strlen($key);
			$code	=	'';
			for ( $i = 0; $i < $num; $i++ )
			{
				$code	.=	$key[$i] ^ $string[$i];	
			}
			return md5($code);
		}
		return '';
	}
}

if ( ! function_exists('md_encrypt') )
{
	function md_encrypt($string)
	{
		if ( $string )
		{
			$hash	=	'{t-#$%}';
			$code	= 	$string.$hash;
			return md5($code);
		}
		return '';
	}
}

if ( ! function_exists('format_time') )
{
	function format_time($time)
	{
		if ( $time )
		{
			$diff_time	=	time() - $time;
			if ( $diff_time <= 0 )
			{
				return '刚刚';
			}
			
			$diff_days	=	$diff_time / (24 * 3600);
			
			if ( $diff_days > 360 )
			{
				return date("Y-m-m H:i:s", $time);
			}
			elseif ( $diff_days > 180 )
			{
				return '半年前';
			}
			elseif ( $diff_days > 30 )
			{
				return '一个月前';
			}
			elseif ( $diff_days == 2 )
			{
				return '前天';
			}
			elseif ( $diff_days == 1 )
			{
				return '昨天';
			}
			else
			{
				$diff_hours	=	intval($diff_time / 3600);
				if ( $diff_hours > 0 )
				{
					return date('Y-m-d h:i:s',$time);
				}
				$diff_minutes	=	intval($diff_time / 60);
				if ( $diff_minutes > 0 )
				{
					return $diff_minutes.'分前';
				}
				
				return $diff_time.'秒前';
			}
		}
		return 'unknow';
	}
}

if ( ! function_exists('random_keys') )
{
	function random_keys($len = 10, $t = FALSE)
	{
		$pattern	=	"1234567890";
		if ($t)
		{
			$pattern	.=	'abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTWXYZ1234567890';
		}
		else
		{
			$pattern	.=	'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTWXYZ';
		}
		$key	=	'';
		$length	=	strlen($pattern) - 1;
		for ($i = 0; $i < $len; $i++)
		{
			$key.=	$pattern{rand(0, $length)};
		}
		return $key;
	}
}

if(!function_exists('uc_authcode'))
{
	function uc_authcode($string, $operation = 'DECODE', $key = '', $expiry = 0)
	{
		$ckey_length = 4;	//note 随机密钥长度 取值 0-32;
		//note 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
		//note 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
		//note 当此值为 0 时，则不产生随机密钥
	
		$key = md5($key ? $key : UC_KEY);
		$keya = md5(substr($key, 0, 16));
		$keyb = md5(substr($key, 16, 16));
		$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';
	
		$cryptkey = $keya.md5($keya.$keyc);
		$key_length = strlen($cryptkey);
	
		$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
		$string_length = strlen($string);
	
		$result = '';
		$box = range(0, 255);
	
		$rndkey = array();
		for($i = 0; $i <= 255; $i++) {
			$rndkey[$i] = ord($cryptkey[$i % $key_length]);
		}
	
		for($j = $i = 0; $i < 256; $i++) {
			$j = ($j + $box[$i] + $rndkey[$i]) % 256;
			$tmp = $box[$i];
			$box[$i] = $box[$j];
			$box[$j] = $tmp;
		}
	
		for($a = $j = $i = 0; $i < $string_length; $i++) {
			$a = ($a + 1) % 256;
			$j = ($j + $box[$a]) % 256;
			$tmp = $box[$a];
			$box[$a] = $box[$j];
			$box[$j] = $tmp;
			$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
		}
	
		if($operation == 'DECODE') {
			if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
				return substr($result, 26);
			} else {
				return '';
			}
		} else {
			return $keyc.str_replace('=', '', base64_encode($result));
		}
	}
}

/**
 * 验证输入的邮件地址是否合法
 *
 * @access  public
 * @param   string      $email      需要验证的邮件地址
 *
 * @return bool
 */
if ( ! function_exists('is_email') )
{
	function is_email($user_email)
	{
	    $chars = "/^([a-z0-9+_]|\\-|\\.)+@(([a-z0-9_]|\\-)+\\.)+[a-z]{2,6}\$/i";
	    if (strpos($user_email, '@') !== false && strpos($user_email, '.') !== false)
	    {
	        if (preg_match($chars, $user_email))
	        {
	            return true;
	        }
	        else
	        {
	            return false;
	        }
	    }
	    else
	    {
	        return false;
	    }
	}
}

if ( ! function_exists('show_page') )
{
	function show_page($page,$total,$url,$pagesize,$pagelen)
	{
		$pagecode	=	"";
		$page		=	intval($page);
		$total		=	intval($total);
		if ( !$total )
		{
			return $pagecode;
		}
		
		$pages		=	ceil($total/$pagesize);
		if ( $page < 1 ) $page	=	1;
		if ( $page > $pages ) $page		=	$pages;
		
		$init		=	1;
		$max		=	$pages;
		$pagelen	=	($pagelen%2)?$pagelen:$pagelen+1;
		$pageoffset	=	($pagelen -1)/2;
		
		$pagecode	=	"";		
		if ( $page!=1 )
		{
			$pagecode	.=	"<a href=\"{$url}&page=".($page-1)."\" class='fy'><< 上一页</a>";
		}		
		if( $pages>$pagelen )
		{
			if( $page <= $pageoffset )
			{
				$init	=	1;
				$max	=	$pagelen;
			}
			else 
			{
				if ( $page+$pageoffset>=$pages+1 )
				{
					$init	=	$pages-$pagelen+1;
				}
				else 
				{
					$init	=	$page-$pageoffset;
					$max	=	$page+$pageoffset;
				}
			}			
		}		
		for ( $i=$init;$i<=$max;$i++)
		{
			if ( $i==$page )
			{
				$pagecode	.=	"<a class='fy2'>".$page."</a>";
			}
			else 
			{
				$pagecode	.=	"<a href=\"{$url}&page=".($i)."\" class='fy'>".$i."</a>";
			}
		}		
		if ( $page!=$pages )
		{
			$pagecode		.=	"<a href=\"{$url}&page=".($page+1)."\" class='fy3'>下一页   >></a>";
		}		
		//$pagecode		.=	"<div>共{$pages}页</div>";		
		return	$pagecode;  
	}

}

/**
 * CURL get方式提交数据
 * 通过curl的get方式提交获取api数据
 * @param string $url api地址
 * @param int $second 超时时间,单位为秒
 * @param string $log_path 日志存放路径,如果没有就不保存日志,还有存放路径要有读写权限
 * @return true or false
 */

if (! function_exists('curl_get'))
{
	function curl_get($url,$second=30,$log_path='')
	{
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_TIMEOUT,$second);
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		$return_ch = curl_errno($ch);
		curl_close($ch);
		if($return_ch!=0)
		{
			if(!empty($log_path))
				file_put_contents($log_path,curl_error($ch)."\n\r\n\r",FILE_APPEND);
			return false;
		}
		else
		{
			return $data;
		}
	}	
}

/**
 * CURL post方式提交数据
 * 通过curl的get方式提交获取api数据
 * @param string $url api地址
 * @param string $vars 给接口提交的参数,该参数可为数组
 * @param int $second 超时时间,单位为秒
 * @param string $log_path 日志存放路径,如果没有就不保存日志,还有存放路径要有读写权限
 */

if ( !function_exists('curl_post') )
{
	function curl_post($url, $vars, $second=30,$log_path='')
	{
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_TIMEOUT,$second);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_POST, 1);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$vars);
		$data = curl_exec($ch);
		$return_ch = curl_errno($ch);
		curl_close($ch);
		if($return_ch!=0)
		{
			if(!empty($log_path))
				file_put_contents($log_path,curl_error($ch)."\n",FILE_APPEND);
			return false;
		}
		else
		{
			return $data;
		}
	}	
}

if(! function_exists('show_page_fun')){
	/** 
	 * 封装CI自带分页功能
	 * @param	$url		string		链接地址
	 * @param	$total_rows	intval		分页记录总数
	 * @param	$size		intval		每页显示的条数
	 * @param	$num_page	intval		每页显示的链接数
	 * @param	$show_total	intval		是否显示数据总数
	 * 
	 * */
	function show_page_fun($url,$total_rows,$size = 20,$num_page = 10,$show_total = true)
	{
		$CI =& get_instance();		
		$CI->load->library('pagination');
		
		$page_conf['base_url']			=	$url;
		$page_conf['total_rows']		=	$total_rows;
		$page_conf['per_page']			=	$size;
		$page_conf['num_links']			=	$num_page;
		$page_conf['page_query_string']	=	TRUE;
		$page_conf['cur_tag_open']		=	'&nbsp;<strong>';
		$page_conf['cur_tag_close'] 	= 	'</strong>';		
		$page_conf['first_link']		= '第一页';
		$page_conf['last_link'] 		= '最末页';
	
		$page_conf['next_link'] 		= '下一页';
		$page_conf['prev_link'] 		= '上一页';
	
		$CI->pagination->initialize($page_conf);
		
		if($show_total && $page_conf['total_rows'] > $size){
			$page_links		=  "<span style='font-size:12px;padding-right:10px;'>共 ".$page_conf['total_rows']." 条</span>";
		}else{
			$page_links		=  "";
		}
		$page_links			.=	$CI->pagination->create_links();
		
		return	$page_links;	
	}
}
//生成字母前缀
if(! function_exists('ff_letter_first')){
    
            function ff_letter_first($s0){
                $firstchar_ord=ord(strtoupper($s0{0})); 
                if (($firstchar_ord>=65 and $firstchar_ord<=91)or($firstchar_ord>=48 and $firstchar_ord<=57)) return $s0{0}; 
                $s=iconv("UTF-8","gb2312", $s0);
                $asc=ord($s{0})*256+ord($s{1})-65536;
                if($asc>=-20319 and $asc<=-20284)return "A";
                if($asc>=-20283 and $asc<=-19776)return "B";
                if($asc>=-19775 and $asc<=-19219)return "C";
                if($asc>=-19218 and $asc<=-18711)return "D";
                if($asc>=-18710 and $asc<=-18527)return "E";
                if($asc>=-18526 and $asc<=-18240)return "F";
                if($asc>=-18239 and $asc<=-17923)return "G";
                if($asc>=-17922 and $asc<=-17418)return "H";
                if($asc>=-17417 and $asc<=-16475)return "J";
                if($asc>=-16474 and $asc<=-16213)return "K";
                if($asc>=-16212 and $asc<=-15641)return "L";
                if($asc>=-15640 and $asc<=-15166)return "M";
                if($asc>=-15165 and $asc<=-14923)return "N";
                if($asc>=-14922 and $asc<=-14915)return "O";
                if($asc>=-14914 and $asc<=-14631)return "P";
                if($asc>=-14630 and $asc<=-14150)return "Q";
                if($asc>=-14149 and $asc<=-14091)return "R";
                if($asc>=-14090 and $asc<=-13319)return "S";
                if($asc>=-13318 and $asc<=-12839)return "T";
                if($asc>=-12838 and $asc<=-12557)return "W";
                if($asc>=-12556 and $asc<=-11848)return "X";
                if($asc>=-11847 and $asc<=-11056)return "Y";
                if($asc>=-11055 and $asc<=-10247)return "Z";
                return 0;//null
        }
}

function saddslashes($string)
{
	if(is_array($string))
	{
		foreach ($string as $key=>$value)
		{
			$string[$key] = saddslashes($value);
		}
	}else
	{
		$string = addslashes($string);
	}
	return $string;
}

if ( ! function_exists('file_write') )
{
	function file_write($file_name, $file_content, $method = 'a+')
	{
		if ( !file_exists($file_name) ) touch($file_name);
		$fp		=	fopen($file_name, $method);
		flock($fp, LOCK_EX); // 独占锁定
		fwrite($fp, $file_content);
		flock($fp, LOCK_UN);
		fclose($fp);
	}
}
?>