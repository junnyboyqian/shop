<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// 全局

class Model_Init extends MY_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function get_item($sql, $method = 'all')
	{
		if ( $method == 'one' )
		{
			$result	=	$this->get_row($sql);
		}
		else
		{
			$result	=	$this->get_all($sql);
		}
		return $result;
	}
	
	public function init_query($sql)
	{
		return $this->execute($sql);
	}
	
	public function get_insert_id($m = '')
	{
		return $this->insert_id($m);
	}	
        
}