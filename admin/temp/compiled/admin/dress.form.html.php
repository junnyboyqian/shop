<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
$(function(){
    $('#ad_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('right').text('OK!');
        },
        onkeyup    : false,
        rules : {
            dress_img : {
                accept  : 'gif|png|jpe?g'
            }
        },
        messages : {
            dress_img : {
                accept : 'limit_img'
            }
        }
    });
});
</script>
<div id="rightTop">
    <p>形象目录</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=dress">管理</a></li>
        <?php if ($this->_var['dress']['image_id']): ?>
        <li><a class="btn1" href="index.php?app=dress&amp;act=add">新增</a></li>
        <?php else: ?>
        <li><span>新增</span></li>
        <?php endif; ?>
    </ul>
</div>

<div class="info">
    <form method="post" enctype="multipart/form-data" id="ad_form">
        <table class="infoTable">
            <tr>
                <th class="paddingT15">
                    <label for="cate_id">分类:</label></th>
                <td class="paddingT15 wordSpacing5">
                    <select id="cate_id" name="cate_id">
                    <option value="0">请选择...</option>
                    <?php echo $this->html_options(array('options'=>$this->_var['cates'],'selected'=>$this->_var['dress']['cate_id'])); ?>
                    </select> 
                    <label class="field_notice">分类</label></td>
            </tr>
            <tr>
                <th class="paddingT15">
                    名称:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="dress_name" type="text" name="dress_name" value="<?php echo $this->_var['dress']['dress_name']; ?>" /> <label class="field_notice"></label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    排序:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="sort_order" type="text" name="sort_order" value="<?php echo $this->_var['dress']['sort_order']; ?>" /> <label class="field_notice">排序值越大 越靠前</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    形象图片:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableFile2" id="dress_img" type="file" name="dress_img" />
                    <label class="field_notice">limit_img</label>
                </td>
            </tr>
            <?php if ($this->_var['dress']['image_url']): ?>
            <tr>
                <th class="paddingT15">
                </th>
                <td class="paddingT15 wordSpacing5">
                <img src="<?php echo $this->_var['dress']['image_url']; ?>" class="makesmall" max_width="387" max_height="542" />
                </td>
            </tr>
            <?php endif; ?>
        <tr>
            <th></th>
            <td class="ptb20">
                <input class="formbtn" type="submit" name="Submit" value="提交" />
                <input class="formbtn" type="reset" name="Submit2" value="重置" />
            </td>
        </tr>
        </table>
    </form>
</div>
<?php echo $this->fetch('footer.html'); ?>
