<%@page import="com.itoffer.bean.Company"%>
<%@page import="com.itoffer.dao.CompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.itoffer.dao.CompanyDAO,com.itoffer.bean.Company,com.itoffer.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int companyId = Integer.parseInt(request.getParameter("companyId"));
CompanyDAO dao = new CompanyDAO();
Company company = dao.getCompanyByID(companyId);
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的公司简介 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职" name="keywords">
<meta content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。" name="description">
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script src="js/jquery-2.1.3.min.js"></script>
<script>
$(document).ready(function(){
    $('#btn').click(function(){
        $('#companyPic').click();
    });
})
$("#companyPic").change(function () {
    $("#text").html($("#companyPic").val());
})
</script>
<script type="text/javascript">
function validate() {
	var companyName = document.getElementById("companyName");
	var companyTel = document.getElementById("companyTel");
	var companyLegalPerson = document.getElementById("companyLegalPerson");
	if (companyName.value == ""){
		alert("企业全称不能为空！");
		companyName.focus();
		return false;
	}
	if (companyTel.value == ""){
		alert("企业联系方式不能为空！");
		companyTel.focus();
		return false;
	}
	if (companyLegalPerson.value == ""){
		alert("企业法人不能为空！");
		companyLegalPerson.focus();
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
				<li> <a href="#">我的企业信息</a></li>
              	<li class="tn-tabs-selected"> <a href="JobApplyServlet?type=myapply">在招职位</a></li>
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
					<form action="CompanyServlet?type=updateEnterpriseInfo&companyId=<%=company.getCompanyId() %>" 
					method="post" enctype="multipart/form-data" onsubmit="return validate();">
						<div class="table_style" style="margin-left:150px;">
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业名称：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="companyName"
										name="companyName" value="<%=company.getCompanyName()%>">
										<input type="hidden" id="companyHrId" name="companyHrId" value="<%=company.getCompanyHrId()%>">
										 <font style="color: red">*</font></td>
										 <td width="110" align="right" bgcolor="#F8F8F8">统一信用代码：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyCreditCode" value="<%=company.getCompanyCreditCode()%>"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
								<td width="110" align="right" bgcolor="#F8F8F8">所属行业：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyIndustry" value="<%=company.getCompanyIndustry()%>">&nbsp;&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">企业法人代表：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyLegalPerson" value="<%=company.getCompanyLegalPerson()%>"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">注册时间：</td>
									<td bgcolor="#F8F8F8" align="left"><input name="companyRegisterTime" type="text"
										id="companyRegisterTime" onclick="SelectDate(this)" readonly="readonly" value="<%=company.getCompanyRegisterTime()%>" />&nbsp;&nbsp;</td>
										<td width="110" align="right" bgcolor="#F8F8F8">注册资本(万元)：</td>
									<td bgcolor="#F8F8F8" align="left"><input name="companyRegisterCapital" type="text"
										id="companyRegisterCapital" value="<%=company.getCompanyRegisterCapital()%>" /></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业性质：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyType" value="<%=company.getCompanyType()%>">&nbsp;&nbsp;</td>
										<td width="110" align="right" bgcolor="#F8F8F8">企业所在地：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companyArea" value="<%=company.getCompanyArea()%>"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
								<td width="110" align="right" bgcolor="#F8F8F8">联系电话：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="companyTel"
										name="companyTel" value="<%=company.getCompanyTel()%>"><font style="color: red">*</font>&nbsp;</td>
									<td width="110" align="right" bgcolor="#F8F8F8">企业规模：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text"
										name="companySize" value="<%=company.getCompanySize()%>"></td>
								</tr>
							</table>
							<div class="he"></div>
							
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">企业简介：</td>
									<td bgcolor="#F8F8F8" align="left">
									<textarea rows="10" cols="70" name="companyBrief"><%=company.getCompanyBrief()%></textarea></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">宣传图片：</td>
									<td bgcolor="#F8F8F8" align="left">
									<label for="companyPic">
									<input class="dfinput" type="button" id="btn" value="选择文件"><span id="text"><%=company.getCompanyPic()%></span>
									<input name="companyPic" id="companyPic" type="file" class="dfinput" style="display: none"/>
									</label>
									<!-- <input name="companyPic" id="companyPic" type="file" class="dfinput" value=""/> -->
									<font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="650" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<td width="110" align="right" bgcolor="#F8F8F8">招聘状态：</td>
								<td bgcolor="#F8F8F8" align="left">
									<select name="companyState">
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