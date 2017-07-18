<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ECSHOP 管理中心 - 分派权限  </title>
<link href="${baseurl}admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl}admin/styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${baseurl}admin/js/transport.js"></script>
<script type="text/javascript" src="${baseurl}admin/js/common.js"></script>
<script type="text/javascript">
	if('${success}'!=''){
		alert('${success}');
	}
</script>
</head>
<body>

<h1>
<span class="action-span"><a href="${baseurl}admin/powerMng/admin_lst.jsp">管理员列表</a></span>
<span class="action-span1"><a href="${baseurl}admin/index.jsp">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 分派权限 [ ${adminUser.user_name } ]  </span>
<div style="clear:both"></div>
</h1>
<form method="POST" action="${baseurl }auser/savePower.do" name="theFrom">
<input hidden="hidden" name="user_id" value="${adminUser.user_id }" />
<div class="list-div">
<table cellspacing="1" id="list-table">
 <tbody><tr>
  <td width="18%" valign="top" class="first-cell">
    <input name="chkGroup" type="checkbox" value="checkbox" onclick="check('goods_add_edit,goods_del_cellback,goodsType_add_edit,goodsType_move_del',this);" class="checkbox">商品管理  </td>
  <td>
        <div style="width:200px;float:left;">
    <label for="goods_manage">
    <c:if test="${pers.goods_add_edit!=null }">
    <input type="checkbox" name="action_code" value="goods_add_edit" id="goods_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.goods_add_edit==null }">
    <input type="checkbox" name="action_code" value="goods_add_edit" id="goods_manage" class="checkbox" >
    </c:if>
    商品添加/编辑</label>
    </div>
    
        <div style="width:200px;float:left;">
    <label for="remove_back">
    <c:if test="${pers.goods_del_cellback!=null }">
    <input type="checkbox" name="action_code" value="goods_del_cellback" id="remove_back" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.goods_del_cellback==null }">
    <input type="checkbox" name="action_code" value="goods_del_cellback" id="remove_back" class="checkbox" >
    </c:if>
    商品删除/恢复</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="cat_manage">
    <c:if test="${pers.goodsType_add_edit!=null }">
    <input type="checkbox" name="action_code" value="goodsType_add_edit" id="cat_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.goodsType_add_edit==null }">
    <input type="checkbox" name="action_code" value="goodsType_add_edit" id="cat_manage" class="checkbox" >
    </c:if>
    分类添加/编辑</label>
    </div>
    <div style="width:200px;float:left;">
    <label for="cat_drop">
    <c:if test="${pers.goodsType_move_del!=null }">
    <input type="checkbox" name="action_code" value="goodsType_move_del" id="cat_drop" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.goodsType_move_del==null }">
    <input type="checkbox" name="action_code" value="goodsType_move_del" id="cat_drop" class="checkbox" >
    </c:if>
    分类转移/删除</label>
    </div>
    </td></tr>
 	
 <tr>
  <td width="18%" valign="top" class="first-cell">
    <input name="chkGroup" type="checkbox" value="checkbox" onclick="check('users_msgManage,users_manage,users_del,users_lvp,users_infoManage',this);" class="checkbox">会员管理  </td>
  <td>
        <div style="width:200px;float:left;">
    <label for="feedback_priv">
    <c:if test="${pers.users_msgManage!=null }">
    <input type="checkbox" name="action_code" value="users_msgManage" id="feedback_priv" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.users_msgManage==null }">
    <input type="checkbox" name="action_code" value="users_msgManage" id="feedback_priv" class="checkbox" >
    </c:if>
    会员留言管理</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="users_manage">
    <c:if test="${pers.users_manage!=null }">
    <input type="checkbox" name="action_code" value="users_manage" id="users_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.users_manage==null }">
    <input type="checkbox" name="action_code" value="users_manage" id="users_manage" class="checkbox" >
    </c:if>
    会员管理</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="users_drop">
    <c:if test="${pers.users_del!=null }">
    <input type="checkbox" name="action_code" value="users_del" id="users_drop" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.users_del==null }">
    <input type="checkbox" name="action_code" value="users_del" id="users_drop" class="checkbox">
    </c:if>
    会员删除</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="user_rank">
    <c:if test="${pers.users_lvp!=null }">
    <input type="checkbox" name="action_code" value="users_lvp" id="user_rank" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.users_lvp==null }">
    <input type="checkbox" name="action_code" value="users_lvp" id="user_rank" class="checkbox" >
    </c:if>
    会员等级管理</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="account_manage">
    <c:if test="${pers.users_infoManage!=null }">
    <input type="checkbox" name="action_code" value="users_infoManage" id="account_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.users_infoManage==null }">
    <input type="checkbox" name="action_code" value="users_infoManage" id="account_manage" class="checkbox" >
    </c:if>
    会员账户管理</label>
    </div>
    </td></tr>
 <tr>
  <td width="18%" valign="top" class="first-cell">
    <input name="chkGroup" type="checkbox" value="checkbox" onclick="check('per_addAdmin_edit,per_delAdmin,per_give,per_adminlog,per_delog,per_roleManage',this);" class="checkbox">权限管理  </td>
  <td>
        
        <div style="width:200px;float:left;">
    <label for="admin_manage">
    <c:if test="${pers.per_addAdmin_edit!=null }">
    <input type="checkbox" name="action_code" value="per_addAdmin_edit" id="admin_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.per_addAdmin_edit==null }">
    <input type="checkbox" name="action_code" value="per_addAdmin_edit" id="admin_manage" class="checkbox">
    </c:if>
    管理员添加/编辑</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="admin_drop">
    <c:if test="${pers.per_delAdmin!=null }">
    <input type="checkbox" name="action_code" value="per_delAdmin" id="admin_drop" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.per_delAdmin==null }">
    <input type="checkbox" name="action_code" value="per_delAdmin" id="admin_drop" class="checkbox" >
    </c:if>
    删除管理员</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="allot_priv">
    <c:if test="${pers.per_give!=null }">
    <input type="checkbox" name="action_code" value="per_give" id="allot_priv" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.per_give==null }">
    <input type="checkbox" name="action_code" value="per_give" id="allot_priv" class="checkbox" >
    </c:if>
    分派权限</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="logs_manage">
    <c:if test="${pers.per_adminlog!=null }">
    <input type="checkbox" name="action_code" value="per_adminlog" id="logs_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.per_adminlog==null }">
    <input type="checkbox" name="action_code" value="per_adminlog" id="logs_manage" class="checkbox" >
    </c:if>
    管理日志列表</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="logs_drop">
    <c:if test="${pers.per_delog!=null }">
    <input type="checkbox" name="action_code" value="per_delog" id="logs_drop" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.per_delog==null }">
    <input type="checkbox" name="action_code" value="per_delog" id="logs_drop" class="checkbox" >
    </c:if>
    删除管理日志</label>
    </div>
        
        
        <div style="width:200px;float:left;">
    <label for="role_manage">
    <c:if test="${pers.per_roleManage!=null }">
    <input type="checkbox" name="action_code" value="per_roleManage" id="role_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.per_roleManage==null }">
    <input type="checkbox" name="action_code" value="per_roleManage" id="role_manage" class="checkbox">
    </c:if>
    角色管理</label>
    </div>
    </td></tr>
 <tr>
  <td width="18%" valign="top" class="first-cell">
    <input name="chkGroup" type="checkbox" value="checkbox" onclick="check('sys_shopConfig,sys_shipManage,sys_payManage,sys_autoBar',this);" class="checkbox">系统设置  </td>
  <td>
        <div style="width:200px;float:left;">
    <label for="shop_config">
    <c:if test="${pers.sys_shopConfig!=null }">
    <input type="checkbox" name="action_code" value="sys_shopConfig" id="shop_config" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.sys_shopConfig==null }">
    <input type="checkbox" name="action_code" value="sys_shopConfig" id="shop_config" class="checkbox">
    </c:if>
    商店设置</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="ship_manage">
    <c:if test="${pers.sys_shipManage!=null }">
    <input type="checkbox" name="action_code" value="sys_shipManage" id="ship_manage" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.sys_shipManage==null }">
    <input type="checkbox" name="action_code" value="sys_shipManage" id="ship_manage" class="checkbox" >
    </c:if>
    配送方式管理</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="payment">
    <c:if test="${pers.sys_payManage!=null }">
    <input type="checkbox" name="action_code" value="sys_payManage" id="payment" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.sys_payManage==null }">
    <input type="checkbox" name="action_code" value="sys_payManage" id="payment" class="checkbox" >
    </c:if>
    支付方式管理</label>
    </div>
        
        <div style="width:200px;float:left;">
    <label for="navigator">
    <c:if test="${pers.sys_autoBar!=null }">
    <input type="checkbox" name="action_code" value="sys_autoBar" id="navigator" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.sys_autoBar==null }">
    <input type="checkbox" name="action_code" value="sys_autoBar" id="navigator" class="checkbox" >
    </c:if>
    自定义导航栏</label>
    </div>
    </td></tr>
 <tr>
  <td width="18%" valign="top" class="first-cell">
    <input name="chkGroup" type="checkbox" value="checkbox" onclick="check('order_edit_status,order_payStatu,order_edit_sendstatu,order_editadd',this);" class="checkbox">订单管理  </td>
  <td>
        <div style="width:200px;float:left;">
    <label for="order_os_edit">
    <c:if test="${pers.order_edit_status!=null }">
    <input type="checkbox" name="action_code" value="order_edit_status" id="order_os_edit" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.order_edit_status==null }">
    <input type="checkbox" name="action_code" value="order_edit_status" id="order_os_edit" class="checkbox" >
    </c:if>
    编辑订单状态</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="order_ps_edit">
    <c:if test="${pers.order_payStatu!=null }">
    <input type="checkbox" name="action_code" value="order_payStatu" id="order_ps_edit" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.order_payStatu==null }">
    <input type="checkbox" name="action_code" value="order_payStatu" id="order_ps_edit" class="checkbox" >
    </c:if>
    编辑付款状态</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="order_ss_edit">
    <c:if test="${pers.order_edit_sendstatu!=null }">
    <input type="checkbox" name="action_code" value="order_edit_sendstatu" id="order_ss_edit" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.order_edit_sendstatu==null }">
    <input type="checkbox" name="action_code" value="order_edit_sendstatu" id="order_ss_edit" class="checkbox" >
    </c:if>
    编辑发货状态</label>
    </div>
        <div style="width:200px;float:left;">
    <label for="order_edit">
    <c:if test="${pers.order_editadd!=null }">
    <input type="checkbox" name="action_code" value="order_editadd" id="order_edit" class="checkbox" checked="true">
    </c:if>
    <c:if test="${pers.order_editadd==null }">
    <input type="checkbox" name="action_code" value="order_editadd" id="order_edit" class="checkbox">
    </c:if>
    添加编辑订单</label>
    </div>
    </td></tr>
 
  <tr>
    <td align="center" colspan="2">
      <input type="checkbox" name="checkall" value="checkbox" onclick="checkAll(this.form, this);" class="checkbox">全选      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="submit" name="Submit" value=" 保存 " class="button">
      <input type="hidden" name="id" value="5">
      <input type="hidden" name="act" value="update_allot">
    </td>
  </tr>
</tbody></table>
</div>
</form>


<script language="javascript">
function checkAll(frm, checkbox)
{
  for (i = 0; i < frm.elements.length; i++)
  {
    if (frm.elements[i].name == 'action_code' || frm.elements[i].name == 'chkGroup')
    {
      frm.elements[i].checked = checkbox.checked;
    }
  }
}

function check(list, obj)
{
  var frm = obj.form;

    for (i = 0; i < frm.elements.length; i++)
    {
      if (frm.elements[i].name == "action_code")
      {
          var regx = new RegExp(frm.elements[i].value + "(?!_)", "i");

          if (list.search(regx) > -1) frm.elements[i].checked = obj.checked;
      }
    }
}
</script>

<div id="footer">
共执行 4 个查询，用时 0.013066 秒，Gzip 已禁用，内存占用 2.001 MB<br>
版权所有 © 2005-2009 上海商派网络科技有限公司，并保留所有权利。</div>
<script type="text/javascript" src="${baseurl}admin/js/utils.js"></script>
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
<embed src="images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="${baseurl }admin/images/online.swf">
  <param name="quality" value="high">
  <embed src="images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
  
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
    var global = $import("${baseurl}admin/js/global.js","js");
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