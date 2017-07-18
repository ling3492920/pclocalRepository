/**
 * Created by Administrator on 2017-04-15.
 */
$(function(){
    //获取url后面参数内容
    var search = window.location.search;
    console.log(search);
    if(search!=""){
        for(var i =0;i<wels.length;i++){
            if(search==wels[i]){
                var val = search.substr(5,20);
                //1.獲取拼好的iframe
                var myiframe = setIframe('page/welcome/'+val+'.html');
                //2.把拼好的插入到wel裡面
                $('#wel').empty();
                $('#wel').append(myiframe);
                //3.设置iframe的高度
                setiframeHeight("myiframe2");
            }
        }
    }

});
/*
拼一個<iframe>
 */
function setIframe(val){
    var myiframe = '<iframe id ="myiframe2" src='+val+' width="750px" scrolling="no" frameborder="0"/>';

    return myiframe;
}
/**
 *?index=
 <a href="welcome.html?act=profile"><img src="themes/default/images/u2.gif"> 用户信息</a>
 <a href="welcome.html?act=order_list"><img src="themes/default/images/u3.gif"> 我的订单</a>
 <a href="welcome.html?act=address_list"><img src="themes/default/images/u4.gif"> 收货地址</a>
 <a href="welcome.html?act=collection_list"><img src="themes/default/images/u5.gif"> 我的收藏</a>
 <a href="welcome.html?act=message_list"><img src="themes/default/images/u6.gif"> 我的留言</a>
 <a href="welcome.html?act=tag_list"><img src="themes/default/images/u7.gif"> 我的标签</a>
 <a href="welcome.html?act=booking_list"><img src="themes/default/images/u8.gif"> 缺货登记</a>
 <a href="welcome.html?act=bonus"><img src="themes/default/images/u9.gif"> 我的红包</a>
 <a href="welcome.html?act=affiliate"><img src="themes/default/images/u10.gif"> 我的推荐</a>
 <a href="welcome.html?act=comment_list"><img src="themes/default/images/u11.gif"> 我的评论</a>
 <!--<a href="welcome.html?act=group_buy">我的团购</a>-->
 <a href="welcome.html?act=track_packages"><img src="themes/default/images/u12.gif"> 跟踪包裹</a>
 <a href="welcome.html?act=account_log"><img src="themes/default/images/u13.gif"> 资金管理</a>
 * @type {Array}
 */
var wels =['?act=profile','?act=order_list','?act=address_list','?act=collection_list','?act=message_list',
    '?act=tag_list','?act=booking_list','?act=bonus','?act=affiliate','?act=comment_list','?act=group_buy',
    '?act=track_packages','?act=account_log'];