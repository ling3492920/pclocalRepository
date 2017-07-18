/**
 * Created by Administrator on 2017-04-13.
 */
$(function(){
    //登陆
    $("#login").click(function(){
        $("#in").next().remove();
        //拼接div
        var register ='<div class="usBox clearfix">'+
            '<div class="usBox_1 f_l">'+
            '<div class="logtitle"></div>'+
            '<form name="formLogin" action="user.php" method="post" onSubmit="return userLogin()">'+
            '<table width="100%" border="0" align="left" cellpadding="3" cellspacing="5">'+
            '<tr>'+
            '<td width="15%" align="right">用户名</td>'+
            '<td width="85%"><input name="username" type="text" size="25" class="inputBg" /></td>'+
            '</tr>'+
            '<tr>'+
            '<td align="right">密码</td>'+
            '<td>'+
            '<input name="password" type="password" size="15"  class="inputBg"/>'+
            '</td>'+
            '/tr>'+
            '<tr>'+
            '<td>&nbsp;</td>'+
        '<td align="left">'+
          '<input type="hidden" name="act" value="act_login" />'+
            '<input type="hidden" name="back_act" value="./index.php" />'+
            '<input type="submit" name="submit" value="" class="us_Submit" />'+
            '</td>'+
            '</tr>'+
            '<tr><td></td><td><a href="user.php?act=qpassword_name" class="f3">密码问题找回密码</a>&nbsp;&nbsp;&nbsp;<a href="user.php?act=get_password" class="f3">注册邮件找回密码</a></td></tr>'+
            '</table>'+
            '</form>'+
            '</div>'+
            '<div class="usTxt">'+
            '<strong>如果您不是会员，请注册</strong>  <br />'+
        '<strong class="f4">友情提示：</strong><br />'+
        '不注册为会员也可在本店购买商品<br />'+
        '但注册之后您可以：<br />'+
        '1. 保存您的个人资料<br />'+
        '2. 收藏您关注的商品<br />'+
        '3. 享受会员积分制度<br />'+
        '4. 订阅本店商品信息  <br />'+
        '<a href="user.php?act=register"><img src="themes/default/images/bnt_ur_reg.gif" /></a>'+
            '</div>'+
            '</div>';
        //将div插入id=in的元素后
        $("#in").after($(register));
        setiframeHeight("myiframe");
    });
    //注册
    $("#register").click(function(){
        $("#in").next().remove();
        //拼接div
        var htm = setdiv_ifra("page/register.html");
        var register ='<div class="block clearfix">' +htm+'</div>';
        //将div插入id=in的元素后
        $("#in").after($(register));
        setiframeHeight("myiframe");
    });
    //密码问题找回密码页面
    //1.输入用户名页面
    $("#qpassword_name").click(function(){
        $("#in").next().remove();
        var htm = '<div class="usBox">'+
            '<div class="usBox_2 clearfix">'+
            '<form action="user.php" method="post">'+
            '<br>'+
            '<table width="70%" border="0" align="center">'+
            '<tbody><tr>'+
            '<td colspan="2" align="center"><strong>请输入您注册的用户名以取得您的密码提示问题。</strong></td>'+
        '</tr>'+
        '<tr>'+
        '<td width="29%" align="right">用户名</td>'+
            '<td width="61%"><input name="user_name" type="text" size="30" class="inputBg"></td>'+
            '</tr>'+
                '<tr>'+
                    '<td width="29%" align="right">密码提示问题：</td>'+
                    '<td width="61%">我最好朋友的生日？</td>'+
                '</tr>'+
                '<tr>'+
                    '<td align="right">密码问题答案：</td>'+
                    '<td><input name="passwd_answer" type="text" size="20" class="inputBg"></td>'+
                '</tr>'+
            '<tr>'+
            '<td></td>'+
            '<td><input type="hidden" name="act" value="get_passwd_question">'+
            '<input type="submit" name="submit" value="提 交" class="bnt_blue" style="border:none;">'+
                '&nbsp;&nbsp;&nbsp;&nbsp;'+
            '<input name="button" type="button" onclick="history.back()" value="返回上一页" style="border:none;" class="bnt_blue_1">'+
            '</td>'+
            '</tr>'+
            '</tbody></table>'+
            '<br>'+
            '</form>'+
            '</div>'+
            '</div>';
        $("#in").after($(htm));
    });
    //2.新密码页面

    getVal();
});