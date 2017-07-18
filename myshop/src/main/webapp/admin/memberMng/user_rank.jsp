<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ECSHOP 管理中心 - 会员等级 </title>

<link href="../styles/general.css" rel="stylesheet" type="text/css">
<link href="../styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/transport.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script language="JavaScript">

</script>
</head>
<body style="cursor: auto;">

<h1>
<span class="action-span"><a href="add_user_rank.jsp">添加会员等级</a></span>
<span class="action-span1"><a href="../index.jsp">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 会员等级 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="../js/utils.js"></script>
<script type="text/javascript" src="../js/listtable.js"></script>
<form method="post" action="" name="listForm">
<!-- start ads list -->
<div class="list-div" id="listDiv">

<table cellspacing="1" id="list-table">
  <tbody><tr>
    <th>会员等级名称</th>
    <th>积分下限</th>
    <th>积分上限</th>
    <th>初始折扣率(%)</th>
    <th>特殊会员组</th>
    <th>显示价格</th>
    <th>操作</th>
  </tr>
    <tr>
    <td class="first-cell" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this,'edit_name', 1)">注册用户</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_min_points', 1)">0</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_max_points', 1)">10000</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_discount', 1)">100</span></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_special', 1)"></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_showprice', 1)"></td>
    <td align="center" style="background-color: rgb(255, 255, 255);">
    <a href="javascript:;" onclick="listTable.remove(1, '您确认要删除这条记录吗?')" title="移除"><img src="../images/icon_drop.gif" border="0" height="16" width="16"></a></td>
  </tr>
    <tr>
    <td class="first-cell" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this,'edit_name', 2)">vip</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_min_points', 2)">10000</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_max_points', 2)" title="点击修改内容">10000000</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_discount', 2)">95</span></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_special', 2)"></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_showprice', 2)"></td>
    <td align="center" style="background-color: rgb(255, 255, 255);">
    <a href="javascript:;" onclick="listTable.remove(2, '您确认要删除这条记录吗?')" title="移除"><img src="../images/icon_drop.gif" border="0" height="16" width="16"></a></td>
  </tr>
    <tr>
    <td class="first-cell" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this,'edit_name', 3)">代销用户</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span>0</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span>0</span></td>
    <td align="right" style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_discount', 3)">90</span></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"><img src="../images/yes.gif" onclick="listTable.toggle(this, 'toggle_special', 3)"></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"><img src="../images/no.gif" onclick="listTable.toggle(this, 'toggle_showprice', 3)"></td>
    <td align="center" style="background-color: rgb(255, 255, 255);">
    <a href="javascript:;" onclick="listTable.remove(3, '您确认要删除这条记录吗?')" title="移除"><img src="../images/icon_drop.gif" border="0" height="16" width="16"></a></td>
  </tr>
    </tbody></table>

</div>
<!-- end user ranks list -->
</form>
<script type="Text/Javascript" language="JavaScript">
<!--

onload = function()
{
    // 开始检查订单
    startCheckOrder();
}

//-->
</script>
<div id="footer">
共执行 2 个查询，用时 0.009618 秒，Gzip 已禁用，内存占用 1.781 MB<br>
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