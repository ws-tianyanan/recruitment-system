<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.itoffer.bean.Job" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>职位信息添加</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/system_administrator/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function validate(){
	if(document.getElementById("jobName").value == ""){
		alert("职位名称不能为空！");
		document.getElementById("jobName").focus();
		return false;
	}
	return true;
}
</script>

</head>
<body>
<div class="place"> <span>位置: </span>
 <ul class="placeul">
  <!-- <li><a href="#">首页</a></li> -->
  <li><a href="#">职位信息添加</a></li>
 </ul>
</div>
<div class="formbody">
 <div class="usual">
  <form name="frm" action="${pageContext.servletContext.contextPath }/ManagerJobServlet?type=addByManager" method="post" onsubmit="return validate();">
  <div class="tabson">
  <ul class="forminfo">
  	<li> <label>企业id <b>*</b>: </label>
	 <input name="companyId" id="companyId"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
  	<li> <label>职位名称 <b>*</b>: </label>
	 <input name="jobName" id="jobName"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>招聘人数：</label>
	 <input name="jobHiringnum" id="jobHiringnum"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>职位薪资：</label>
	 <input name="jobSalary" id="jobSalary"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>工作地区：</label>
	 <input name="jobArea" id="jobArea"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>年龄要求：</label>
	 <input name="jobAgeRequirements" id="jobAgeRequirements"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>学历要求：</label>
	 <input name="jobEducationRequirements" id="jobEducationRequirements"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>性别要求：</label>
	 <input name="jobSexRequirements" id="jobSexRequirements"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>外语要求：</label>
	 <input name="jobForeignLanguages" id="jobForeignLanguages"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>职位招聘状态：</label>
	 <div class="vocation">
	  <select name="jobState" class="select3">
	   <option value="1">招聘中</option>
       <option value="2">已暂停</option>
       <option value="3">已结束</option>
	  </select>
	 </div>
	</li>
	<li> <p>岗位职责：</p><br>
		 <textarea name="jobDesc" id="jobDesc" cols="50" rows="10" class="ckeditor" ></textarea>
	</li>
	<li> <label>&nbsp;</label>
	 <input name="jobId" type="hidden">
	 <input name="type" type="hidden" class="btn" value="updateJobByManager"/>
	 <input name="" type="submit" class="btn" value="保存"/>
	</li>
   </ul>
  </div>
 </form>
 </div>
</div>
</body>
</html>