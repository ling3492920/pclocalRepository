<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 系统信息 </title>
<meta name="robots" content="noindex, nofollow">
<link href="${baseurl }admin/styles/general.css" rel="stylesheet" type="text/css" />
<link href="${baseurl }admin/styles/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseurl }admin/js/transport.js"></script>
<script type="text/javascript" src="${baseurl }admin/js/common.js"></script>
</head>
<body>

<h1>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 系统信息 </span>
<div style="clear:both"></div>
</h1>
<div class="list-div">
  <div style="background:#FFF; padding: 20px 50px; margin: 2px;">
    <table align="center" width="400">
      <tr>
        <td width="50" valign="top">
                    <img src="images/warning.gif" width="32" height="32" border="0" alt="warning" />
                  </td>
        <td style="font-size: 14px; font-weight: bold">您输入的帐号信息不正确。</td>
      </tr>
      <tr>
        <td></td>
        <td id="redirectionMsg">
          如果您不做出选择，将在 <span id="spanSeconds">3</span> 秒后跳转到第一个链接地址。
		</td>
      </tr>
      <tr>
        <td></td>
        <td>
          <ul style="margin:0; padding:0 10px" class="msg-link">
               <li><a href="javascript:history.go(-1)" >返回上一页</a></li>
          </ul>
        </td>
      </tr>
    </table>
  </div>
</div>
<script language="JavaScript">
<!--
var seconds = 3;
var defaultUrl = "javascript:history.go(-1)";


onload = function()
{
  if (defaultUrl == 'javascript:history.go(-1)' && window.history.length == 0)
  {
    document.getElementById('redirectionMsg').innerHTML = '';
    return;
  }

  window.setInterval(redirection, 1000);
}
function redirection()
{
  if (seconds <= 0)
  {
    window.clearInterval();
    return;
  }

  seconds --;
  document.getElementById('spanSeconds').innerHTML = seconds;

  if (seconds == 0)
  {
    window.clearInterval();
    location.href = defaultUrl;
  }
}
//-->
</script>

<div id="footer">
共执行 2 个查询，用时 0.009663 秒，Gzip 已禁用，内存占用 1.878 MB<br />
版权所有 &copy; 2005-2009 上海商派网络科技有限公司，并保留所有权利。</div>
<script type="text/javascript" src="../js/utils.js"></script><!-- 新订单提示信息 -->
<div id="popMsg">
  <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#cfdef4" border="0">
  <tr>
    <td style="color: #0f2c8c" width="30" height="24"></td>
    <td style="font-weight: normal; color: #1f336b; padding-top: 4px;padding-left: 4px" valign="center" width="100%"> 新订单通知</td>
    <td style="padding-top: 2px;padding-right:2px" valign="center" align="right" width="19"><span title="关闭" style="cursor: hand;cursor:pointer;color:red;font-size:12px;font-weight:bold;margin-right:4px;" onclick="Message.close()" >×</span><!-- <img title=关闭 style="cursor: hand" onclick=closediv() hspace=3 src="msgclose.jpg"> --></td>
  </tr>
  <tr>
    <td style="padding-right: 1px; padding-bottom: 1px" colspan="3" height="70">
    <div id="popMsgContent">
      <p>您有 <strong style="color:#ff0000" id="spanNewOrder">1</strong> 个新订单以及       <strong style="color:#ff0000" id="spanNewPaid">0</strong> 个新付款的订单</p>
      <p align="center" style="word-break:break-all"><a href="order.php?act=list"><span style="color:#ff0000">点击查看新订单</span></a></p>
    </div>
    </td>
  </tr>
  </table>
</div>

<!--
<embed src="images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="images/online.swf">
  <param name="quality" value="high">
  <embed src="images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
  </embed>
</object>


</body>
</html>