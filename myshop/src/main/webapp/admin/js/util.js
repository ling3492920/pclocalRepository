//根据总记录数初始化分页栏方法
function initLimt(){
	//1.获取到总记录数量
	var count=$("#totalRecords").text();
	console.log("count:"+count);
	//2.默认pageSize为15，如果特意设置则是设置的值
	if($("#pageSize").val()==0){//排除等于0 的情况
		$("#pageSize").val("");
	}
	var pageSize=$("#pageSize").val()==""?15:$("#pageSize").val();
	var num = Math.ceil(parseInt(count)/pageSize);
	//3.根据计算得出总页数
	$("#totalPages").text(num);
	
	console.log("totalPages:"+totalPages);
	//4.当前第几页由ops选中的来决定
	var pageCurrent=$("#pageCurrent").text($("#gotoPage").val());
	$("#gotoPage").empty()
	var ops='';
	for(var i=1;i<=num;i++){
		ops+='<option value='+i+'>'+i+'</option>';
	}
	//5.ops刚刚生成，默认是第一页
	$("#gotoPage").append(ops);
	
}
//根据，用户id,分页，ip查询日志的方法
function limit(){
	var pSize=$("#pageSize").val();
	var nPage=$("#gotoPage").val();
	var sLine=(nPage-1)*pSize;
	
	var id='${user_id}'==''?null:'${user_id}';
	var ip=$("#ip").val()==0?null:$("#ip").val();
	
	var calobj={"user_id":id,'ip_address':ip,'startLine':sLine,'pageSize':pSize};
	//console.log(calobj);
	var cal = JSON.stringify(calobj);
	$.ajax({
		url:path+"auser/auto.do",
		type:"post",
		dataType:"json",
		data:{"cal":cal},
		contentType:"application/json;charset=utf-8",
		success:function(res){
			if(res.state==0){
				var al = res.data;
				var tr=saveTr(al);
				$("#log_list").empty();
				$("#log_list").append(tr);
			}else{
				alert("加载异常！");
			}
		}
	});
}
$("#checkAll").click(function() {
    $('input[name="subBox"]').attr("checked",this.checked);
//    if($subBox.length == $("input[name='subBox']:checked").length){
//        for(var i=0;i<$subBox.length;i++){
//            console.log($subBox.eq(i).val());
//        }
//    }
});
var $subBox = $("input[name='subBox']");
$subBox.click(function(){
    $("#checkAll").attr("checked",$subBox.length == $("input[name='subBox']:checked").length ? true : false);
    
//    if($(this).attr("checked")==true){
//        var val = $(this).val();
//        console.log("checked:"+val);
//    }
});