<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.itoffer.dao.ResumeDAO,com.itoffer.bean.Resume,com.itoffer.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的简历 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<script src="js/jquery-2.1.3.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<meta
	content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职"
	name="keywords">
<meta
	content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。"
	name="description">
<body>
<jsp:include page="../top.jsp"></jsp:include>

<div class="resume_con">
	<div class="status">
	<div style="float:left">
	<!-- <span style="font-size:14px">简历状态：</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#666666">通过审核</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#19A8B6">通过审核</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#19A8B6">不通过审核</span></div>-->
	<!--<div style="float:left" class="pingyu">评语</div> -->
	<div class="clear"></div>
	</div>
	<div class="all_resume">
		<div style="float:left">
			<span class="person_name">${basicinfo.realName }：</span>${basicinfo.gender }
			<p>${basicinfo.jobIntension } | ${basicinfo.jobExperience }| ${basicinfo.currentLoca }</p>
			<p>手机：${basicinfo.telephone }</p>
			<p>电子邮箱：${basicinfo.email }</p>
			<p>户口所在地：${basicinfo.residentLoca }</p>
			<p>出生日期：${basicinfo.birthday }</p>
		</div>
		<div style="float:right"><img src="file/upload_headshot/${basicinfo.headShot }" width="240" height="240"></div>
		<div class="clear"></div>
	</div>
	<div class="resume_title">教育经历</div>
	<div class="all_resume">
			<p>${basicinfo.graduateSchool } | ${basicinfo.education }</p>
			<p>专业：${basicinfo.major }</p>
			<p>入学时间：${basicinfo.studyStartTime }</p>
			<%-- <p>毕业时间：${basicinfo.studyStartTime }</p> --%>
	</div>
	<div class="resume_title">项目经验</div>
	<div class="all_resume">
			<p>项目名称：${basicinfo.entryName }</p>
			<p>项目参与开始时间：${basicinfo.entryStartTime }</p>
			<p>项目参与结束时间：${basicinfo.entryStopTime }</p>
			<p>担任职位：${basicinfo.assumeOffice }</p>
	</div>
	<div class="resume_title">求职意向</div>
	<div class="all_resume">
			<p>求职意向：${basicinfo.jobIntension }</p>
			<p>工作经验：${basicinfo.jobExperience }</p>
			<p>简历附件：${basicinfo.resumeEnclosure }</p>
	</div>
	</div>
</div>
<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>