<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../styles/general.css" rel="stylesheet" type="text/css">
<link href="../styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/transport.js"></script>
<script type="text/javascript" src="js/common.js"></script>
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
//-->
</script>
</head>
<body>

<h1>
<span class="action-span"><a href="privilege.php?act=list">管理员列表</a></span>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 编辑个人资料 </span>
<div style="clear:both"></div>
</h1>
<div class="main-div">
<form name="theForm" method="post" enctype="multipart/form-data" onsubmit="return validate();">
<table width="100%">
  <tbody><tr>
    <td class="label">用户名</td>
    <td>
      <input type="text" name="user_name" maxlength="20" value="admin" size="34"><span class="require-field">*</span></td>
  </tr>
  <tr>
    <td class="label">Email地址</td>
    <td>
      <input type="text" name="email" value="jianghd@tedu.cn" size="34"><span class="require-field">*</span></td>
  </tr>
     <tr>
    <td class="label">
      <a href="javascript:showNotice('passwordNotic');" title="点击此处查看提示信息">
        <img src="../images/notice.gif" width="16" height="16" border="0" alt="点击此处查看提示信息"></a>旧密码</td>
    <td>
      <input type="password" name="old_password" size="34"><span class="require-field">*</span>      <br><span class="notice-span" style="display:block" id="passwordNotic">如果要修改密码,请先填写旧密码,如留空,密码保持不变</span></td>
  </tr>
  <tr>
    <td class="label">新密码</td>
    <td>
      <input type="password" name="new_password" maxlength="32" size="34"><span class="require-field">*</span></td>
  </tr>
  <tr>
    <td class="label">确认密码</td>
    <td>
      <input type="password" name="pwd_confirm" value="" size="34"><span class="require-field">*</span></td>
  </tr>
           <tr>
  <td align="left" class="label">设置个人导航</td>
  <td>
      <table style="width:300px" cellspacing="0">
        <tbody><tr>
        <td valign="top">
          <input type="hidden" name="nav_list[]" id="nav_list[]">
          <select name="menus_navlist" id="menus_navlist" multiple="true" style="width: 120px; height: 180px" onclick="setTimeout('toggleButtonSatus()', 1);">
          <option value="goods.php?act=list">商品列表</option><option value="order.php?act=list">订单列表</option><option value="comment_manage.php?act=list">用户评论</option><option value="users.php?act=list">会员列表</option><option value="shop_config.php?act=list_edit">商店设置</option>          </select></td>
        <td align="center">
         <input type="button" class="button" value="上移" id="btnMoveUp" onclick="moveOptions('up')" disabled="true">
         <input type="button" class="button" value="下移" id="btnMoveDown" onclick="moveOptions('down')" disabled="true">
         <input type="button" value="增加" id="btnAdd" onclick="JavaScript:addItem(theForm.all_menu_list,theForm.menus_navlist); this.disabled=true; " class="button" disabled="true"><br>
         <input type="button" value="移除" onclick="JavaScript:delItem(theForm.menus_navlist); toggleButtonSatus()" class="button" disabled="true" id="btnRemove"></td>
        <td>
          <select id="all_menu_list" name="all_menu_list" size="15" multiple="true" style="width:150px; height: 180px" onchange="toggleAddButton()">
                                        <option value="" style="font-weight:bold;">商品管理</option>
                            <option value="goods.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;商品列表</option>
                            <option value="goods.php?act=add">&nbsp;&nbsp;&nbsp;&nbsp;添加新商品</option>
                            <option value="category.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;商品分类</option>
                            <option value="comment_manage.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;用户评论</option>
                            <option value="brand.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;商品品牌</option>
                            <option value="goods_type.php?act=manage">&nbsp;&nbsp;&nbsp;&nbsp;商品类型</option>
                            <option value="goods.php?act=trash">&nbsp;&nbsp;&nbsp;&nbsp;商品回收站</option>
                            <option value="picture_batch.php">&nbsp;&nbsp;&nbsp;&nbsp;图片批量处理</option>
                            <option value="goods_batch.php?act=add">&nbsp;&nbsp;&nbsp;&nbsp;商品批量上传</option>
                            <option value="goods_export.php?act=goods_export">&nbsp;&nbsp;&nbsp;&nbsp;商品批量导出</option>
                            <option value="goods_batch.php?act=select">&nbsp;&nbsp;&nbsp;&nbsp;商品批量修改</option>
                            <option value="gen_goods_script.php?act=setup">&nbsp;&nbsp;&nbsp;&nbsp;生成商品代码</option>
                            <option value="tag_manage.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;标签管理</option>
                            <option value="goods.php?act=list&amp;extension_code=virtual_card">&nbsp;&nbsp;&nbsp;&nbsp;虚拟商品列表</option>
                            <option value="goods.php?act=add&amp;extension_code=virtual_card">&nbsp;&nbsp;&nbsp;&nbsp;添加虚拟商品</option>
                            <option value="virtual_card.php?act=change">&nbsp;&nbsp;&nbsp;&nbsp;更改加密串</option>
                            <option value="goods_auto.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;商品自动上下架</option>
                                                                     <option value="" style="font-weight:bold;">促销管理</option>
                            <option value="snatch.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;夺宝奇兵</option>
                            <option value="bonus.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;红包类型</option>
                            <option value="pack.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;商品包装</option>
                            <option value="card.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;祝福贺卡</option>
                            <option value="group_buy.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;团购活动</option>
                            <option value="topic.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;专题管理</option>
                            <option value="auction.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;拍卖活动</option>
                            <option value="favourable.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;优惠活动</option>
                            <option value="wholesale.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;批发管理</option>
                            <option value="package.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;超值礼包</option>
                            <option value="exchange_goods.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;积分商城商品</option>
                                                                     <option value="" style="font-weight:bold;">订单管理</option>
                            <option value="order.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;订单列表</option>
                            <option value="order.php?act=order_query">&nbsp;&nbsp;&nbsp;&nbsp;订单查询</option>
                            <option value="order.php?act=merge">&nbsp;&nbsp;&nbsp;&nbsp;合并订单</option>
                            <option value="order.php?act=templates">&nbsp;&nbsp;&nbsp;&nbsp;订单打印</option>
                            <option value="goods_booking.php?act=list_all">&nbsp;&nbsp;&nbsp;&nbsp;缺货登记</option>
                            <option value="order.php?act=add">&nbsp;&nbsp;&nbsp;&nbsp;添加订单</option>
                            <option value="order.php?act=delivery_list">&nbsp;&nbsp;&nbsp;&nbsp;发货单列表</option>
                            <option value="order.php?act=back_list">&nbsp;&nbsp;&nbsp;&nbsp;退货单列表</option>
                                                                     <option value="" style="font-weight:bold;">广告管理</option>
                            <option value="ads.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;广告列表</option>
                            <option value="ad_position.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;广告位置</option>
                                                                     <option value="" style="font-weight:bold;">报表统计</option>
                            <option value="flow_stats.php?act=view">&nbsp;&nbsp;&nbsp;&nbsp;流量分析</option>
                            <option value="guest_stats.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;客户统计</option>
                            <option value="order_stats.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;订单统计</option>
                            <option value="sale_general.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;销售概况</option>
                            <option value="users_order.php?act=order_num">&nbsp;&nbsp;&nbsp;&nbsp;会员排行</option>
                            <option value="sale_list.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;销售明细</option>
                            <option value="searchengine_stats.php?act=view">&nbsp;&nbsp;&nbsp;&nbsp;搜索引擎</option>
                            <option value="sale_order.php?act=goods_num">&nbsp;&nbsp;&nbsp;&nbsp;销售排行</option>
                            <option value="visit_sold.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;访问购买率</option>
                            <option value="adsense.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;站外投放JS</option>
                                                                     <option value="" style="font-weight:bold;">文章管理</option>
                            <option value="articlecat.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;文章分类</option>
                            <option value="article.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;文章列表</option>
                            <option value="article_auto.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;文章自动发布</option>
                            <option value="vote.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;在线调查</option>
                                                                     <option value="" style="font-weight:bold;">会员管理</option>
                            <option value="users.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;会员列表</option>
                            <option value="users.php?act=add">&nbsp;&nbsp;&nbsp;&nbsp;添加会员</option>
                            <option value="user_rank.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;会员等级</option>
                            <option value="integrate.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;会员整合</option>
                            <option value="user_msg.php?act=list_all">&nbsp;&nbsp;&nbsp;&nbsp;会员留言</option>
                            <option value="user_account.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;充值和提现申请</option>
                            <option value="user_account_manage.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;资金管理</option>
                                                                     <option value="" style="font-weight:bold;">权限管理</option>
                            <option value="privilege.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;管理员列表</option>
                            <option value="admin_logs.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;管理员日志</option>
                            <option value="role.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;角色管理</option>
                            <option value="agency.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;办事处列表</option>
                            <option value="suppliers.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;供货商列表</option>
                                                                     <option value="" style="font-weight:bold;">系统设置</option>
                            <option value="shop_config.php?act=list_edit">&nbsp;&nbsp;&nbsp;&nbsp;商店设置</option>
                            <option value="reg_fields.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;会员注册项设置</option>
                            <option value="payment.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;支付方式</option>
                            <option value="shipping.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;配送方式</option>
                            <option value="shop_config.php?act=mail_settings">&nbsp;&nbsp;&nbsp;&nbsp;邮件服务器设置</option>
                            <option value="area_manage.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;地区列表</option>
                            <option value="cron.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;计划任务</option>
                            <option value="friend_link.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;友情链接</option>
                            <option value="captcha_manage.php?act=main">&nbsp;&nbsp;&nbsp;&nbsp;验证码管理</option>
                            <option value="check_file_priv.php?act=check">&nbsp;&nbsp;&nbsp;&nbsp;文件权限检测</option>
                            <option value="filecheck.php">&nbsp;&nbsp;&nbsp;&nbsp;文件校验</option>
                            <option value="flashplay.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;首页主广告管理</option>
                            <option value="navigator.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;自定义导航栏</option>
                            <option value="license.php?act=list_edit">&nbsp;&nbsp;&nbsp;&nbsp;授权证书</option>
                            <option value="webcollect.php">&nbsp;&nbsp;&nbsp;&nbsp;网罗天下</option>
                            <option value="sitemap.php">&nbsp;&nbsp;&nbsp;&nbsp;站点地图</option>
                            <option value="integrate.php?act=setup&amp;code=ucenter">&nbsp;&nbsp;&nbsp;&nbsp;UCenter设置</option>
                                                                     <option value="" style="font-weight:bold;">模板管理</option>
                            <option value="template.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;模板选择</option>
                            <option value="template.php?act=setup">&nbsp;&nbsp;&nbsp;&nbsp;设置模板</option>
                            <option value="template.php?act=library">&nbsp;&nbsp;&nbsp;&nbsp;库项目管理</option>
                            <option value="edit_languages.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;语言项编辑</option>
                            <option value="template.php?act=backup_setting">&nbsp;&nbsp;&nbsp;&nbsp;模板设置备份</option>
                            <option value="mail_template.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;邮件模板</option>
                                                                     <option value="" style="font-weight:bold;">数据库管理</option>
                            <option value="database.php?act=backup">&nbsp;&nbsp;&nbsp;&nbsp;数据备份</option>
                            <option value="database.php?act=optimize">&nbsp;&nbsp;&nbsp;&nbsp;数据表优化</option>
                            <option value="sql.php?act=main">&nbsp;&nbsp;&nbsp;&nbsp;SQL查询</option>
                            <option value="convert.php?act=main">&nbsp;&nbsp;&nbsp;&nbsp;转换数据</option>
                                                                     <option value="" style="font-weight:bold;">短信管理</option>
                            <option value="sms.php?act=display_send_ui">&nbsp;&nbsp;&nbsp;&nbsp;发送短信</option>
                                                                     <option value="" style="font-weight:bold;">推荐管理</option>
                            <option value="affiliate.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;推荐设置</option>
                            <option value="affiliate_ck.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;分成管理</option>
                                                                     <option value="" style="font-weight:bold;">邮件群发管理</option>
                            <option value="attention_list.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;关注管理</option>
                            <option value="email_list.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;邮件订阅管理</option>
                            <option value="magazine_list.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;杂志管理</option>
                            <option value="view_sendlist.php?act=list">&nbsp;&nbsp;&nbsp;&nbsp;邮件队列管理</option>
                                                    </select></td>
        </tr>
      </tbody></table></td>
  </tr>
    <tr>
    <td colspan="2" align="center">
      <input type="submit" value=" 确定 " class="button">&nbsp;&nbsp;&nbsp;
      <input type="reset" value=" 重置 " class="button">
      <input type="hidden" name="act" value="update_self">
      <input type="hidden" name="id" value="1"></td>
  </tr>
