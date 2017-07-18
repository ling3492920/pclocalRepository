<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ECSHOP 管理中心 - 订单列表 </title>
<link href="${baseurl}admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl}admin/styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${baseurl }admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${baseurl }admin/js/utils.js"></script>
<script type="text/javascript" src="${baseurl }admin/js/util.js"></script>
<script type="text/javascript">
var path='${baseurl}';
var order_sn;
var consignee;
var composite_status;
var gotoPage=1;
var orderbycolum;
$(function(){
	//1.加载订单列表
	loadOrder();
	//2.初始化分页栏
	initLimt();
	
});

//动态加载订单列表
function loadOrder(){
	//1.获取订单号，获取收货人姓名 获取订单状态 获取gotoPage与pageSize
	order_sn=$("#order_sn").val()==''?null:$("#order_sn").val();
	consignee=$("#consignee").val()==""?null:$("#consignee").val();
	//待确认：0 0 in (0)----val=0
	//待发货：1 2 in (0,3,4)val=100 
	//待付款: 1 0 in (1,0)  val=101
	//已完成：1 2 in (1,2)  val=102
	//付款中：              val=1
	//取消：  2 0 0			val=2
	//无效：  3 0 0         val=3
	//退货    4 0 0			val=4
	composite_status=$("#status").val()=="-1"?null:$("#status").val();
	var order_status,pay_status,ship_statu;
	if(composite_status==0){
		order_status=0,pay_status=0,ship_statu=new Array('0');//如果只有一个元素，需要把值改成字符形式 否则会被认为是length值
	}else if(composite_status==100){
		order_status=1,pay_status=2,ship_statu=new Array(0,3,4);
	}else if(composite_status==101){
		order_status=1,pay_status=0,ship_statu=new Array(1,0);
	}else if(composite_status==102){
		order_status=1,pay_status=2,ship_statu=new Array(1,2);
	}else if(composite_status==2){
		order_status=2,pay_status=0,ship_statu=new Array('0');
	}else if(composite_status==3){
		order_status=3,pay_status=0,ship_statu=new Array('0');
	}else if(composite_status==4){
		order_status=4,pay_status=0,ship_statu=new Array('0');
	}else if(composite_status==1){//==1付款中的情况
		order_status=1,pay_status=1,ship_statu=new Array('0');
	}
	gotoPage=$("#gotoPage").val();
	pageSize=$("#pageSize").val();
	startLine=(parseInt(gotoPage)-1)*pageSize;
	$("#pageCurrent").text(gotoPage);
	var coiobj = {"order_sn":order_sn,"consignee":consignee,"order_status":order_status,"orderbycolum":orderbycolum,
			"pay_status":pay_status,"ship_statu":ship_statu,"startLine":startLine,"pageSize":pageSize};
	//console.log(coiobj);
	var coi=JSON.stringify(coiobj);
	
	$.ajax({
		url:path+"aorder/lst.do",
		type:"post",
		dataType:"json",
		data:coi,
		contentType:"application/json;charset=utf-8",
		success:function(res){
			if(res.state==0){
				var map = res.data;
				var ois = map.ois;
				//console.log("该分页记录数"+ois.length);
				//console.log("查询到总记录数:"+count);
				$("#order_lst").empty();
				$("#order_lst").append(createTR(ois));
				
				$("#totalRecords").text(map.count)
				
			}else{
				alert("没有查到订单！");
			}
		}
		//,
		//error:function(){
		//	alert("服务器异常！");
		//}
		,
		async:false
		
	});
	
	
}
//拼一个tr
function createTR(ois){
	var tr='';
	for(var i=0;i<ois.length;i++){
		//<font color="red">无效</font>,未付款,未发货</td>
		var order_status,pay_status,shipping_status;
		if(ois[i].order_status==3){
			order_status='<font color="red">无效</font>';
		}else if(ois[i].order_status==2){
			order_status="取消"
		}else if(ois[i].order_status==1){
			order_status="已确认"
		}else if(ois[i].order_status==0){
			order_status="未确认"
		}else if(ois[i].order_status==4){
			order_status="退货"
		}
		if(ois[i].pay_status==0){
			pay_status="未付款"
		}else if(ois[i].pay_status==1){
			pay_status="付款中"
		}else if(ois[i].pay_status==2){
			pay_status="已付款"
		}
		if(ois[i].shipping_status==0){
			shipping_status="未发货"
		}else if(ois[i].shipping_status==1){
			shipping_status="已发货"
		}else if(ois[i].shipping_status==2){
			shipping_status="收货确认"
		}else if(ois[i].shipping_status==3){
			shipping_status="配货中"
		}else if(ois[i].shipping_status==4){
			shipping_status="已发货(部分商品)"
		}
		
		tr+='<tr>'+
		    '<td valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);"><input type="checkbox" name="checkboxes" value='+ois[i].order_sn+'><a href="order.php?act=info&amp;order_id=27" id="order_0">'+ois[i].order_sn+'</a></td>'+
		    '<td style="background-color: rgb(255, 255, 255);">'+ois[i].consignee+'<br>06-17 14:33</td>'+
		    '<td align="left" valign="top" style="background-color: rgb(255, 255, 255);"><a href="mailto: '+ois[i].email+'"> '+ois[i].consignee+'</a> [TEL: '+ois[i].tel+'] <br>'+ois[i].address+'</td>'+
		    '<td align="right" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">￥'+ois[i].order_amount+'元</td>'+
		    '<td align="right" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">￥'+ois[i].order_amount+'元</td>'+
		    '<td align="center" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">'+order_status+','+pay_status+','+shipping_status+
		    '<td align="center" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">'+
		     '<a href="orderinfo.jsp">查看</a><br>'+
		     '<a href="javascript:;" onclick="remove('+ois[i].order_id+')">移除</a>'+
		    '</td>'+
		  '</tr>';
	}
	return tr;
}
function searchOrder(){
	/*
    order_sn= Utils.trim(document.forms['searchForm'].elements['order_sn'].value);
    consignee = Utils.trim(document.forms['searchForm'].elements['consignee'].value);
    composite_status = document.forms['searchForm'].elements['status'].value;
    */
    $("#gotoPage").val(1);
    $("#pageSize").val(15);
    loadOrder();
    initLimt();
}
function ogotoPage(){
	loadOrder();
}
function gotoPageFirst(){
	$("#gotoPage").val(1);
	$("#pageCurrent").text(1);
	loadOrder();
}
function gotoPagePrev(){
	gotoPage=$("#gotoPage").val();
	if(gotoPage==1){
		alert("已经是第一页了！")
		return;
	}
	$("#pageCurrent").text(parseInt(gotoPage)-1);
	$("#gotoPage").val(parseInt(gotoPage)-1);
	loadOrder();
}
function gotoPageNext(){
	gotoPage=$("#gotoPage").val();
	if(gotoPage==$("#totalPages").text()){
		alert("已经到最后一页了！")
		return;
	}
	$("#gotoPage").val(parseInt(gotoPage)+1);
	$("#pageCurrent").text(parseInt(gotoPage)+1);
	loadOrder();
}
function gotoPageLast(){
	$("#gotoPage").val($("#totalPages").text());
	$("#pageCurrent").text($("#totalPages").text());
	loadOrder();
}
function resetpageSize(){
	$("#gotoPage").val(1);
	$("#pageCurrent").text(1);
	loadOrder();//重新加载列表
	initLimt();//根据总页数和gotopage,pageSize初始化分页栏
}
/**
 * 按字段名排序
 * sort_by:字段名
   sort_order:顺序 ASC/DESC
 */
