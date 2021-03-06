<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 商品分类 </title>
<link href="../styles/general.css" rel="stylesheet" type="text/css">
<link href="../styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/transport.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script language="JavaScript">
<!--
// 这里把JS用到的所有语言都赋值到这里
var process_request = "正在处理您的请求...";
var todolist_caption = "记事本";
var todolist_autosave = "自动保存";
var todolist_save = "保存";
var todolist_clear = "清除";
var todolist_confirm_save = "是否将更改保存到记事本？";
var todolist_confirm_clear = "是否清空内容？";
var catname_empty = "分类名称不能为空!";
var unit_empyt = "数量单位不能为空!";
var is_leafcat = "您选定的分类是一个末级分类。\r\n新分类的上级分类不能是一个末级分类";
var not_leafcat = "您选定的分类不是一个末级分类。\r\n商品的分类转移只能在末级分类之间才可以操作。";
var filter_attr_not_repeated = "筛选属性不可重复";
var filter_attr_not_selected = "请选择筛选属性";
//-->
</script>
</head>
<body style="cursor: auto;">

<h1>
<span class="action-span"><a href="additemType.jsp">添加分类</a></span>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 商品分类 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="../js/utils.js"></script>
<script type="text/javascript" src="../js/listtable.js"></script>
<form method="post" action="" name="listForm">
<!-- start ad position list -->
<div class="list-div" id="listDiv">

