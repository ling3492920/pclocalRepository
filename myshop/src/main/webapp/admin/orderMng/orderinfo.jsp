<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECSHOP 管理中心 - 订单信息 </title>
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
var remove_confirm = "删除订单将清除该订单的所有信息。您确定要这么做吗？";
var confirm_merge = "您确实要合并这两个订单吗？";
var input_price = "自定义价格";
var pls_search_user = "请搜索并选择会员";
var confirm_drop = "确认要删除该商品吗？";
var invalid_goods_number = "商品数量不正确";
var pls_search_goods = "请搜索并选择商品";
var pls_select_area = "请完整选择所在地区";
var pls_select_shipping = "请选择配送方式";
var pls_select_payment = "请选择支付方式";
var pls_select_pack = "请选择包装";
var pls_select_card = "请选择贺卡";
var pls_input_note = "请您填写备注！";
var pls_input_cancel = "请您填写取消原因！";
var pls_select_refund = "请选择退款方式！";
var pls_select_agency = "请选择办事处！";
var pls_select_other_agency = "该订单现在就属于这个办事处，请选择其他办事处！";
var loading = "加载中...";
//-->
</script>
</head>
<body>

<h1>
<span class="action-span"><a href="order_lst.jsp">订单列表</a></span>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 订单信息 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="../js/topbar.js"></script>
<script type="text/javascript" src="../js/utils.js"></script>
<script type="text/javascript" src="../js/listtable.js"></script>
<script type="text/javascript" src="../js/selectzone.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<div id="topbar">
  <div align="right"><a href="" onclick="closebar(); return false"><img src="../images/close.gif" border="0"></a></div>
  <table width="100%" border="0">
    <caption><strong> 购货人信息 </strong></caption>
    <tbody><tr>
      <td> 电子邮件 </td>
      <td> <a href="mailto:2634243151@qq.com">2634243151@qq.com</a> </td>
    </tr>
    <tr>
      <td> 账户余额 </td>
      <td> ￥0.00元 </td>
    </tr>
    <tr>
      <td> 消费积分 </td>
      <td> 0 </td>
    </tr>
    <tr>
      <td> 等级积分 </td>
      <td> 0 </td>
    </tr>
    <tr>
      <td> 会员等级 </td>
      <td> 注册用户 </td>
    </tr>
    <tr>
      <td> 红包数量 </td>
      <td> 0 </td>
    </tr>
  </tbody></table>

    <table width="100%" border="0">
    <caption><strong> 收货人 : 王小北 </strong></caption>
    <tbody><tr>
      <td> 电子邮件 </td>
      <td> <a href="mailto:2634243151@qq.com">2634243151@qq.com</a> </td>
    </tr>
    <tr>
      <td> 地址 </td>
      <td> 九亭翠亭别墅30号204 </td>
    </tr>
    <tr>
      <td> 邮编 </td>
      <td> 465465 </td>
    </tr>
    <tr>
      <td> 电话 </td>
      <td> 1871212121 </td>
    </tr>
    <tr>
      <td> 备用电话 </td>
      <td> 18721564564 </td>
    </tr>
  </tbody></table>
    <table width="100%" border="0">
    <caption><strong> 收货人 : 李四第二 </strong></caption>
    <tbody><tr>
      <td> 电子邮件 </td>
      <td> <a href="mailto:2634243151@qq.com">2634243151@qq.com</a> </td>
    </tr>
    <tr>
      <td> 地址 </td>
      <td> 壶口黄河 </td>
    </tr>
    <tr>
      <td> 邮编 </td>
      <td> 455555656 </td>
    </tr>
    <tr>
      <td> 电话 </td>
      <td> 45654646 </td>
    </tr>
    <tr>
      <td> 备用电话 </td>
      <td> 14544545 </td>
    </tr>
  </tbody></table>
  </div>

