package com.itoffer.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.User;
import com.itoffer.bean.Resume;
import com.itoffer.dao.ResumeDAO;

/**
 * 简历基本信息操作Servlet
 * 
 * @author TianYanan
 *
 */
@WebServlet("/ResumeServlet")
public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResumeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 设置请求和响应编码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// 获取请求操作类型
		String type = request.getParameter("type");
		// 简历添加操作
		if ("add".equals(type)) {
			// 封装请求数据
			Resume basicinfo = this.requestDataObj(request);
			// 从会话对象中获取当前登录用户标识
			User user = (User)request.getSession().getAttribute("SESSION_USER");
			// 向数据库中添加当前用户的简历
			ResumeDAO dao = new ResumeDAO();
			int basicinfoID = dao.addBaseInfo(basicinfo, user.getUserId());
			request.getSession().setAttribute("SESSION_RESUMEID", basicinfoID);
			// 操作成功，转向“我的简历”页面
			response.sendRedirect("ResumeServlet?type=select");
		}else if("select".equals(type)){ // 简历查询操作
			// 从会话对象中获取当前登录用户标识
			User User = (User)request.getSession().getAttribute("SESSION_USER");
			// 根据简历标识查询简历基本信息
			ResumeDAO dao = new ResumeDAO();
			Resume basicinfo = dao.selectBasicinfoByID(User.getUserId());
			// 将简历基本信息存入request对象进行请求转发
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("applicant/resume.jsp").forward(request, response);
		}else if("updateSelect".equals(type)){ // 简历更新前的查询
			// 从会话对象中获取当前登录用户标识
			User User = (User)request.getSession().getAttribute("SESSION_USER");
			// 根据简历标识查询简历基本信息
			ResumeDAO dao = new ResumeDAO();
			Resume basicinfo = dao.selectBasicinfoByID(User.getUserId());
			// 将简历基本信息存入request对象进行请求转发
			request.setAttribute("basicinfo", basicinfo);
			request.getSession().setAttribute("completionOfResume", basicinfo.getCompletionOfResume());
			request.getRequestDispatcher("applicant/resumeBasicinfoUpdate.jsp").forward(request, response);
		}else if("update".equals(type)){
			// 封装请求数据
			Resume basicinfo = this.requestDataObj(request);
			int basicinfoId = Integer.parseInt(request.getParameter("basicinfoId"));
			basicinfo.setBasicinfoId(basicinfoId);
			// 更新简历信息
			basicinfo.setResumeUpdate(basicinfo);
			request.setAttribute("basicinfo", basicinfo);
			request.getSession().setAttribute("completionOfResume", basicinfo.getCompletionOfResume());
			request.getRequestDispatcher("applicant/resumeBasicinfoUpdate.jsp").forward(request, response);
		}else if ("addEucation".equals(type)) {
			//获取简历id
			int basicinfoId = Integer.parseInt(request.getParameter("basicinfoId"));
			// 封装请求数据
			Resume basicinfo = this.requestDataObj(request);
			// 向数据库中添加当前用户的简历
			ResumeDAO dao = new ResumeDAO();
			dao.addEducationExperience(basicinfo, basicinfoId);
			request.getSession().setAttribute("completionOfResume", basicinfo.getCompletionOfResume());
			// 操作成功，转向“我的简历”页面
			response.sendRedirect("ResumeServlet?type=select");
		}else if ("addProject".equals(type)) {
			//获取简历id
			int basicinfoId = Integer.parseInt(request.getParameter("basicinfoId"));
			// 封装请求数据
			Resume basicinfo = this.requestDataObj(request);
			// 向数据库中添加当前用户的简历
			ResumeDAO dao = new ResumeDAO();
			dao.addProjectExperience(basicinfo, basicinfoId);
			request.getSession().setAttribute("completionOfResume", basicinfo.getCompletionOfResume());
			// 操作成功，转向“我的简历”页面
			response.sendRedirect("ResumeServlet?type=select");
		}else if ("resumeView".equals(type)) {
			// 从会话对象中获取当前登录用户标识
			User User = (User)request.getSession().getAttribute("SESSION_USER");
			// 根据简历标识查询简历基本信息
			ResumeDAO dao = new ResumeDAO();
			Resume basicinfo = dao.selectBasicinfoByID(User.getUserId());
			// 将简历基本信息存入request对象进行请求转发
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("applicant/resumeView.jsp").forward(request,response);
			/*response.sendRedirect("applicant/resumeView.jsp");*/
		}
	}

	/**
	 * 将请求的简历数据封装成一个对象
	 * 
	 * @param request
	 * @return
	 * @throws ItOfferException
	 */
	private Resume requestDataObj(HttpServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Resume basicinfo = null;
		// 获得请求数据
		int userId = 0;
		if(request.getParameter("userId")!=null){
			userId =Integer.parseInt(request.getParameter("userId"));
		}
		String realname = "";
		if(request.getParameter("realName")!=null){
			realname = request.getParameter("realName");
		}
		String gender = "";
		if(request.getParameter("gender")!=null){
			gender = request.getParameter("gender");
		}
		String birthday = "";
		Date birthdayDate = null;
		if(request.getParameter("birthday")!=null){
			birthday = request.getParameter("birthday");
			try {
				birthdayDate = sdf.parse(birthday);
			} catch (ParseException e) {
				birthdayDate = null;
			}
		}
		String currentLoca = "";
		if(request.getParameter("currentLoca")!=null){
			currentLoca = request.getParameter("currentLoca");
		}
		String residentLoca = "";
		if(request.getParameter("residentLoca")!=null){
			residentLoca = request.getParameter("residentLoca");
		}
		String telephone = "";
		if(request.getParameter("telephone")!=null){
			telephone = request.getParameter("telephone");
		}
		String email = "";
		if(request.getParameter("email")!=null){
			email = request.getParameter("email");
		}
		String jobIntension = "";
		if(request.getParameter("jobIntension")!=null){
			jobIntension = request.getParameter("jobIntension");
		}
		String jobExperience = "";
		if(request.getParameter("jobExperience")!=null){
			jobExperience = request.getParameter("jobExperience");
		}
		String headShot = "";
		if(request.getParameter("headShot")!=null){
			headShot = request.getParameter("headShot");
		}
		String graduateSchool = "";
		if(request.getParameter("graduateSchool")!=null){
			graduateSchool = request.getParameter("graduateSchool");
		}
		String studyStartTime = "";
		Date studyTime = null;
		if(request.getParameter("studyStartTime")!=null){
			studyStartTime = request.getParameter("studyStartTime");
			try {
				studyTime = sdf.parse(studyStartTime);
			} catch (ParseException e) {
				studyTime = null;
			}
		}
		String education = "";
		if(request.getParameter("education")!=null){
			education =request.getParameter("education");
		}
		String major = "";
		if(request.getParameter("major")!=null){
			major = request.getParameter("major");
		}
		String entryName = "";
		if(request.getParameter("entryName")!=null){
			entryName = request.getParameter("entryName");
		}
		String entryStartTime = "";
		Date entryStart = null;
		if(request.getParameter("entryStartTime")!=null){
			entryStartTime = request.getParameter("entryStartTime");
			try {
				entryStart = sdf.parse(entryStartTime);
			} catch (ParseException e) {
				entryStart = null;
			}
		}
		String entryStopTime = "";
		Date entryStop = null;
		if(request.getParameter("entryStopTime")!=null){
			entryStopTime = request.getParameter("entryStopTime");
			try {
				entryStop = sdf.parse(entryStopTime);
			} catch (ParseException e) {
				entryStop = null;
			}
		}
		String assumeOffice = "";
		if(request.getParameter("assumeOffice")!=null){
			assumeOffice = request.getParameter("assumeOffice");
		}
		String resumeEnclosure = "";
		if(request.getParameter("resumeEnclosure")!=null){
			resumeEnclosure = request.getParameter("resumeEnclosure");
		}
		
		// 将请求数据封装成一个简历基本信息对象
		basicinfo = new Resume(userId,realname, gender, birthdayDate,
				currentLoca, residentLoca, telephone, email, jobIntension,
				jobExperience,headShot,graduateSchool,studyTime,
				education,major,entryName,entryStart,entryStop,
				assumeOffice,resumeEnclosure);
		return basicinfo;
	}
}
