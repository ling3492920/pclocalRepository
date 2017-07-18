<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心</title>
<link href="${baseurl}admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl}admin/styles/main.css" rel="stylesheet" type="text/css">

<style type="text/css">
body {
  color: white;
}
</style>

<script type="text/javascript" src="${baseurl}admin/js/utils.js"></script>
<script type="text/javascript" src="${baseurl}admin/js/validator.js"></script>
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
var user_name_empty = "管理员用户名不能为空!";
var password_invaild = "密码必须同时包含字母及数字且长度不能小于6!";
var email_empty = "Email地址不能为空!";
var email_error = "Email地址格式不正确!";
var password_error = "两次输入的密码不一致!";
var captcha_empty = "您没有输入验证码!";

if (window.parent != window)
{
  window.top.location.href = location.href;
}

//-->
</script>
</head>
<body style="background: #278296">
<form method="post" action="${baseurl}login.do" name="theForm" onsubmit="return validate()">
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tbody><tr>
    <td><img src="${baseurl}admin/images/login.png" width="178" height="256" border="0" alt="ECSHOP"></td>
    <td style="padding-left: 50px">
      <table>
      <tbody>
      <tr>
        <td>管理员姓名：</td>
        <td><input type="text" name="username"></td>
      </tr>
      <tr>
        <td>管理员密码：</td>
        <td><input type="password" name="password"></td>
      </tr>
      <tr><td colspan="2"><input type="checkbox" value="1" name="remember" id="remember"><label for="remember">请保存我这次的登录信息。</label></td></tr>
      <tr><td>&nbsp;</td><td><input type="submit" value="进入管理中心" class="button"></td></tr>
      <tr>
        <td colspan="2" align="right">» <a href="../" style="color:white">返回首页</a> » <a href="get_password.php?act=forget_pwd" style="color:white">您忘记了密码吗?</a></td>
      </tr>
      </tbody></table>
    </td>
  </tr>
  </tbody></table>
  <input type="hidden" name="act" value="signin">
</form>
<script language="JavaScript">
<!--
  document.forms['theForm'].elements['username'].focus();
  
  /**
   * 检查表单输入的内容
   */
  function validate()
  {
    var validator = new Validator('theForm');
    validator.required('username', user_name_empty);
    //validator.required('password', password_empty);
    if (document.forms['theForm'].elements['captcha'])
    {
      validator.required('captcha', captcha_empty);
    }
    return validator.passed();
  }
  
//-->
</script>
</body></html>