<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.itoffer.bean.Company" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%
Company company = (Company)request.getAttribute("company");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>企业信息更新</title>
<base href="<%=request.getContextPath() %>">
<link href="${pageContext.servletContext.contextPath }/system_administrator/css/manageadmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/system_administrator/ckeditor/ckeditor.js"></script>
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
  <!-- <li><a href="#">首页</a></li> -->
  <li><a href="#">企业信息更新</a></li>
 </ul>
</div>
<div class="formbody">
 <div class="usual">
  <form name="frm" action="${pageContext.servletContext.contextPath }/ManagerCompanyServlet" method="post" enctype="multipart/form-data" onsubmit="return validate();">
	  <div class="tabson">
	  <ul class="forminfo">
	    <li> <label style="font-size: 20px;">企业ID</label> <label style="font-size: 20px;"><%=company.getCompanyId() %></label> <br><br>
		</li>
	  	<li> <label>企业名称 <b>*</b>: </label>
		 <input name="companyName" value='<%=company.getCompanyName() %>' id="companyName"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业注册时间：</label>
		 <input name="companyRegisterTime" value='<%=company.getCompanyRegisterTime() %>' id="companyRegisterTime"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业法人代表：</label>
		 <input name="companyLegalPerson" value='<%=company.getCompanyLegalPerson() %>' id="companyLegalPerson"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业所在地：</label>
		 <input name="companyArea" value='<%=company.getCompanyArea() %>' id="companyArea"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业规模：</label>
		 <input name="companySize" value='<%=company.getCompanySize() %>' id="companySize"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业性质：</label>
		 <input name="companyType" value='<%=company.getCompanyType() %>' id="companyType"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		
		<li> <label>注册资本：</label>
		 <input name="companyRegisterCapital" value='<%=company.getCompanyRegisterCapital() %>' id="companyLegalPerson"
		 type="text" class="dfinput" style="width:485px;"/>&nbsp;&nbsp;&nbsp;万元
		</li>
		<li> <label>统一信用代码：</label>
		 <input name="companyCreditCode" value='<%=company.getCompanyCreditCode() %>' id="companyArea"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>行业：</label>
		 <input name="companyIndustry" value='<%=company.getCompanyIndustry() %>' id="companySize"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		
		<li> <p>企业简介&nbsp;（不超过1000字）：</p><br>
		 <textarea name="companyBrief" id="companyBrief" cols="50" rows="10" class="ckeditor" >
		 <%=company.getCompanyBrief() %></textarea>
		</li>
		<li> <label>企业招聘状态：</label>
		 <div class="vocation">
		  <select name="companyState" class="select3">
		   <option value="1" <%if(company.getCompanyState() == 1){ %>
	  	   selected="selected"<%} %>>招聘中</option>
	  	   <option value="2" <%if(company.getCompanyState() == 2){ %>
		    selected="selected"<%} %>>已暂停</option>
		   <option value="3" <%if(company.getCompanyState() == 3){ %>
		    selected="selected"<%} %>>已结束</option>
		  </select>
		 </div>
		</li>
		<li> <label>企业hr：</label>
		 <input name="companyHrId" value='<%=company.getCompanyHrId() %>' id="companyHrId"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		<li> <label>企业联系方式：</label>
		 <input name="companyTel" value='<%=company.getCompanyTel() %>' id="companyTel"
		 type="text" class="dfinput" style="width:518px;"/>
		</li>
		
		<li> <label>宣传图片：</label>
		 <img src="${pageContext.servletContext.contextPath }/file/upload_companypic/<%=company.getCompanyPic() %>"><br>
		 <input name="companyPic" id="companyPic" type="file" class="dfinput" style="margin-right: 5px;"/>
		 <input name="companyOldPic" value='<%=company.getCompanyPic() %>' type="hidden"/>
		</li>
		<li> <label>&nbsp;</label>
		 <input name="companyId" value="<%=company.getCompanyId() %>" type="hidden">
		 <input name="type" type="hidden" class="btn" value="updateCompanyByManager"/>
		  <input name="" type="submit" class="btn" value="修改"/>
		</li>
	   </ul>
	  </div>
 	</form>
 </div>
</div>
</body>
</html>