<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="com.itoffer.bean.Company,com.itoffer.bean.Job,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业信息展示</title>
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/company.css" type="text/css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
<%
Company company = (Company)request.getAttribute("company");
List<Job> joblist = (List<Job>)request.getAttribute("joblist");
%>
<div class="tn-grid">
   <div class="bottomban">
   <!-- /recruitment-system/WebContent/file/upload_companypic -->
    <%-- <div class="bottombanbox"> <img src="file/upload_companypic/<%=company.getCompanyPic() %>" /> </div> --%>
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
          <div class="it-com-textnote"> 
           <span class="kuai"> 行业：<%=company.getCompanyIndustry() %> </span> 
           <span class="kuai"> 规模：<%=company.getCompanySize() %> </span> 
           <span class="kuai"> 所在地：<%=company.getCompanyArea() %> </span> 
           <span class="kuai"> 性质：<%=company.getCompanyType() %> </span> 
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
	              <td class="it-table-title"> 统一信用代码： </td>
	              <td class="tn-border-rb"><%=company.getCompanyCreditCode() %></td>
	            </tr>
	            <tr>
	              <td class="it-table-title"> 企业地址： </td>
	              <td class="tn-border-rb"> <%=company.getCompanyArea() %> </td>
	              <td class="it-table-title"> 企业排名：</td>
	              <td class="tn-border-rb"><%=company.getCompanySort() %></td>
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
        <div class="it-title-line">
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
          <a class="it-font-underline" href="JobServlet?type=select&jobId=<%=job.getJobId()%>">
          <span class="tn-icon-view"></span><span class=tn-action-text>查看详细</span> </a>
          <a class="tn-button-small" href="JobApplyServlet?type=apply&jobId=<%=job.getJobId()%>">
          <span class="tn-button-text">申请</span> </a>
          </div>
          <h3><a href="JobServlet?type=select&jobId=<%=job.getJobId()%>"><%=job.getJobName() %></a></h3>
        </div>
        <ul class="it-post">
          <li style="width:300px;">薪资： 
          <span class="it-font-size"><%=job.getJobSalary() %></span></li>
          <li style="width:250px;"><span class=tn-text-note>工作地区：</span>
          <label for=""><%=job.getJobArea() %></label>
          </li>
          <li><span class="tn-text-note">招聘人数：</span> <%=job.getJobHiringnum() %></li>
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