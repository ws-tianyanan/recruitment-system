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
<title>简历基本信息 - 易职网</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职" name="keywords">
<meta content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。" name="description">
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var graduateSchool = document.getElementById("graduateSchool");
		var studyStartTime = document.getElementById("studyStartTime");
		var education = document.getElementById("education");
		var major = document.getElementById("major");
		
		if (graduateSchool.value == ""){
			alert("就读学校不能为空！");
			graduateSchool.focus();
			return false;
		}
		if (studyStartTime.value == ""){
			alert("就读开始时间不能为空！");
			studyStartTime.focus();
			return false;
		}
		if(education.value == ""){
			alert("学历不能为空！");
			education.focus();
			return false;
		}
		if(major.value == ""){
			alert("专业不能为空！");
			major.focus();
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
					<div style="float: left">教育经历</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
					<!--------------------- 教育经历添加 ------------------------->
					<form action="ResumeServlet?type=addEucation&basicinfoId=<%=basicinfoId %>" method="post" onsubmit="return validate();">
						<div class="table_style" style="margin-left:150px;">
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">就读学校：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="graduateSchool"
										name="graduateSchool"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">就读开始时间：</td>
									<td bgcolor="#F8F8F8" align="left"><input name="studyStartTime" type="text"
										id="studyStartTime" onclick="SelectDate(this)" readonly="readonly" />
										<font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">学历：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="education"
										name="education"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">专业：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="major"
										name="major"> <font style="color: red">*</font></td>
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
					<!--------------------- 教育经历添加 结束------------------->
				</div>
			</div>
			<!-- 右侧公共部分：简历完善度 -->
			<iframe src="applicant/resume_right.jsp?completionOfResume=<%=completionOfResume %>" width="297" height="440"
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