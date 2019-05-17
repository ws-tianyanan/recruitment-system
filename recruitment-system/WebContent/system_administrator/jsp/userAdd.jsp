<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加用户</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="place"> <span>位置：</span>
  <ul class="placeul">
    <!-- <li><a href="#">首页</a></li> -->
    <li><a href="#">添加用户</a></li>
  </ul>
</div>
<div class="formbody">
  <div class="usual">
  <form name="frm" action="${pageContext.servletContext.contextPath }/ManagerUserServlet?type=addSelect" method="post">
    <div class="tabson">
      <ul class="forminfo">
      	<li>
          <label>登录名称<b>*</b></label>
          <input name="userLogname" type="text" class="dfinput" style="width:518px;"/>
        </li>
        <li>
          <label>登录密码<b>*</b></label>
          <input name="userPwd" type="password" class="dfinput" style="width:518px;"/>
        </li>
        <li>
          <label>真实姓名<b>*</b></label>
          <input name="userRealname" type="text" class="dfinput" style="width:518px;"/>
        </li>
        <li>
          <label>邮箱<b>*</b></label>
          <input name="userEmail" type="text" class="dfinput" style="width:518px;"/>
        </li>
        <li>
          <label>用户角色<b>*</b></label>
          <div class="vocation">
            <select name="userRole" class="select3">
              <option value="1">普通用户</option>
              <option value="2">企业用户</option>
              <option value="3">猎头用户</option>
              <option value="4">系统管理员</option>
            </select>
          </div>
        </li>
        <li>
          <label>用户状态<b>*</b></label>
          <input name="userState" type="radio" value="1" checked="checked"/>启用
          <input name="userState" type="radio" value="0"/>禁用
        </li>
        <li>  <label>&nbsp;</label>
          <input name="" type="submit" class="btn" value="添加"/>
        </li>
      </ul>
    </div>
  </form>
  </div>
</div>
</body>
</html>