<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of hone
 *
 * @author Administrator
 */
class home extends MY_Controller {
        
        public function __construct() {
            parent::__construct();
        }
           
        public function index()
        {		
                redirect(site_url('welcome'));
        }
        
        public function message()
	{
		$str = $this->input->get('str');
		$type= $this->input->get('type');
		$msg = urldecode($str);
		$data = array(
			'type'=> $type,
			'msg' => $msg,
		);
		$this->_set_data($data);
		$this->_set_view('show_message',$this->_DATA);
	}
}

?>