<table width="100%" cellspacing="1" cellpadding="2" id="list-table">
  <tbody><tr>
    <th>分类名称</th>
    <th>商品数量</th>
    <th>数量单位</th>
    <th>导航栏</th>
    <th>是否显示</th>
    <th>价格分级</th>
    <th>排序</th>
    <th>操作</th>
  </tr>
    <tr align="center" class="0">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:0em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=16">书籍</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">0</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 16)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 16)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 16)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 16)">0</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 16)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=16">转移商品</a> |
      <a href="editItemType.jsp">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(16, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=17">一千零一夜</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">0</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 17)"><!--  -->本<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 17)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 17)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 17)" title="点击修改内容">5</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 17)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=17">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=17">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(17, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="0">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:0em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=1">手机类型</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">0</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 1)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 1)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 1)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 1)">5</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 1)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=1">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=1">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(1, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=5">双模手机</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">3</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 5)" title="点击修改内容"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 5)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 5)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 5)">5</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 5)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=5">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=5">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(5, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=4">3G手机</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">2</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 4)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 4)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 4)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 4)">0</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 4)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=4">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=4">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(4, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=3">GSM手机</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">11</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 3)"><!--  -->台<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 3)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 3)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 3)">4</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 3)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=3">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=3">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(3, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=2">CDMA手机</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">0</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 2)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 2)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 2)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 2)" title="点击修改内容">0</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 2)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=2">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=2">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(2, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="0">
    <td align="left" class="first-cell" style="background-color: rgb(255, 255, 255);">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:0em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=12">充值卡</a></span>
    </td>
    <td width="10%" style="background-color: rgb(255, 255, 255);">0</td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_measure_unit', 12)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 12)"></td>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 12)"></td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_grade', 12)">0</span></td>
    <td width="10%" align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_sort_order', 12)">50</span></td>
    <td width="24%" align="center" style="background-color: rgb(255, 255, 255);">
      <a href="category.php?act=move&amp;cat_id=12">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=12">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(12, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=15">联通手机充值卡</a></span>
    </td>
    <td width="10%">2</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 15)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 15)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 15)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 15)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 15)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=15">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=15">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(15, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=14">移动手机充值卡</a></span>
    </td>
    <td width="10%">2</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 14)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 14)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 14)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 14)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 14)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=14">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=14">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(14, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=13">小灵通/固话充值卡</a></span>
    </td>
    <td width="10%">2</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 13)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 13)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 13)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 13)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 13)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=13">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=13">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(13, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="0">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:0em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=18">黑科技</a></span>
    </td>
    <td width="10%">1</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 18)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 18)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 18)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 18)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 18)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=18">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=18">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(18, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="0">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:0em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=6">手机配件</a></span>
    </td>
    <td width="10%">0</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 6)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 6)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 6)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 6)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 6)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=6">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=6">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(6, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=11">读卡器和内存卡</a></span>
    </td>
    <td width="10%">2</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 11)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 11)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 11)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 11)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 11)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=11">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=11">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(11, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=9">电池</a></span>
    </td>
    <td width="10%">0</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 9)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 9)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 9)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 9)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 9)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=9">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=9">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(9, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=8">耳机</a></span>
    </td>
    <td width="10%">3</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 8)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 8)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 8)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 8)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 8)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=8">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=8">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(8, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
    <tr align="center" class="1">
    <td align="left" class="first-cell">
            <img src="../images/menu_minus.gif" width="9" height="9" border="0" style="margin-left:1em" onclick="rowClicked(this)">
            <span><a href="goods.php?act=list&amp;cat_id=7">充电器</a></span>
    </td>
    <td width="10%">0</td>
    <td width="10%"><span onclick="listTable.edit(this, 'edit_measure_unit', 7)"><!--  -->&nbsp;&nbsp;&nbsp;&nbsp;<!--  --></span></td>
    <td width="10%"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_show_in_nav', 7)"></td>
    <td width="10%"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_is_show', 7)"></td>
    <td><span onclick="listTable.edit(this, 'edit_grade', 7)">0</span></td>
    <td width="10%" align="right"><span onclick="listTable.edit(this, 'edit_sort_order', 7)">50</span></td>
    <td width="24%" align="center">
      <a href="category.php?act=move&amp;cat_id=7">转移商品</a> |
      <a href="category.php?act=edit&amp;cat_id=7">编辑</a> |
      <a href="javascript:;" onclick="listTable.remove(7, '您确认要删除这条记录吗?')" title="移除">移除</a>
    </td>
  </tr>
  </tbody></table>

</div>
</form>


<script language="JavaScript">
<!--

onload = function()
{
  // 开始检查订单
  startCheckOrder();
}

var imgPlus = new Image();
imgPlus.src = "../images/menu_plus.gif";

/**
 * 折叠分类列表
 */
function rowClicked(obj)
{
  obj = obj.parentNode.parentNode;

  var tbl = document.getElementById("list-table");
  var lvl = parseInt(obj.className);
  var fnd = false;

  for (i = 0; i < tbl.rows.length; i++)
  {
      var row = tbl.rows[i];

      if (tbl.rows[i] == obj)
      {
          fnd = true;
      }
      else
      {
          if (fnd == true)
          {
              var cur = parseInt(row.className);
              if (cur > lvl)
              {
                  row.style.display = (row.style.display != 'none') ? 'none' : (Browser.isIE) ? 'block' : 'table-row';
              }
              else
              {
                  fnd = false;
                  break;
              }
          }
      }
  }

  for (i = 0; i < obj.cells[0].childNodes.length; i++)
  {
      var imgObj = obj.cells[0].childNodes[i];
      if (imgObj.tagName == "IMG" && imgObj.src != '../images/menu_arrow.gif')
      {
          imgObj.src = (imgObj.src == imgPlus.src) ? '../images/menu_minus.gif' : imgPlus.src;
      }
  }
}
//-->
</script>


<div id="footer">
共执行 1 个查询，用时 0.012963 秒，Gzip 已禁用，内存占用 1.960 MB<br>
版权所有 © 2005-2009 上海商派网络科技有限公司，并保留所有权利。</div>
<!-- 新订单提示信息 -->
<div id="popMsg">
  <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#cfdef4" border="0">
  <tbody><tr>
    <td style="color: #0f2c8c" width="30" height="24"></td>
    <td style="font-weight: normal; color: #1f336b; padding-top: 4px;padding-left: 4px" valign="center" width="100%"> 新订单通知</td>
    <td style="padding-top: 2px;padding-right:2px" valign="center" align="right" width="19"><span title="关闭" style="cursor: hand;cursor:pointer;color:red;font-size:12px;font-weight:bold;margin-right:4px;" onclick="Message.close()">×</span><!-- <img title=关闭 style="cursor: hand" onclick=closediv() hspace=3 src="msgclose.jpg"> --></td>
  </tr>
  <tr>
    <td style="padding-right: 1px; padding-bottom: 1px" colspan="3" height="70">
    <div id="popMsgContent">
      <p>您有 <strong style="color:#ff0000" id="spanNewOrder">1</strong> 个新订单以及       <strong style="color:#ff0000" id="spanNewPaid">0</strong> 个新付款的订单</p>
      <p align="center" style="word-break:break-all"><a href="order.php?act=list"><span style="color:#ff0000">点击查看新订单</span></a></p>
    </div>
    </td>
  </tr>
  </tbody></table>
</div>

<!--
<embed src="../images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="../images/online.swf">
  <param name="quality" value="high">
  <embed src="../images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
  
</object>

<script language="JavaScript">
document.onmousemove=function(e)
{
  var obj = Utils.srcElement(e);
  if (typeof(obj.onclick) == 'function' && obj.onclick.toString().indexOf('listTable.edit') != -1)
  {
    obj.title = '点击修改内容';
    obj.style.cssText = 'background: #278296;';
    obj.onmouseout = function(e)
    {
      this.style.cssText = '';
    }
  }
  else if (typeof(obj.href) != 'undefined' && obj.href.indexOf('listTable.sort') != -1)
  {
    obj.title = '点击对列表排序';
  }
}
<!--


var MyTodolist;
function showTodoList(adminid)
{
  if(!MyTodolist)
  {
    var global = $import("../js/global.js","js");
    global.onload = global.onreadystatechange= function()
    {
      if(this.readyState && this.readyState=="loading")return;
      var md5 = $import("js/md5.js","js");
      md5.onload = md5.onreadystatechange= function()
      {
        if(this.readyState && this.readyState=="loading")return;
        var todolist = $import("js/todolist.js","js");
        todolist.onload = todolist.onreadystatechange = function()
        {
          if(this.readyState && this.readyState=="loading")return;
          MyTodolist = new Todolist();
          MyTodolist.show();
        }
      }
    }
  }
  else
  {
    if(MyTodolist.visibility)
    {
      MyTodolist.hide();
    }
    else
    {
      MyTodolist.show();
    }
  }
}

if (Browser.isIE)
{
  onscroll = function()
  {
    //document.getElementById('calculator').style.top = document.body.scrollTop;
    document.getElementById('popMsg').style.top = (document.body.scrollTop + document.body.clientHeight - document.getElementById('popMsg').offsetHeight) + "px";
  }
}

if (document.getElementById("listDiv"))
{
  document.getElementById("listDiv").onmouseover = function(e)
  {
    obj = Utils.srcElement(e);

    if (obj)
    {
      if (obj.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode;
      else if (obj.parentNode.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode.parentNode;
      else return;

      for (i = 0; i < row.cells.length; i++)
      {
        if (row.cells[i].tagName != "TH") row.cells[i].style.backgroundColor = '#F4FAFB';
      }
    }

  }

  document.getElementById("listDiv").onmouseout = function(e)
  {
    obj = Utils.srcElement(e);

    if (obj)
    {
      if (obj.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode;
      else if (obj.parentNode.parentNode.tagName.toLowerCase() == "tr") row = obj.parentNode.parentNode;
      else return;

      for (i = 0; i < row.cells.length; i++)
      {
          if (row.cells[i].tagName != "TH") row.cells[i].style.backgroundColor = '#FFF';
      }
    }
  }

  document.getElementById("listDiv").onclick = function(e)
  {
    var obj = Utils.srcElement(e);

    if (obj.tagName == "INPUT" && obj.type == "checkbox")
    {
      if (!document.forms['listForm'])
      {
        return;
      }
      var nodes = document.forms['listForm'].elements;
      var checked = false;

      for (i = 0; i < nodes.length; i++)
      {
        if (nodes[i].checked)
        {
           checked = true;
           break;
         }
      }

      if(document.getElementById("btnSubmit"))
      {
        document.getElementById("btnSubmit").disabled = !checked;
      }
      for (i = 1; i <= 10; i++)
      {
        if (document.getElementById("btnSubmit" + i))
        {
          document.getElementById("btnSubmit" + i).disabled = !checked;
        }
      }
    }
  }

}

//-->
</script>

</body></html>