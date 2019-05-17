<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.itoffer.bean.User" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%
Boolean result = (Boolean)request.getAttribute("result");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户密码更新</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/system_administrator/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){  
	if(result){
		document.getElementById("result").innerHTML = "用户名修改成功！";
	} else {
		document.getElementById("result").innerHTML = "用户名修改失败！";
	}
});
</script>

</head>
<body>
<div class="place"> <span>位置: </span>
 <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">用户密码更新</a></li>
 </ul>
</div>
<div class="formbody" id="result">
 
</div>
</body>
</html>