<?php

/* 品牌 ad */
class ProductModel extends BaseModel
{
    var $table  = 'product';
    var $prikey = 'pro_id';
    var $_name  = 'product';

    /**
     *    删除商品品牌
     *
     *    @author    Hyber
     *    @param     string $conditions
     *    @param     string $fields
     *    @return    void
     */
    function drop($conditions, $fields = '')
    {
        $droped_rows = parent::drop($conditions, $fields);
        if ($droped_rows)
        {
            restore_error_handler();      
            reset_error_handler();
        }

        return $droped_rows;
    }

}

?>