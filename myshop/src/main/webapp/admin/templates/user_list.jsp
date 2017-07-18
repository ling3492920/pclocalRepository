<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 会员列表 </title>
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
var no_username = "没有输入用户名。";
var invalid_email = "没有输入邮件地址或者输入了一个无效的邮件地址。";
var no_password = "没有输入密码。";
var less_password = "输入的密码不能少于六位。";
var passwd_balnk = "密码中不能包含空格";
var no_confirm_password = "没有输入确认密码。";
var password_not_same = "输入的密码和确认密码不一致。";
var invalid_pay_points = "消费积分数不是一个整数。";
var invalid_rank_points = "等级积分数不是一个整数。";
var password_len_err = "新密码和确认密码的长度不能小于6";
//-->
</script>
</head>
<body style="cursor: auto;">

<h1>
<span class="action-span"><a href="../powerMng/add_users.jsp">添加会员</a></span>
<span class="action-span1"><a href="../index.jsp">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 会员列表 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="../js/utils.js"></script><script type="text/javascript" src="js/listtable.js"></script>
<div class="form-div">
  <form action="javascript:searchUser()" name="searchForm">
    <img src="../images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH">
    &nbsp;会员等级 <select name="user_rank"><option value="0">所有等级</option><option value="1">注册用户</option><option value="3">代销用户</option><option value="2">vip</option></select>
    &nbsp;会员积分大于&nbsp;<input type="text" name="pay_points_gt" size="8">&nbsp;会员积分小于&nbsp;<input type="text" name="pay_points_lt" size="10">
    &nbsp;会员名称 &nbsp;<input type="text" name="keyword"> <input type="submit" value=" 搜索 ">
  </form>
</div>

<form method="POST" action="" name="listForm">

<!-- start users list -->
<div class="list-div" id="listDiv">
<!--用户列表部分-->
<table cellpadding="3" cellspacing="1">
  <tbody><tr>
    <th>
      <input onclick="listTable.selectAll(this, &quot;checkboxes&quot;)" type="checkbox">
      <a href="javascript:listTable.sort('user_id');">编号</a><img src="../images/sort_desc.gif">    </th>
    <th><a href="javascript:listTable.sort('user_name');">会员名称</a></th>
    <th><a href="javascript:listTable.sort('email');">邮件地址</a></th>
    <th><a href="javascript:listTable.sort('is_validated');">是否已验证</a></th>
    <th>可用资金</th>
    <th>冻结资金</th>
    <th>等级积分</th>
    <th>消费积分</th>
    <th><a href="javascript:listTable.sort('reg_time');">注册日期</a></th>
    <th>操作</th>
  </tr><tr>
    </tr>
    <tr>
    <td style="background-color: rgb(255, 255, 255);"><input type="checkbox" name="checkboxes[]" value="8">8</td>
    <td class="first-cell" style="background-color: rgb(255, 255, 255);">小花</td>
    <td style="background-color: rgb(255, 255, 255);"><span onclick="listTable.edit(this, 'edit_email', 8)">xiaohua@tedu.cn</span></td>
    <td align="center" style="background-color: rgb(255, 255, 255);"> <img src="../images/no.gif"> </td>
    <td style="background-color: rgb(255, 255, 255);">0.00</td>
    <td style="background-color: rgb(255, 255, 255);">0.00</td>
    <td style="background-color: rgb(255, 255, 255);">0</td>
    <td style="background-color: rgb(255, 255, 255);">0</td>
    <td align="center" style="background-color: rgb(255, 255, 255);">2017-04-21</td>
    <td align="center" style="background-color: rgb(255, 255, 255);">
      <a href="users.php?act=edit&amp;id=8" title="编辑"><img src="../images/icon_edit.gif" border="0" height="16" width="16"></a>
      <a href="../memberMng/address_list.jsp" title="收货地址"><img src="../images/book_open.gif" border="0" height="16" width="16"></a>
      <a href="../orderMng/orderinfo.jsp" title="查看订单"><img src="../images/icon_view.gif" border="0" height="16" width="16"></a>
      <a href="account_log.php?act=list&amp;user_id=8" title="查看账目明细"><img src="../images/icon_account.gif" border="0" height="16" width="16"></a>
      <a href="javascript:confirm_redirect('您确定要删除该会员账号吗？', 'users.php?act=remove&amp;id=8')" title="移除"><img src="../images/icon_drop.gif" border="0" height="16" width="16"></a>
    </td>
  </tr>
    
    <tr>
      <td colspan="2">
      <input type="hidden" name="act" value="batch_remove">
      <input type="submit" id="btnSubmit" value="删除会员" disabled="true" class="button"></td>
      <td align="right" nowrap="true" colspan="8">
            <!-- $Id: page.htm 14216 2008-03-10 02:27:21Z testyang $ -->
            <div id="turn-page">
        总计  <span id="totalRecords">8</span>
        个记录分为 <span id="totalPages">1</span>
        页当前第 <span id="pageCurrent">1</span>
        页，每页 <input type="text" size="3" id="pageSize" value="15" onkeypress="return listTable.changePageSize(event)">
        <span id="page-link">
          <a href="javascript:listTable.gotoPageFirst()">第一页</a>
          <a href="javascript:listTable.gotoPagePrev()">上一页</a>
          <a href="javascript:listTable.gotoPageNext()">下一页</a>
          <a href="javascript:listTable.gotoPageLast()">最末页</a>
          <select id="gotoPage" onchange="listTable.gotoPage(this.value)">
            <option value="1">1</option>          </select>
        </span>
      </div>
      </td>
  </tr>
</tbody></table>

</div>
<!-- end users list -->
</form>
<script type="text/javascript" language="JavaScript">
<!--
listTable.recordCount = 8;
listTable.pageCount = 1;

listTable.filter.keywords = '';
listTable.filter.rank = '0';
listTable.filter.pay_points_gt = '0';
listTable.filter.pay_points_lt = '0';
listTable.filter.sort_by = 'user_id';
listTable.filter.sort_order = 'DESC';
listTable.filter.record_count = '8';
listTable.filter.page_size = '15';
listTable.filter.page = '1';
listTable.filter.page_count = '1';
listTable.filter.start = '0';


onload = function()
{
    document.forms['searchForm'].elements['keyword'].focus();
    // 开始检查订单
    startCheckOrder();
}

/**
 * 搜索用户
 */
function searchUser()
{
    listTable.filter['keywords'] = Utils.trim(document.forms['searchForm'].elements['keyword'].value);
    listTable.filter['rank'] = document.forms['searchForm'].elements['user_rank'].value;
    listTable.filter['pay_points_gt'] = Utils.trim(document.forms['searchForm'].elements['pay_points_gt'].value);
    listTable.filter['pay_points_lt'] = Utils.trim(document.forms['searchForm'].elements['pay_points_lt'].value);
    listTable.filter['page'] = 1;
    listTable.loadList();
}
//-->
</script>

<div id="footer">
共执行 4 个查询，用时 0.038594 秒，Gzip 已禁用，内存占用 1.934 MB<br>
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