<form action="order.php?act=operate" method="post" name="theForm">
<div class="list-div" style="margin-bottom: 5px">
<table width="100%" cellpadding="3" cellspacing="1">
  <tbody><tr>
    <td colspan="4">
      <div align="center">
        <input name="prev" type="button" class="button" onclick="location.href='order.php?act=info&amp;order_id=25';" value="前一个订单">
        <input name="next" type="button" class="button" onclick="location.href='order.php?act=info&amp;order_id=27';" value="后一个订单">
        <input type="button" onclick="window.open('order.php?act=info&amp;order_id=26&amp;print=1')" class="button" value="打印订单">
    </div></td>
  </tr>
  <tr>
    <th colspan="4">基本信息</th>
  </tr>
  <tr>
    <td width="18%"><div align="right"><strong>订单号：</strong></div></td>
    <td width="34%">2017052351638</td>
    <td width="15%"><div align="right"><strong>订单状态：</strong></div></td>
    <td>未确认,未付款,未发货</td>
  </tr>
  <tr>
    <td><div align="right"><strong>购货人：</strong></div></td>
    <td>李四 [ <a href="" onclick="staticbar();return false;">显示购货人信息</a> ] [ <a href="user_msg.php?act=add&amp;order_id=26&amp;user_id=6">发送/查看留言</a> ]</td>
    <td><div align="right"><strong>下单时间：</strong></div></td>
    <td>2017-05-23 10:04:22</td>
  </tr>
  <tr>
    <td><div align="right"><strong>支付方式：</strong></div></td>
    <td>银行汇款/转帐<a href="order.php?act=edit&amp;order_id=26&amp;step=payment" class="special">编辑</a>
    (备注: <span onclick="listTable.edit(this, 'edit_pay_note', 26)">N/A</span>)</td>
    <td><div align="right"><strong>付款时间：</strong></div></td>
    <td>未付款</td>
  </tr>
  <tr>
    <td><div align="right"><strong>配送方式：</strong></div></td>
    <td>申通快递<a href="order.php?act=edit&amp;order_id=26&amp;step=shipping" class="special">编辑</a>&nbsp;&nbsp;<input type="button" onclick="window.open('order.php?act=info&amp;order_id=26&amp;shipping_print=1')" class="button" value="打印快递单"> </td>
    <td><div align="right"><strong>发货时间：</strong></div></td>
    <td>未发货</td>
  </tr>
  <tr>
    <td><div align="right"><strong>发货单号：</strong></div></td>
    <td></td>
    <td><div align="right"><strong>订单来源：</strong></div></td>
    <td>本站</td>
  </tr>
  <tr>
    <th colspan="4">其他信息<a href="order.php?act=edit&amp;order_id=26&amp;step=other" class="special">编辑</a></th>
    </tr>
  <tr>
    <td><div align="right"><strong>发票类型：</strong></div></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><strong>发票抬头：</strong></div></td>
    <td></td>
    <td><div align="right"><strong>发票内容：</strong></div></td>
    <td></td>
  </tr>
  <tr>
    <td><div align="right"><strong>客户给商家的留言：</strong></div></td>
    <td colspan="3"></td>
  </tr>
  <tr>
    <td><div align="right"><strong>缺货处理：</strong></div></td>
    <td>等待所有商品备齐后再发</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><strong>包装：</strong></div></td>
    <td></td>
    <td><div align="right"><strong>贺卡：</strong></div></td>
    <td></td>
  </tr>
  <tr>
    <td><div align="right"><strong>贺卡祝福语：</strong></div></td>
    <td colspan="3"></td>
  </tr>
  <tr>
    <td><div align="right"><strong>商家给客户的留言：</strong></div></td>
    <td colspan="3"></td>
  </tr>
  <tr>
    <th colspan="4">收货人信息<a href="order.php?act=edit&amp;order_id=26&amp;step=consignee" class="special">编辑</a></th>
    </tr>
  <tr>
    <td><div align="right"><strong>收货人：</strong></div></td>
    <td>李四第二</td>
    <td><div align="right"><strong>电子邮件：</strong></div></td>
    <td>2634243151@qq.com</td>
  </tr>
  <tr>
    <td><div align="right"><strong>地址：</strong></div></td>
    <td>[中国  江西  南昌  东湖区] 壶口黄河</td>
    <td><div align="right"><strong>邮编：</strong></div></td>
    <td>455555656</td>
  </tr>
  <tr>
    <td><div align="right"><strong>电话：</strong></div></td>
    <td>45654646</td>
    <td><div align="right"><strong>手机：</strong></div></td>
    <td>14544545</td>
  </tr>
  <tr>
    <td><div align="right"><strong>标志性建筑：</strong></div></td>
    <td>撒啊</td>
    <td><div align="right"><strong>最佳送货时间：</strong></div></td>
    <td>周末或晚上6点后</td>
  </tr>
</tbody></table>
</div>

