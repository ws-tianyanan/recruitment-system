<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.itoffer.dao.ResumeDAO,com.itoffer.bean.Resume,com.itoffer.bean.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript"
	language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var companyName = document.getElementById("companyName");
		if (companyName.value == "") {
			alert("企业全称不能为空！");
			companyName.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>

	<!-- 企业信息填写页面 开始 -->
	<div class="resume_con">
		<!--tab设置-->
		<div class="user_operate">
			<ul style="float: left">
				<li><a href="#">我的企业信息</a></li>
				<li class="tn-tabs-selected"><a
					href="JobApplyServlet?type=myapply">在招职位</a></li>
			</ul>
			<div class="clear"></div>
		</div>
		<!--主体部分-->
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left" style="width: 995px">
				<div class="resume_title">
					<div style="float: left">企业信息填写</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
					<!--------------------- 企业基本信息添加 ------------------------->
					<form action="headhuntingServlet?type=addEnterpriseInfo" method="post"
						onsubmit="return validate();">
						<div class="table_style" style="margin-left: 150px;">
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业名称：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										id="companyName" name="companyName"> <font
										style="color: red">*</font>&nbsp;&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">所属行业：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyIndustry">&nbsp;&nbsp;</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业性质：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyType">&nbsp;&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">企业所在地：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyArea"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">联系电话：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										id="companyTel" name="companyTel"><font
										style="color: red">*</font>&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">企业规模：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companySize"></td>
								</tr>
							</table>
							<div class="he"></div>

							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业简介：</td>
									<td bgcolor="#F8F8F8" align="left"><textarea rows="10"
											cols="69" name="companyBrief"></textarea></td>
								</tr>
							</table>
							<div class="he"></div>
							<div class="he"></div>
							<div align="center">
								<input name="" type="submit" class="save1" value="保存"> <input
									name="" type="reset" class="cancel2" value="取消">
							</div>
						</div>
					</form>
					<!--------------------- 企业基本信息添加 结束------------------->
				</div>
			</div>
		</div>
	</div>
	<!-- 企业信息填写面页面结束 -->

	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>