<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作列表</title>
<base href="<%=basePath%>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <!-- <li><a href="#">首页</a></li> -->
    <li><a href="#">工作列表</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li class="click"><span><img src="${pageContext.servletContext.contextPath }/system_administrator/images/t01.png" /></span>
      <a href="${pageContext.servletContext.contextPath }/system_administrator/jsp/jobAdd.jsp">添加</a></li>
    </ul>
    <%-- <iframe src="${pageContext.servletContext.contextPath }/system_administrator/html/jobSearch.html" scrolling="no" frameborder="0" width="400" height="42"></iframe> --%>
  </div>
  
  <table class="imgtable">
    <thead>
    <tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>职位名称（ID）</th>
        <th>所属企业</th>
        <th>地址</th>
        <th>招聘数</th>
		<th>申请数</th>
		<th>招聘状态</th>
		<th>浏览数</th>
		<th>操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${requestScope.pageBean.pageData }" var="job">
      <tr>
         <td style="height: 50px"><input name="" type="checkbox" value="" /></td>
         <td style="height: 50px">${job.jobName }（${job.jobId }）</td>
         <td style="height: 50px">${job.company.companyName }</td>
         <td style="height: 50px">${job.jobArea }</td>
         <td style="height: 50px">${job.jobHiringnum }</td>
         <td style="height: 50px">${job.jobApplicantsNumber }</td>
         <td style="height: 50px">
			<c:if test="${job.jobState == 1 }">招聘中</c:if>
			<c:if test="${job.jobState == 2 }">已暂停</c:if>
			<c:if test="${job.jobState == 3 }">已结束</c:if>
		 </td>
         <td style="height: 50px">${job.jobViewNumber }</td>
         <td style="height: 50px">
         	<a href="${pageContext.servletContext.contextPath }/ManagerJobServlet?type=updateByManager&jobId=${job.jobId }" class="tablelink">修  改</a> &nbsp;&nbsp;
         	<a href="${pageContext.servletContext.contextPath }/ManagerJobServlet?type=delectByManager&jobId=${job.jobId }" class="tablelink">删  除</a>
         </td>
       </tr>
      </c:forEach>
    </tbody>
  </table>
  
 <div class="pagin">
    <div class="message">共<i class="blue">${requestScope.pageBean.totalPages }</i>页
		当前显示第&nbsp;<i class="blue">${requestScope.pageBean.pageNo }&nbsp;</i>页
	</div>
	<ul class="paginList">
		<li class="paginItem"><a href="ManagerJobServlet?type=listByManager&pageNo=1">首页</a></li>
		<c:if test="${requestScope.pageBean.hasPreviousPage }">
		 <li class="paginItem">
		 <a href="ManagerJobServlet?type=listByManager&pageNo=${requestScope.pageBean.pageNo-1 }">
		 上一页<span class="pagepre"></span></a>
		 </li>
		</c:if>
		
		<c:if test="${requestScope.pageBean.hasNextPage }">
		 <li class="paginItem">
		 <a href="ManagerJobServlet?type=listByManager&pageNo=${requestScope.pageBean.pageNo+1 }">
		 下一页<span class="pagenxt"></span></a>
		 </li>
		</c:if>
		
		<li class="paginItem">
			<a href="ManagerJobServlet?type=listByManager&pageNo=${requestScope.pageBean.totalPages }">
			尾页</a>
		</li>
	</ul>
	</div>
	</div>
</body>
</html>