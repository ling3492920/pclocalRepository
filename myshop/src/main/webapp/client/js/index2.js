/**
 * Created by Administrator on 2017-04-11.
 */
$(function(){
    //登陆
    //注册
    //查看购物车
    $("#flow").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/flow.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //选购中心
    $("#pick_out").click(function(){
        $("#in").next().remove();
        var htm = setdiv_ifra("pick_out.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });



    //标签云
    $("#tag_cloud").click(function(){
        $("#in").next().remove();
        var tag_cloud ='<div class="block">'+
            '<div class="box">'+
            '<div class="box_1">'+
            '<h3><span>所有标签</span></h3>'+
            '<div class="boxCenterList RelaArticle">'+
            '<p class="f_red" style="text-decoration:none;">&nbsp;&nbsp; 标签云（Tag cloud）是用以表示一个网站中的内容标签。 标签（tag、关键词）是一种更为灵活、有趣的商品分类方式，您可以为每个商品添加一个或多个标签，那么可以通过点击这个标签查看商品其他会员提交的与您的标签一样的商品,能够让您使用最快的方式查找某一个标签的所有网店商品。比方说点击“红色”这个标签，就可以打开这样的一个页面，显示所有的以“红色” 为标签的网店商品 &nbsp;&nbsp;</p>'+
        '<span style="font-size:0.9em; line-height:36px;"> <a href="search.php?keywords=%D2%F4%C0%D6%CA%D6%BB%FA" style="color:#333333">'+
            '音乐手机                    </a>'+
            '</span>'+
            '<span style="font-size:0.8em; line-height:36px;"> <a href="search.php?keywords=%D6%C7%C4%DC%CA%D6%BB%FA" style="color:#666666">'+
            '<b>智能手机</b>'+
            '</a>'+
            '</span>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>';
        $("#in").after($(tag_cloud));
    });
    //报价单
    $("#quotation").click(function(){
        $("#in").next().remove();
        //拼一个div
        var quotation ='<div class="block">'+
            '<div class="flowBox">'+
            '<h6><span>打印报价单</span></h6>'+
            '<form action="quotation.php" method="post" name="searchForm" target="_blank" class="quotation">'+

            '<select name="cat_id"><option value="0">所有分类</option><option value="1">手机类型</option><option value="3">&nbsp;&nbsp;&nbsp;&nbsp;GSM手机</option><option value="2">&nbsp;&nbsp;&nbsp;&nbsp;CDMA手机</option><option value="5">&nbsp;&nbsp;&nbsp;&nbsp;双模手机</option><option value="4">&nbsp;&nbsp;&nbsp;&nbsp;3G手机</option><option value="12">充值卡</option><option value="15">&nbsp;&nbsp;&nbsp;&nbsp;联通手机充值卡</option><option value="14">&nbsp;&nbsp;&nbsp;&nbsp;移动手机充值卡</option><option value="13">&nbsp;&nbsp;&nbsp;&nbsp;小灵通/固话充值卡</option><option value="6">手机配件</option><option value="11">&nbsp;&nbsp;&nbsp;&nbsp;读卡器和内存卡</option><option value="9">&nbsp;&nbsp;&nbsp;&nbsp;电池</option><option value="8">&nbsp;&nbsp;&nbsp;&nbsp;耳机</option><option value="7">&nbsp;&nbsp;&nbsp;&nbsp;充电器</option></select>'+

        '<select name="brand_id"><option value="0">所有品牌</option><option value="1">诺基亚</option><option value="10">金立</option><option value="9">联想</option><option value="8">LG</option><option value="7">索爱</option><option value="6">三星</option><option value="5">夏新</option><option value="4">飞利浦</option><option value="3">多普达</option><option value="2">摩托罗拉</option><option value="11">  恒基伟业</option></select>'+

            '关键字 <input type="text" name="keyword" class="inputBg">'+

            '<input name="act" type="hidden" value="print_quotation">'+
            '<input type="submit" name="print_quotation" id="print_quotation" value="打印报价单" style="vertical-align:middle;" class="bnt_blue_1">'+
            '</form>'+
            '</div>'+

            '</div>';

        $("#in").after($(quotation));
    });

    /*
     <a href="#" id="index" class="cur">首页<span></span></a>
     <a href="#" id="category_3" >GSM手机<span></span></a>
     <a href="#" id="category_4" >双模手机<span></span></a>
     <a href="#" id="category_6"  >手机配件<span></span></a>
     <a href="#" id="group_buy"  >团购商品<span></span></a>
     <a href="#" id="activity"  >优惠活动<span></span></a>
     <a href="#" id="snatch"  >夺宝奇兵<span></span></a>
     <a href="#" id="auction"  >拍卖活动<span></span></a>
     <a href="#" id="exchange"  >积分商城<span></span></a>
     <a href="#" id="message"  >留言板<span></span></a>
     <a href="#" target="_blank"  >EC论坛<span></span></a>
     */
    //首页
    //$("#index").click(function(){
    //    $("#in").next().remove();
    //    //拼一个div
    //    var index ='';
    //
    //    $("#in").after($(index));
    //});
    //GSM手机
    $("#category3").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/category3.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //双模手机
    $("#category4").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/categroy4.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //手机配件
    $("#category6").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/category6.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //团购活动
    $("#group_buy").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/group_buy.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //优惠活动
    $("#activity").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/activity.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //夺宝奇兵
    $("#snatch").click(function(){
        $("#in").next().remove();
        //拼一个div
        var snatch ='<div class="block">'+
            '<div class="box">'+
            '<div class="box_1">'+
            '<h3><span>系统信息</span></h3>'+
            '<div class="boxCenterList RelaArticle" align="center">'+
            '<div style="margin:20px auto;">'+
            '<p style="font-size: 14px; font-weight:bold; color: red;">当前没有活动</p>'+
            '<div class="blank"></div>'+
            '<p><a href="javascript:history.back()">返回上一页</a></p>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>';

        $("#in").after($(snatch));
    });
    //拍卖活动
    $("#auction").click(function(){
        $("#in").next().remove();
        //拼一个div
        var htm = setdiv_ifra("page/auction.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //积分商城
    $("#exchange").click(function(){
        $("#in").next().remove();
        var htm = setdiv_ifra("page/exchange.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });
    //留言板
    $("#message").click(function(){
        $("#in").next().remove();
        var htm = setdiv_ifra("page/message.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    });

    //判断uri是否为index.html
    var req_page = window.location.href.split("/");
    if(req_page[req_page.length-1]=="index.html"){
        $("#in").next().remove();
        var htm = setdiv_ifra("page/indexitems.html");
        var pick_out ='<div class="block clearfix">' +htm+'</div>';
        $("#in").after($(pick_out));
        setiframeHeight("myiframe");
    }
    setiframeHeight("myiframe");
    getVal();
});
//结算中心/购物流程/订单生成页
//function toOrder(){
//
//}
//商品页
var goods_id;
//function toGoods(id){
//    $("#in").next().remove();
//    console.log("!!!!")
//    var htm = setdiv_ifra("page/goods.html");
//    var pick_out ='<div class="block clearfix">' +htm+'</div>';
//    $("#in").after($(pick_out));
//    setiframeHeight("myiframe");
//    goods_id=id;
//}



    //如果从首页或者用户页面过来的请求，根据其参数值，做对应显示
var vals = ['login','register','flow','pick_out','tag_cloud','quotation','category3','category4',
        'category6','group_buy','activity','snatch','auction','exchange','message','qpassword_name','goods','checkout'];
var valsObj ={
        login:'登陆',
        register:'注册',
        flow:'购物流程',
        pick_out:'选购中心',
        tag_cloud:'标签云',
        quotation:'报价单',
        category3:'手机类型 <code>&gt;</code> GSM手机',
        category4:'手机类型 <code>&gt;</code> 3G手机',
        category6:'手机配件',
        group_buy:'团购商品',
        activity:'优惠活动',
        snatch:'夺宝骑兵',
        auction:'拍卖活动',
        exchange:'积分商城',
        message:'留言板',
        qpassword_name:'用户中心',
        goods:'商品',
        checkout:'购物流程'
};




function getVal(){
    var val1 = window.location.search.trim();
    console.log(val1);
    if(val1.indexOf('&')!=-1){
        val1 = val1.substring(val1.indexOf('=')+1,val1.indexOf('&')).trim();
        console.log("___")

    }
    //substr(num1,num2)参数最好动态化
    else {
        val1 = val1.substr(val1.indexOf("=")+1,20);
        console.log("!!!")
    }

    console.log(val1);


    if(val1!=""){
        for(var i =0;i<vals.length;i++){
            if(vals[i]==val1){
                //对匹配到的值，做单击操作
                $('#'+val1).trigger("click");
                //根据匹配到的值，取对应属性值

                $('#ur_here').empty();
                var url_here = '<div id="ur_here">'+
                    '当前位置: <a href=".">首页</a> <code>&gt;</code> '+eval("valsObj."+val1)+' </div>';

                $('#ur_here').append(url_here);
                //window.location.search='';
            }
        }
    }
}

function setdiv_ifra(src_val){
    var myiframe = '<iframe style="width: 960px;"' +
        'id="myiframe" frameborder="0" src='+src_val+' scrolling="no" >';
    return myiframe;
}

/**
 * IE用attachEvent | 3C用onload来判断子页面是否加载完成。

 IE用contentWindow | 3C用contentDocument来获取子页面

 IE用document.documentElement.scrollHeight（兼容ie6 ie7）| 3C用body.scrollHeight获取页面高度
 * @type {Element}
 */
function setiframeHeight(id){
    //设置myiframe的高度
    //1.获取到myiframe元素
//    console.log(id);
    var ifra = document.getElementById(id);
//    console.log(ifra);
    if(ifra.attachEvent){
        //等待子页面加载完毕，执行函数
        ifra.attachEvent("onload", function(){
            //获取子页面高度，赋值给iframe
            ifra.height =  ifra.contentWindow.document.documentElement.scrollHeight;
        });
        return;
    }else{
        ifra.onload = function(){
            ifra.height = ifra.contentDocument.body.scrollHeight;
        };
        return;
    }
}