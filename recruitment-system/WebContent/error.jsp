<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
// 获得请求的绝对地址
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/error.css" type="text/css" rel="stylesheet" />
</head>
<body>
<jsp:include page="top.jsp"/>
<div class="success_content">
  <div class="success_left">
    <div class="error"><img alt="" src="images/error.gif"></div>
    <h2 align="center">出错了！</h2>
  </div>
  <div class="success_right">
    <p class="green16"><%=exception%></p>
    <p><a href="javascript:window.history.go(-1);"><span class="tn-button">返回上一步</span></a>
    <a href="index.jsp"><span class="tn-button">返回首页</span></a></p>
  </div>
  <div class="clear"></div>
</div>
<iframe src="foot.html" width="100%" height="150"  scrolling="no" frameborder="0" ></iframe>
</body>
</html>