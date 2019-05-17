<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<style>
body {
	font: 12px/30px microsoft yahei;
	background: #692b64;
}
.login_content {
	background: url(images/login.png) no-repeat;
	width: 737px;
	height: 396px;
	margin: 150px auto 0px;
}

.login_name {
	float: left;
	margin: 50px 0px 0px 400px;
	color: black;
	font-size: 14px;
	line-height: 35px;
}

.login_name h3 {
	font-size: 16px;
	border-bottom: 1px dotted #02356f;
}

.login_input {
	padding: 5px;
	height: 20px;
	line-height: 20px;
	color: gray;
	width: 200px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
}

.yzm_input {
	width: 100px;
	padding: 5px;
	height: 20px;
	line-height: 20px;
	color: gray;
	border: 1px solid #ccc;
	margin-right: 5px;
}
.login_button{background:#a94ace;border-radius:5px;width:80px;height:35px;line-heihgt:35px;display:block; margin-top:10px; color:white; border:none; font-family:microsoft yahei;cursor:pointer;}
.login_button:hover{ background:#a94ace;color:yellow; }
</style>
<script type="text/javascript">
	//验证码更换
	function changeValidateCode() {
		document.getElementById("validateCodeImg").src = "../ValidateCodeServlet?rand="
				+ Math.random();
	}

	// 表单提交请求验证
	function validate() {
		if(document.getElementById("userEmail").value == ""){
			alert("用户登录名不能为空！");
			document.getElementById("userEmail").focus();
			return false;
		}
		if(document.getElementById("userPwd").value == ""){
			alert("登录密码不能为空！");
			document.getElementById("userPwd").focus();
			return false;
		}
		if(document.getElementById("validateCode").value == ""){
			alert("验证码不能为空！");
			document.getElementById("validateCode").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="login_content">
		<div class="login_name">
			<h3>用户登录</h3>
			<form action="${pageContext.servletContext.contextPath }/ManagerLoginServlet" method="post" onsubmit="return validate();">
				<div>
					邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input name="userEmail" id="userEmail" type="text"
						class="login_input" placeholder="输入邮箱" />
				</div>
				<div>
					密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="userPwd" id="userPwd"
						type="password" class="login_input" />
				</div>
				<div>
					验证码：<input name="validateCode" id="validateCode" type="text"
						class="yzm_input" />
						<img src="../ValidateCodeServlet" id="validateCodeImg"
						title="点击换一换" onclick="changeValidateCode()" />
						<a href="javascript: changeValidateCode();"
						style="color: blue;">看不清? </a>
				</div>
				<div align="center">
					<input type="submit" class="login_button" value="登&nbsp;&nbsp;录"></input>
				</div>
				<input type="hidden" name="type" value="managerLogin"></input>
			</form>
		</div>
	</div>
</body>
</html>