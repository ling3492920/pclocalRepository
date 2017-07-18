<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ include file="/admin/tag.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ECSHOP 管理中心 - 管理员日志 </title>

<link href="${baseurl}admin/styles/general.css" rel="stylesheet" type="text/css">
<link href="${baseurl}admin/styles/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${baseurl}admin/js/jquery.min.js"></script>

<script type="text/javascript">
var path="${baseurl}";
$(function(){
	//1.初始化分页栏
	initLimt();
	//2.加载ip信息
	loadIPType();
	
	//3.为pageSize绑定实时内容变更事件	
	$('#pageSize').on('input change', function() {
		$("#pageCurrent").text(1);//只要改每页显示条数，默认回到第一页显示
		$("#gotoPage").val(1);
		//分页加载数据最好用ajax请求
		limit();//重新加载分页栏
		
	});
	//4.为gotoPage绑定内容实时变更事件
	$('#gotoPage').bind('input propertychange', function() {
		$("#pageCurrent").text($(this).val());
		limit();
		
	});
	//3.清除对应时间段的日志
	//4.请求删除对应id的日志/批量删除
	/*
	$("#checkAll").on('click',function() {
        $('input[name="subBox"]').attr("checked",this.checked);
    	}
    );
	*/
	$("#checkAll").click(function(){
		$('input[name="subBox"]').prop("checked",this.checked);
	});
    var $subBox = $("input[name='subBox']");
    $subBox.click(function(){
        $("#checkAll").prop("checked",$subBox.length == $("input[name='subBox']:checked").length ? true : false);
        //当被选中的多选框个数大于=1的时候激活清除按钮
        if($("input[name='subBox']:checked").length>=1){
        	$("#btnSubmit").prop("disabled",false);
        }else{
        	$("#btnSubmit").prop("disabled",true); 
        }
    });
});

