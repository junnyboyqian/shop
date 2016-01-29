<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>产品图</p>
    <ul class="subnav">
        <li><span>管理</span></li>
        <li><a class="btn1" href="index.php?app=pimage&amp;act=add&amp;pro_id=<?php echo $_GET['id']; ?>">新增</a></li>
        <li><a class="btn1" href="index.php?app=product&amp;act=index">返回</a></li>
    </ul>
</div>
<div class="tdare">
    <table width="100%" cellspacing="0" class="dataTable">
        <?php if ($this->_var['pros']): ?>
        <tr class="tatr1">
            <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
            <td align="left" class="table-center">图片</td>
            <td align="left"><span ectype="sort_order" fieldname="sort_order">排序</span></td>
            <td class="handler">操作</td>
        </tr>
        <?php endif; ?>
        <?php $_from = $this->_var['pros']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'ad');if (count($_from)):
    foreach ($_from AS $this->_var['ad']):
?>
        <tr class="tatr2">
            <td class="firstCell"><input value="<?php echo $this->_var['ad']['image_id']; ?>" class='checkitem' type="checkbox" /></td>
            <td align="left" class="table-center"><?php if ($this->_var['ad']['image_url']): ?><img src="<?php echo $this->_var['ad']['image_url']; ?>" width="200" height="200"/><?php endif; ?></td>
            <td align="left"><span class="editable" ectype="inline_edit" fieldname="sort_order" fieldid="<?php echo $this->_var['ad']['image_id']; ?>" required="1"><?php echo $this->_var['ad']['sort_order']; ?><span></td>
            <td class="handler">
            <a name="drop" href="javascript:drop_confirm('确定删除吗？', 'index.php?app=pimage&amp;act=drop&amp;id=<?php echo $this->_var['ad']['image_id']; ?>');">删除</a>
            </td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="7">未上传图片</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </table>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
