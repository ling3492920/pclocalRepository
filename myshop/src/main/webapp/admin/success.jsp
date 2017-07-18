<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<Meta http-equiv="Refresh" Content="5; Url=${baseurl }${uri}">
    <title>倒计时结束，回到url指定地址</title>
    <script language="javascript">
        var nn = 5;
        function num()
        {
        	if(nn==0){
                history.back();
            }
            document.getElementById("nuber").innerHTML = nn;
            nn --;
        }
        function SetNum()
        {
            setInterval("num()",1000);
        }
        
    </script>
</head>
<body onLoad="SetNum();">
：<p>${success }，<span id="nuber" style="color:#FF0000;">6</span>秒后返回...</p>
</body>
</html>