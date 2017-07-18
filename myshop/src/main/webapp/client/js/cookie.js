/**
 * Created by Administrator on 2017-04-30.
 */

//该函数接收3个参数：cookie名称，cookie值，以及在多少小时后过期。
//这里约定expiresHours为0时不设定过期时间，
//即当浏览器关闭时cookie自动消失(会话期cookie)。
function addCookie(name,value,expiresHours){
    var cookieString=name+"="+escape(value);
//判断是否设置过期时间
    if(expiresHours>0){
        var date=new Date();
        date.setTime(date.getTime+expiresHours*3600*1000);
        cookieString=cookieString+"; expires="+date.toGMTString();
    }
    document.cookie=cookieString;
}

//该函数返回名称为name的cookie值，如果不存在则返回空
function getCookie(name){
    var strCookie=document.cookie;
    var arrCookie=strCookie.split("; ");
    for(var i=0;i<arrCookie.length;i++){
        var arr=arrCookie[i].split("=");
        if(arr[0]==name)return arr[1];
    }
    return "";
}
//该函数可以删除指定名称的cookie
function deleteCookie(name){
    var date=new Date();
    date.setTime(date.getTime()-10000);
    document.cookie=name+"=v; expires="+date.toGMTString();
}