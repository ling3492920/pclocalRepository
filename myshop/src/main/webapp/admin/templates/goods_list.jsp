<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ include file="/admin/tag.jsp"%>      
<!DOCTYPE html>
<html>
<head>
<title>ECSHOP 管理中心 - 商品列表 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${baseurl }admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl }admin/styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${baseurl }admin/js/common.js"></script>
<script type="text/javascript" src="${baseurl }admin/js/jquery.min.js"></script>
<script type="text/javascript">
var path="${baseurl}";
</script>
<script src="${baseurl }admin/js/goodslst.js"></script>
<script type="text/javascript">
	$(function(){
		//1.加载商品列表
		loadGoodList();
		//2.分页处理
		limit();
		//3.为pageSize绑定实时内容变更事件
		$('#pageSize').bind('input propertychange', function() {
			$("#pageCurrent").text(1);//只要改每页显示条数，默认回到第一页显示
			$("#gotoPage").val(1);
			limit();//重新加载分页栏
			loadGoodList();//根据新加载分页栏，重新加载goodList
		});
		//4.为gotoPage绑定内容实时变更事件
		$('#gotoPage').bind('input propertychange', function() {
			$("#pageCurrent").text($(this).val());
			loadGoodList();//根据新加载分页栏，重新加载goodList
		});
		
	})
	$(document).ready(function(){
		var value;
		//对table现在以及未来其子元素span绑定单击时间函数
	    $("#goods_list").on("click","span",function(){
	        var num=$(this).text();
	        value=num;
	        var width="width:"+(num.length*12)+"px";
	        var p=$(this).parent();
	        p.empty();
	        var input='<input type="text" onblur="outFocus(this)" style='+width+' value='+num+'>';
	        p.append(input);
	        p.children().eq(0).focus();
	    });
	    //change事件，是改变input值后，需要在单机一下其它地方，再触发（相当于确认改变的状态）
	    //如果input值不改变，点击其它地方，事件也不会触发
	    $("#goods_list").on("change","input",function(){
	        //1.获取到改变后的值
	        var num=$(this).val();
	        //2.真是业务中，发送ajax请求，对该字段值进行改变，回调函数返回成功结果
	        var id=$(this).parent().parent().children().eq(0).text();//获取父元素的父元素的第一个孩子的内容
	        var str=$(this).parent().attr("name");
	        //console.log("num="+num+",id="+id+",str="+str);
	        var flag=editBase(id,str,num);
	        //console.log("flag="+flag);
	        if(flag){
	        	//3.如果成功，获取当前元素的父元素，并清空
		        var p=$(this).parent();
		        p.empty();
		        
		        //4.拼接一个新元素，把成功改变后的值填充进去
		        var span='<span style="width: 100%">'+num+'</span>';
		        //5.通过父元素，把新的子元素追加进去显示
		        p.append(span);
		        return;
	        }
	        //4.如果，把修改后的值恢复
	        $(this).val(value);
	        return;  
	    });
	});
	/*
	直接在列表上修改基本信息的字段值
	str:字段名称
	val:对应字段值
	*/
	
	function editBase(id,str,val){
		var flag;
		$.ajax({
			url:path+"agoods/editBase.do",
			type:"get",
			data:{id:id,str:str,val:val},
			dataType:"json",
			success:function(res){
				if(res.state==0){
					flag=true;
				}else{
					flag=false;
				}	
			},
			error:function(){
				alert("服务器异常，稍后再试！");
			},
			async:false
		})
		return flag;
	}