var sort_order1="ASC";
//var sort_bayarr=new Array("add_time","consignee","order_amount","order_amount");
var sort_by1=null;
function sort(sort_by,sort_order){
   if (sort_by1 == sort_by){//第一次执行排序时，sort_by1==null,第二次执行时，sort_by1==sort_by时
	   sort_order1=sort_order1 == "DESC" ? "ASC" : "DESC";//第二判断发现=="DESC"就会按"ASC"执行
   }else{
	 sort_by1=sort_by;//第一次执行排序，把当前sort_by的值赋给aort_by1
	 sort_order1 = "DESC";//第一次执行，按"DESC"执行
   }
	orderbycolum=sort_by1+" "+sort_order1;
	loadOrder();
}
</script>
</head>
<body style="cursor: auto;">

<h1>
<span class="action-span"><a href="order_query.jsp">订单查询</a></span>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 订单列表 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="${baseurl}admin/js/utils.js"></script>
<script type="text/javascript" src="${baseurl}admin/js/listtable.js"></script>
<!-- 订单搜索 -->
<div class="form-div">
  <form action="javascript:searchOrder()" name="searchForm">
    <img src="${baseurl}admin/images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH">
    订单号<input name="order_sn" type="text" id="order_sn" size="15">
    收货人<input name="consignee" type="text" id="consignee" size="15">
    订单状态    <select name="status" id="status">
      <option value="-1">请选择...</option>
      <option value="0" >待确认</option>
      <option value="100">待付款</option>
      <option value="101">待发货</option>
      <option value="102">已完成</option>
      <option value="1">付款中</option>
      <option value="2">取消</option>
      <option value="3">无效</option>
      <option value="4">退货</option>    
      </select>
    <input type="submit" value=" 搜索 " class="button">
    <!--  
    <a href="order.php?act=list&amp;composite_status=0">待确认</a>
    <a href="order.php?act=list&amp;composite_status=100">待付款</a>
    <a href="order.php?act=list&amp;composite_status=101">待发货</a>
    -->
  </form>
</div>

<!-- 订单列表 -->
<form method="post" action="order.php?act=operate" name="listForm" onsubmit="return check()">
  <div class="list-div" id="listDiv">

