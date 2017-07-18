$(function(){
    //登陆存储cookie
    var user_name = unescape(getCookie("user_name"));
    if(user_name!=""){
        $("#ECS_MEMBERZONE").empty();
        var ff = '<div id="append_parent"></div>'+
            '<font style="position:relative; top:10px;" id="welcome">'+
            '您好，<font class="f4_b">'+user_name+'</font>, 欢迎您回来！'+
            '<a href="welcome.html">用户中心</a>|'+
            '<a href="#" id="logout">退出</a>'+
            '</font>';
        $("#ECS_MEMBERZONE").append(ff);
    }
    //退出清除cookie(对应用户信息）
    $("#logout").click(function(){
        if(getCookie("user_name")!=""){
            deleteCookie("user_name");
            deleteCookie("user_id");

        //<font id="ECS_MEMBERZONE"><div id="append_parent"></div>
        //        欢迎光临本店&nbsp;&nbsp;&nbsp;&nbsp;
        //<a href="user.html?index=login" id="login"><img src="themes/default/images/bnt_log.gif"></a>
        //        <a href="user.html?index=register" id="register"><img src="themes/default/images/bnt_reg.gif"></a>
        //        </font>
        }
        window.location.href="index.html";
    });
})