function searchGoods(obj){
	var cs = $(obj).parent().children();
	var cat_id = cs.eq(1).val()==0?null:cs.eq(1).val();
	var brand_id = cs.eq(2).val()==0?null:cs.eq(2).val();
	var intro_type = cs.eq(3).val();
	var is_best=null;is_new=null;is_hot=null;is_promote=null;
	if(intro_type=="0"){is_best=null;is_new=null;is_hot=null;is_promote=null;}
	if(intro_type=="is_best"){is_best=1}
	if(intro_type=="is_new"){is_new=1}
	if(intro_type=="is_hot"){is_hot=1}
	if(intro_type=="is_promote"){is_promote=1}
	if(intro_type=="all_type"){is_best=1;is_new=1;is_hot=1;is_promote=1}
	var suppliers_id = cs.eq(4).val()==0?null:cs.eq(4).val();
	var is_on_sale = cs.eq(5).val()==""?null:cs.eq(5).val();
	var keyword = cs.eq(6).val()==""?null:cs.eq(6).val();
	//console.log("cat_id="+cat_id+",brand_id="+brand_id+",intro_type="+intro_type+",suppliers_id="+suppliers_id+
	//		",is_on_sale="+is_on_sale+",keyword="+keyword);
	var customGoods = {"cat_id":cat_id,"brand_id":brand_id,"is_best":is_best,"is_new":is_new,"is_hot":is_hot,
			"is_promote":is_promote,"suppliers_id":suppliers_id,"is_on_sale":is_on_sale,"keywords":keyword,
			"is_delete":0,"startLine":0,"pageSize":15};
	//console.log(customGoods);
	var cgs = JSON.stringify(customGoods);
	console.log(cgs);
	$.ajax({
		url:path+"agoods/search.do",
		type:"post",
		data:cgs,
		dataType:"json",
		contentType:"application/json;charset=utf-8",	
		success:function(res){
			if(res.state==0){
				var gs = res.data;
				console.log("gs.length="+gs.length);
				var tr = itroGood(gs);//调用拼接方法
				$("#goods_list").empty();
				$("#goods_list").append(tr);	
			}else{
				//$("#goods_list").empty();
				//$("#goods_list").append();
			}
			
		}
	});
	//再发送一个ajax请求，请求总记录数。为了分页栏的处理……参数依然是cgs
	/*
	$.ajax({
		url:path+"agoods/searchCount.do",
		type:"post",
		data:cgs,
		dataType:"json",
		contentType:"application/json;charset=utf-8",	
		success:function(res){
			if(res.state==0){
				var count = res.data;
				console.log("count="+count);
				
				//
			}else{
				//$("#goods_list").empty();
				//$("#goods_list").append();
			}
			
		}
	});
	*/
}
</script>

</head>
<body>

<h1>
<shiro:hasPermission name="goods:add:edit">
<span class="action-span"><a href="${baseurl }admin/itemManage/addgoods.jsp">添加新商品</a></span>
</shiro:hasPermission>
<span class="action-span1"><a href="#">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 商品列表 </span>
<div style="clear:both"></div>
</h1>
<script type="text/javascript" src="${baseurl }admin/js/utils.js"></script>

<script type="text/javascript" src="${baseurl }admin/js/listtable.js"></script>

<!-- 商品搜索 -->
<!-- $Id: goods_search.htm 16790 2009-11-10 08:56:15Z wangleisvn $ -->
<div class="form-div">
    <img src="${baseurl }admin/images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH">
        <!-- 分类 -->
    <select name="cat_id"><option value="0">所有分类</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option><option value="16">书籍</option><option value="17">&nbsp;&nbsp;&nbsp;&nbsp;一千零一夜</option><option value="1">手机类型</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option></select>
    <!-- 品牌 -->
    <select name="brand_id"><option value="0">所有品牌</option><option value="1">诺基亚</option><option value="10">金立</option><option value="9">联想</option><option value="8">LG</option><option value="7">索爱</option><option value="6">三星</option><option value="5">夏新</option><option value="4">飞利浦</option><option value="3">多普达</option><option value="2">摩托罗拉</option><option value="11">  恒基伟业</option></select>
    <!-- 推荐 -->
    <select name="intro_type">
	    <option value="0">全部</option>
	    <option value="is_best">精品</option>
	    <option value="is_new">新品</option>
	    <option value="is_hot">热销</option>
	    <option value="is_promote">特价</option>
	    <option value="all_type">全部推荐</option>
    </select>
         
      <!-- 供货商 -->
      <select name="suppliers_id"><option value="0">全部</option><option value="1">北京供货商</option><option value="2">上海供货商</option></select>
            <!-- 上架 -->
      <select name="is_on_sale"><option value="">全部</option><option value="1">上架</option><option value="0">下架</option></select>
        <!-- 关键字 -->
    关键字 <input type="text" name="keyword" size="15">
    <input type="button" onclick="searchGoods(this)" value=" 搜索 " class="button"> 