<div class="list-div" style="margin-bottom: 5px">
<table width="100%" cellpadding="3" cellspacing="1">
  <tbody><tr>
    <th colspan="7" scope="col">商品信息<a href="order.php?act=edit&amp;order_id=26&amp;step=goods" class="special">编辑</a></th>
    </tr>
  <tr>
    <td scope="col"><div align="center"><strong>商品名称 [ 品牌 ]</strong></div></td>
    <td scope="col"><div align="center"><strong>货号</strong></div></td>
    <td scope="col"><div align="center"><strong>价格</strong></div></td>
    <td scope="col"><div align="center"><strong>数量</strong></div></td>
    <td scope="col"><div align="center"><strong>属性</strong></div></td>
    <td scope="col"><div align="center"><strong>库存</strong></div></td>
    <td scope="col"><div align="center"><strong>小计</strong></div></td>
  </tr>
    <tr>
    <td>
        <a href="../goods.php?id=9" target="_blank">诺基亚E66 [ 诺基亚 ]        </a>
        </td>
    <td>ECS000009</td>
    <td><div align="right">￥2298.00元</div></td>
    <td><div align="right">1    </div></td>
    <td>颜色:白色 <br>
</td>
    <td><div align="right">13</div></td>
    <td><div align="right">￥2298.00元</div></td>
  </tr>
    <tr>
    <td></td>
    <td>&nbsp;</td>
    <td><div align="right"><strong>商品总重量：    </strong></div></td>
    <td><div align="right">121克    </div></td>
    <td>&nbsp;</td>
    <td><div align="right"><strong>合计：</strong></div></td>
    <td><div align="right">￥2298.00元</div></td>
  </tr>
</tbody></table>
</div>

<div class="list-div" style="margin-bottom: 5px">
<table width="100%" cellpadding="3" cellspacing="1">
  <tbody><tr>
    <th>费用信息<a href="order.php?act=edit&amp;order_id=26&amp;step=money" class="special">编辑</a></th>
  </tr>
  <tr>
    <td><div align="right">商品总金额：<strong>￥2298.00元</strong>
- 折扣：<strong>￥0.00元</strong>     + 发票税额：<strong>￥0.00元</strong>
      + 配送费用：<strong>￥15.00元</strong>
      + 保价费用：<strong>￥0.00元</strong>
      + 支付费用：<strong>￥0.00元</strong>
      + 包装费用：<strong>￥0.00元</strong>
      + 贺卡费用：<strong>￥0.00元</strong></div></td>
  </tr><tr>
    <td><div align="right"> = 订单总金额：<strong>￥2313.00元</strong></div></td>
  </tr>
  <tr>
    <td><div align="right">
      - 已付款金额：<strong>￥0.00元</strong> - 使用余额： <strong>￥0.00元</strong>
      - 使用积分： <strong>￥0.00元</strong>
      - 使用红包： <strong>￥0.00元</strong>
    </div></td>
  </tr><tr>
    <td><div align="right"> = 应付款金额：<strong>￥2313.00元</strong>
      </div></td>
  </tr>
</tbody></table>
</div>

<div class="list-div" style="margin-bottom: 5px">
<table cellpadding="3" cellspacing="1">
  <tbody><tr>
    <th colspan="6">操作信息</th>
  </tr>
  <tr>
    <td><div align="right"><strong>操作备注：</strong></div></td>
  <td colspan="5"><textarea name="action_note" cols="80" rows="3"></textarea></td>
    </tr>
  <tr>
    <td><div align="right"></div>
      <div align="right"><strong>当前可执行操作：</strong> </div></td>
    <td colspan="5">      <input name="confirm" type="submit" value="确认" class="button">
                 <input name="pay" type="submit" value="付款" class="button">
                      <input name="cancel" type="submit" value="取消" class="button">
                 <input name="invalid" type="submit" value="无效" class="button">
           <input name="after_service" type="submit" value="售后" class="button">                        <input name="order_id" type="hidden" value="26"></td>
    </tr>
  <tr>
    <th>操作者：</th>
    <th>操作时间</th>
    <th>订单状态</th>
    <th>付款状态</th>
    <th>发货状态</th>
    <th>备注</th>
  </tr>
  </tbody></table>
</div>
</form>

<script language="JavaScript">

  var oldAgencyId = 0;

  onload = function()
  {
    // 开始检查订单
    startCheckOrder();
  }

  /**
   * 把订单指派给某办事处
   * @param int agencyId
   */
  function assignTo(agencyId)
  {
    if (agencyId == 0)
    {
      alert(pls_select_agency);
      return false;
    }
    if (oldAgencyId != 0 && agencyId == oldAgencyId)
    {
      alert(pls_select_other_agency);
      return false;
    }
    return true;
  }
</script>


<div id="footer">
共执行 17 个查询，用时 0.026940 秒，Gzip 已禁用，内存占用 3.995 MB<br>
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