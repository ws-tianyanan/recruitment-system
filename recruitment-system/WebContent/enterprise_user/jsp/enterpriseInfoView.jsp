<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="com.itoffer.bean.User,com.itoffer.bean.Company,com.itoffer.bean.Job,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业信息展示</title>
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/company.css" type="text/css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<%
User user = (User)request.getAttribute("user");
Company company = (Company)request.getAttribute("company");
List<Job> joblist = (List<Job>)request.getAttribute("joblist");
%>
<div class="tn-grid">
   <div class="bottomban">
    <div class="bottombanbox"> <img src="file/upload_companypic/<%=company.getCompanyPic() %>" /> </div>
  </div>
</div>

<div class="clear"></div>
<div class="tn-grid">
  <div class="tn-widget-content">
    <div class="tn-box-content">
      <div class="tn-helper-clearfix">
        <div class="it-main2">
          <div class="it-ctn-heading">
            <div class="it-title-line"> <span> <em> <%=company.getCompanyViewnum() %> </em> 浏览 </span>
              <h3> 企业简介 </h3>
            </div>
          </div>
          <h1 style="margin-top: 15px"> <%=company.getCompanyName() %> </h1>
          <!-- /recruitment-system/WebContent/enterprise_user/jsp/updateEnterprise.jsp -->
          <div style="display: block;float: right;margin-top: -25px;margin-right: 20px">
          	<a class="tn-button-small" href="enterprise_user/jsp/updateEnterprise.jsp?companyId=<%=company.getCompanyId() %>">
          	<span class="tn-button-text">修改</span> </a>
          </div>
          <div class="it-com-textnote"> 
          &nbsp;&nbsp;&nbsp;&nbsp;
           <span class="kuai"> 性质：<%=company.getCompanyType() %> </span> 
           <span class="kuai"> 规模：<%=company.getCompanySize() %> 人</span> 
          </div>
          <div class="company">
	        <table class="it-table" style="width:950px;margin-bottom: 10px">
	          <tbody>
	          	<tr>
	              <td class="it-table-title"> 注册时间： </td>
	              <td class="tn-border-rb"><%=company.getCompanyRegisterTime() %></td>
	              <td class="it-table-title"> 注册资本： </td>
	              <td class="tn-border-rb"><%=company.getCompanyRegisterCapital() %></td>
	            </tr>
	            <tr>
	              <td class="it-table-title"> 注册法人： </td>
	              <td class="tn-border-rb"><%=company.getCompanyLegalPerson() %></td>
	              <td class="it-table-title"> 所属行业：</td>
	              <td class="tn-border-rb"><%=company.getCompanyIndustry() %></td>
	            </tr>
	            <tr>
	             <td class="it-table-title"> 企业地址： </td>
	              <td class="tn-border-rb"> <%=company.getCompanyArea() %> </td>
	             <td class="it-table-title"> 统一信用代码： </td>
	              <td class="tn-border-rb"><%=company.getCompanyCreditCode() %></td>
	            </tr>
	            <tr>
	              <td class="it-table-title"> 企业hr： </td>
	              <td class="tn-border-rb"> <%=user.getUserRealname() %> </td>
	              <td class="it-table-title"> 联系电话：</td>
	              <td class="tn-border-rb"><%=company.getCompanyTel() %></td>
	            </tr>
	          </tbody>
	        </table>
	       </div>
          <div class="it-company-text">
            <p class="p1" style="padding-left: 30px;">
            <span style="line-height: 1.5; font-size: 14px;"> 
           	<%=company.getCompanyBrief() %>
            </span> </p>
          </div>
          
        </div>
      </div>
    </div>
  </div>
  
  <div class="it-content-seqbox">
    <div id="morejob"   >
      <div class="it-ctn-heading">
        <div class="it-title-line"> <span> <a href="enterprise_user/jsp/addJob.jsp">添加职位</a> </span>
          <h3> 职位 </h3>
        </div>
      </div>
      <!--职位列表-->
      <% if(joblist!=null){
      		for(Job job:joblist){
      %>
      <div class="it-post-box tn-border-dashed">
        <div class="it-post-name">
          <div class="tn-helper-right it-post-btn"> 
          <a class="it-font-underline" href="JobServlet?type=viewJobInfo&jobId=<%=job.getJobId()%>">
          <span class="tn-icon-view"></span><span class=tn-action-text>查看详细</span> </a>
          <!-- /recruitment-system/WebContent/enterprise_user/jsp/updateJob.jsp -->
          <a class="tn-button-small" href="enterprise_user/jsp/updateJob.jsp?jobId=<%=job.getJobId()%>">
          <span class="tn-button-text">修改</span> </a></div>
          <h3><a href="JobServlet?type=viewJobInfo&jobId=<%=job.getJobId()%>"><%=job.getJobName() %></a></h3>
        </div>
        <ul class="it-post">
          <li style="width:300px;">薪资： 
          <span class="it-font-size"><%=job.getJobSalary() %></span></li>
          <li style="width:250px;"><span class=tn-text-note>工作地区：</span>
          <label for=""><%=job.getJobArea() %></label>
          </li>
          <li><span class="tn-text-note">招聘人数：</span> <%=job.getJobHiringnum() %></li>
          <li><span class="tn-text-note"><a href="JobServlet?type=deleteJobInfo&jobId=<%=job.getJobId()%>"><b>删除</b></a></span></li>
        </ul>
      </div>
      <!--职位列表-->
      <%	}
      	} %>
    </div>
  </div>
</div>
<p class="it-back-to-top" style=" position:fixed" id="backTop" title="返回顶部"> <a href="#top"> <span> </span> 返回顶部 </a> </p>

<!-- 网站公共尾部 -->
<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>