</div>
<!-- 商品列表 -->
<form method="post" action="" name="listForm" onsubmit="return confirmSubmit(this)">
  <!-- start goods list -->
  <div class="list-div" id="listDiv">
	<table cellpadding="3" cellspacing="1">
	<thead>
		<tr>
		   <th>
		     <input onclick="" type="checkbox">
		     <a href="javascript:listTable.sort('goods_id');">编号</a><img src="${baseurl }admin/images/sort_desc.gif"></th>
		   <th><a href="javascript:listTable.sort('goods_name');">商品名称</a></th>
		   <th><a href="javascript:listTable.sort('goods_sn');">货号</a></th>
		   <th><a href="javascript:listTable.sort('shop_price');">价格</a></th>
		   <th><a href="javascript:listTable.sort('is_on_sale');">上架</a></th>
		   <th><a href="javascript:listTable.sort('is_best');">精品</a></th>
		   <th><a href="javascript:listTable.sort('is_new');">新品</a></th>
		   <th><a href="javascript:listTable.sort('is_hot');">热销</a></th>
		   <th><a href="javascript:listTable.sort('sort_order');">推荐排序</a></th>
		   <th><a href="javascript:listTable.sort('goods_number');">库存</a></th>
		   <th>操作</th>
		</tr>
	</thead>
	  <tbody id="goods_list">
	  	
	  </tbody>
	</table>
<!-- end goods list -->

<!-- 分页 -->
<table id="page-table" cellspacing="0">
  <tbody><tr>
    <td align="right" nowrap="true">
          <!-- $Id: page.htm 14216 2008-03-10 02:27:21Z testyang $ -->
            <div id="turn-page">
        总计  <span id="totalRecords">22</span>
        个记录分为 <span id="totalPages">2</span>
        页当前第 <span id="pageCurrent">1</span>
        页，每页 <input type="text" size="3" id="pageSize" value="15" onkeypress="return listTable.changePageSize(event)">
        <span id="page-link">
          <a href="javascript:gotoPageFirst()">第一页</a>
          <a href="javascript:gotoPagePrev()">上一页</a>
          <a href="javascript:gotoPageNext()">下一页</a>
          <a href="javascript:gotoPageLast()">最末页</a>
          <select id="gotoPage">
            <option value="1">1</option><option value="2">2</option>
          </select>
        </span>
      </div>
    </td>
  </tr>
</tbody>
</table>

</div>

<div>
  <input type="hidden" name="act" value="batch">
  <select name="type" id="selAction" onchange="changeAction()">
    <option value="">请选择...</option>
    <option value="trash">回收站</option>
    <option value="on_sale">上架</option>
    <option value="not_on_sale">下架</option>
    <option value="best">精品</option>
    <option value="not_best">取消精品</option>
    <option value="new">新品</option>
    <option value="not_new">取消新品</option>
    <option value="hot">热销</option>
    <option value="not_hot">取消热销</option>
    <option value="move_to">转移到分类</option>
	    <option value="suppliers_move_to">转移到供货商</option>
	    
  </select>
  <select name="target_cat" style="display:none">
    <option value="0">请选择...</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option><option value="16">书籍</option><option value="17">&nbsp;&nbsp;&nbsp;&nbsp;一千零一夜</option><option value="1">手机类型</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option>  </select>
	  <!--二级主菜单：转移供货商-->
  <select name="suppliers_id" style="display:none">
    <option value="-1">请选择...</option>
    <option value="0">转移到网店</option>
          <option value="1">北京供货商</option>
          <option value="2">上海供货商</option>
      </select>
  <!--end!-->
	  
    <input type="hidden" name="extension_code" value="">
    <input type="submit" value=" 确定 " id="btnSubmit" name="btnSubmit" class="button" disabled="true">
</div>
</form>

<div id="footer">
共执行 6 个查询，用时 0.022674 秒，Gzip 已禁用，内存占用 2.799 MB<br>
版权所有 © 2005-2009 上海商派网络科技有限公司，并保留所有权利。</div>
<!-- 新订单提示信息 -->
<div id="popMsg">
  <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#cfdef4" border="0">
  <tbody>
  <tr>
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

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="${baseurl }admin/images/online.swf">
  <param name="quality" value="high">
  <embed src="${baseurl }admin/images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
</object>
</body>
</html>