</tbody></table>
</form>
</div>
<script type="text/javascript" src="../js/utils.js"></script><script type="text/javascript" src="js/validator.js"></script><script language="JavaScript">
var action = "modif";
<!--

document.forms['theForm'].elements['user_name'].focus();
onload = function()
{
    // 开始检查订单
    startCheckOrder();
}

/**
 * 切换增加按钮的状态
 */
function toggleAddButton()
{
    var sel = document.getElementById("all_menu_list");
    document.getElementById("btnAdd").disabled = (sel.selectedIndex > -1) ? false : true;
}

/**
 * 切换移出，上移，下移按钮状态
 */
function toggleButtonSatus()
{
    var sel = document.getElementById("menus_navlist");
    document.getElementById("btnRemove").disabled = (sel.selectedIndex > -1) ? false : true;
    document.getElementById("btnMoveUp").disabled = (sel.selectedIndex > -1) ? false : true;
    document.getElementById("btnMoveDown").disabled = (sel.selectedIndex > -1) ? false : true;
}

/**
 * 移动选定的列表项
 */
function moveOptions(direction)
{
    var sel = document.getElementById('menus_navlist');
    if (sel.selectedIndex == -1)
    {
        return;
    }

    len = sel.length
    for (i = 0; i < len; i++)
    {
        if (sel.options[i].selected)
        {
            if (i == 0 && direction == 'up')
            {
                return;
            }

            newOpt = sel.options[i].cloneNode(true);

            sel.removeChild(sel.options[i]);
            tarOpt = (direction == "up") ? sel.options[i-1] : sel.options[i+1]
            sel.insertBefore(newOpt, tarOpt);
            newOpt.selected = true;
            break;
        }
    }
}

