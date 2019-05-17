<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%--  errorPage="/error.jsp" --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.itoffer.dao.ResumeDAO,com.itoffer.bean.Resume,com.itoffer.bean.User,com.itoffer.bean.Company"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Resume basicinfo = (Resume)request.getAttribute("basicinfo");
	Company enterprise = (Company)request.getAttribute("enterprise");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的公司简介 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta
	content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职"
	name="keywords">
<meta
	content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。"
	name="description">
<script type="text/javascript">
function setIframeHeight(iframe) {
	if (iframe) {
	var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
	if (iframeWin.document.body) {
	iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
	}
	}
	};

	window.onload = function () {
	setIframeHeight(document.getElementById('external-frame'));
	};
</script>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>

	<!-- 企业信息填写页面 开始 -->
	<div class="resume_con">
		<!-- tab设置 -->
		<div class="user_operate">
			<ul style="float: left">
			<!-- /recruitment-system/WebContent/headhunting_user/jsp/userInfoView.jsp -->
				<li><a href="${pageContext.servletContext.contextPath }/headhuntingServlet?type=viewHeadhuntingInfo" target="mianFrame">我的猎头信息</a></li>
				<li class="tn-tabs-selected"><a
				href="${pageContext.servletContext.contextPath }/ManagerCompanyServlet?type=listByManager" target="mianFrame">我的企业列表</a></li>
				<li class="tn-tabs-selected"><a
				href="${pageContext.servletContext.contextPath }/ManagerJobServlet?type=listByManager" target="mianFrame">我的职位列表</a></li>
				<!-- /recruitment-system/WebContent/system_administrator/jsp/userList.jsp -->
				<li class="tn-tabs-selected"><a
				href="system_administrator/jsp/userList.jsp" target="mianFrame">我的客户列表</a></li>
				<li class="tn-tabs-selected"><a
				href="${pageContext.servletContext.contextPath }/ManagerResumeServlet?type=list" target="mianFrame">我的简历列表</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		<!--主体部分-->
		<div class="resume_main">
			<!--显示内容-->
			<iframe src="${pageContext.servletContext.contextPath }/headhuntingServlet?type=viewHeadhuntingInfo" 
			name="mianFrame" id="mianFrame" title="mianFrame" width="1000px"  height="100%" 
			frameborder="0" scrolling="no"  onload="setIframeHeight(this)">
			
			</iframe>
		</div>
	</div>
	
	<!-- 企业信息填写面页面结束 -->

	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>