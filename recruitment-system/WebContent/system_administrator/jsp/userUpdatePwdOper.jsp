<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itoffer.dao.UserDAO" %>
<%
request.setCharacterEncoding("UTF-8") ;
%>
<jsp:useBean id="user" class="com.itoffer.bean.User" scope= "request" ></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
UserDAO dao=new UserDAO();
dao.updatePwd(user);
/* request.getRequestDispatcher("userList.jsp").forward(request,response); */
response.sendRedirect("userList.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息修改</title>
</head>
<body>

</body>
</html>