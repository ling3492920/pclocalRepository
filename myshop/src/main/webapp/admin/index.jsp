<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/admin/tag.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台首页</title>
<script type="text/javascript" src="${baseurl }admin/js/jquery.min.js"></script>
<script type="text/javascript">
var mes = "${activeUser.menus}";
$(function(){
	//头信息显示
	$("#header-frame").load(function(){//必须要子页面加载完在执行该方法
		
		$(window.frames["header-frame"].document).find("#adminname").text('${activeUser.userName}'); 
	});
	
	//菜单显示
	$("#menu-frame").load(function(){
		var ul='<c:forEach items="${activeUser.menus }" var="menu1">'+
				'<li class="explode" key="02_cat_and_goods" name="menu">'+
				    '${menu1.action_name }'+
				    '<ul style="display: block;">'+
				    '<c:forEach items="${menu1.aus }" var="menu2">'+	
				          '<li class="menu-item"><a href="${baseurl}${menu2.url}" target="main-frame">${menu2.action_name }</a></li>'+   	
				    '</c:forEach>'+  
				    '</ul>'+
				  '</li>'+  
			   '</c:forEach>';
		$(window.frames["menu-frame"].document).find("#menus").html(ul);
	});
	
	
})
</script>
<frameset rows="76,*" framespacing="0" border="0">
  <frame src="${baseurl }admin/top.jsp" id="header-frame" name="header-frame" frameborder="no" scrolling="no">
  <frameset cols="180, 10, *" framespacing="0" border="0" id="frame-body">
    <frame src="${baseurl }admin/menu.jsp" id="menu-frame" name="menu-frame" frameborder="no" scrolling="yes">
    <frame src="${baseurl }admin/drag.jsp" id="drag-frame" name="drag-frame" frameborder="no" scrolling="no">
    <frame src="${baseurl }admin/main.jsp" id="main-frame" name="main-frame" frameborder="no" scrolling="yes">
  </frameset>
</frameset>
  <frameset rows="0, 0" framespacing="0" border="0">
  <frame src="http://api.ecshop.com/record.php?mod=login&url=http%3A%2F%2Flocalhost%2Fws%2Fecshop%2Fupload%2F" id="hidd-frame" name="hidd-frame" frameborder="no" scrolling="no">
  </frameset>
</head>
<body>
</body>
</html>
