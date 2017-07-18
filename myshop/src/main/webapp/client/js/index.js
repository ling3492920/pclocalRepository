/**
 * Created by Administrator on 2017-04-11.
 */


//根据rec_type,cat_id来发送请求，rec_type=1的为best，2为new，3为hot
function get_cat_recommend(rec_type, cat_id){
	console.log("rec_type:"+rec_type+"cid:"+cat_id);//1,3 
	
	$.ajax({
    	url:path+'goods/findcat.do',
    	data: {'rec_type': rec_type , 'cid' : cat_id},
    	success:cat_rec_response,
    	type:"POST",
    	dataType:"json"
    });
}

//成功回调函数的处理
function cat_rec_response(result)
{
    if(result.state==0){
        var res = result.data;
        console.log("success:"+res.type);
        
        if(res.type==1){					//这个type对应rec_type
            var ele = $("#show_best_area");	
//            
//            best_str[res.cat_id] = res;
            addivforgoods(res,ele,"best");
        }else if(res.type==2){
            var ele = $("#show_new_area");
//            new_str[res.cat_id] = res;
        	addivforgoods(res,ele,"new");
        }else{
            var ele = $("#show_hot_area");
//            hot_str[res.cat_id] = res;
        	addivforgoods(res,ele,"hot");
        }
    }
}

function addivforgoods(goods,ele,class_name){
	
    ele.empty();
    for(var i=0;i<goods.length;i++){
    	var g_name = goods[i].goods_name;
    	if(g_name.length>7){
    		g_name=g_name.substr(0,7)+"……";
    	}
//    	console.log(goods[i].goods_thumb);
    	var g_thumb = '../'+goods[i].goods_thumb;
        var item='<div class="goodsItem">'+
        '<span class='+class_name+'></span>'+
        '<a href="goods.html" onmouseover="getID('+goods[i].goods_id+')"><img src="'+g_thumb+'" alt="'+goods[i].goods_name+'" class="goodsimg"></a><br>'+
        '<p><a href="#" title='+goods[i].goods_name+'>'+g_name+'</a></p>'+
        '<font class="f1">￥'+goods[i].shop_price+'元</font>'+
        '</div>';
        
        
        ele.append(item);
    }
    var  more='<div class="more"><a href="search.do?intro=best"><img src="../themes/default/images/more.gif"></a></div>';
    ele.append(more);
}

function change_tab_style(item, elem, obj)
{
    elem = elem.toUpperCase();
    var itemObj = document.getElementById(item);
    var elems = itemObj.getElementsByTagName(elem);
    var _o = obj.parentNode;
    while(_o.nodeName != elem)
    {
        _o = _o.parentNode;
    }
    for (var i=0,l=elems.length; i<l; i++)
    {
        elems[i].className = 'h2bg';
    }
    _o.className = '';
}