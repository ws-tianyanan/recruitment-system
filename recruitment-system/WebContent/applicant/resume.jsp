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
<script type="text/javascript">
$(document).ready(function(){
	  $("#addResumeEnclosure").click(function(){
	    $("#uploadResumeEnclosure").show();
	    $("#noEnclosure").hide();
	  });
	});
$(function () {
    $("#uploadResume").click(function () {
    	//接收上传文件的后台地址
    	var fileStorageAddress = "../../file/upload_resume";
    	var formData = new FormData();
        formData.append("type","uploadResumeEnclosure");
        formData.append("resumefile",$("#uploadResumeFile"));
        formData.append("basicinfoId",$("#basicinfoId").val());
        $.ajax({
            url: "UploadServlet",
            type: "POST",
            data: formData,
            /**
            * 必须false才会自动加上正确的Content-Type,
            * 当有文件要上传时，此项是必须的，否则后台无法识别文件流的起始位置
            */
            contentType: false,
            /*是否序列化data属性，默认true(注意：false时type必须是post)
            * 必须false才会避开jQuery对 formdata 的默认处理
            * XMLHttpRequest会对 formdata 进行正确的处理
            */
            processData: false,
          /* //这里是返回类型，一般是json,text等
            dataType: 'json', */
            /* mimeType:"multipart/form-data", */
            success: function (data) {
                if (data.status == "true") {
                    alert("上传成功！");
                }
                if (data.status == "error") {
                    alert(data.msg);
                }
            },
            error: function () {
                alert("上传失败！");
            }
    });
	})
});
</script>
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="basicinfo" class="com.itoffer.bean.Resume" scope="request"></jsp:useBean>
	
	<!-- 我的简历页面开始 -->
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
					<c:if test="${empty sessionScope.SESSION_RESUMEID }"> 
					<div class="btn">
						<a href="applicant/resumeBasicInfoAdd.jsp?completionOfResume=${basicinfo.completionOfResume }">添加</a>
					</div></c:if> 
					<c:if test="${not empty sessionScope.SESSION_RESUMEID }"> 
					<div class="btn">
						<a href="ResumeServlet?type=updateSelect">修改</a>
					</div></c:if>
				</div>
				<div class="all_resume">
					<div class="table_style">
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">姓名：</td>
								<td bgcolor="#F8F8F8">${basicinfo.realName }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">性别：</td>
								<td bgcolor="#F8F8F8">${basicinfo.gender }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">出生日期：</td>
								<td bgcolor="#F8F8F8">${basicinfo.birthday }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">现居住地：</td>
								<td bgcolor="#F8F8F8">${basicinfo.currentLoca }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">户口所在地：</td>
								<td bgcolor="#F8F8F8">${basicinfo.residentLoca }</td>
							</tr>
						</table>
						<div class="he"></div>

						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">手机：</td>
								<td bgcolor="#F8F8F8">${basicinfo.telephone }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">邮箱：</td>
								<td bgcolor="#F8F8F8">${basicinfo.email }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">求职意向：</td>
								<td bgcolor="#F8F8F8">${basicinfo.jobIntension }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">工作经验：</td>
								<td bgcolor="#F8F8F8">${basicinfo.jobExperience }</td>
							</tr>
						</table>
						<div class="he"></div>
					</div>
					<div style="float: right" class="uploade">
						<% if("".equals(basicinfo.getHeadShot()) || null==basicinfo.getHeadShot()){ %>
						<img src="applicant/images/anonymous.png">
						<% }else{ %>
						<img src="file/upload_headshot/<jsp:getProperty property="headShot" name="basicinfo"/>" width="140" height="140">
						<% } %>
						<p>&nbsp;</p>
						<div align="center">
							<a href="applicant/resumeBasicInfoPicUpload.jsp?basicinfoId=${basicinfo.basicinfoId }&completionOfResume=${basicinfo.completionOfResume }" class="uploade_btn">更换照片</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="resume_title">
					<div style="float: left">教育经历</div>
					<c:if test="${basicinfo.completionOfResume!='31' }"> 
					<div class="btn">
						<a href="applicant/resumeEducationAdd.jsp?basicinfoId=${basicinfo.basicinfoId }&completionOfResume=${basicinfo.completionOfResume }">添加</a>
					</div></c:if> 
					<c:if test="${basicinfo.completionOfResume=='31' }"> 
					<div class="btn">
						<a href="applicant/resumeEducationUpdate.jsp?basicinfoId=${basicinfo.basicinfoId }&completionOfResume=${basicinfo.completionOfResume }">修改</a>
					</div></c:if>
					
					
				</div>
				<div class="it-table-grid">
					<ul>
						<li class="tn-border-gray tn-border-bottom it-table-grid-header">
							<p class="tn-name">毕业院校</p>
							<p class="tn-date">就读时间</p>
							<p class="tn-degree">学历</p>
							<p class="tn-fieldofstudy">专业</p>
						</li>
					</ul>
					<ul>
						<li class="tn-border-bottom">
							<p class="tn-name">${basicinfo.graduateSchool }</p>
							<p class="tn-date">${basicinfo.studyStartTime }</p>
							<p class="tn-degree">${basicinfo.education }</p>
							<p class="tn-fieldofstudy">${basicinfo.major }</p>
						</li>
					</ul>
				</div>
				<div class="resume_title">
					<div style="float: left">项目经验</div>
					<div class="btn">
						<a href="applicant/resumeProjectAdd.jsp?basicinfoId=${basicinfo.basicinfoId }&completionOfResume=${basicinfo.completionOfResume }">添加</a>
					</div>
				</div>
				<div class="it-table-grid">
					<ul>
						<li class="tn-border-gray tn-border-bottom it-table-grid-header">
							<p class="tn-name">项目名称</p>
							<p class="tn-date">担任职位</p>
							<p class="tn-degree">参与时间</p>
						</li>
					</ul>
					<ul>
						<li class="tn-border-bottom">
							<p class="tn-name">${basicinfo.entryName }</p>
							<p class="tn-date">${basicinfo.assumeOffice }</p>
							<p style="width: 30%;">${basicinfo.entryStartTime } --- ${basicinfo.entryStopTime }</p>
						</li>
					</ul>
				</div>
				<div class="resume_title">
					<div style="float: left">简历附件</div>
					<c:if test="${empty basicinfo.resumeEnclosure }"> 
						<div class="btn" id="addResumeEnclosure">添加</div></c:if> 
					<c:if test="${not empty basicinfo.resumeEnclosure }"> 
						<div class="btn">修改</div></c:if>
				</div>
				<div class="it-table-grid">
					<div class="it-table-grid" id="noEnclosure">暂无附件！</div>
					<div id="uploadResumeEnclosure" style="display: none">
					<form id="uploadResumeFileForm" name="uploadResumeFileForm" enctype="multipart/form-data">
						<input type="hidden" id="basicinfoId" value="${basicinfo.basicinfoId }">
						<input type="file" id="uploadResumeFile" name="uploadResumeFile" value="上传简历附件">
						<input type="submit" id="uploadResume" value="上传" /></form>
					</div>
				</div>
			</div>
			<!-- 右侧公共部分：简历完善度 -->
			<iframe src="applicant/resume_right.jsp?userId=${basicinfo.userId }&completionOfResume=${basicinfo.completionOfResume }" width="297" height="440"
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