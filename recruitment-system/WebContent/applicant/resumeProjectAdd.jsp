<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 获得请求的绝对地址
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//获取简历id和简历完整度字段
	int basicinfoId = Integer.parseInt(request.getParameter("basicinfoId"));
	String completionOfResume = request.getParameter("completionOfResume");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历项目经验 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职" name="keywords">
<meta content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。" name="description">
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var entryName = document.getElementById("entryName");
		var entryStartTime = document.getElementById("entryStartTime");
		var entryStopTime = document.getElementById("entryStopTime");
		var assumeOffice = document.getElementById("assumeOffice");
		
		if (entryName.value == ""){
			alert("项目名称不能为空！");
			entryName.focus();
			return false;
		}
		if (entryStartTime.value == ""){
			alert("项目参与开始日期不能为空！");
			entryStartTime.focus();
			return false;
		}
		if (entryStopTime.value == ""){
			alert("项目参与结束日期不能为空！");
			entryStopTime.focus();
			return false;
		}
		
		if (assumeOffice.value == ""){
			alert("担任职位不能为空！");
			assumeOffice.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<!-- 网站公共头部 -->
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
					<div style="float: left">项目经验</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
					<!--------------------- 项目经验添加 ------------------------->
					<form action="ResumeServlet?type=addProject&basicinfoId=<%=basicinfoId %>" method="post" onsubmit="return validate();">
						<div class="table_style" style="margin-left:150px;">
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">项目名称：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="entryName"
										name="entryName"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">参与开始日期：</td>
									<td bgcolor="#F8F8F8" align="left"><input name="entryStartTime" type="text"
										id="entryStartTime" onclick="SelectDate(this)" readonly="readonly" />
										<font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">参与结束日期：</td>
									<td bgcolor="#F8F8F8" align="left"><input name="entryStopTime" type="text"
										id="entryStopTime" onclick="SelectDate(this)" readonly="readonly" />
										<font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">担任职位：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="assumeOffice"
										name="assumeOffice"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<div class="he"></div>
							<div align="center">
								<input name="" type="submit" class="save1" value="保存">
								<input name="" type="reset" class="cancel2" value="取消">
							</div>
						</div>
					</form>
					<!--------------------- 项目经验添加 结束------------------->
				</div>
			</div>
			<!-- 右侧公共部分：简历完善度 -->
			<iframe src="applicant/resume_right.jsp?completionOfResume=<%=completionOfResume %>" width="297" height="440"
				scrolling="no" frameborder="0"></iframe>
			<div style="clear: both"></div>
		</div>
	</div>
	<!-- 项目经验页面结束 -->
	
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>