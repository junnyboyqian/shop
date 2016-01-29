<?php

/* 形象目录 */
class DressModel extends BaseModel
{
    var $table  = 'dress';
    var $prikey = 'image_id';
    var $_name  = 'dress';

    /**
     *    删除商品品牌
     *
     *    @author    Hyber
     *    @param     string $conditions
     *    @param     string $fields
     *    @return    void
     */
    function drop($conditions, $fields = 'image_url')
    {
        $droped_rows = parent::drop($conditions, $fields);
        if ($droped_rows)
        {
            restore_error_handler();
            $droped_data = $this->getDroppedData();
            foreach ($droped_data as $key => $value)
            {
                if ($value['image_url'])
                {
                    @unlink(ROOT_PATH . '/' . $value['image_url']);  //删除广告文件
                }
            }
            reset_error_handler();
        }

        return $droped_rows;
    }

}

?>