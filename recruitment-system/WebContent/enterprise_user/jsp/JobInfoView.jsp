<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="com.itoffer.bean.Company,com.itoffer.bean.Job" %>
<%String path = request.getContextPath() + "/";%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职位信息展示</title>
<base href="<%=path%>">
<link href="css/base.css" type="text/css" rel="stylesheet">
<link href="css/job.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>

<div class="tn-grid" align="center">
   <div class="bottomban">
    <div class="bottombanbox">
    <a href="CompanyServlet?type=selectById=selectById&id=${requestScope.company.companyId }"> 
    <img src="file/upload_companypic/${requestScope.company.companyPic }"></a> </div>
  </div>
</div>
<div class="tn-grid">
  <div class="tn-box-content">
    <div class="it-main">
      <div class="it-ctn-heading">
        <div class="it-title-line">
          <h3>${requestScope.job.jobName }</h3>
        </div>
      </div>
      <div class="job">
        <table class="it-table" style="width:700px">
          <tbody>
          	<tr>
              <td class="it-table-title"> 年龄要求： </td>
              <td class="tn-border-rb">${requestScope.job.jobAgeRequirements }</td>
              <td class="it-table-title"> 学历要求： </td>
              <td class="tn-border-rb">${requestScope.job.jobEducationRequirements }</td>
            </tr>
            <tr>
              <td class="it-table-title"> 性别要求： </td>
              <td class="tn-border-rb">${requestScope.job.jobSexRequirements }</td>
              <td class="it-table-title"> 外语要求： </td>
              <td class="tn-border-rb">${requestScope.job.jobForeignLanguages }</td>
            </tr>
            <tr>
              <td class="it-table-title"> 招聘人数： </td>
              <td class="tn-border-rb"> ${requestScope.job.jobHiringnum }人 </td>
              <td class="it-table-title"> 薪资： </td>
              <td class="tn-border-rb">${requestScope.job.jobSalary }</td>
            </tr>
            <tr>
              <td class="it-table-title"> 工作地区： </td>
              <td class="tn-border-rb" colspan="3">${requestScope.job.jobArea }</td>
            </tr>
          </tbody>
        </table>
        <div class="it-post-count">
          <div class="it-com-apply">
          	<a href="JobApplyServlet?type=listByUser&jobId=${requestScope.job.jobId }" title="查看申请" 
           		class="tn-button2 it-smallbutton-apply-hover"></a> </div>
          <ul class="tn-text-note it-text-part">
            <li class="jobli"><span class="tn-explain-icon">
            <span class="tn-icon it-icon-time"></span>
             <span class="tn-icon-text">
              <c:if test="${requestScope.job.jobState == 1 }">招聘中</c:if>
              <c:if test="${requestScope.job.jobState == 2 }">已暂停</c:if>
              <c:if test="${requestScope.job.jobState == 3 }">已结束</c:if>
             </span>
            </span></li>
            <li class="jobli"><span class="tn-explain-icon">
            <span class="tn-icon it-icon-people"></span>
            <span class="tn-icon-text">浏览人数
            <span class="it-font-cor">${requestScope.job.jobViewNumber }</span> 人</span></span></li>
            <li class="jobli"><span class="tn-explain-icon">
            <span class="tn-icon it-icon-people"></span>
            <span class="tn-icon-text">招聘人数
            <span class="it-font-cor">${requestScope.job.jobHiringnum }</span> 人</span></span></li>
            <%-- <li class="jobli"><span class="tn-explain-icon">
            <span class="tn-icon it-icon-people"></span>
            <span class="tn-icon-text">通过人数
            <span class="it-font-cor">${requestScope.job.jobPassingNumber }</span> 人</span></span></li> --%>
          </ul>
        </div>
        <div class="clear"> </div>
        <div style="margin-left: 50px;height: 150px">
        	<h1>职位描述</h1>
	        <div class="it-post-text">
	          <p>${requestScope.job.jobDesc }</p>
	        </div>
        </div>
        <div style="height: 40px"></div>
      </div>
    </div>
    <div class="clear"> </div>
  </div>
</div>
<iframe src="foot.html" width="100%" height="150" scrolling="no" frameborder="0"> </iframe>
</body>
</html>