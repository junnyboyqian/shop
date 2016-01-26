<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>产品</p>
    <ul class="subnav">
        <li><span>管理</span></li>
        <li><a class="btn1" href="index.php?app=product&amp;act=add">新增</a></li>
    </ul>
</div>
<div class="tdare">
    <table width="100%" cellspacing="0" class="dataTable">
        <?php if ($this->_var['pros']): ?>
        <tr class="tatr1">
            <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
            <td align="left"><span>产品名称</span></td>
            <td align="left"><span>分类</span></td>
            <td align="left"><span>货号</span></td>
            <td align="left"><span>材质</span></td>
            <td >操作</td>
        </tr>
        <?php endif; ?>
        <?php $_from = $this->_var['pros']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'ad');if (count($_from)):
    foreach ($_from AS $this->_var['ad']):
?>
        <tr class="tatr2">
            <td class="firstCell"><input value="<?php echo $this->_var['ad']['pro_id']; ?>" class='checkitem' type="checkbox" /></td>
            <td align="left"><span><?php echo htmlspecialchars($this->_var['ad']['pro_name']); ?></span></td>
            <td align="left"><span><?php echo $this->_var['ad']['cate']; ?><span></td>
            <td align="left"><span><?php echo $this->_var['ad']['pdt_no']; ?><span></td>
            <td align="left"><span><?php echo $this->_var['ad']['fabric']; ?></span></td>
            <td style="width:200px;">
            <a href="index.php?app=pimage&amp;act=edit&amp;id=<?php echo $this->_var['ad']['pro_id']; ?>">产品图片</a>  | <a href="index.php?app=product&amp;act=edit&amp;id=<?php echo $this->_var['ad']['pro_id']; ?>">编辑</a>  |  <a name="drop" href="javascript:drop_confirm('确定删除吗？', 'index.php?app=product&amp;act=drop&amp;id=<?php echo $this->_var['ad']['pro_id']; ?>');">删除</a>
            </td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="4">无产品数据</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </table>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
