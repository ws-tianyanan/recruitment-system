<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="com.itoffer.dao.CompanyDAO,com.itoffer.bean.Company,com.itoffer.bean.Job" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RTO服务_易职官网-大学生求职,大学生就业,IT行业招聘，IT企业快速入职 - 易职网</title>
<meta name="renderer" content="ie-stand">
<link rel="shortcut icon" href="${pageContext.servletContext.contextPath }/images/favicon.ico" type="image/x-icon" />
<meta content="大学生求职,大学生就业,大学生招聘,各类人才招聘,大学生名企招聘,大学生找工作,各类名企招聘，各类行业招聘，企业快速入职" name="keywords">
<meta content="易职专注于为企业提供高效的人力资源解决方案，同时面向各类技术人才推出快速一站式免费就业服务。秉承TianYanan人才服务理念，为数千家企业量身定做个性化、全程化的人才培养体系，同时帮助中高级人才铺设成功之路，为人才和企业架设起沟通之桥。" name="description">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/index.css" type="text/css" rel="stylesheet" />
</head>
<body class="tn-page-bg" >
  <div id="tn-content">
     <!-- 招聘企业展示 -->
     <c:forEach items="${pagination.pageData}" var="company">
      <div class="tn-grid" style="margin-bottom: 10px">
        <div class="tn-box tn-widget tn-widget-content tn-corner-all it-home-box">
          <div class="tn-box-content tn-widget-content tn-corner-all">
          	<!-- 企业图片展示 -->
            <div class="it-company-keyimg tn-border-bottom tn-border-gray"> 
            <a href="CompanyServlet?type=selectById&id=${company.companyId}"> 
            <!-- /recruitment-system/WebContent/file/upload_companypic -->
            <img src="file/upload_companypic/${company.companyPic}" width="990"> </a> </div>
            <!-- 招聘职位展示 -->
            <c:forEach items="${company.jobs}" var="job">
            <div class="it-home-present">
             <div class="it-present-btn"> 
             <a class=" tn-button tn-button-home-apply" href="JobServlet?type=select&jobId=${job.jobId }"> 
             <span class="tn-button-text">我要申请</span> </a> </div>
              <div class="it-present-text" style="padding-left:185px;">
                <div class="it-line01 it-text-bom">
                  <p class="it-text-tit">职位</p>
                  <p class="it-line01 it-text-explain"> <span class="tn-icon it-home-arrow"></span> 
                  <span class="tn-helper-right tn-action"> 
                  <a href="CompanyServlet?type=selectById&id=${company.companyId}" 
                  class="tn-button tn-corner-all tn-button-text-only tn-button-semidlong"> 
                  <span class="tn-button-text">更多职位</span> </a> </span> 
                  <b>${job.jobName}</b> </p>
                </div>
                <div class="it-line01 it-text-top">
                  <p class="it-text-tit">薪资</p>
                  <p class="it-line01 it-text-explain"> <span class="tn-icon it-home-arrow"></span> 
                  <b>${job.jobSalary}</b> </p>
                </div>
              </div>
              <div class="it-present-text">
                <div class="it-line01 it-text-bom">
                  <p class="it-text-tit">招聘人数</p>
                  <p class="it-line01 it-text-explain"> <span class="tn-icon it-home-arrow"></span> 
                   <b>${job.jobHiringnum}</b> </p>
                </div>
                <div class="it-line01 it-text-top">
                  <p class="it-text-tit">工作地区</p>
                  <p class="it-line01 it-text-explain"> <span class="tn-icon it-home-arrow"></span> 
                  <b>${job.jobArea}</b> </p>
                </div>
              </div>
            </div>
            </c:forEach>
            </div>
          </div>
        </div>
      </c:forEach>
    <!-- 企业信息分页 -->
   <div class="page01">
	   <div class="page02">&nbsp;</div>
	   <div class="page03"><a href="index.jsp?type=pageList&pageNo=1">首页 </a></div>
	   <c:if test="${pagination.hasPreviousPage}">
	   <div class="page03">
	   <a href='index.jsp?type=pageList&pageNo=${pagination.pageNo-1}'>上一页 </a></div></c:if>
	   <c:if test="${pagination.hasNextPage}">
	   <div class="page03"><a href="index.jsp?type=pageList&pageNo=${pagination.pageNo+1}">下一页 </a></div></c:if>
	   <div class="page03"><a href="index.jsp?type=pageList&pageNo=${pagination.totalPages}">尾页</a></div>
	   <div class="page03">当前是第${pagination.pageNo}页，共${pagination.totalPages}页</div>
   </div>
  </div>
</body>
</html>