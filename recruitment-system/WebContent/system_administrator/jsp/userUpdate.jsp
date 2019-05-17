<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置: </span>
 <ul class="placeul">
  <!-- <li><a href="#">首页</a></li> -->
  <li><a href="#">修改用户</a></li>
 </ul>
</div>
<div class="formbody">
 <div class="usual">
  <jsp:useBean id="user" class="com.itoffer.bean.User" scope="request"></jsp:useBean>
  <form name="frm" action="${pageContext.servletContext.contextPath }/system_administrator/jsp/userUpdateOper.jsp" method="post">
  <div class="tabson">
  <ul class="forminfo">
   <!--根据表单自动匹配所有的属性 -->
  	<li> <label>邮箱<b>*</b></label>
	 <input name="userEmail" value='<jsp:getProperty property="userEmail" name="user"/>' 
	 type="text" class="dfinput" style="width:518px;"/>
	</li>
	<%-- value='<jsp:getProperty property="userLogname" name="user"/>' --%>
	<li> <label>登录名称</label>
	 <input name="userLogname"
	 <%if(user.getUserLogname() == null){ %>
	  value=""
	 <%} else { %>
	  value='<jsp:getProperty property="userLogname" name="user"/>'
	 <%} %>
	 type="text" class="dfinput"
	 style="width:518px;"/>
	</li>
	<%-- value='<jsp:getProperty property="userRealname" name="user"/>' --%>
	<li> <label>真实姓名<b>*</b></label>
	<input name="userRealname"
	<%if(user.getUserRealname() == null){ %>
	  value=""
	 <%} else { %>
	  value='<jsp:getProperty property="userRealname" name="user"/>'
	 <%} %>
	type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>用户角色<b>*</b></label>
 	<div class="vocation">
	 <select name="userRole" class="select3">
	  <option value="1" <%if(user.getUserRole() == 1){ %>
 	  selected="selected"<%} %>>普通用户</option>
  	  <option value="2" <%if(user.getUserRole() == 2){ %>
	   selected="selected"<%} %>>企业用户</option>
	  <option value="3" <%if(user.getUserRole() == 3){ %>
	   selected="selected"<%} %>>猎头用户</option>
	  <option value="4" <%if(user.getUserRole() == 4){ %>
	   selected="selected"<%} %>>系统管理员</option>
	 </select>
	 </div>
	</li>
	<li>  <label>用户状态<b>*</b></label>
	 <input name="userState" type="radio" value="1"
	  <%if (user.getUserState() == 1) { %>checked="checked"<%} %>/>启 用
	 <input name="userState" type="radio" value="0"
	  <%if (user.getUserState() == 0) { %>checked="checked"<%} %>/>禁 用
	</li>
	<li> <label>&nbsp;</label>
	 <input name="userId" value="<jsp:getProperty property="userId"
	  name="user"/>" type="hidden">
	  <jsp:setProperty name="user" property="*"/> 
	 <input name="" type="submit" class="btn" value="修改"/>
	</li>
   </ul>
  </div>
 </form>
 </div>
</div>
</body>
</html>