<?php
class ShipinfoModel extends BaseModel
{
	var $table  = 'shipinfo';
    var $prikey = 'id';
	function get($ship_id)
	{
		
		return $this->db->getRow("select * from {$this->table} where ship_id = ".$ship_id." and area_id=0");
	}
}
?>