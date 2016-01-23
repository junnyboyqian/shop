<?php
class CardApp extends BackendApp
{
	public function CardApp()
	{
		parent::BackendApp();
		$this->_card_m = &m('card');
	}

	public function index()
	{
		$page = $this->_get_page();
		$cards = $this->_card_m->find(array(
			'limit'=>$page['limit'],
			'count'=>true,
			'order'=>'st asc'
		));
		//检查是否在使用中
		foreach($cards as $k=>$card)
		{
			$model_order =& m('order');
			$row = $model_order ->find(array('conditions'=>"card_id = ".$card['id']." and (`status` != ".ORDER_FINISHED." and `status` != ".ORDER_CANCELED.")"));
		
			if($row)
			{
				$cards[$k]['tag'] = 1;
			}else
			{
				$cards[$k]['tag'] = 0;
			}
		}
		$this->assign('cards',$cards);
		$page['item_count'] = $this->_card_m->getCount();
		$this->_format_page($page);
		$this->assign('page_info', $page);
		$this->display('card.index.html');
	}

	public function check()
	{
		$id = intval($_REQUEST['id']);
		if(IS_POST)
		{
			$page = intval($_REQUEST['page']);
			$this->_card_m->edit($id,array('st'=>1));
			header("Location:index.php?app=card&act=index&page=".$page);
			exit;
		}else
		{
			
			$card = $this->_card_m->get($id);
			$this->assign('card',$card);
			$this->display('card.form.html');
		}
	}
}
?>