function delByLog_date(){
	var log_date=$("#log_date").val();
	var now = new Date();
	switch(parseInt(log_date)){
	case 1://一周前
		now.setDate(now.getDate()-7);
		break;
	case 2://一月前
		now.setDate(now.getDate()-30);
		break;
	case 3://三月前
		now.setDate(now.getDate()-90);
		break;
	case 4://半年前
		now.setDate(now.getDate()-180);
		break;
	case 5://1年前
		now.setDate(now.getDate()-360);
		break;
	default:
		now=null;
	}
	//console.log("now="+now.getTime());
	//批量删除导致页面数据变动较大，建议采用表单提交请求方式
	//表单提交请求，服务器做批量删除后，重新加载页面，可以转到tolog.do
	var yesdate = parseInt((now.getTime()+"").substr(0,10));
	$.ajax({
		url:path+"log/delByDate.do",
		type:"get",
		date:{"yesdate":yesdate,"user_id":id},
		dateType:"json",
		success:function(res){
			if(res.state==0){
				alert("成功删除:"+now+"之前的日志");
			}
		}
	})
}
//2.加载ip信息
function loadIPType(){
	$.ajax({
		url:path+"log/findIp.do",
		type:"get",
		dataType:"json",
		success:function(res){
			if(res.state==0){
				$("#ip").empty();
				var ips=res.data;
				var op='<option value="0">选择IP地址</option>';
				for(var i=0;i<ips.length;i++){
					op+='<option value='+ips[i]+'>'+ips[i]+'</option>'
				}
				$("#ip").append(op);
			}
		}
	})
}
//5.根据ip请求当前用户列表
function selectByIp(){
	limit();
	initLimt();
}
//动态加载日志信息的方法
function limit(){
	var pSize=$("#pageSize").val();
	var nPage=$("#gotoPage").val();
	var sLine=(nPage-1)*pSize;
	
	var id='${user_id}'==''?null:'${user_id}';
	var ip=$("#ip").val()==0?null:$("#ip").val();
	
	var calobj={"user_id":id,'ip_address':ip,'startLine':sLine,'pageSize':pSize};
	console.log(calobj);
	var cal = JSON.stringify(calobj);
	$.ajax({
		url:path+"log/auto.do",
		type:"post",
		dataType:"json",
		data:cal,
		contentType:"application/json;charset=utf-8",
		success:function(res){
			if(res.state==0){
				var al = res.data.cals;
				var count = res.data.count;
				var tr=saveTr(al);
				$("#log_list").empty();
				$("#log_list").append(tr);
				$("#totalRecords").text(count);
			}else{
				alert("加载异常！");
			}
		},
		async:false
	});
}
//拼接日志列表
function saveTr(al){
	var tr='';
	for(var i=0;i<al.length;i++){
		tr+='<tr>'+
	    '<td width="10%" style="background-color: rgb(255, 255, 255);"><span><input name="subBox" type="checkbox" value='+al[i].log_id+'>'+al[i].log_id+'</span></td>'+
	    '<td width="15%" class="first-cell" style="background-color: rgb(255, 255, 255);"><span>'+al[i].user_name+'</span></td>'+
	    '<td width="20%" align="center" style="background-color: rgb(255, 255, 255);"><span>'+al[i].dateTime+'</span></td>'+
	    '<td width="15%" align="left" style="background-color: rgb(255, 255, 255);"><span>'+al[i].ip_address+'</span></td>'+
	    '<td width="40%" align="left" style="background-color: rgb(255, 255, 255);"><span>'+al[i].log_info+'</span></td>'+
	  '</tr>';
	}
	return tr;
}
//根据总记录数初始化分页栏方法
function initLimt(){
	//console.log("initLimt……start");
	//1.获取到总记录数量
	var count=$("#totalRecords").text();
	//2.默认pageSize为15，如果特意设置则是设置的值
	if($("#pageSize").val()==0){//排除等于0 的情况
		$("#pageSize").val("");
	}
	var pageSize=$("#pageSize").val()==""?15:$("#pageSize").val();
	var num=Math.ceil(parseInt(count)/pageSize)
	//3.根据计算得出总页数
	$("#totalPages").text(num);
	
	//4.当前第几页由ops选中的来决定
	var pageCurrent=$("#pageCurrent").text($("#gotoPage").val());
	$("#gotoPage").empty()
	var ops='';
	for(var i=1;i<=num;i++){
		ops+='<option value='+i+'>'+i+'</option>';
		
	}
	//5.ops刚刚生成，默认是第一页
	$("#gotoPage").append(ops);
	//console.log("initLimt……end");
	
}

function gotoPageFirst(){
	$("#gotoPage").val(1);
	$("#pageCurrent").text(1);
	limit();
}
function gotoPagePrev(){
	if($("#gotoPage").val()==1){
		alert("已经是第一页了！")
		return;
	}
	$("#gotoPage").val(parseInt($("#gotoPage").val())-1);
	$("#pageCurrent").text($("#gotoPage").val());
	limit();
}
function gotoPageNext(){
	if($("#gotoPage").val()==$("#totalPages").text()){
		alert("已经是最后一页了！");
		return ;
	}
	$("#gotoPage").val(parseInt($("#gotoPage").val())+1);
	$("#pageCurrent").text($("#gotoPage").val());
	limit();
}
function gotoPageLast(){
	$("#gotoPage").val($("#totalPages").text());
	$("#pageCurrent").text($("#totalPages").text());
	limit();
}
</script>
</head>
<body>

<h1>
<span class="action-span1"><a href="index.php?act=main">ECSHOP 管理中心</a> </span><span id="search_id" class="action-span1"> - 管理员日志 </span>
<div style="clear:both"></div>
</h1>

