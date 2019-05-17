<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.itoffer.bean.Job" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%
Job job = (Job)request.getAttribute("job");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>职位信息更新</title>
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
  <li><a href="#">职位信息更新</a></li>
 </ul>
</div>
<div class="formbody">
 <div class="usual">
  <form name="frm" action="${pageContext.servletContext.contextPath }/ManagerJobServlet" method="post" onsubmit="return validate();">
  <div class="tabson">
  <ul class="forminfo">
    <li> <label style="font-size: 20px;">职位ID</label><label style="font-size: 20px;width: 700px"><%=job.getJobId() %>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<b>所属企业（企业ID）</b>&nbsp;&nbsp;<b><%=job.getCompany().getCompanyName() %>（<%=job.getCompany().getCompanyId() %>）</b></label> <br><br>
	</li>
  	<li> <label>职位名称 <b>*</b>: </label>
	 <input name="jobName" value='<%=job.getJobName() %>' id="jobName"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>招聘人数：</label>
	 <input name="jobHiringnum" value='<%=job.getJobHiringnum() %>' id="jobHiringnum"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>职位薪资：</label>
	 <input name="jobSalary" value='<%=job.getJobSalary() %>' id="jobSalary"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>工作地区：</label>
	 <input name="jobArea" value='<%=job.getJobArea() %>' id="jobArea"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>年龄要求：</label>
	 <input name="jobAgeRequirements" value='<%=job.getJobAgeRequirements() %>' id="jobAgeRequirements"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>学历要求：</label>
	 <input name="jobEducationRequirements" value='<%=job.getJobEducationRequirements() %>' id="jobEducationRequirements"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>性别要求：</label>
	 <input name="jobSexRequirements" value='<%=job.getJobSexRequirements() %>' id="jobSexRequirements"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>外语要求：</label>
	 <input name="jobForeignLanguages" value='<%=job.getJobForeignLanguages() %>' id="jobForeignLanguages"
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>职位招聘状态：</label>
	 <div class="vocation">
	  <select name="jobState" class="select3">
	   <option value="1" <%if(job.getJobState() == 1){ %>
  	   selected="selected"<%} %>>招聘中</option>
  	   <option value="2" <%if(job.getJobState() == 2){ %>
	    selected="selected"<%} %>>已暂停</option>
	   <option value="3" <%if(job.getJobState() == 3){ %>
	    selected="selected"<%} %>>已结束</option>
	  </select>
	 </div>
	</li>
	<li> <p>岗位职责：</p><br>
		 <textarea name="jobDesc" id="jobDesc" cols="50" rows="10" class="ckeditor" >
		 <%=job.getJobDesc() %></textarea>
	</li>
	<li> <label>&nbsp;</label>
	 <input name="jobId" value="<%=job.getJobId() %>" type="hidden">
	 <input name="type" type="hidden" class="btn" value="updateJobByManager"/>
	 <input name="" type="submit" class="btn" value="修改"/>
	</li>
   </ul>
  </div>
 </form>
 </div>
</div>
</body>
</html>