<table cellpadding="3" cellspacing="1">
<thead>
	<tr>
	    <th>
	      <input onclick="" type="checkbox"><a href="">订单号</a>    </th>
	    <th><a href="javascript:sort('add_time', 'DESC');">下单时间</a><img src="${baseurl}admin/images/sort_desc.gif"></th>
	    <th><a href="javascript:sort('consignee', 'DESC');">收货人</a></th>
	    <th><a href="javascript:sort('order_amount', 'DESC');">总金额</a></th>
	    <th><a href="javascript:sort('order_amount', 'DESC');">应付金额</a></th>
	    <th>订单状态</th>
	    <th>操作</th>
	</tr>
</thead>
  <tbody id="order_lst">
	  <tr>
	    <td valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);"><input type="checkbox" name="checkboxes" value="2017061790607"><a href="order.php?act=info&amp;order_id=27" id="order_0">2017061790607</a></td>
	    <td style="background-color: rgb(255, 255, 255);">匿名用户<br>06-17 14:33</td>
	    <td align="left" valign="top" style="background-color: rgb(255, 255, 255);"><a href="mailto:"> </a> <br></td>
	    <td align="right" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">￥0.00元</td>
	    <td align="right" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">￥0.00元</td>
	    <td align="center" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);"><font color="red">无效</font>,未付款,未发货</td>
	    <td align="center" valign="top" nowrap="nowrap" style="background-color: rgb(255, 255, 255);">
	     <a href="orderinfo.jsp">查看</a><br>
	     <a href="javascript:;" onclick="listTable.remove(27, remove_confirm, 'remove_order')">移除</a>
	    </td>
	  </tr>
  </tbody>
  </table>

<!-- 分页 -->
<table id="page-table" cellspacing="0">
  <tbody><tr>
    <td align="right" nowrap="true">
          <!-- $Id: page.htm 14216 2008-03-10 02:27:21Z testyang $ -->
            <div id="turn-page">
        总计  <span id="totalRecords">25</span>
        个记录分为 <span id="totalPages">2</span>
        页当前第 <span id="pageCurrent">1</span>
        页，每页 <input type="text" size="3"  onchange="resetpageSize()" id="pageSize" value="15" >
        <span id="page-link">
          <a href="javascript:gotoPageFirst();">第一页</a>
          <a href="javascript:gotoPagePrev();">上一页</a>
          <a href="javascript:gotoPageNext();">下一页</a>
          <a href="javascript:gotoPageLast();">最末页</a>
          <select id="gotoPage" onchange="ogotoPage();">
            <option value="1">1</option>
            <option value="2">2</option>
          </select>
        </span>
      </div>
    </td>
  </tr>
</tbody>
</table>

  </div>
  <div>
    <input name="confirm" type="submit" id="btnSubmit" value="确认" class="button" disabled="true" onclick="this.form.target = '_self'">
    <input name="invalid" type="submit" id="btnSubmit1" value="无效" class="button" disabled="true" onclick="this.form.target = '_self'">
    <input name="cancel" type="submit" id="btnSubmit2" value="取消" class="button" disabled="true" onclick="this.form.target = '_self'">
    <input name="remove" type="submit" id="btnSubmit3" value="移除" class="button" disabled="true" onclick="this.form.target = '_self'">
    <input name="print" type="submit" id="btnSubmit4" value="打印订单" class="button" disabled="true" onclick="this.form.target = '_blank'">
    <input name="batch" type="hidden" value="1">
    <input name="order_id" type="hidden" value="">
  </div>
</form>
<div id="footer">
共执行 4 个查询，用时 0.025174 秒，Gzip 已禁用，内存占用 4.027 MB<br>
版权所有 © 2005-2009 上海商派网络科技有限公司，并保留所有权利。</div>
<!-- 新订单提示信息 -->
<div id="popMsg" style="visibility: hidden; display: none; bottom: 1px;">
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

<div id="order_goods_layer" class="order-goods" style="top: 517px; left: 100px; display: none;"><table width="100%" cellpadding="3" cellspacing="1">
  <tbody><tr>
    <td scope="col"><div align="center"><strong>商品名称 [ 品牌 ]</strong></div></td>
    <td scope="col"><div align="center"><strong>货号</strong></div></td>
    <td scope="col"><div align="center"><strong>价格</strong></div></td>
    <td scope="col"><div align="center"><strong>数量</strong></div></td>
    <td scope="col"><div align="center"><strong>属性</strong></div></td>
    <td scope="col"><div align="center"><strong>库存</strong></div></td>
    <td scope="col"><div align="center"><strong>小计</strong></div></td>
  </tr>
    <tr>
        <td><img src="http://localhost/ws/ecshop/upload/images/201704/thumb_img/33_thumb_G_1492764521668.jpg"><br><a href="${baseurl}admin/goods.php?id=33" target="_blank">t商品名称 [ 金立 ]        </a></td>
        <td>ECS000033</td>
    <td><div align="right">￥150.00元</div></td>
    <td><div align="right">2    </div></td>
    <td></td>
    <td><div align="right">50</div></td>
    <td><div align="right">￥300.00元</div></td>
  </tr>
  </tbody></table></div></body></html>