<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ECSHOP 管理中心 - 添加会员等级 </title>

<link href="../styles/general.css" rel="stylesheet" type="text/css">
<link href="../styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/transport.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script language="JavaScript">

</script>
</head>
<body>

<h1>
<span class="action-span"><a href="user_rank.jsp">会员等级</a></span>
<span class="action-span1"><a href="../index.jsp">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 添加会员等级 </span>
<div style="clear:both"></div>
</h1>

<div class="main-div">
<form action="user_rank.php" method="post" name="theForm" onsubmit="return validate()">
<table width="100%">
  <tbody><tr>
    <td class="label">会员等级名称: </td>
    <td><input type="text" name="rank_name" value="" maxlength="20"><span class="require-field">*</span></td>
  </tr>
  <tr>
    <td class="label">积分下限: </td>
    <td><input type="text" name="min_points" value="0" size="10" maxlength="20"></td>
  </tr>
  <tr>
    <td class="label">积分上限: </td>
    <td><input type="text" name="max_points" value="0" size="10" maxlength="20"></td>
  </tr>
  <tr>
    <td class="label"></td>
    <td>
    <input type="checkbox" name="show_price" value="1" checked="true"> 在商品详情页显示该会员等级的商品价格</td>
  </tr>
  <tr>
    <td class="label"></td>
    <td>
    <input type="checkbox" name="special_rank" value="1" onclick="javascript:doSpecial()"> 特殊会员组 <a href="javascript:showNotice('notice_special');" title="点击此处查看提示信息"><img src="images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a>
    <br><span class="notice-span" style="display:block" id="notice_special">特殊会员组的会员不会随着积分的变化而变化。</span></td>
  </tr>
  <tr>
    <td class="label"><a href="javascript:showNotice('notice_discount');" title="点击此处查看提示信息"><img src="images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a>初始折扣率: </td>
    <td><input type="text" name="discount" value="100" size="10" maxlength="20"><span class="require-field">*</span>    <br><span class="notice-span" style="display:block" id="notice_discount">请填写为0-100的整数,如填入80，表示初始折扣率为8折</span>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="hidden" name="act" value="insert">
      <input type="hidden" name="id" value="0">
      <input type="submit" value=" 确定 " class="button">
      <input type="reset" value=" 重置 " class="button">
    </td>
  </tr>
</tbody></table>
</form>
</div>
<script type="text/javascript" src="../js/utils.js"></script>
<script type="text/javascript" src="../js/validator.js"></script>
<script language="JavaScript">
<!--
document.forms['theForm'].elements['rank_name'].focus();

onload = function()
{
  // 开始检查订单
  startCheckOrder();
}

/**
 * 检查表单输入的数据
 */
function validate()
{
    if (!document.forms['theForm'].elements['special_rank'].checked)
    {
        if (Utils.trim(document.forms['theForm'].elements['min_points'].value) == '' ||
            !Utils.isInt(document.forms['theForm'].elements['min_points'].value))
        {
            alert(integral_min_invalid);
            return false;
        }

        if (Utils.trim(document.forms['theForm'].elements['max_points'].value) == '' ||
            !Utils.isInt(document.forms['theForm'].elements['max_points'].value))
        {
            alert(integral_max_invalid);
            return false;
        }

        if (!document.forms['theForm'].elements['special_rank'].checked &&
            (parseInt(document.forms['theForm'].elements['max_points'].value) <=
            parseInt(document.forms['theForm'].elements['min_points'].value)))
        {
            alert(integral_max_small);
            return false;
        }
        if (parseInt(document.forms['theForm'].elements['discount'].value) < 1 ||
          parseInt(document.forms['theForm'].elements['discount'].value) > 100)
        {
          alert(discount_invalid);
          return false;
        }
    }

    validator = new Validator("theForm");
    validator.required('rank_name', rank_name_empty);
    validator.isInt('discount', discount_invalid, true);
    return validator.passed();
}

function doSpecial()
{
  if(document.forms['theForm'].elements['special_rank'].checked)
  {
      document.forms['theForm'].elements['max_points'].disabled = "true";
      document.forms['theForm'].elements['min_points'].disabled = "true";
  }
  else
  {
      document.forms['theForm'].elements['max_points'].disabled = "";
      document.forms['theForm'].elements['min_points'].disabled = "";
  }
}
//-->
</script>

<div id="footer">
共执行 1 个查询，用时 0.010321 秒，Gzip 已禁用，内存占用 1.797 MB<br>
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
<embed src="images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="images/online.swf">
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