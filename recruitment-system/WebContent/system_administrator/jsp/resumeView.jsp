<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<%
String picPath = getServletContext().getRealPath("/applicant/images");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历详情</title>
<base href="<%=basePath %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <!-- <li><a href="#">首页</a></li> -->
    <li><a href="#">简历详情</a></li>
  </ul>
</div>

<div class="formbody">
 <div class="usual">
  <div class="tabson">
  <div style="margin:20px 10px;border-radius: 10px;width: 700px;height: 50px">
     <b><label style="font-size: 25px">简历ID（用户ID）: </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <label style="width: 200px;font-size: 25px">${requestScope.resume.basicinfoId }（ ${requestScope.resume.userId } ）</label></b>
   </div>
   <b><label style="margin-left: 20px;font-size: 15px">基本信息</label></b>
   <div style="border: 1px solid #B7D5DF;background-color: #F5F5F5;border-radius: 10px;width: 500px;height: 470px">
   <ul class="forminfo">
    <li>
     <label>真实姓名: </label>
     <label style="width: 200px;"><b style="color:#000">${requestScope.resume.realName }</b></label>
    </li>
	<li>
	 <label>照片: </label>
	 <!-- /recruitment-system/WebContent/file/upload_headshot -->
	 <img src="${pageContext.servletContext.contextPath }/file/upload_headshot/${requestScope.resume.headShot }" width="100px" height="100px">
	</li> 
	<li>
	 <label>性别: </label>
	 <label style="width: 200px;"><b style="color:#000">${requestScope.resume.gender }</b></label>
	</li>
	<li>
	 <label>出生日期: </label>
	 <label style="width:200px;"><b style="color: #000">${requestScope.resume.birthday }</b></label>
	</li>
	<li>
	 <label>当前所在地: </label>
	 <label style="width: 200px;"><b style="color: #000">${requestScope.resume.currentLoca }</b></label>
	</li>
	<li>
	 <label>户口所在地: </label>
	 <label style="width: 200px;"><b style="color: #000">${requestScope.resume.residentLoca }</b></label>
	</li>
	<li>
	 <label>手机号: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.telephone }</b></label>
	</li>
	<li>
	 <label>邮箱: </label>
	 <label style="width: 200px;"><b style="color: #000">${requestScope.resume.email }</b></label>
	</li>
	<li>
	 <label>求职意向: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.jobIntension }</b></label>
	</li>
	<li>
	 <label>工作经验: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.jobExperience }</b></label>
	</li>
   </ul>
   </div>
   <br>
   <b><label style="margin-left: 20px;font-size: 15px">教育经历</label></b>
   <div style="border: 1px solid #B7D5DF;background-color: #F5F5F5;border-radius: 10px;width: 500px;height: 180px">
   <ul class="forminfo">
	<li>
	 <label>毕业院校: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.graduateSchool }</b></label>
	</li>
	<li>
	 <label>就读时间: </label>
	 <label style="width: 200px;"><b style="color: #000">${requestScope.resume.studyStartTime }</b></label>
	</li>
	<li>
	 <label>学历: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.education }</b></label>
	</li>
	<li>
	 <label>专业: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.major }</b></label>
	</li>
   </ul>
   </div>
   <br>
   <b><label style="margin-left: 20px;font-size: 15px">项目经验</label></b>
   <div style="border: 1px solid #B7D5DF;background-color: #F5F5F5;border-radius: 10px;width: 500px;height: 180px">
   <ul class="forminfo">
	<li>
	 <label>项目名称: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.entryName }</b></label>
	</li>
	<li>
	 <label>开始时间: </label>
	 <label style="width: 200px;"><b style="color: #000">${requestScope.resume.entryStartTime }</b></label>
	</li>
	<li>
	 <label>结束时间: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.entryStopTime }</b></label>
	</li>
	<li>
	 <label>担任职位: </label>
	 <label style="width: 200px;"> <b style="color: #000"> ${requestScope.resume.assumeOffice }</b></label>
	</li>
   </ul>
   </div>
   <br>
   <b><label style="margin-left: 20px;font-size: 15px">简历附件</label></b>
   <div style="border: 1px solid #B7D5DF;background-color: #F5F5F5;border-radius: 10px;width: 500px;height: 50px">
   <ul class="forminfo">
   	<li>
	 <label>简历附件: </label>
	 <label style="width: 200px;margin-bottom: 20px;"> <b style="color: #000"> ${requestScope.resume.resumeEnclosure }</b></label>
	</li>
   </ul>
   </div>
  </div>
 </div>
</div>
</body>
</html>