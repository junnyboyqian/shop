<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
// 主Model

class MY_Model extends CI_Model
{
	private $_query;
	protected $_TIME;
	protected $_DATE;
	var $is_get_insert_id = FALSE;
	
	public function __construct()
	{
		parent::__construct();
		$this->_init();
	}
	
	private function _init()
	{
		$this->_TIME	=	time();
		$this->_DATE	=	date("Y-m-d");
	}
	
	public function get_row($sql)
	{
		$this->_query( $sql );
		$row	=	$this->_query->row_array();
		return $row;
	}
	
	public function get_one($sql)
	{
		$this->_query( $sql );
		$row	=	$this->_query->row_array();
		sort($row);
		return $row[0];
	}
	
	public function get_all($sql)
	{
		$this->_query( $sql );
		$list	=	$this->_query->result_array();
		return $list;
	}
	
	public function insert($table, $params)
	{
		$insert_key		=	array();
		$insert_value	=	array();
		foreach ($params as $key=>$value)
		{
			$insert_key[]	=	"`".$key."`";
			$insert_value[]	=	$this->db->escape($value);
		}
			
		$sql	=	"INSERT INTO ".$table."(".implode(',', $insert_key).")".
					"VALUES(".implode(',', $insert_value).")";
		if ( !$this->_query( $sql ) )
		{
			return FALSE;
		}
		return TRUE;
	}
	
	public function update($table, $params,$sql_where)
	{
		$insert_key		=	array();
		$insert_value	=	array();
		$sql = "update ".$table." set ";
		$num = count($params);
		$k = 0;


		foreach ($params as $key=>$value)
		{
			$k++;
			if($num==$k){
				$sql.=" `".$key."`=".$this->db->escape($value)." ";
			}else{
				$sql.=" `".$key."`=".$this->db->escape($value).", ";
			}

		}

		$sql.=	$sql_where;

		if ( !$this->_query( $sql ) )
		{
			return FALSE;
		}
		return TRUE;
	}
	
	public function execute($sql)
	{
		return $this->_query($sql) ? TRUE : FALSE;
	}
	
	private function _query($sql)
	{
		if ( $this->_query = $this->db->query( $sql ) )
		{
			return TRUE;
		}
		else
		{
			$this->_show_error();
		}
	}
	
	public function insert_id($m = '')
	{
		if( $m != '' )
		{
			$sql	= "SELECT LAST_INSERT_ID() as id";	
			$this->is_get_insert_id	=	FALSE;
			if ( $temp=$this->get_row($sql) )
			{
				$id	=	$temp["id"];
				return $id;
			}
			return 0;
		}
		else
		{
			$id	=	mysql_insert_id();
			return $id;
		}
	}
	
	private function _show_error()
	{
		exit('over');
	}
}