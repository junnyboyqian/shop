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
            ad_name : {
                required : true
            },
            ad_img : {
                accept  : 'gif|png|jpe?g'
            }
        },
        messages : {
            ad_name : {
                required : '产品名称不能为空',
            },
            ad_img : {
                accept : 'limit_img'
            }
        }
    });
});
</script>
<div id="rightTop">
    <p>产品</p>
    <ul class="subnav">
        <li><a class="btn1" href="index.php?app=product">管理</a></li>
        <?php if ($this->_var['product']['pro_id']): ?>
        <li><a class="btn1" href="index.php?app=product&amp;act=add">新增</a></li>
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
                    <?php echo $this->html_options(array('options'=>$this->_var['cates'],'selected'=>$this->_var['product']['cate_id'])); ?>
                    </select> 
                    <label class="field_notice">分类</label></td>
            </tr>
            <tr>
                <th class="paddingT15">
                    产品名称:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="pro_name" type="text" name="pro_name" value="<?php echo htmlspecialchars($this->_var['product']['pro_name']); ?>" /> <label class="field_notice">产品名称</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    货号:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="pdt_no" type="text" name="pdt_no" value="<?php echo $this->_var['product']['pdt_no']; ?>" /> <label class="field_notice">货号</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    材质:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="fabric" type="text" name="fabric" value="<?php echo $this->_var['product']['fabric']; ?>" /> <label class="field_notice">材质</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    颜色:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="color" type="text" name="color" value="<?php echo $this->_var['product']['color']; ?>" /> <label class="field_notice">颜色</label>
                </td>
            </tr>
            <tr>
                <th class="paddingT15">
                    尺码:</th>
                <td class="paddingT15 wordSpacing5">
                    <input class="infoTableInput2" id="size" type="text" name="size" value="<?php echo $this->_var['product']['size']; ?>" /> <label class="field_notice">尺码</label>
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
