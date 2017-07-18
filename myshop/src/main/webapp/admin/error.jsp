<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>无标题文档</title>
    <script type="text/javascript" src="${baseurl }admin/js/jquery.min.js"></script>
    <script language="javascript">
        var nn = 5;
        function num() {
            if(nn==0){
                history.back();
            }
            $("#nuber").text(nn);
            nn --;
        }
        function SetNum() {
            setInterval("num()",1000);
        }
    </script>
</head>
<body onLoad="SetNum();">
	<h1>${errors}</h1>
	：<p>操作完成，<span id="nuber" style="color:#FF0000;">6</span>秒后返回...</p>
</body>
</html>