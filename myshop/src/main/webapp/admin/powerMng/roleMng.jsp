<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 角色管理 </title>
<link href="${baseurl}admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl}admin/styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${baseurl }admin/js/jquery.min.js"></script>
<script type="text/javascript">
var msg='${mgs}';
if(msg=='success'){
	alert("删除成功！");
}else if(msg=="error"){
	alert("删除失败！");
}
</script>
</head>
<body>

<h1>
<span class="action-span"><a href="${baseurl }admin/powerMng/addRole.jsp">添加角色</a></span>
<span class="action-span1"><a href="${baseurl}admin/index.jsp">EC${baseurl}adminOP 管理中心</a> 
</span><span id="search_id" class="action-span1"> - 角色管理 </span>
<div style="clear:both"></div>
</h1>
<div class="list-div" id="listDiv">
<table cellspacing="1" cellpadding="3" >
  <thead><tr><th>角色名</th><th>角色描述</th><th>操作</th></tr></thead>
  <tbody id="list-table">
   	<c:forEach items="${ars }" var="ar">
	 <tr>
		 <td class="first-cell" style="background-color: rgb(255, 255, 255);">${ar.role_name }</td>
		 <td class="first-cell" style="background-color: rgb(255, 255, 255);">${ar.role_describe }</td>
		 <td align="center" style="background-color: rgb(255, 255, 255);">
		   <a href="${baseurl }role/toedit.do?id=${ar.role_id}" title="编辑"><img src="${baseurl}admin/images/icon_edit.gif" border="0" height="16" width="16"></a>&nbsp;&nbsp;
		   <a href="${baseurl }role/remove.do?id=${ar.role_id}" title="移除"><img src="${baseurl}admin/images/icon_drop.gif" border="0" height="16" width="16"></a>
		 </td>
	</tr>
	</c:forEach>
  </tbody>
</table>

</div>
<div id="footer">
共执行 2 个查询，用时 0.010174 秒，Gzip 已禁用，内存占用 1.768 MB<br>
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
	  </tbody>
  </table>
</div>
</body></html>