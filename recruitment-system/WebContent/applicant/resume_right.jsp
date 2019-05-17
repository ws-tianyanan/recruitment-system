<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String completion = request.getParameter("completionOfResume");
int completionNum = 0;
int completionResume = 0;
String completionOfResume = null;
if(completion == null || completion == ""){
	completionOfResume = "10";
}else{
	completionOfResume = completion;
	completionNum = Integer.parseInt(completionOfResume);
}
if(completionOfResume != "00" || completionOfResume != "10"){
	if(completionOfResume.endsWith("1")){
		completionResume = (completionNum/10)*20;
		/* System.out.println(completionResume); */
	}else if(completionOfResume.endsWith("0")){
		completionResume = (completionNum/10)*20;
	}else{
		out.print("<script>alert('完整度出错了')</script>");
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的简历 - 易职网</title>
<link href="../css/base.css" type="text/css" rel="stylesheet" />
<link href="../css/resume.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<!--右侧简历完成度信息-->
	<div class="it-aside" style="background-color: #f8f8f8">
		<div class="it-aside-fixed">
			<div id="resumeSavePreview">
				<div class="it-comment-btn">
					<a id="reviewResume"
						class="tn-button tn-corner-all tn-button-text-only tn-button-preview"
						href="../ResumeServlet?type=resumeView" target="_parent" plugin="dialog"> <span class="tn-button-text">简历预览</span>
					</a> <a id="saveResume"
						class="tn-button tn-corner-all tn-button-text-only tn-button-save"
						href="javascript:;"> <span class="tn-button-text">保存简历</span>
					</a>
				</div>
			</div>

			<div id="resumeFull">
				<div class="tn-instructions tn-border-gray tn-border-bottom">
					<p class="tn-progress-text">
						<span class="tn-text-note">简历完整度</span><strong class="tn-action"><%=completionResume %>%</strong>
					</p>
					<div class="tn-progress-bar tn-widget-content tn-corner-all">
						<div
							class="tn-progress-bar-value tn-widget-header tn-corner-left tn-border-tbl
							style="width: 0%"></div>
					</div>
					</div>
				<div class="it-editdata-list">
					<ul>
						<li class="tn-editdata-bg"><a class="tn-button-text"
							href="#Resume">基本信息</a> <span class="tn-icon it-icon-accept"></span></li>
						<li class="tn-editdata-bg"><a class="tn-button-text"
							href="#Resume">简历照片</a> <span class="tn-icon it-icon-stop"></span></li>
						<li class="tn-editdata-bg"><a class="tn-button-text"
							href="#ResumesEducationExperience"> 教育经历</a> <span
							class="tn-icon it-icon-stop"></span></li>
						<li class="tn-editdata-bg"><a class="tn-button-text"
							href="#ResumesProjectExperience"> 项目经验</a> <span
							class="tn-icon it-icon-stop"></span></li>
						<li class="tn-editdata-bg"><a class="tn-button-text"
							href="#ResumesAttachment">简历附件</a> <span
							class="tn-icon it-icon-stop"></span></li>
					</ul>
				</div>
				<div class="it-list-aid">
					<span class="tn-action tn-action-text-icon"><span
						class="tn-icon it-icon-accept"></span> <span
						class="tn-action-text tn-text-note">已填写</span></span> <span
						class="tn-action tn-action-text-icon"> <span
						class="tn-icon it-icon-stop"></span><span
						class="tn-action-text tn-text-note"> 暂未填写</span>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>