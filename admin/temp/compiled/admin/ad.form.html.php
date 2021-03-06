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
            ad_img : {
                accept  : 'gif|png|jpe?g'
            }
        },
        messages : {
            ad_img : {
                accept : 'limit_img'
            }
        }
    });
});
</script>
<div id="rightTop">
    <p>轮播图</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=ad">管理</a></li>
        <?php if ($this->_var['ad']['ad_id']): ?>
        <li><a class="btn1" href="index.php?app=ad&amp;act=add">新增</a></li>
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
                    名称:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="ad_name" type="text" name="ad_name" value="<?php echo htmlspecialchars($this->_var['ad']['ad_name']); ?>" /> <label class="field_notice">名称</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    链接:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="link" type="text" name="link" value="<?php echo htmlspecialchars($this->_var['ad']['link']); ?>" /> <label class="field_notice">链接</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    图片:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableFile2" id="ad_img" type="file" name="ad_img" />
                    <label class="field_notice">规格: 1600 * 950</label>
                </td>
            </tr>
            <?php if ($this->_var['ad']['ad_img']): ?>
            <tr>
                <th class="paddingT15">
                </th>
                <td class="paddingT15 wordSpacing5">
                <img src="<?php echo $this->_var['ad']['ad_img']; ?>" class="makesmall" max_width="352" max_height="162" />
                </td>
            </tr>
            <?php endif; ?>
            <tr>
                <th class="paddingT15">
                    排序:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="sort_order" type="text" name="sort_order" value="<?php echo $this->_var['ad']['sort_order']; ?>" /> <label class="field_notice">数值越大 排序越靠前</label>
                </td>
            </tr>
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
