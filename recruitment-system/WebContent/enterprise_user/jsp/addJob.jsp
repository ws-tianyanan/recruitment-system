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
<title>我的公司简介 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，职位快速入职" name="keywords">
<meta content="易职专注于为职位提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家职位量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和职位架设起沟通之桥。" name="description">
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var jobName = document.getElementById("jobName");
		var jobSexRequirements = document.getElementById("jobSexRequirements");
		var jobHiringnum = document.getElementById("jobHiringnum");
		if (jobName.value == ""){
			alert("职位全称不能为空！");
			jobName.focus();
			return false;
		}
		if (jobSexRequirements.value == ""){
			alert("职位联系方式不能为空！");
			jobSexRequirements.focus();
			return false;
		}
		if (jobHiringnum.value == ""){
			alert("职位法人不能为空！");
			jobHiringnum.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>
	
	<!-- 职位信息填写页面 开始 -->
	<div class="resume_con">
		<!--tab设置-->
		<!-- <div class="user_operate">
			<ul style="float: left">
				<li> <a href="#">我的职位信息</a></li>
              	<li class="tn-tabs-selected"> <a href="JobApplyServlet?type=myapply">在招职位</a></li>
			</ul>
			<div class="clear"></div>
		</div> -->
		<!--主体部分-->
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left" style="width: 995px">
				<div class="resume_title">
					<div style="float: left">职位信息填写</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
					<!--------------------- 职位基本信息添加 ------------------------->
					<form action="JobServlet?type=addJobInfo" method="post" onsubmit="return validate();">
						<div class="table_style" style="margin-left:150px;">
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">职位名称：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="jobName"
										name="jobName">
										<input type="hidden" id="jobHrId" name="jobHrId">
										 <font style="color: red">*</font></td>
										 <td width="110" align="right" bgcolor="#F8F8F8">工作地区：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="jobArea"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
								<td width="110" align="right" bgcolor="#F8F8F8">职位薪资：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="jobSalary">&nbsp;&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">招聘人数：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="jobHiringnum"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">年龄要求：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="jobAgeRequirements">&nbsp;&nbsp;</td>
										<td width="110" align="right" bgcolor="#F8F8F8">学历要求：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="jobEducationRequirements"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
								<td width="110" align="right" bgcolor="#F8F8F8">性别要求：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="jobSexRequirements"
										name="jobSexRequirements"><font style="color: red">*</font>&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">外语要求：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="jobForeignLanguages"></td>
								</tr>
							</table>
							<div class="he"></div>
							
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">职位描述：</td>
									<td bgcolor="#F8F8F8" align="left">
									<textarea rows="10" cols="70" name="jobDesc"></textarea></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<td width="110" align="right" bgcolor="#F8F8F8">招聘状态：</td>
								<td bgcolor="#F8F8F8" align="left">
									<select name="jobState">
										<option value="0">请选择</option>
										<option value="1">招聘中</option>
										<option value="2">已暂停</option>
										<option value="3">已结束</option>
									</select>
								</td>
							</table>
							<div class="he"></div>
							<div class="he"></div>
							<div align="center">
								<input name="" type="submit" class="save1" value="保存">
								<input name="" type="reset" class="cancel2" value="取消">
							</div>
						</div>
					</form>
					<!--------------------- 职位基本信息添加 结束------------------->
				</div>
			</div>
		</div>
	</div>
	<!-- 职位信息填写面页面结束 -->
	
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>