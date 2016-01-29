<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>形象目录</p>
    <ul class="subnav">
        <li><span>管理</span></li>
        <li><a class="btn1" href="index.php?app=dress&amp;act=add">新增</a></li>
    </ul>
</div>
<div class="mrightTop">
    <div class="fontl">
        <form method="get">
             <div class="left">
                <input type="hidden" name="app" value="dress" />
                <input type="hidden" name="act" value="index" />
                形象名称:<input class="queryInput" type="text" name="dress_name" value="<?php echo htmlspecialchars($this->_var['query']['dress_name']); ?>" />
                <input type="submit" class="formbtn" value="查询" />
            </div>
            <?php if ($this->_var['filtered']): ?>
            <a class="left formbtn1" href="index.php?app=dress">撤销检索</a>
            <?php endif; ?>
        </form>
    </div>
    <div class="fontr">
        <?php if ($this->_var['pros']): ?><?php echo $this->fetch('page.top.html'); ?><?php endif; ?>
    </div>
</div>
<div class="tdare">
    <table width="100%" cellspacing="0" class="dataTable">
        <?php if ($this->_var['pros']): ?>
        <tr class="tatr1">
            <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
            <td align="left" class="table-center"><span ectype="dress_name" fieldname="dress_name">名称</span></td>
            <td align="left" class="table-center">分类</td>
            <td align="left" class="table-center"><span ectype="sort_order" fieldname="sort_order">排序</span></td>
            <td align="left" class="table-center">图片</td>
            <td align="left" class="table-center">添加时间</td>
            <td class="handler">操作</td>
        </tr>
        <?php endif; ?>
        <?php $_from = $this->_var['pros']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'ad');if (count($_from)):
    foreach ($_from AS $this->_var['ad']):
?>
        <tr class="tatr2">
            <td class="firstCell"><input value="<?php echo $this->_var['ad']['image_id']; ?>" class='checkitem' type="checkbox" /></td>
            <td align="left" class="table-center"><span class="editable" ectype="inline_edit" fieldname="dress_name" fieldid="<?php echo $this->_var['ad']['image_id']; ?>" required="1"><?php echo $this->_var['ad']['dress_name']; ?><span></td>
            <td align="left" class="table-center"><?php echo $this->_var['ad']['cate']; ?></td>
            <td align="left" class="table-center"><span class="editable" ectype="inline_edit" fieldname="sort_order" fieldid="<?php echo $this->_var['ad']['image_id']; ?>" required="1"><?php echo $this->_var['ad']['sort_order']; ?><span></td>
            <td align="left" class="table-center"><?php if ($this->_var['ad']['image_url']): ?><img src="<?php echo $this->_var['ad']['image_url']; ?>" width="50" height="70"/><?php endif; ?></td>
            <td style="width:200px;" align="left" class="table-center"><?php echo local_date("Y-m-d H:i:s",$this->_var['ad']['add_time']); ?></td>
            <td class="handler">
            <a href="index.php?app=dress&amp;act=edit&amp;id=<?php echo $this->_var['ad']['image_id']; ?>">编辑</a>  |<a name="drop" href="javascript:drop_confirm('确定删除吗？', 'index.php?app=dress&amp;act=drop&amp;id=<?php echo $this->_var['ad']['image_id']; ?>');">删除</a>
            </td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="7">无图片记录</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </table>
    <div id="dataFuncs">
        <div class="pageLinks">
            <?php if ($this->_var['pros']): ?><?php echo $this->fetch('page.bottom.html'); ?><?php endif; ?>
        </div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
