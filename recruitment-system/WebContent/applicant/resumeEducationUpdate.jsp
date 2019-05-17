<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.itoffer.bean.Resume" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历基本信息修改 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职" name="keywords">
<meta content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。" name="description">
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var realname = document.getElementById("realName");
		var telephone = document.getElementById("telephone");
		var email = document.getElementById("email");
		// 邮箱格式正则表达式
		var emailPattern =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		// 手机号格式正则表达式
		var phonePattern = /^(((13[0-9]{1})|159|153)+\d{8})$/;
		
		if (realname.value == ""){
			alert("姓名不能为空！");
			realname.focus();
			return false;
		}
		if (telephone.value == ""){
			alert("手机不能为空！");
			telephone.focus();
			return false;
		}else if(!phonePattern.test(telephone.value)){
			alert("手机号格式不正确！");
			telephone.focus();
			return false;
		}
		if (email.value == ""){
			alert("邮箱不能为空！");
			email.focus();
			return false;
		}else if(!emailPattern.test(email.value)){
			alert("邮箱格式不正确！");
			email.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<!-- 我的简历页面 开始 -->
	<div class="resume_con">
		<!--tab设置-->
		<div class="user_operate">
			<ul style="float: left">
			  <li> <a href="ResumeServlet?type=select">我的简历</a></li>
              <li class="tn-tabs-selected"> <a href="JobApplyServlet?type=myapply">我的申请</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		<!--主体部分-->
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left">基本信息</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
				<h3><font color="red">${basicinfo.resumeUpdateResult}</font></h3>
<!--------------------- 简历基本信息更新 ------------------------->
<form action="ResumeServlet?type=update" method="post" onsubmit="return validate();">
	<div class="table_style" style="margin-left:150px;">
		<table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">姓名：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="text" id="realName" name="realName" value="${basicinfo.realName }">
				<input type="hidden" name="basicinfoId" value="${basicinfo.basicinfoId }">
				<font style="color: red">*</font></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">性别：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="radio" name="gender" value="男"
				<c:if test="${basicinfo.gender=='男'}">
				checked="checked" </c:if>>男&nbsp;&nbsp; 
				<input type="radio" name="gender" value="女"
				<c:if test="${basicinfo.gender=='女'}">
				checked="checked" </c:if>>女</td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">出生日期：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input name="birthday" type="text" id="birthday" onclick="SelectDate(this)" 
				readonly="readonly" value='<fmt:formatDate value="${basicinfo.birthday }"/>'/></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">当前所在地：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="text" name="currentLoca" value="${basicinfo.currentLoca }"></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">户口所在地：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="text" name="residentLoca" value="${basicinfo.residentLoca }"></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">手机：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="text" id="telephone" name="telephone" value="${basicinfo.telephone }">
				<font style="color: red">*</font></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">邮箱：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="text" id="email" name="email" value="${basicinfo.email }">
				<font style="color: red">*</font></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">求职意向：</td>
				<td bgcolor="#F8F8F8" align="left">
				<input type="text" name="jobIntension" value="${basicinfo.jobIntension }"></td>
			</tr>
		</table>
		<div class="he"></div>
		<table width="350" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#EEEEEE">
			<tr>
				<td width="110" align="right" bgcolor="#F8F8F8">工作经验：</td>
				<td bgcolor="#F8F8F8" align="left">
				<select name="jobExperience">
					<option value="0">请选择</option>
					<option value="刚刚参加工作" <c:if test="${basicinfo.jobExperience=='刚刚参加工作' }">
					selected="selected"</c:if>>刚刚参加工作</option>
					<option value="已工作一年"<c:if test="${basicinfo.jobExperience=='已工作一年' }">
					selected="selected"</c:if>>已工作一年</option>
					<option value="已工作二年"<c:if test="${basicinfo.jobExperience=='已工作二年' }">
					selected="selected"</c:if>>已工作二年</option>
					<option value="已工作三年"<c:if test="${basicinfo.jobExperience=='已工作三年' }">
					selected="selected"</c:if>>已工作三年</option>
					<option value="已工作三年以上"<c:if test="${basicinfo.jobExperience=='已工作三年以上' }">
					selected="selected"</c:if>>已工作三年以上</option>
				</select></td>
			</tr>
		</table>
		<div class="he"></div>
		<div class="he"></div>
		<div align="center">
			<input name="" type="submit" class="save1" value="保存">
			<input name="" type="button" onclick="javascript:window.location.href='<%=basePath%>ResumeServlet?type=select';" class="cancel2" value="返回">
		</div>
	</div>
</form>
<!--------------------- 简历基本信息添加 结束------------------->
				</div>
			</div>
			<!-- 右侧公共部分：简历完善度 -->
			<iframe src="applicant/resume_right.jsp?completionOfResume=${basicinfo.completionOfResume }" width="297" height="440"
				scrolling="no" frameborder="0"></iframe>
			<div style="clear: both"></div>
		</div>
	</div>
	<!-- 我的简历页面结束 -->
	
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>