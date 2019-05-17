package com.itoffer.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.itoffer.bean.CompanyPageBean;
import com.itoffer.bean.Company;
import com.itoffer.bean.Job;
import com.itoffer.bean.Resume;
import com.itoffer.bean.User;
import com.itoffer.dao.CompanyDAO;
import com.itoffer.dao.JobDAO;
import com.itoffer.dao.ResumeDAO;
import com.itoffer.dao.UserDAO;

/**
 * 企业信息处理Servlet
 * 
 * @author TianYanan
 *
 */
@WebServlet("/CompanyServlet")
//上传文件注释
@MultipartConfig
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CompanyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		//请求解决乱码
		request.setCharacterEncoding("utf-8");
		//响应解决乱码
		response.setCharacterEncoding("utf-8");
		//获取响应字符输出流
		PrintWriter out = response.getWriter();
		// 获取对企业信息处理的请求类型
		String type = request.getParameter("type");
		CompanyDAO companyDao = new CompanyDAO();
		JobDAO jobdao = new JobDAO();
		UserDAO userDao = new UserDAO();
		if("login".equals (type)) {
			//获取用户提交的验证码
			String validateCode = request.getParameter("validateCode");
			//获取本次请求会话中保存的验证码
			String sessionValidateCode = (String)request.getSession().
			getAttribute("SESSION_VALIDATECODE") ;
			//判断若验证码不--致，提示错误，返回登陆页面
			if (! sessionValidateCode.equals (validateCode) ) {
				out.print("<script type='text/javascript'>") ;
				out.print("alert('验证码输入错误! ' ;") ;
				out.print ("window.location='system_administrator/administrator_login.html';") ;
				out.print("</script>") ;
				return ;
			}
		} else if("selectById".equals(type)) {
			// 获取请求查询的企业编号
			int companyID = Integer.parseInt(request.getParameter("id"));
			// 根据企业编号查询企业详细信息
			Company company = companyDao.getCompanyByID(companyID);
			// 将查询到的企业信息存入request请求域
			request.setAttribute("company", company);
			// 根据企业编号查询企业的所有招聘职位
			List<Job> jobList = jobdao.getJobListByCompanyID(companyID);
			// 将查询到的职位列表存入request请求域
			request.setAttribute("joblist", jobList);
			// 请求转发
			request.getRequestDispatcher("recruit/company.jsp").forward(
					request, response);
		} else if("pageList".equals(type)) {
			// 企业列表分页显示功能
			String pageNo = request.getParameter("pageNo");
			if (pageNo == null || "".equals(pageNo))
				pageNo = "1";
			// 企业信息分页展示功能实现JavaBean
			CompanyPageBean pagination = new CompanyPageBean(2,
					Integer.parseInt(pageNo));
			request.setAttribute("pagination", pagination);
			request.getRequestDispatcher("include_companyList.jsp").include(
					request, response);
		} else if("addEnterpriseInfo".equals(type)) {
			Company company = this.requestDataObj(request);
			// 从会话对象中获取当前登录用户标识
			User user = (User)request.getSession().getAttribute("SESSION_USER");
			// 向数据库中添加当前企业的信息
			company.setCompanyHrId(user.getUserId());
			int companyId = companyDao.addCompanyByUserId(company);
			Company companyView = companyDao.getCompanyByUserID(companyId);
			request.getSession().setAttribute("SESSION_ENTERPRISEINFOID", companyId);
			request.getSession().setAttribute("company", companyView);
			// 操作成功，转向“企业信息查看”页面
			response.sendRedirect("CompanyServlet?type=viewEnterpriseInfo");
		} else if("viewEnterpriseInfo".equals(type)) {
			// 从会话对象中获取当前登录用户标识
			User user = (User)request.getSession().getAttribute("SESSION_USER");
			User selectUser = userDao.selectById(user.getUserId());
			request.setAttribute("user", selectUser);
			// 根据企业编号查询企业详细信息
			Company company = companyDao.getCompanyByUserID(user.getUserId());
			// 将查询到的企业信息存入request请求域
			request.setAttribute("company", company);
			// 根据企业编号查询企业的所有招聘职位
			List<Job> jobList = jobdao.getJobListByCompanyID(company.getCompanyId());
			// 将查询到的职位列表存入request请求域
			request.setAttribute("joblist", jobList);
			// 请求转发
			request.getRequestDispatcher("enterprise_user/jsp/enterpriseInfoView.jsp").forward(
					request, response);
		} else if("updateEnterpriseInfo".equals(type)) {
				Company company = this.requestDataObj(request);
				// 从会话对象中获取当前登录用户标识
				int companyId = Integer.parseInt(request.getParameter("companyId"));
				int companyHrId = Integer.parseInt(request.getParameter("companyHrId"));
				company.setCompanyId(companyId);
				company.setCompanyHrId(companyHrId);
				// 向数据库中添加当前企业的信息
				companyDao.updateByManager(company);
				/*Company companyView = companyDao.getCompanyByUserID(companyId);
				request.getSession().setAttribute("company", companyView);*/
				// 操作成功，转向“企业信息查看”页面
				response.sendRedirect("CompanyServlet?type=viewEnterpriseInfo");
		} else if ("resumeView".equals(type)) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			// 根据简历标识查询简历基本信息
			ResumeDAO dao = new ResumeDAO();
			Resume basicinfo = dao.selectBasicinfoByID(userId);
			// 将简历基本信息存入request对象进行请求转发
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("applicant/resumeView.jsp").forward(request,response);
		}
	}
	
	/**
	 * 将请求的企业信息数据封装成一个对象
	 * 
	 * @param request
	 * @return
	 * @throws ItOfferException
	 */
	private Company requestDataObj(HttpServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 获得请求数据
		String companyName = "";
		if(request.getParameter("companyName")!=null){
			companyName = request.getParameter("companyName");
		}
		String companyArea = "";
		if(request.getParameter("companyArea")!=null){
			companyArea = request.getParameter("companyArea");
		}
		String companySize = "";
		if(request.getParameter("companySize")!=null){
			companySize = request.getParameter("companySize");
		}
		String companyType = "";
		if(request.getParameter("companyType")!=null){
			companyType = request.getParameter("companyType");
		}
		String companyBrief = "";
		if(request.getParameter("companyBrief")!=null){
			companyBrief = request.getParameter("companyBrief");
		}
		int companyState = 0;
		if(request.getParameter("companyState")!=null){
			companyState =Integer.parseInt(request.getParameter("companyState"));
		}
		int companySort = 0;
		if(request.getParameter("companySort")!=null){
			companySort = Integer.parseInt(request.getParameter("companySort"));
		}
		int companyViewnum = 0;
		if(request.getParameter("companyViewnum")!=null){
			companyViewnum = Integer.parseInt(request.getParameter("companyViewnum"));
		}
		
		// 获取上传文件域
		Part part = null;
		try {
			part = request.getPart("companyPic");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 获取上传文件名称
		String fileName = part.getSubmittedFileName();
		// 为防止上传文件重名，对文件进行重命名
		String newFileName = System.currentTimeMillis() + fileName;
		// 将上传的文件保存在服务器项目发布路径的/file/upload_resume目录下
		String filepath = getServletContext().getRealPath("/file/upload_companypic");
		System.out.println("企业图片保存路径为：" + filepath);
		File f = new File(filepath);
		if (!f.exists())
			f.mkdirs();
		try {
			part.write(filepath + "/" + newFileName);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String companyRegisterTime = "";
		Date registerTime = null;
		if(request.getParameter("companyRegisterTime")!=null){
			companyRegisterTime = request.getParameter("companyRegisterTime");
			try {
				registerTime = sdf.parse(companyRegisterTime);
			} catch (ParseException e) {
				registerTime = null;
			}
		}
		int companyRegisterCapital = 0;
		if(request.getParameter("companyRegisterCapital")!=null){
			companyRegisterCapital = Integer.parseInt(request.getParameter("companyRegisterCapital"));
		}
		
		String companyLegalPerson = "";
		if(request.getParameter("companyLegalPerson")!=null){
			companyLegalPerson = request.getParameter("companyLegalPerson");
		}
		String companyCreditCode = "";
		if(request.getParameter("companyCreditCode")!=null){
			companyCreditCode = request.getParameter("companyCreditCode");
		}
		String companyTel = "";
		if(request.getParameter("companyTel")!=null){
			companyTel = request.getParameter("companyTel");
		}
		
		String companyIndustry = "";
		if(request.getParameter("companyIndustry")!=null){
			companyIndustry = request.getParameter("companyIndustry");
		}
		
		
		// 将请求数据封装成一个企业基本信息对象
		Company company= new Company(companyName, registerTime, companyRegisterCapital,
				companyLegalPerson, companyCreditCode, companyArea, companySize,
				companyType, companyIndustry, companyBrief, companyState, companySort,
				companyViewnum, newFileName, companyTel);
		return company;
	}
}
