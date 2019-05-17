<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.itoffer.bean.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:useBean id="userBean" class="com.itoffer.bean.User" scope="request" ></jsp:useBean>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <!-- <li><a href="#">首页</a></li> -->
    <li><a href="#">用户列表</a></li>
  </ul>
</div>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li class="click"><span><img src="${pageContext.servletContext.contextPath }/system_administrator/images/t01.png" /></span>
      <a href="${pageContext.servletContext.contextPath }/system_administrator/jsp/userAdd.jsp">添加</a></li>
    </ul>
    <%-- <iframe src="${pageContext.servletContext.contextPath }/system_administrator/html/userSearch.html" scrolling="no" frameborder="0" width="400" height="42"></iframe> --%>
  </div>
  <jsp:useBean id="pagination" class="com.itoffer.bean.UserPageBean" scope= "request" >
	<jsp:setProperty name="pagination" property="pageSize" value="5" />
	<jsp:setProperty name="pagination" property="pageNo" value="1"/>
  </jsp:useBean>
  <jsp:setProperty name="pagination" property="pageNo" param= "pageNo"/>
  
  <table class="imgtable">
    <thead>
      <tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>用户ID</th>
        <th>用户Email</th>
        <th>用户登录名</th>
        <th>用户真实姓名</th>
        <th>用户角色</th>
        <th>用户状态</th>
        <th>账户创建时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <%
      	List<User> list = pagination.getPageData();
		if(list != null)
			for(User user : list) {
	  %>
			  <tr height=" 50px">
				<td><input name="" type="checkbox" value="" /></td>
				<td><%=user.getUserId() %></td>
				<td><%=user.getUserEmail() %></td>
				<td>
				<%if(user.getUserLogname() == null){ %>
				--
				<%} else { %>
				 <%=user.getUserLogname() %>
				<%} %>
				</td>
				<td>
				<%if(user.getUserRealname() == null){ %>
				--
				<%} else { %>
				 <%=user.getUserRealname() %>
				<%} %>
				</td>
				<td><% if(user.getUserRole() == 1) {%>普通用户<%} %>
					<% if(user.getUserRole() == 2) {%>企业用户<%} %>
					<% if(user.getUserRole() == 3) {%>猎头用户<%} %>
					<% if(user.getUserRole() == 4) {%> 系统管理员<%} %>
				</td>
				<td><% if(user.getUserState() == 1) { %>启用
					<%} else if(user.getUserState() == 0) { %>
					禁用<%} %>
				</td>
				<td><%=user.getUserRegistDate() %></td>
				<td ><a href="../../ManagerUserServlet?type=updateSelect&userId=<%=user.getUserId() %>" class="tablelink">修改</a> &nbsp; &nbsp;
				<a href="${pageContext.servletContext.contextPath }/ManagerUserServlet?type=delectSelectOper" class="tablelink">删除</a></td>
			<%} %>
      </tr>
    </tbody>
  </table>
  <div class="pagin">
    <div class="message">
    	共<i class="blue"><jsp:getProperty property="totalPages" name="pagination"/></i>页
		当前显示第&nbsp;<i class="blue"><jsp:getProperty property="pageNo" name="pagination"/></i>页
	</div>
	<ul class="paginList">
		<li class="paginItem"><a href="userList.jsp?pageNo=1">首页</a></li>
		
		<% if(pagination.isHasPreviousPage()) { %>
		 <li class="paginItem">
		 <a href="userList.jsp?pageNo=<%=pagination.getPageNo()-1 %>">
		 上一页<span class="pagepre"></span></a>
		 </li>
		<%} %>
		
		<%if (pagination.isHasNextPage()) { %>
		 <li class="paginItem">
		 <a href="userList.jsp?pageNo=<%=pagination.getPageNo()+1 %>">
		  下一页<span class="pagenxt"></span></a></li>
		<%} %>
		
		<li class="paginItem">
			<a href="userList.jsp?pageNo=<%=pagination.getTotalPages()%>">
			尾页</a>
		</li>
	</ul>
	</div>
  </div>
</body>
</html>