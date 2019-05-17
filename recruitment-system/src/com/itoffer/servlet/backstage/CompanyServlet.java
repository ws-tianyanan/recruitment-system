package com.itoffer.servlet.backstage;

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

import com.itoffer.bean.Company;
import com.itoffer.bean.PageBean;
import com.itoffer.dao.CompanyDAO;

/**
 * 企业信息处理Servlet
 * 
 * @author TianYanan
 *
 */
@WebServlet("/ManagerCompanyServlet")
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
		if("listByManager".equals(type)) {
			getCompanyListByManager(request,response);
			
			// 请求转发
			request.getRequestDispatcher("system_administrator/jsp/companyList.jsp").forward(request, response);
		} else if("addByManager".equals(type)){
			Company company = this.requestDataObj(request);
			int companyHrId = 0;
			if(request.getParameter("companyHrId")!=null){
				companyHrId =Integer.parseInt(request.getParameter("companyHrId"));
			}
			company.setCompanyHrId(companyHrId);
			companyDao.addCompanyByUserId(company);
			getCompanyListByManager(request,response);
			request.getRequestDispatcher("system_administrator/jsp/companyList.jsp").forward(request,response);
		} else if("delectByManager".equals(type)){
			getCompanyListByManager(request,response);
			int companyId = Integer.parseInt(request.getParameter("companyId")) ;
			companyDao.deleteByManager(companyId);
			
			request.getRequestDispatcher("system_administrator/jsp/companyList.jsp").forward(request,response);
		} else if("updateByManager".equals(type)){
			getCompanyListByManager(request,response);
			
			int companyId = Integer.parseInt(request.getParameter("companyId"));
			Company company=companyDao.getCompanyByID(companyId);
			request.setAttribute("company", company);
			request.getRequestDispatcher("system_administrator/jsp/companyUpdate.jsp").forward(request,response);
		} else if("updateCompanyByManager".equals(type)){
			//获取企业更新信息
			Company company = this.requestDataObj(request);
			int companyId = Integer.parseInt(request.getParameter("companyId"));
			company.setCompanyId(companyId);
			companyDao.updateByManager(company);
			getCompanyListByManager(request,response);
			request.getRequestDispatcher("system_administrator/jsp/companyList.jsp").forward(request, response);
		}
	}

	private void getCompanyListByManager(HttpServletRequest request, HttpServletResponse response) {
		CompanyDAO companyDao = new CompanyDAO();
		
		//获取请求页码
		int pageNo = Integer.parseInt(request.getParameter("pageNo")==null?"1":request.getParameter ("pageNo"));
		int recordCount=companyDao.getRecordCountByManager();
		List<Company> companyList=companyDao.getALLCompanyListByManager(pageNo,5);
		
		//将分页信息封装到PageBean对象中
		PageBean<Company> pageBean = new PageBean<Company>() ;
		pageBean.setPageNo(pageNo);
		pageBean.setRecordCount(recordCount);
		pageBean.setPageData(companyList);
		
		// 将查询到企业列表存入request请求域
		request.setAttribute("pageBean", pageBean);
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
