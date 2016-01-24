<?php

/* 品牌 ad */
class AdModel extends BaseModel
{
    var $table  = 'ad';
    var $prikey = 'ad_id';
    var $_name  = 'ad';

    /* 添加编辑时自动验证 */
    var $_autov = array(
        'ad_name' => array(
            'required'  => true,    //必填
            'min'       => 1,       //最短1个字符
            'max'       => 100,     //最长100个字符
            'filter'    => 'trim',
        )
    );

    /**
     *    删除商品品牌
     *
     *    @author    Hyber
     *    @param     string $conditions
     *    @param     string $fields
     *    @return    void
     */
    function drop($conditions, $fields = 'ad_img')
    {
        $droped_rows = parent::drop($conditions, $fields);
        if ($droped_rows)
        {
            restore_error_handler();
            $droped_data = $this->getDroppedData();
            foreach ($droped_data as $key => $value)
            {
                if ($value['ad_img'])
                {
                    @unlink(ROOT_PATH . '/' . $value['ad_img']);  //删除广告文件
                }
            }
            reset_error_handler();
        }

        return $droped_rows;
    }
    function getAds($position,$num){
        $rs = array();
        $sql = "select * from  ecm_ad where position = '".$position."' limit ".$num;
        $rs = $this->getAll($sql);
        return $rs;
    }

}

?>