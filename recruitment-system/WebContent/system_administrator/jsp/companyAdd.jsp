<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业信息更新</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/system_administrator/ckeditor/ckeditor.js"></script>
<!-- 日期控件js -->
<script src="${pageContext.servletContext.contextPath }/js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function validate(){
	if(document.getElementById("companyName").value == ""){
		alert("企业名称不能为空！");
		document.getElementById("companyName").focus();
		return false;
	}
	return true;
}
</script>

</head>
<body>
 <div class="place"> <span>位置: </span>
 <ul class="placeul">
  <!--<li><a href="#">首页</a></li>-->
  <li><a href="#">企业信息添加</a></li>
 </ul>
</div> 
<div class="formbody">
 <div class="usual">
  <form name="frm" action="${pageContext.servletContext.contextPath }/ManagerCompanyServlet?type=addByManager" method="post" enctype="multipart/form-data" onsubmit="return validate();">
	  <div class="tabson">
	  <ul class="forminfo">
	  	<li> <label>企业名称 <b>*</b>: </label>
		 <input name="companyName" id="companyName"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业注册时间：</label>
		 <input name="companyRegisterTime" id="companyRegisterTime"
		 type="text" class="dfinput" style="width:518px;"
		  onclick="SelectDate(this)" readonly="readonly" />
		</li>
		<li> <label>企业法人代表：</label>
		 <input name="companyLegalPerson" id="companyLegalPerson"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业所在地：</label>
		 <input name="companyArea" id="companyArea"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业规模：</label>
		 <input name="companySize" id="companySize"
		 type="text" class="dfinput" style="width:470px;"/>&nbsp;&nbsp;&nbsp;人以上
		</li>
		<li> <label>企业性质：</label>
		 <input name="companyType" id="companyType"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		
		<li> <label>注册资本：</label>
		 <input name="companyRegisterCapital" id="companyLegalPerson"
		 type="text" class="dfinput" style="width:470px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;万元
		</li>
		<li> <label>统一信用代码：</label>
		 <input name="companyCreditCode" id="companyArea"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>行业：</label>
		 <input name="companyIndustry" id="companySize"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		
		<li> <p>企业简介&nbsp;（不超过1000字）：</p><br>
		 <textarea name="companyBrief" id="companyBrief" cols="50" rows="10" class="ckeditor" ></textarea>
		</li>
		<li> <label>企业招聘状态：</label>
		 <div class="vocation">
		  <select name="companyState" class="select3">
		   	<option value="1">招聘中</option>
            <option value="2">已暂停</option>
            <option value="3">已结束</option>
		  </select>
		 </div>
		</li>
		<li> <label>企业hr：</label>
		 <input name="companyHrId" id="companyHrId"
		 type="text" class="dfinput" style="width:518px;" placeholder="请输入hrID号"/>
		</li>
		<li> <label>企业联系方式：</label>
		 <input name="companyTel" id="companyTel"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		
		<li> <label>宣传图片：</label>
		 <input name="companyPic" id="companyPic" type="file" class="dfinput" style="margin-right: 5px;width:518px;"/>
		</li>
		<li> <label>&nbsp;</label>
		 <input name="" type="submit" class="btn" value="保存"/>
		</li>
	   </ul>
	  </div>
 	</form>
 </div>
</div>
</body>
</html>