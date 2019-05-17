<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职位申请列表</title>
<base href="<%=basePath%>">
<link
	href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css"
	rel="stylesheet" type="text/css" />
<!--日期控件js -->
<script src="js/Calendar6.js" type=" text/javascript"></script>
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<!-- <li><a href="#">首页</a></li> -->
			<li><a href="#">职位申请列表</a></li>
		</ul>
	</div>
	<div class="rightinfo">
	<table class="imgtable">
		<thead>
			<tr>
				<th><input name="" type="checkbox" value="" checked="checked" /></th>
				<th>申请ID</th>
				<th>用户姓名（用户ID）</th>
				<th>申请职位（职位ID）</th>
				<th>申请状态</th>
				<th>申请日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach items="${requestScope.pageBean.pageData }" var="apply">
	       <tr>
	         <td style="height: 50px"><input name="" type="checkbox" value="" /></td>
	         <td style="height: 50px">${apply.applyId }</td>
	         <td style="height: 50px">${apply.user.userRealname }（${apply.userId }）</td>
	         <td style="height: 50px">${apply.job.jobName }（${apply.jobId }）</td>
	         <td style="height: 50px">
	          <c:if test="${apply.applyState == 1 }">已申请</c:if>
	          <c:if test="${apply.applyState == 2 }">已审核</c:if>
	          <c:if test="${apply.applyState == 3 }">待通知</c:if>
	         </td>
	         <td style="height: 50px">${apply.applyDate }</td>
	         <td style="height: 50px">
 	         	<%--<a href="${pageContext.servletContext.contextPath }/ManagerResumeServlet?type=viewOper&applyId=${resume.basicinfoId }" class="tablelink">查  看</a> &nbsp;&nbsp; --%>
	         	<a href="${pageContext.servletContext.contextPath }/ManagerJobApplyServlet?type=deleteApplyByManager&applyId=${apply.applyId }" class="tablelink">删  除</a>
	         </td>
	       </tr>
	      </c:forEach>
		</tbody>
	</table>

	<div class="pagin">
		<div class="message">
			共<i class="blue">${requestScope.pageBean.totalPages }</i>页
			当前显示第&nbsp;<i class="blue">${requestScope.pageBean.pageNo }&nbsp;</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a
				href="ManagerJobApplyServlet?type=listByManager&pageNo=1">首页</a></li>
			<c:if test="${requestScope.pageBean.hasPreviousPage }">
				<li class="paginItem"><a
					href="JobApplyServlet?type=listByManager&pageNo=${requestScope.pageBean.pageNo-1 }">
						上一页<span class="pagepre"></span>
				</a></li>
			</c:if>

			<c:if test="${requestScope.pageBean.hasNextPage }">
				<li class="paginItem"><a
					href="ManagerJobApplyServlet?type=listByManager&pageNo=${requestScope.pageBean.pageNo+1 }">
						下一页<span class="pagenxt"></span>
				</a></li>
			</c:if>

			<li class="paginItem"><a
				href="ManagerJobApplyServlet?type=listByManager&pageNo=${requestScope.pageBean.totalPages }">
					尾页</a></li>
		</ul>
	</div>
	</div> 
</body>
</html>