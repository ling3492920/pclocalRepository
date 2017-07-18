
//input失去焦点函数
function outFocus(obj){
    var num=$(obj).val();
    var p=$(obj).parent();
    p.empty();
    var span='<span style="width: 100%">'+num+'</span>';
    p.append(span);
}
//2.把商品放入回收站
function cellBack(id,obj){
	var con=confirm("确定把该商品放入回收站吗？");
	if(con){	
		$.ajax({
			url:path+"agoods/del.do",
			type:"get",
			data:{"id":id},
			dataType:"json",
			success:function(res){
				if(res.state==0){
					console.log($(obj).parent());
					$(obj).parent().parent().remove();
					alert("成功把id:"+id+"的商品放入回收站！");
				}else{
					alert(res.message);
				}
			},
			error:function(){
				alert("系统繁忙 ,请稍后再试！");
			}
		});	
	}
}
function limit(){
	//1.获取每页记录数
	var pageSize=$("#pageSize").val();
	//2.请求记录总数
	$.ajax({
		url:path+"agoods/count.do",
		type:"get",
		dataType:"json",
		success:function(res){
			if(res.state==0){
				var count=res.data;
				//3.把记录总数显示到对应位置
				$("#totalRecords").text(count);
				//4.根据count和pageSize计算总页数,并将其输出到对应位置
				var countPage=Math.ceil(count/pageSize);
				$("#totalPages").text(countPage);
				//5.根据countPage添加对应数量的下拉选页
				$("#gotoPage").empty();
				var option="";
				for(var i=1;i<=countPage;i++){
					option+='<option value="'+i+'">'+i+'</option>';
				}
				$("#gotoPage").append(option);
			}
		}
	});
}
/*
gotoPageFirst()">第一页</a>
gotoPagePrev()">上一页</a>
gotoPageNext()">下一页</a>
gotoPageLast()
*/

function gotoPageFirst(){
	$("#gotoPage").val(1);
	$("#pageCurrent").text(1);
	$("#pageSize").val();
	loadGoodList();
}
function gotoPagePrev(){
	var nowP=$("#gotoPage").val();
	if(nowP==1){
		alert("当前已是最前页！")
		return;
	}
	$("#gotoPage").val(parseInt(nowP)-1);
	$("#pageCurrent").text(parseInt(nowP)-1);
	loadGoodList();
}
function gotoPageNext(){
	var nowP=$("#gotoPage").val();
	if(nowP==$("#totalPages").text()){
		alert("当前已是最后页！")
		return;
	}
	$("#gotoPage").val(parseInt(nowP)+1);
	$("#pageCurrent").text(parseInt(nowP)+1);
	loadGoodList();
}
function gotoPageLast(){
	$("#gotoPage").val($("#totalPages").text());
	$("#pageCurrent").text($("#totalPages").text());
	$("#pageSize").val();
	loadGoodList();
}
function loadGoodList(){
	/*根据nowPage与pageSize计算sLine*/
	var nPage=$("#gotoPage").val();
	var pSize=$("#pageSize").val();
	var sLine=(nPage-1)*pSize;//第二页1*15，第一页=0*15
	$.ajax({
		url:path+"agoods/show.do",
		type:"post",
		data:{"startLine":sLine,"pageSize":pSize},
		dataType:"JSON",
		success:function(res){
			if(res.state==0){
				var goods = res.data;
				var tr = itroGood(goods);
				$("#goods_list").empty();
				$("#goods_list").append(tr);
			}
		},
		error:function(){
			alert("服务器异常！请稍后")
		}
	});
}
//遍历goods
function itroGood(goods){
	var tr='';
	for(var i=0;i<goods.length;i++){
		var is_on_sale_img=goods[i].is_on_sale==1?path+"admin/images/yes.gif":path+"admin/images/no.gif";
		var is_best_img=goods[i].is_best==1?path+"admin/images/yes.gif":path+"admin/images/no.gif";
		var is_new_img=goods[i].is_new==1?path+"admin/images/yes.gif":path+"admin/images/no.gif";
		var is_hot_img=goods[i].is_hot==1?path+"admin/images/yes.gif":path+"admin/images/no.gif";
		tr+='<tr>'+
	    '<td><input type="checkbox" name="checkboxes[]" value="'+goods[i].goods_id+'">'+goods[i].goods_id+'</td>'+
	    '<td class="first-cell" name="goods_name"><span>'+goods[i].goods_name+'</span></td>'+
	    '<td  name="goods_sn"><span> '+goods[i].goods_sn+'</span></td>'+
	    '<td align="right" name="shop_price"><span>'+goods[i].shop_price+'</span></td>'+
	    '<td align="center"><img src='+is_on_sale_img+' onclick="toggle(this, 1, '+goods[i].goods_id+')"><a hidden="hidden">'+goods[i].is_on_sale+'</a></td>'+
	    '<td align="center"><img src='+is_best_img+' onclick="toggle(this, 2,'+goods[i].goods_id+')"><a hidden="hidden">'+goods[i].is_best+'</a></td>'+
	    '<td align="center"><img src='+is_new_img+' onclick="toggle(this, 3,'+goods[i].goods_id+')"><a hidden="hidden">'+goods[i].is_new+'</a></td>'+
	    '<td align="center"><img src='+is_hot_img+' onclick="toggle(this, 4,'+goods[i].goods_id+')"><a hidden="hidden">'+goods[i].is_hot+'</a></td>'+
	    '<td align="center" name="sort_order"><span>'+goods[i].sort_order+'</span></td>'+
	    '<td align="right" name="goods_number"><span>'+goods[i].goods_number+'</span></td>'+
	    '<td align="center">'+
			'<a href="goods/findById.do?id='+goods[i].goods_id+'" target="_blank" title="查看"><img src="'+path+'admin/images/icon_view.gif" width="16" height="16" border="0"></a>'+
			'<shiro:hasPermission name="goods:add:edit">'+
			'<a href="${baseurl }agoods/toEdit.do?id='+goods[i].goods_id+'" title="编辑"><img src="'+path+'admin/images/icon_edit.gif" width="16" height="16" border="0"></a>'+
	  		'</shiro:hasPermission>'+
	  		'<shiro:hasPermission name="goods:del:cellback">'+
			'<a href="javascript:;" onclick="cellBack('+goods[i].goods_id+',this);" title="回收站"><img src="'+path+'admin/images/icon_trash.gif" width="16" height="16" border="0"></a>'+
			'</shiro:hasPermission>'+
		'</td>'+
	    '</tr>';
	}
	return tr;
}

