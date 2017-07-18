<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ include file="/admin/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 管理员列表 </title>
<link href="${baseurl }admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl }admin/styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${baseurl }admin/js/common.js"></script>
<script type="text/javascript" src="${baseurl }admin/js/jquery.min.js"></script>
<script type="text/javascript">
var path="${baseurl}";
	//1.加载管理员列表
	$(function(){
		$.ajax({
			url:path+"auser/load.do",
			type:"get",
			dataType:"json",
			success:function(res){
				if(res.state==0){
					var admins = res.data;
					var tr='';
					for(var i=0;i<admins.length;i++){
						var add_time=simpdateForMat(admins[i].add_time+'000','-','');
						var last_login=simpdateForMat(admins[i].last_login+'000','-','');
						tr+='<tr>'+
					    '<td class="first-cell" style="background-color: rgb(255, 255, 255);">'+admins[i].user_name+'</td>'+
					    '<td align="left" style="background-color: rgb(255, 255, 255);">'+admins[i].email+'</td>'+
					    '<td align="center" style="background-color: rgb(255, 255, 255);">'+add_time+'</td>'+
					    '<td align="center" style="background-color: rgb(255, 255, 255);">'+last_login+'</td>'+
					    '<td align="center" style="background-color: rgb(255, 255, 255);">'+
					      '<a href='+path+'auser/topower.do?id='+admins[i].user_id+' title="分派权限"><img src="${baseurl}admin/images/icon_priv.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;'+
					      '<a href='+path+'auser/tolog.do?id='+admins[i].user_id+' title="查看日志"><img src="${baseurl}admin/images/icon_view.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;'+
					      '<a href='+path+'auser/toedit.do?id='+admins[i].user_id+' title="编辑"><img src="${baseurl}admin/images/icon_edit.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;'+
					      '<a href="javascript:void(0);" onclick="del('+admins[i].user_id+',this)" title="移除"><img src="${baseurl}admin/images/icon_drop.gif" border="0" height="16" width="16"></a></td>'+
					  '</tr>';
					}
					$("#list-table").append(tr);	
				}
			}
		});
	});
	//长整形转日期格式
	function simpdateForMat(lnum,reg,reg2){
		var date = new Date(parseInt(lnum));  
		var theDate = date.toLocaleString();  
		//alert(theDate); //2008年12月30日 10:30:30
		//console.log()
		var theDdate1 = theDate.replace('/年/',reg);
		var theDdate2 = theDdate1 .replace('/月/',reg);
		var theDdate3 = theDdate2 .replace('/日/',reg2);
		//alert(theDdate3 )//2008-12-30 10:30:30
		return theDdate3;
	}
	
	//2.删除
	function del(id,obj){
		var con = confirm("确定删除id为："+id+"的管理员吗？");
		if(con){
			$.ajax({
				url:path+"auser/del.do",
				type:"get",
				data:{id:id},
				dataType:"json",
				success:function(res){
					if(res.state==0){
						//删除成功
						$(obj).parent().parent().remove();
					}
				}
			});
		}
	}
</script>
</head>
<body style="cursor: auto;">

<h1>
<span class="action-span"><a href="${baseurl }admin/powerMng/addAdmin.jsp">添加管理员</a></span>
<span class="action-span1"><a href="${baseurl}admin/index.jsp">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 管理员列表 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="${baseurl }admin/js/utils.js"></script>
<div class="list-div" id="listDiv">

<table cellspacing="1" cellpadding="3" >
  <tbody id="list-table"><tr>
    <th>用户名</th>
    <th>Email地址</th>
    <th>加入时间</th>
    <th>最后登录时间</th>
    <th>操作</th>
  </tr>
  <!-- 
    <tr>
    <td class="first-cell" style="background-color: rgb(255, 255, 255);">lisi</td>
    <td align="left" style="background-color: rgb(255, 255, 255);">lisi@ecshop.com</td>
    <td align="center" style="background-color: rgb(255, 255, 255);">2017-03-03 11:44:30</td>
    <td align="center" style="background-color: rgb(255, 255, 255);">2017-03-03 17:43:16</td>
    <td align="center" style="background-color: rgb(255, 255, 255);">
      <a href="topower.jsp" title="分派权限"><img src="${baseurl}admin/images/icon_priv.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;
      <a href="admin_log.jsp" title="查看日志"><img src="${baseurl}admin/images/icon_view.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;
      <a href="editAdmin.jsp" title="编辑"><img src="${baseurl}admin/images/icon_edit.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;
      <a href="javascript:;" onclick="listTable.remove(5, '您确认要删除这条记录吗?')" title="移除"><img src="${baseurl}admin/images/icon_drop.gif" border="0" height="16" width="16"></a></td>
  </tr>
 -->
  </tbody></table>

</div>
<script type="text/javascript" language="JavaScript">
  
  onload = function()
  {
    // 开始检查订单
    startCheckOrder();
  }
  
</script>
<div id="footer">
共执行 2 个查询，用时 0.010658 秒，Gzip 已禁用，内存占用 1.885 MB<br>
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
<embed src="${baseurl}admin/images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="${baseurl}admin/images/online.swf">
  <param name="quality" value="high">
  <embed src="${baseurl}admin/images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
  
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