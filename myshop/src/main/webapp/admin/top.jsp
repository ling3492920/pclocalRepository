<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/admin/tag.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/general.css" rel="stylesheet" type="text/css">
<style type="text/css">
#header-div {
  background: #278296;
  border-bottom: 1px solid #FFF;
}

#logo-div {
  height: 50px;
  float: left;
}

#license-div {
  height: 50px;
  float: left;
  text-align:center;
  vertical-align:middle;
  line-height:50px;
}

#license-div a:visited, #license-div a:link {
  color: #EB8A3D;
}

#license-div a:hover {
  text-decoration: none;
  color: #EB8A3D;
}

#submenu-div {
  height: 50px;
}

#submenu-div ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
}

#submenu-div li {
  float: right;
  padding: 0 10px;
  margin: 3px 0;
  border-left: 1px solid #FFF;
}

#submenu-div a:visited, #submenu-div a:link {
  color: #FFF;
  text-decoration: none;
}

#submenu-div a:hover {
  color: #F5C29A;
}

#loading-div {
  clear: right;
  text-align: right;
  display: block;
}

#menu-div {
  background: #80BDCB;
  font-weight: bold;
  height: 24px;
  line-height:24px;
}

#menu-div ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
}

#menu-div li {
  float: left;
  border-right: 1px solid #192E32;
  border-left:1px solid #BBDDE5;
}

#menu-div a:visited, #menu-div a:link {
  display:block;
  padding: 0 20px;
  text-decoration: none;
  color: #335B64;
  background:#9CCBD6;
}

#menu-div a:hover {
  color: #000;
  background:#80BDCB;
}

#submenu-div a.fix-submenu{clear:both; margin-left:5px; padding:1px 5px; *padding:3px 5px 5px; background:#DDEEF2; color:#278296;}
#submenu-div a.fix-submenu:hover{padding:1px 5px; *padding:3px 5px 5px; background:#FFF; color:#278296;}
#menu-div li.fix-spacel{width:30px; border-left:none;}
#menu-div li.fix-spacer{border-right:none;}
</style>
<script type="text/javascript" src="${baseurl }admin/js/transport.js"></script>
<script type="text/javascript">
/*
$(function(){
	
	  $.ajax({
          url:"${baseurl }auser/checkName.do",
          type: 'GET',
          dataType: 'JSON',
          success: function(jr){
              if(jr.state==0){
                  var name = jr.data;
                  $("#adminname").text(name)

              }
          },
          error:function(){
              alert("服务器异常，稍后重试！")
          }
      });
	
});
*/
function web_address()
{
  var ne_add = parent.document.getElementById('main-frame');
  var ne_list = ne_add.contentWindow.document.getElementById('search_id').innerHTML;
  ne_list.replace('-', '');
  var arr = ne_list.split('-');
  window.open('help.php?al='+arr[arr.length - 1],'_blank');
}


/**
 * æææ£æµåè°å¤ç
 */
function start_sendmail_Response(result)
{
  // è¿è¡æ­£å¸¸
  if (result.error == 0)
  {
    var str = '';
		if (result['content']['auth_str'])
		{
			str = '<a href="javascript:void(0);" target="_blank">' + result['content']['auth_str'];
			if (result['content']['auth_type'])
			{
				str += '[' + result['content']['auth_type'] + ']';
			}
			str += '</a> ';
		}

    document.getElementById('license-div').innerHTML = str;
  }
}

function modalDialog(url, name, width, height)
{
  if (width == undefined)
  {
    width = 400;
  }
  if (height == undefined)
  {
    height = 300;
  }

  if (window.showModalDialog)
  {
    window.showModalDialog(url, name, 'dialogWidth=' + (width) + 'px; dialogHeight=' + (height+5) + 'px; status=off');
  }
  else
  {
    x = (window.screen.width - width) / 2;
    y = (window.screen.height - height) / 2;

    window.open(url, name, 'height='+height+', width='+width+', left='+x+', top='+y+', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes');
  }
}

function ShowToDoList()
{
  try
  {
    var mainFrame = window.top.frames['main-frame'];
    mainFrame.window.showTodoList(adminId);
  }
  catch (ex)
  {
  }
}


var adminId = "1"; 
</script>
</head>
<body style="cursor: auto;">
<div id="header-div">
  <div id="logo-div" style="bgcolor:#000000;"><img src="images/ecshop_logo.gif" alt="ECSHOP - power for e-commerce"></div>
  <div id="license-div" style="bgcolor:#000000;"></div>
  <div id="submenu-div">
    <ul>
      <li><a href="templates/about_us.htm" target="main-frame">关于 ECSHOP</a></li>
      <li><a href="javascript:web_address();">帮助</a></li>
      <li><a href="javascript:modalDialog('templates/calculator.html', 'calculator', 340, 250)">计算器</a></li>
      <li><a href="../" target="_blank">查看网店</a></li>
      <li><a href="message.php?act=list" target="main-frame">管理员留言</a></li>
      <li><a href="templates/modify.jsp" target="main-frame">个人设置</a></li>
      <li><a href="javascript:window.top.frames['main-frame'].document.location.reload();window.top.frames['header-frame'].document.location.reload()">刷新</a></li>
      <li><a href="#" onclick="ShowToDoList()">记事本</a></li>
      <li style="border-left:none;"><a href="templates/shophelp.jsp" target="main-frame">开店向导</a></li>
    </ul>
    <div id="send_info" style="padding: 5px 10px 0 0; clear:right;text-align: right; color: #FF9900;width:40%;float: right;">
      欢迎：<span id="adminname"></span>
      <a href="index.php?act=clear_cache" target="main-frame" class="fix-submenu">清除缓存</a>
      <a href="${baseurl}logout.do" target="_top" class="fix-submenu">退出</a>
    </div>
        <!--<div id="load-div" style="padding: 5px 10px 0px 0px; text-align: right; color: rgb(255, 153, 0); display: none; width: 40%; float: right;"><img src="images/top_loader.gif" width="16" height="16" alt="æ­£å¨å¤çæ¨çè¯·æ±..." style="vertical-align: middle"> 正在请求中...</div>
        -->
  </div>
</div>
<div id="menu-div">
  <ul>
    <li class="fix-spacel">&nbsp;</li>
    <li><a href="main.jsp" target="main-frame">起始页</a></li>
    <li><a href="templates/modify.jsp" target="main-frame">设置导航栏</a></li>
        <li><a href="templates/goods_list.jsp" target="main-frame">商品列表</a></li>
        <li><a href="templates/order_list.jsp" target="main-frame">订单列表</a></li>
        <li><a href="templates/comment_manage.jsp" target="main-frame">用户评论</a></li>
        <li><a href="templates/user_list.jsp" target="main-frame">会员列表</a></li>
        <li><a href="templates/shopconfig.jsp" target="main-frame">商店设置</a></li>
        <li class="fix-spacer">&nbsp;</li>
  </ul>
  <br class="clear">
</div>

</body>
</html>