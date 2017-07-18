/**
 * Created by Administrator on 2017-05-06.
 */
$(function(){
    //1.加载一级分类关联2及分类
    $("#category_tree").empty();
    $.ajax({
        url:path+"cat/findall.do",
        type:'get',
        success:function(result){
            if(result.state==0){
                var cgs = result.data;
                
                //4
                for(var i=0;i<cgs.length;i++){
                	var dt='';
                    var dd='';
                    var dl='';
                    dl=dl+'<dl>';
                    dt =dt+ '<dt><a href="#">'+cgs[i].cat_name+'</a></dt>';
                    var cats = cgs[i].cats;

                    for(var j=0;j<cats.length;j++){
                    	
                        var cat = cats[j];
                        dd=dd+'<dd><a href="#">'+cat.cat_name+'</a></dd>';
//                        $(dd).data(cat.cat_id);//将cat_id绑定到对应元素上去
//                        console.log($(dd).data());
                    }
                    dl=dl+dt+dd+'</dl>'; 
                    $("#category_tree").append(dl);
                }
                
            }
        }
    });
    //2.加载销售排行
    //$("div.top10List") 目标块元素
    //前3的ul元素
    //<ul class="clearfix">……
    $("div.top10List").empty();
    $.ajax({
        url:path+"goods/sales.do",
        type:'get',
        success:function(result){
            if(result.state==0){
                var goods = result.data;
                for(var i=0;i<3;i++){
                	var str = goods[i].goods_name;
                	if(str.length>7){
                		
                		str = str.substr(0,7)+"……";
                	}
                    var ul='<ul class="clearfix">'+
                        '<img src="../themes/default/images/top_'+(i+1)+'.gif" class="iteration">'+
                        '<li class="topimg">'+
                        '<a href="#"><img src=../'+goods[i].goods_thumb+' alt="" class="samllimg"></a>'+
                        '</li>'+
                        '<li class="iteration1">'+
                        '<a href="#" title="">'+str+'</a><br>'+
                        '本店售价：<font class="f1">￥'+goods[i].shop_price+'元</font><br>'+
                        '</li>'+
                        '</ul>';
                    $("div.top10List").append(ul);
                }
                for(var i=3;i<goods.length-3;i++){
                	var str = goods[i].goods_name;
                	if(str.length>15){
                		console.log(str);
                		str = str.substr(0,15)+"……";
                	}
                    var ul='<ul class="clearfix">'+
                        '<img src="../themes/default/images/top_'+(i+1)+'.gif" class="iteration">'+
                        '<li>'+
                        '<a href="goods.do?id=9" title="">'+str+'</a><br>'+
                        '本店售价：<font class="f1">￥'+goods[i].shop_price+'元</font><br>'+
                        '</li>'+
                        '</ul>';
                    $("div.top10List").append(ul);
                }
            }
        }
    });
    //3.加载精品推荐
    //$("#show_best_area").empty();
    $.ajax({
        url:path+"goods/best.do",
        type:"get",
        success:function(result){
            if(result.state==0){
                var goods = result.data;
                var ele=$("#show_best_area");
                addivforgoods(goods,ele,"best");
            }
        }
    });
    //4.加载新品
    $("#show_new_area").empty();
    $.ajax({
        url:path+"goods/new.do",
        type:"get",
        success:function(result){
            if(result.state==0){
                var goods = result.data;
                var ele=$("#show_new_area");
                addivforgoods(goods,ele,"news");
            }
        }
    });
    //5.加载热卖品
    $("#show_hot_area").empty();
    $.ajax({
        url:path+"goods/hot.do",
        type:"get",
        success:function(result){
            if(result.state==0){
                var goods = result.data;
                var ele=$("#show_hot_area");
                addivforgoods(goods,ele,"hot");
            }
        }
    });

//    h2arr = $("h2");

//    $('h2').click(function(){							//为所有h2追加单机事件
//        for(var i=0;i<h2arr.length;i++){				//1.遍历所有h2
//            var itemType=$(this).parent().attr('id');  //2.获取h2当前被单击的h2父元素id属性值
//            
//            if(itemType=='itemBest'){					//3.判断id为itemBest的情况
//                var is_best=1;
//                var cat_name=$(this).text();			//4.获取被单机对象的文本内容
//                console.log("cat_name="+cat_name);
//                console.log("catnames.length="+catnames.length);
//                var cat_id;
//                for(var j=0;j<catnames.length;j++){		//5.遍历所有类型名数组
//                	console.log("catnames:"+j);
//                    if(cat_name==catnames[j]){			//6.判断类型名为当前单机的类型名
//                    	console.log(h2arrstrs);
//                    	console.log(h2arrstrs.cat_name);
//                        cat_id=h2arrstrs.cat_name;		//7.通过h2arrstrs取出属性值为当前类型名的值的对应值作为cat_id
//                        
//                        console.log("cat_id="+cat_id);
//                        break;
//                    }
//                }
//                console.log("____")
//                if(cat_id!=0){							//8.判断id不为0的情况
//                	
//                    $.ajax({
//                        url:path+"goods/bestAndCat.do",
//                        type:"get",
//                        data:{cat_id:cat_id},			//9.发送参数为cat_id的请求
//                        dataType:'json',
//                        success:function(result){
//                            if(result.state==0){		//10.处理结果集
//                                var goods = result.data;
//                                var ele=$("#show_best_area");
//                                console.log(goods);
//                                addivforgoods(goods,ele,"best");
//                            }
//                        }
//                    });
//                    break;								//11.结束当前遍历
//                }else {									//12.这是判断cat_id==0的情况，即‘全部商品’
//                    $.ajax({
//                        url:path+"goods/best.do",
//                        type:"get",
//                        success:function(result){
//                            if(result.state==0){
//                                var goods = result.data;
//                                var ele=$("#show_best_area");
//                                addivforgoods(goods,ele,"best");
//                            }
//                        }
//                    });
//                }
//
//            }
//            											//以上是itemBest部分
//            if(itemType=='itemNew'){
//                var is_new=1;
//                var cat_name=h2arr[i].text();
//                var cat_id;
//                for(var j=0;j<catnames.length;j++){
//                    if(cat_name==catnames[i]){
//                        var cat_id=h2arrstrs.cat_name;
//                        break;
//                    }
//                }
//                if(cat_id!=0){
//                    $.ajax({
//                        url:path+"goods/newAndCat.do",
//                        type:"get",
//                        data:{cat_id:cat_id},
//                        dataType:"json",
//                        success:function(result){
//                            if(result.state==0){
//                                var goods=result.data;
//                                var ele=$("#show_new_area");
//                                addivforgoods(goods,ele,"news");
//                            }
//                        }
//                    });
//                }else{
//                    $.ajax({
//                        url:path+"goods/new.do",
//                        type:"get",
//                        success:function(result){
//                            if(result.state==0){
//                                var goods = result.data;
//                                var ele=$("#show_new_area");
//                                addivforgoods(goods,ele,"news");
//                            }
//                        }
//                    });
//                }
//
//            }
//            if(itemType=='itemHot'){
//                var is_hot=1;
//                var cat_name=h2arr[i].text();
//                var cat_id;
//                for(var j=0;j<catnames.length;j++){
//                    if(cat_name==catnames[i]){
//                        cat_id=h2arrstrs.cat_name;
//                        break;
//                    }
//                }
//                if(cat_id!=0){
//                    $.ajax({
//                        url:path+"goods/hotAndCat.do",
//                        type:"get",
//                        data:{cat_id:cat_id},
//                        dataType:"json",
//                        success:function(){
//                            if(result.state==0){
//                                var goods=result.data;
//                                var ele=$("#show_hot_area");
//                                addivforgoods(goods,ele,"hot");
//                            }
//                        }
//                    });
//                }else{
//                    $.ajax({
//                        url:path+"goods/hot.do",
//                        type:"get",
//                        success:function(result){
//                            if(result.state==0){
//                                var goods = result.data;
//                                var ele=$("#show_hot_area");
//                                addivforgoods(goods,ele,"hot");
//                            }
//                        }
//                    });
//                }
//            }
//        }
//    });
//
    });
