<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>轮播图</p>
    <ul class="subnav">
        <li><span>管理</span></li>
        <li><a class="btn1" href="index.php?app=ad&amp;act=add">新增</a></li>
    </ul>
</div>
<div class="tdare">
    <table width="100%" cellspacing="0" class="dataTable">
        <?php if ($this->_var['ads']): ?>
        <tr class="tatr1">
            <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
            <td align="left"><span fieldname="ad_name">名称</span></td>
            <td align="left"><span fieldname="link">图片链接</span></td>
            <td align="left" class="table-center">图片</td>
            <td align="left"><span ectype="sort_order" fieldname="sort_order">排序</span></td>
            <td class="handler">操作</td>
        </tr>
        <?php endif; ?>
        <?php $_from = $this->_var['ads']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'ad');if (count($_from)):
    foreach ($_from AS $this->_var['ad']):
?>
        <tr class="tatr2">
            <td class="firstCell"><input value="<?php echo $this->_var['ad']['ad_id']; ?>" class='checkitem' type="checkbox" /></td>
            <td align="left"><span class="editable" ectype="inline_edit" fieldname="ad_name" fieldid="<?php echo $this->_var['ad']['ad_id']; ?>" required="1"><?php echo htmlspecialchars($this->_var['ad']['ad_name']); ?></span></td>
            <td align="left"><span class="editable" ectype="inline_edit" fieldname="link" fieldid="<?php echo $this->_var['ad']['ad_id']; ?>" required="1"><?php echo $this->_var['ad']['link']; ?><span></td>
            <td align="left" class="table-center"><?php if ($this->_var['ad']['ad_img']): ?><img src="<?php echo $this->_var['ad']['ad_img']; ?>" height="30"/><?php endif; ?></td>
            <td align="left"><span class="editable" ectype="inline_edit" fieldname="sort_order" fieldid="<?php echo $this->_var['ad']['ad_id']; ?>" required="1"><?php echo $this->_var['ad']['sort_order']; ?><span></td>
            <td class="handler">
            <a href="index.php?app=ad&amp;act=edit&amp;id=<?php echo $this->_var['ad']['ad_id']; ?>">编辑</a>  |  <a name="drop" href="javascript:drop_confirm('确定删除吗？', 'index.php?app=ad&amp;act=drop&amp;id=<?php echo $this->_var['ad']['ad_id']; ?>');">删除</a>
            </td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="7">无图片记录</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </table>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