<div class="form-div">
<table>
    <tbody>
    <tr>
      <td width="50%">
      
	     按IP地址查看      <select name="ip" id="ip">
	     <option value="0">选择IP地址</option>
	     <option value="0.0.0.0">0.0.0.0</option><option value="127.0.0.1">127.0.0.1</option>      
	     </select>
	     <input type="button" onclick="selectByIp();" value="确定" class="button">
      </td>
      <td>
      
      清除日志      <select name="log_date" id="log_date">
        <option value="0">选择清除的日期${baseurl}admin.</option>
        <option value="1">一周之前</option>
        <option value="2">一个月之前</option>
        <option value="3">三个月之前</option>
        <option value="4">半年之前</option>
        <option value="5">一年之前</option>
      </select>
      <input name="drop_type_date" onclick="delByLog_date()" type="button" value="确定" class="button">
      
      </td>
    </tr>
</tbody></table>
</div>


<!-- start admin_logs list -->
<div class="list-div" id="listDiv">
<!-- 关于form表单元素最好放个正常的位置，正常情况下，在页面查询form表单时，form标签应该包含要提交的数据 -->
<form method="post" action="${baseurl }log/delById.do" >
<table cellpadding="3" cellspacing="1">
<thead>
	<tr>
    <th>
    <input id="checkAll" type="checkbox">
    <a href="javascript:listTable.sort('log_id');">编号</a><img src="${baseurl}admin/images/sort_desc.gif"></th>
    <th><a href="javascript:listTable.sort('user_id');">操作者</a></th>
    <th><a href="javascript:listTable.sort('log_time');">操作日期</a></th>
    <th><a href="javascript:listTable.sort('ip_address');" title="点击对列表排序">IP地址</a></th>
    <th>操作记录</th>
  	</tr>
</thead>
  <tbody id="log_list">
  <c:forEach items="${cals }" var="al">
    <tr>
    <td width="10%" style="background-color: rgb(255, 255, 255);"><span><input name="subBox" type="checkbox" value="${al.log_id }">${al.log_id }</span></td>
    <td width="15%" class="first-cell" style="background-color: rgb(255, 255, 255);"><span>${al.user_name }</span></td>
    <td width="20%" align="center" style="background-color: rgb(255, 255, 255);"><span>${al.dateTime }</span></td>
    <td width="15%" align="left" style="background-color: rgb(255, 255, 255);"><span>${al.ip_address }</span></td>
    <td width="40%" align="left" style="background-color: rgb(255, 255, 255);"><span>${al.log_info }</span></td>
  </tr>
   </c:forEach>  
  </tbody>
  <tfoot>
	<tr>
    	<td colspan="2"><input disabled name="drop_type_id" type="submit" id="btnSubmit" value="清除日志" class="button"></td>
    	
    	<td align="right" nowrap="true" colspan="10">      <!-- $Id: page.htm 14216 2008-03-10 02:27:21Z testyang $ -->
            <div id="turn-page">
        总计  <span id="totalRecords">${count }</span>
        个记录分为 <span id="totalPages">32</span>
        页当前第 <span id="pageCurrent">1</span>
        页，每页 <input type="text" size="3" id="pageSize" value="15" >
		        <span id="page-link">
		          <a href="javascript:gotoPageFirst()">第一页</a>
		          <a href="javascript:gotoPagePrev()">上一页</a>
		          <a href="javascript:gotoPageNext()">下一页</a>
		          <a href="javascript:gotoPageLast()">最末页</a>
		          <select id="gotoPage">
		            <option value="1">1</option>
		            <option value="2">2</option>
		            
				  </select>
		        </span>
			</div>
		</td>
	</tr>
  </tfoot>
</table>
</form>
</div>
<!-- end ad_position list -->

<div id="footer">
共执行 4 个查询，用时 0.011068 秒，Gzip 已禁用，内存占用 1.767 MB<br>
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
<embed src="${baseurl}admin/images/online.wav" width="0" height="0" autostart="false" name="msgBeep" id="msgBeep" enablejavascript="true"/>
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" id="msgBeep" width="1" height="1">
  <param name="movie" value="${baseurl}admin/images/online.swf">
  <param name="quality" value="high">
  <embed src="${baseurl}admin/images/online.swf" name="msgBeep" id="msgBeep" quality="high" width="0" height="0" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash">
  
</object>

</body></html>