var h2arr;
var catnames=['全部商品','GSM手机','双模手机','充值卡','联通手机充值卡','移动手机充值卡','小灵通固话充值卡'];
var h2arrstrs={全部商品:0,GSM手机:3,双模手机:5,充值卡:12,联通手机充值卡:15, 移动手机充值卡:14, 小灵通固话充值卡:13};
//function addivforgoods(goods,ele,class_name){
//	console.log(class_name);
//	console.log(goods.length);
//    ele.empty();
//    for(var i=0;i<goods.length;i++){
//    	var g_name = goods[i].goods_name;
//    	if(g_name.length>7){
//    		g_name=g_name.substr(0,7)+"……";
//    	}
////    	console.log(goods[i].goods_thumb);
//    	var g_thumb = '../'+goods[i].goods_thumb;
//        var item='<div class="goodsItem">'+
//        '<span class=""+'+class_name+'></span>'+
//        '<a href="goods.html" onmouseover="getID('+goods[i].goods_id+')"><img src="'+g_thumb+'" alt="'+goods[i].goods_name+'" class="goodsimg"></a><br>'+
//        '<p><a href="#" title='+goods[i].goods_name+'>'+g_name+'</a></p>'+
//        '<font class="f1">￥'+goods[i].shop_price+'元</font>'+
//        '</div>';
//        
//        
//        ele.append(item);
//    }
//    var  more='<div class="more"><a href="search.do?intro=best"><img src="../themes/default/images/more.gif"></a></div>';
//    ele.append(more);
//}
//1.把当前页面id值传给父页面goods_id变量接收
function getID(id){
    window.parent.goods_id=id;
}

