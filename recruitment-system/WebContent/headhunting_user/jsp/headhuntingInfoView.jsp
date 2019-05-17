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
</head>
<body>
<div class="resume_left" style="width: 995px">
				<!--------------------- 猎头基本信息展示 ------------------------->
				<div class="resume_title">
					<div style="float: left">猎头信息</div>
				</div>
				<div class="all_resume">
					<div class="table_style" style="width: 500px;margin-left: 200px">
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">姓名：</td>
								<td bgcolor="#F8F8F8"><%=basicinfo.getRealName() %></td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">性别：</td>
								<td bgcolor="#F8F8F8"><%=basicinfo.getGender() %></td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">出生日期：</td>
								<td bgcolor="#F8F8F8"><%=basicinfo.getbirthday() %>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">手机：</td>
								<td bgcolor="#F8F8F8"><%=basicinfo.getTelephone() %></td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">邮箱：</td>
								<td bgcolor="#F8F8F8"><%=basicinfo.getEmail() %></td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">工作经验：</td>
								<td bgcolor="#F8F8F8"><%=basicinfo.getJobExperience() %></td>
							</tr>
						</table>
						<div class="he"></div>
					</div>
					<div class="clear"></div>
				</div>
				<!--------------------- 猎头基本信息添加 结束------------------->
				
				
				<!--------------------- 企业基本信息添加 ------------------------->
				<div class="resume_title">
					<div style="float: left">企业信息</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
						<div class="table_style" style="margin-left: 150px;">
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业名称：</td>
									<td width="210" bgcolor="#F8F8F8" align="left">
									<%=enterprise.getCompanyName() %></td>
									<td width="110" align="right" bgcolor="#F8F8F8">所属行业：</td>
									<td width="210" bgcolor="#F8F8F8" align="left">
									<%=enterprise.getCompanyIndustry() %></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业性质：</td>
									<td width="210" bgcolor="#F8F8F8" align="left"><%=enterprise.getCompanyType() %></td>
									<td width="110" align="right" bgcolor="#F8F8F8">企业所在地：</td>
									<td width="210" bgcolor="#F8F8F8" align="left"><%=enterprise.getCompanyArea() %></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">联系电话：</td>
									<td width="210" bgcolor="#F8F8F8" align="left"><%=enterprise.getCompanyTel() %></td>
									<td width="110" align="right" bgcolor="#F8F8F8">企业规模：</td>
									<td width="210" bgcolor="#F8F8F8" align="left"><%=enterprise.getCompanySize() %></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业简介：</td>
									<td bgcolor="#F8F8F8" align="left"><%=enterprise.getCompanyBrief() %></td>
								</tr>
							</table>
							<div class="he"></div>
							<div class="he" style="height: 20px"></div>
						</div>
					<!--------------------- 企业基本信息添加 结束------------------->
				</div>
			</div>
	
	<!-- 企业信息填写面页面结束 -->
</body>
</html>