/**
* 检查表单输入的数据
*/
function validate()
{
  get_navlist();

  validator = new Validator("theForm");
  validator.password = function (controlId, msg)
  {
    var obj = document.forms[this.formName].elements[controlId];
    obj.value = Utils.trim(obj.value);
    if (!(obj.value.length >= 6 && /\d+/.test(obj.value) && /[a-zA-Z]+/.test(obj.value)))
    {
      this.addErrorMsg(msg);
    }

  }

  validator.required("user_name", user_name_empty);
  validator.required("email", email_empty, 1);
  validator.isEmail("email", email_error);

  if (action == "add")
  {
    if (document.forms['theForm'].elements['password'])
    {
      validator.password("password", password_invaild);
      validator.eqaul("password", "pwd_confirm", password_error);
    }
  }
  if (action == "edit" || action == "modif")
  {
    if (document.forms['theForm'].elements['old_password'].value.length > 0)
    {
      validator.password("new_password", password_invaild);
      validator.eqaul("new_password", "pwd_confirm", password_error);
    }
  }

  return validator.passed();
}

function get_navlist()
{
  if (!document.getElementById('nav_list[]'))
  {
    return;
  }

  document.getElementById('nav_list[]').value = joinItem(document.getElementById('menus_navlist'));
  //alert(document.getElementById('nav_list[]').value);
}
//-->

</script>
<div id="footer">
共执行 3 个查询，用时 0.012455 秒，Gzip 已禁用，内存占用 1.923 MB<br>
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