<?php

/* 品牌 brand */
class BrandModel extends BaseModel
{
    var $table  = 'brand';
    var $prikey = 'brand_id';
    var $_name  = 'brand';

    /* 添加编辑时自动验证 */
    var $_autov = array(
        'brand_name' => array(
            'required'  => true,    //必填
            'min'       => 1,       //最短1个字符
            'max'       => 100,     //最长100个字符
            'filter'    => 'trim',
        ),
        'sort_order'  => array(
            'filter'    => 'intval',
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
    function drop($conditions, $fields = 'brand_logo,brand_recommend')
    {
        $droped_rows = parent::drop($conditions, $fields);
        if ($droped_rows)
        {
            restore_error_handler();
            $droped_data = $this->getDroppedData();
            foreach ($droped_data as $key => $value)
            {
                if ($value['brand_logo'])
                {
                    @unlink(ROOT_PATH . '/' . $value['brand_logo']);  //删除Logo文件
                }
                if ($value['brand_recommend'])
                {
                    @unlink(ROOT_PATH . '/' . $value['brand_recommend']);  //删除Logo文件
                }
            }
            reset_error_handler();
        }

        return $droped_rows;
    }

        /*
     * 判断名称是否唯一
     */
    function unique($brand_name, $brand_id = 0)
    {
        $conditions = "brand_name = '" . $brand_name . "' AND brand_id != ".$brand_id."";
        //dump($conditions);
        return count($this->find(array('conditions' => $conditions))) == 0;
    }
    
    /* 按标签分类取得所有的品牌   */
    
    function getAllBrands()
    {
        $sql = "SELECT group_concat(brand_id) as brand_ids,COUNT(*) as count,tag FROM {$this->table} WHERE if_show = 1 GROUP BY tag ORDER BY count DESC";
        return $this->db->getAll($sql);
    }

    /* 取得推荐的品牌 */
    
    function getRecommendBrands() {
        $sql = "SELECT brand_recommend,age,discount_time,discount,brand_name,brand_logo,brand_link,tag FROM {$this->table} WHERE if_show = 1 and recommended = 1 ORDER BY sort_order DESC limit 3";
        $arr_rs = $this->db->getAll($sql);
        foreach ($arr_rs as $key => $val) {
           $arr_time = $this->timediff(time(),$val['discount_time']);
           $day = $arr_time['day'] ? $arr_time['day'].'天' :''; 
           $hour = $arr_time['hour'] ? $arr_time['hour'].'小时' :''; 
           $min = $arr_time['min'] ? $arr_time['min'].'分钟' :'';
           $sec = $arr_time['sec'] ? $arr_time['sec'].'秒' :'';
           $arr_rs[$key]['discount_time_words'] = $day.$hour.$min.$sec;
           $arr_rs[$key]['discount_time_words'] = $arr_rs[$key]['discount_time_words'] ? $arr_rs[$key]['discount_time_words'] : '特卖已结束';
        }
        return $arr_rs;
    }
    function timediff($begin_time,$end_time)
    {
         if($begin_time < $end_time){
            $starttime = $begin_time;
            $endtime = $end_time;
         } else{
            return array("day" => '',"hour" => '',"min" => '',"sec" => '');
         }
         $timediff = $endtime-$starttime;
         $days = intval($timediff/86400);
         $remain = $timediff%86400;
         $hours = intval($remain/3600);
         $remain = $remain%3600;
         $mins = intval($remain/60);
         $secs = $remain%60;
         $res = array("day" => $days,"hour" => $hours,"min" => $mins,"sec" => $secs);
         return $res;
    }
    /* 所有品牌列表 */
    function getBrandsList() {
        $sql = "SELECT brand_id,brand_name,brand_logo,brand_link,tag FROM {$this->table} WHERE if_show = 1 ORDER BY sort_order DESC";
        return $this->db->getAll($sql);
    }
    /* 根据品牌名称取得品牌图片 */
    function getBrandLogoByBname($bname) {
        $sql = "SELECT brand_logo FROM {$this->table} WHERE if_show = 1 and brand_name = '".$bname."' limit 1";
        return $this->db->getOne($sql);
    }
}

?>