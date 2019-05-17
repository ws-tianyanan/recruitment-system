<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itoffer.bean.User"%>
<%
	// 获得请求的绝对地址
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易职网</title>
<!-- 设置网页的基链接地址 -->
<base href="<%=basePath%>">
<link href="css/base.css" rel="stylesheet" type="text/css">
<script src="js/jquery-2.1.3.min.js"></script>
<script>
	//案例:点击按钮修改a标签的地址和热点文字
	/* $(document).ready(function(){
	 var userRole = ${sessionScope.SESSION_USER.userEmail};
	 $("#index").click(function(){
	 if(userRole == 1){
	 $("#index").href = "index.jsp";
	 } else if(userRole == 2){
	 $("#index").href = "CompanyServlet?type=viewEnterpriseInfo";
	 } else if(userRole == 3){
	 $("#index").href = "index.jsp";
	 }
	 });
	 }); */
</script>
</head>
<body>
	<div class="head">
		<div class="head_area">
			<div class="head_nav">
				<ul>
					<li><img src="images/nav_inc1.png" /><a href="index.jsp"
						id="index">首页</a></li>
					<li><img src="images/nav_inc3.png" /><a href="#">关于易职</a></li>
				</ul>
			</div>
			<div class="head_logo">
				<img src="images/main_logo.png" style="width: 200px;height: 35px;margin-top: -5px" />
			</div>
			<div class="head_user">
				<%
					if (session.getAttribute("SESSION_USER") == null) {
				%>
				<a href="system_administrator/administrator_login.jsp"
					target="_parent"><span class="type3">管理员登录</span></a> <a
					href="login.jsp" target="_parent"><span class="type1">登录</span></a><a
					href="register.jsp" target="_parent"><span class="type2">注册</span></a>
				<%
					} else {
				%>
				<c:if test="${sessionScope.SESSION_USER.userRole == 1}">
					<a href="ResumeServlet?type=select">${sessionScope.SESSION_USER.userEmail}<%
						//=sessionUser.getUserEmail()
					%></a>&nbsp;&nbsp;
					</c:if>
				<c:if test="${sessionScope.SESSION_USER.userRole == 2}">
					<a href="CompanyServlet?type=viewEnterpriseInfo">${sessionScope.SESSION_USER.userEmail}</a>&nbsp;&nbsp;
					</c:if>
				<c:if test="${sessionScope.SESSION_USER.userRole == 3}">
					<a href="headhunting_user/jsp/main.jsp">${sessionScope.SESSION_USER.userEmail}<%
						//=sessionUser.getUserEmail()
					%></a>&nbsp;&nbsp;
					</c:if>
				<a href="LogoutServlet">退出</a>
				<%
					}
				%>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="top_main">
		<!-- <div class="top_logo">
			<img src="images/main_logo.png" />
		</div> -->
	</div>
	<div class="clear"></div>
</body>
</html>