//2.对是否上架等发送异步处理请求
function toggle(obj, n, id){
	switch(n){
		case 1:
			var val=$(obj).next().text();
			if(val==0){
				val=1;
				var str="is_on_sale";
				var flag=editIS(str,val,id);
				if(flag){	
					$(obj).next().text(val);
					if(val==1){
						$(obj).attr("src",path+"admin/images/yes.gif");
					}else{
						$(obj).attr("src",path+"admin/images/no.gif");
					}	
				}
				return;
			}
			if(val==1){
				val=0;
				var str="is_on_sale";
				var flag=editIS(str,val,id);
				if(flag){
					$(obj).next().text(val);
					if(val==1){
						$(obj).attr("src",path+"admin/images/yes.gif");
					}else{
						$(obj).attr("src",path+"admin/images/no.gif");
					}	
				}
				return;
			}
			
		break;
		case 2:
			var val=$(obj).next().text();
			if(val==0){
				val=1;
				var str="is_best";
				var flag=editIS(str,val,id);
				if(flag){	
					$(obj).next().text(val);
					if(val==1){
						$(obj).attr("src",path+"admin/images/yes.gif");
					}else{
						$(obj).attr("src",path+"admin/images/no.gif");
					}	
				}
				return;
			}
			if(val==1){
				val=0;
				var str="is_best";
				var flag=editIS(str,val,id);
				if(flag){
					$(obj).next().text(val);
					if(val==1){
						$(obj).attr("src",path+"admin/images/yes.gif");
					}else{
						$(obj).attr("src",path+"admin/images/no.gif");
					}	
				}
				return;
			}
		break;
		case 3:
			var val=$(obj).next().text();
			if(val==0){
				val=1;
				var str="is_new";
				var flag=editIS(str,val,id);
				if(flag){	
					$(obj).next().text(val);
					if(val==1){
						$(obj).attr("src",path+"admin/images/yes.gif");
					}else{
						$(obj).attr("src",path+"admin/images/no.gif");
					}	
				}
				return;
			}
			if(val==1){
				val=0;
				var str="is_new";
				var flag=editIS(str,val,id);
				if(flag){
					$(obj).next().text(val);
					if(val==1){
						$(obj).attr("src",path+"admin/images/yes.gif");
					}else{
						$(obj).attr("src",path+"admin/images/no.gif");
					}	
				}
				return;
			}
		break;
		default:
			var val=$(obj).next().text();
		if(val==0){
			val=1;
			var str="is_hot";
			var flag=editIS(str,val,id);
			if(flag){	
				$(obj).next().text(val);
				if(val==1){
					$(obj).attr("src",path+"admin/images/yes.gif");
				}else{
					$(obj).attr("src",path+"admin/images/no.gif");
				}	
			}
			return;
		}
		if(val==1){
			val=0;
			var str="is_hot";
			var flag=editIS(str,val,id);
			if(flag){
				$(obj).next().text(val);
				if(val==1){
					$(obj).attr("src",path+"admin/images/yes.gif");
				}else{
					$(obj).attr("src",path+"admin/images/no.gif");
				}	
			}
			return;
		}
	}
}
//请求修改，上架等内容字段
/**
 * str:代表是修改字段名称(is_on_sale,is_best,is_new,is_hot)
 * val:对应字段修改后的值(1,0)
 * obj:当前对象元素
 * id:当前商品id值
 */
function editIS(str,val,id){ 
	 var flag;
	$.ajax({
		url:path+"agoods/editIS.do",
		type:"get",
		data:{"id":id,"str":str,"val":val},
		dataType:"json",
		success:function(res){
			if(res.state==0){
				flag=true;
			}else{
				flag=false;
			}
		},
		error:function(){
			alert("服务器异常！");
		},
		async:false
	});
	return flag;
}