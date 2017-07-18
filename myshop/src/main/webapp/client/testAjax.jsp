<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
//经检查jsp页面发送ajax请求完全没有问题，问题在于js脚本之间的兼容问题，需要吧jquery放置在最前
$.ajax({
	url:"http://localhost:8088/myshop/agoods/show.do",
	type:"post",
	data:{"startLine":0,"pageSize":10},
	dataType:"JSON",
	success:function(res){
		if(res.state==0){
			console.log(res.data.length);
		}
	},
	error:function(){
		alert("!!!")
	}
})
</script>
</head>
<body>
	
</body>
</html>