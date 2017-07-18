<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 开店向导－设置网店 </title>

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
var expand_all = "展开";
var collapse_all = "闭合";
var shop_name_not_null = "商店名称不能为空";
var good_name_not_null = "商品名称不能为空";
var good_category_not_null = "商品分类不能为空";
var good_number_not_number = "商品数量不是数值";
var good_price_not_number = "商品价格不是数值";
//-->
</script>
</head>
<body>

<h1>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 开店向导－设置网店 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="../js/utils.js"></script>
<script type="text/javascript" src="../js/region.js"></script>
<div class="main-div">
<div class="step1">设置商店的一些基本信息<em>商店的名字、地址、配送方式、支付方式等</em></div>
<form action="shophelp2.jsp" name="theForm" method="post" onsubmit="return validator()">
  <table cellspacing="1" cellpadding="3" width="100%">
    <tbody><tr>
      <td class="micro-label">商店名称:</td>
      <td><input type="text" name="shop_name" value="ECSHOP"></td>
    </tr>
    <tr>
      <td class="micro-label">商店标题:</td>
      <td><input type="text" name="shop_title" value="ECSHOP演示站"></td>
    </tr>
    <tr>
      <td class="micro-label">所在国家:</td>
      <td>
         <select name="shop_country" id="selCountries" onchange="region.changed(this, 1, 'selProvinces')">
           <option value="">请选择...</option>
                        <option value="1" selected="">中国</option>
                    </select>                
       </td>
    </tr>
    <tr>
      <td class="micro-label">所在省份:</td>
      <td>
         <select name="shop_province" id="selProvinces" onchange="region.changed(this, 2, 'selCities')">
           <option value="">请选择...</option>
                            <option value="2" selected=""> 北京</option>
                            <option value="3"> 安徽</option>
                            <option value="4"> 福建</option>
                            <option value="5"> 甘肃</option>
                            <option value="6"> 广东</option>
                            <option value="7"> 广西</option>
                            <option value="8"> 贵州</option>
                            <option value="9"> 海南</option>
                            <option value="10"> 河北</option>
                            <option value="11"> 河南</option>
                            <option value="12"> 黑龙江</option>
                            <option value="13"> 湖北</option>
                            <option value="14"> 湖南</option>
                            <option value="15"> 吉林</option>
                            <option value="16"> 江苏</option>
                            <option value="17"> 江西</option>
                            <option value="18"> 辽宁</option>
                            <option value="19"> 内蒙古</option>
                            <option value="20"> 宁夏</option>
                            <option value="21"> 青海</option>
                            <option value="22"> 山东</option>
                            <option value="23"> 山西</option>
                            <option value="24"> 陕西</option>
                            <option value="25"> 上海</option>
                            <option value="26"> 四川</option>
                            <option value="27"> 天津</option>
                            <option value="28"> 西藏</option>
                            <option value="29"> 新疆</option>
                            <option value="30"> 云南</option>
                            <option value="31"> 浙江</option>
                            <option value="32"> 重庆</option>
                            <option value="33"> 香港</option>
                            <option value="34"> 澳门</option>
                            <option value="35"> 台湾</option>
                      </select>
      </td>
    </tr>
    <tr>
      <td class="micro-label">所在城市:</td>
      <td>
        <select name="shop_city" id="selCities">
          <option value="">请选择...</option>
                          <option value="52">北京</option>
                    </select>
      </td>
    </tr>
    <tr>
      <td class="micro-label">详细地址:</td>
      <td><input type="text" name="shop_address"></td>
    </tr>
    <tr>
      <td class="micro-label">配送方式:</td>
      <td>
        <select name="shipping" id="shipping_type" onchange="show_shipping_area()">
          <option value="">请选择...</option>
                          <option value="cac">上门取货</option>
                          <option value="city_express">城际快递</option>
                          <option value="ems">EMS 国内邮政特快专递</option>
                          <option value="flat">市内快递</option>
                          <option value="fpd">运费到付</option>
                          <option value="post_express">邮政快递包裹</option>
                          <option value="post_mail">邮局平邮</option>
                          <option value="presswork">邮政挂号印刷品</option>
                          <option value="sf_express">顺丰速运</option>
                          <option value="sto_express">申通快递</option>
                          <option value="yto">圆通速递</option>
                          <option value="zto">中通速递</option>
                    </select>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <div id="shipping_area" style="display:none">
          <table cellspacing="1" cellpadding="3" width="100%">
            <tbody><tr>
              <td width="80">配送区域名称:</td>
              <td><input type="text" name="area_name" style="margin-bottom:5px;vertical-align:middle"></td>
            </tr>
            <tr>
              <td>国家:</td>
              <td>
	          <select name="shipping_country" id="sel_Countries" onchange="region.changed(this, 1, 'sel_Provinces')">
	           	             <option value="1">中国</option>
	           	         </select> 
              </td>
            </tr>
            <tr>
              <td>省份:</td>
              <td>
	          <select name="shipping_province" id="sel_Provinces" onchange="region.changed(this, 2, 'sel_Cities')">
	           <option value="">请选择...</option>
	             	               <option value="2">北京</option>
	             	               <option value="3">安徽</option>
	             	               <option value="4">福建</option>
	             	               <option value="5">甘肃</option>
	             	               <option value="6">广东</option>
	             	               <option value="7">广西</option>
	             	               <option value="8">贵州</option>
	             	               <option value="9">海南</option>
	             	               <option value="10">河北</option>
	             	               <option value="11">河南</option>
	             	               <option value="12">黑龙江</option>
	             	               <option value="13">湖北</option>
	             	               <option value="14">湖南</option>
	             	               <option value="15">吉林</option>
	             	               <option value="16">江苏</option>
	             	               <option value="17">江西</option>
	             	               <option value="18">辽宁</option>
	             	               <option value="19">内蒙古</option>
	             	               <option value="20">宁夏</option>
	             	               <option value="21">青海</option>
	             	               <option value="22">山东</option>
	             	               <option value="23">山西</option>
	             	               <option value="24">陕西</option>
	             	               <option value="25">上海</option>
	             	               <option value="26">四川</option>
	             	               <option value="27">天津</option>
	             	               <option value="28">西藏</option>
	             	               <option value="29">新疆</option>
	             	               <option value="30">云南</option>
	             	               <option value="31">浙江</option>
	             	               <option value="32">重庆</option>
	             	               <option value="33">香港</option>
	             	               <option value="34">澳门</option>
	             	               <option value="35">台湾</option>
	             	         </select>
              </td>
            </tr>
             <tr>
              <td>城市:</td>
              <td>
	          <select name="shipping_city" id="sel_Cities" onchange="region.changed(this, 3, 'sel_Districts')">
	          <option value="">请选择...</option>
	          </select> 
              </td>
            </tr>
             <tr>
              <td>请选择...</td>
              <td>
	          <select name="shipping_district" id="sel_Districts">
	            <option value="">请选择...</option>
	          </select>
              </td>
            </tr>
          </tbody></table>
        </div>
      </td>
    </tr>
    <tr>
      <td class="micro-label">支付方式:</td>
      <td>
			  <table border="0" cellpadding="0" cellspacing="0" style="margin-top:-10px"><tbody><tr><td width="50"><select name="payment" id="payment_type" onchange="loadConfig()">
          <option value="">请选择...</option>
			    
                          
			    <option value="alipay">支付宝</option>
			    
                          
			    <option value="balance">余额支付</option>
			    
                          
			    <option value="bank">银行汇款/转帐</option>
			    
                          
			    <option value="cappay">首信易支付</option>
			    
                          
			    <option value="chinabank">网银在线</option>
			    
                          
			    <option value="cncard">云网支付</option>
			    
                          
			    <option value="cod">货到付款</option>
			    
                          
			    <option value="express">易捷IPS</option>
			    
                          
			    <option value="ips">环迅IPS</option>
			    
                          
			    <option value="kuaiqian">快钱人民币网关</option>
			    
                          
			    <option value="kuaiqian_abc">农业银行-快钱</option>
			    
                          
			    <option value="kuaiqian_bcom">交通银行-快钱</option>
			    
                          
			    <option value="kuaiqian_bob">北京银行-快钱</option>
			    
                          
			    <option value="kuaiqian_boc">中国银行-快钱</option>
			    
                          
			    <option value="kuaiqian_ccb">建设银行-快钱</option>
			    
                          
			    <option value="kuaiqian_cmb">招商银行-快钱</option>
			    
                          
			    <option value="kuaiqian_cmbc">民生银行-快钱</option>
			    
                          
			    <option value="kuaiqian_icbc">工商银行-快钱</option>
			    
                          
			    <option value="kuaiqian_sdb">深发银行-快钱</option>
			    
                          
			    <option value="paypal">paypal</option>
			    
                          
			    <option value="paypal_ec">paypal快速结帐</option>
			    
                          
			    <option value="post">邮局汇款</option>
			    
                          
			    <option value="shenzhou">快钱神州行支付</option>
			    
                          
			    <option value="tenpay">财付通</option>
			    
                          
			    <option value="tenpayc2c">财付通中介担保接口</option>
			    
                          
			    <option value="yeepay">YeePay易宝</option>
			    
                          
			    <option value="yeepayszx">YeePay易宝神州行支付</option>
			    
                          
			    <option value="yeepay_abchina">易宝农行支付</option>
			    
                          
			    <option value="yeepay_ccb">易宝建行支付</option>
			    
                          
			    <option value="yeepay_cmbchina">易宝招行支付</option>
			    
                          
			    <option value="yeepay_icbc">易宝工行支付</option>
			    
                          
			    <option value="yeepay_jcard">易宝骏网支付</option>
			    
                    
			    </select></td>
			  <td>	<div align="left"><span id="paynon" style="display: none;"><a href="https://www.alipay.com/user/login.htm?goto=https%3A%2F%2Fwww.alipay.com%2Fhimalayas%2Fpracticality_profile_edit.htm%3Fmarket_type%3Dfrom_agent_contract%26customer_external_id%3D%2BC4335319945672464113" target="_blank">立即免费申请支付接口权限</a></span>
            </div></td></tr></tbody></table>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <div id="paymentConfig" style="display:none">
        
        </div>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <input type="submit" value="下一步" class="button">
        <input type="button" value="完成向导" onclick="javascript:window.location.href='index.php?act=main'" class="button">
      </td>
    </tr>
  </tbody></table>
