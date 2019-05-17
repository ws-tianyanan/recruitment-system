<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Map,com.itoffer.bean.User" %>
<%
Map<Integer, User> onlineUserMap = (Map<Integer, User>) application.getAttribute("ONLINE_USER");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户在线列表</title>
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置: </span>
 <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">用户在线列表</a></li>
 </ul>
</div>
<div class="rightinfo">
 <table class="imgtable">
 <thead>
  <tr>
   <th ><input name="" type="checkbox" value="" checked="checked"/></th>
   <th>用户ID</th>
   <th>用户登录名</th>
   <th>用户真实姓名</th>
   <th>用户角色</th>
   <th>操作</th>
  </tr>
 </thead>
 <tbody>
  <c:forEach items="${onlineUserMap}" var="onlineUserMap">
   <tr height="50px">
    <td><input name="" type="checkbox" value="" checked="checked"/></td>
    <td>${onlineUserMap.key}</td>
    <td>
    	<c:if test="${onlineUserMap.value.userLogname == null}">--</c:if>
    	<c:if test="${onlineUserMap.value.userLogname != null}">${onlineUserMap.value.userLogname}</c:if>
    </td>
    <td>
    	<c:if test="${onlineUserMap.value.userRealname == null}">--</c:if>
    	<c:if test="${onlineUserMap.value.userRealname != null}">${onlineUserMap.value.userRealname}</c:if>
    </td>
    <td><c:if test="${onlineUserMap.value.userRole==1}">普通用户</c:if>
    <c:if test="${onlineUserMap.value.userRole==2}">企业用户</c:if>
    <c:if test="${onlineUserMap.value.userRole==3}">猎头用户</c:if>
    <c:if test="${onlineUserMap.value.userRole==4}">系统管理员</c:if></td>
    <td><a href="${pageContext.servletContext.contextPath }/ManagerUserServlet?type=forceLogout&userId=${onlineUserMap.key }" class="tablelink">强制下线</a></td>
   </tr>
  </c:forEach>
  </tbody>
 </table>
 
 <%-- <div class="pagin">
    <div class="message">共<i class="blue">${requestScope.pageBean.totalPages }</i>页
		当前显示第&nbsp;<i class="blue">${requestScope.pageBean.pageNo }&nbsp;</i>页
	</div>
	<ul class="paginList">
		<li class="paginItem"><a href="CompanyServlet?type=listByManager&pageNo=1">首页</a></li>
		<c:if test="${requestScope.pageBean.hasPreviousPage }">
		 <li class="paginItem">
		 <a href="ManagerCompanyServlet?type=listByManager&pageNo=${requestScope.pageBean.pageNo-1 }">
		 上一页<span class="pagepre"></span></a>
		 </li>
		</c:if>
		
		<c:if test="${requestScope.pageBean.hasNextPage }">
		 <li class="paginItem">
		 <a href="ManagerCompanyServlet?type=listByManager&pageNo=${requestScope.pageBean.pageNo+1 }">
		 下一页<span class="pagenxt"></span></a>
		 </li>
		</c:if>
		
		<li class="paginItem">
			<a href="ManagerCompanyServlet?type=listByManager&pageNo=${requestScope.pageBean.totalPages }">
			尾页</a>
		</li>
	</ul>
	</div> --%>
</div>
</body>
</html>