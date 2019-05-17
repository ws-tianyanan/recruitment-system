<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.itoffer.bean.User" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%
User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户密码更新</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/system_administrator/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function validate(){
	var error="";
	if(document.getElementById("userId").value == ""){
		error+="用户id不能为空！";
		document.getElementById("userId").focus();
		return false;
	}
	if(document.getElementById("oldPassword").value == ""){
		error+="旧密码不能为空！";
		document.getElementById("oldPassword").focus();
		return false;
	}
	if(document.getElementById("newPassword").value == ""){
		error+="新密码不能为空！";
		document.getElementById("newPassword").focus();
		return false;
	}
	if("" != error){
		alert(error);
	}
	return true;
}

</script>

</head>
<body>
<div class="place"> <span>位置: </span>
 <ul class="placeul">
  <li><a href="#">首页</a></li>
  <li><a href="#">用户密码更新</a></li>
 </ul>
</div>
<div class="formbody">
 <div class="usual">
  <form name="frm" action="${pageContext.servletContext.contextPath }/ManagerUserServlet" method="post" onsubmit="return validate();">
  <div class="tabson">
  <ul class="forminfo">
  	<li> <label>用户ID:<b>*</b>: </label>
	 <input name="userId" id="userId" type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>旧密码<b>*</b>：</label>
	 <input name="oldPassword" id="oldPassword" type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>新密码<b>*</b>：</label>
	 <input name="newPassword" id="newPassword" type="text" class="dfinput" style="width:518px;"/>
	</li>
	<li> <label>&nbsp;</label>
	<input name="type" type="hidden" class="btn" value="changePassword"/>
	 <input name="" type="submit" class="btn" value="修改"/>
	</li>
   </ul>
  </div>
 </form>
 </div>
</div>
</body>
</html>