</form>
</div>
<script type="text/javascript" src="../js/validator.js"></script>
<script type="Text/Javascript" language="JavaScript">
<!--

region.isAdmin = true;

onload = function()
{
   document.getElementById('paynon').style.display = 'none';
}

function validator()
{
  var validator = new Validator('theForm');
  validator.required('shop_name', shop_name_not_null);
  
  return validator.passed();
}

function show_shipping_area()
{
  Ajax.call('shipping.php?act=shipping_priv', '', shippingResponse, 'GET', 'JSON');
}

function shippingResponse(result)
{
  var shipping_name = document.getElementById('shipping_type');
  if (result.error == '1' && result.message != '')
  {
    alert(result.message);
    shipping_name.options[0].selected = true;
    return;
  }
  
  var area = document.getElementById('shipping_area');
  if(shipping_name.value == '')
  {
    area.style.display = 'none';
  }
  else
  {
    area.style.display = "block";
  }
}

function loadConfig()
{
  var payment = document.forms['theForm'].elements['payment'];
  var paymentConfig = document.getElementById('paymentConfig');
  if(payment.value == '')
  {
    paymentConfig.style.display = 'none';
    return;
  }
  else
  {
    paymentConfig.style.display = 'block';
  }
	if(payment.value == 'alipay')
  {
	  document.getElementById('paynon').style.display = 'block';
	}
	else
	{
	  document.getElementById('paynon').style.display = 'none';
	}
  var params = 'code=' + payment.value;

  Ajax.call('payment.php?is_ajax=1&act=get_config', params, showConfig, 'GET', 'JSON');
}

function showConfig(result)
{
  var payment = document.forms['theForm'].elements['payment'];
  if (result.error == '1' && result.message != '')
  {
    alert(result.message);
    payment.options[0].selected = true;
    return;
  }
  var paymentConfig = document.getElementById('paymentConfig');
  var config = result.content;

  paymentConfig.innerHTML = config;
}


//-->
</script>
<div id="footer">
共执行 6 个查询，用时 0.445633 秒，Gzip 已禁用，内存占用 4.241 MB<br>
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