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
<title>企业列表</title>
<base href="<%=basePath%>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">企业列表</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li class="click"><span><img src="${pageContext.servletContext.contextPath }/system_administrator/images/t01.png" /></span><a href="../html/companyAdd.html">添加</a></li>
    </ul>
    <iframe src="${pageContext.servletContext.contextPath }/system_administrator/html/companySearch.html" scrolling="no" frameborder="0" width="400" height="42"></iframe>
  </div>
  
  <table class="imgtable">
    <thead>
    <tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>企业名称（ID）</th>
		<th>注册时间</th>
		<th>法人代表</th>
		<th>企业地址</th>
		<th>企业规模</th>
		<th>企业性质</th>
		<th>招聘状态</th>
		<th>显示排序</th>
		<th>浏览数</th>
		<th>HR</th>
		<th>联系电话</th>
		<th>操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${requestScope.pageBean.pageData }" var="company">
      <tr>
        <td style="height: 50px"><input name="" type="checkbox" value="" /></td>
         <td style="height: 50px">${company.companyName }（${company.companyId }）</td>
         <td style="height: 50px">${company.companyRegisterTime }</td>
         <td style="height: 50px">${company.companyLegalPerson }</td>
         <td style="height: 50px">${company.companyArea }</td>
         <td style="height: 50px">${company.companySize }</td>
         <td style="height: 50px">${company.companyType }</td>
         <td style="height: 50px">${company.companyState }</td>
         <td style="height: 50px">${company.companySort }</td>
         <td style="height: 50px">${company.companyViewnum }</td>
         <td style="height: 50px">${company.companyHrId }</td>
         <td style="height: 50px">${company.companyTel }</td>
         <td style="height: 50px">
         	<a href="${pageContext.servletContext.contextPath }/ManagerCompanyServlet?type=updateOper&companyId=${company.companyId }" class="tablelink">修  改</a> &nbsp;&nbsp;
         	<a href="${pageContext.servletContext.contextPath }/ManagerCompanyServlet?type=delectOper&companyId=${company.companyId }" class="tablelink">删  除</a>
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
		<li class="paginItem"><a href="ManagerCompanyServlet?type=listByManager&pageNo=1">首页</a></li>
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
	</div>
	</div>
</body>
</html>