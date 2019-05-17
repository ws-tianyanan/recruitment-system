package com.itoffer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.Company;
import com.itoffer.bean.Job;
import com.itoffer.dao.CompanyDAO;
import com.itoffer.dao.JobDAO;
/**
 * 职位信息处理Servlet
 *
 * @author TianYanan
 *
 */
@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JobServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		//请求解决乱码
		request.setCharacterEncoding("utf-8");
		//响应解决乱码
		response.setCharacterEncoding("utf-8");

		// 获取操作类型
		String type = request.getParameter("type");
		JobDAO dao = new JobDAO();
		CompanyDAO companyDAO = new CompanyDAO();
		if("select".equals(type)){
			// 获取职位编号
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			// 根据职位编号查询职位详细信息
			Job job = dao.getJobByID(jobId);
			// 将职位信息对象存入request对象
			request.setAttribute("job", job);
			// 将企业信息对象存入request对象
			request.setAttribute("company", job.getCompany());
			request.getRequestDispatcher("recruit/job.jsp").forward(request, response);
		} else if("addJobInfo".equals(type)) {
			int companyId = (int) request.getSession().getAttribute("SESSION_ENTERPRISEINFOID");
			Job job = this.requestDataObj(request,companyId);
			// 向数据库中添加当前企业的信息
			int jobId = dao.addJobByUserId(job,companyId);
			Job jobView = dao.getJobByID(jobId);
			request.getSession().setAttribute("jobId", jobId);
			request.getSession().setAttribute("Job", jobView);
			// 操作成功，转向“企业信息查看”页面
			response.sendRedirect("JobServlet?type=viewJobInfo&jobId="+jobId);
		} else if("viewJobInfo".equals(type)){
			int companyId = (int) request.getSession().getAttribute("SESSION_ENTERPRISEINFOID");
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			
			// 职位详细信息
			Job job = dao.getJobByID(jobId);
			/*Job job = (Job) request.getSession().getAttribute("Job");*/
			// 将职位信息对象存入request对象
			request.setAttribute("job", job);
			// 将企业信息对象存入request对象
			request.setAttribute("company", companyDAO.getCompanyByID(companyId));
			//recruitment-system/WebContent/enterprise_user/jsp/JobInfoView.jsp
			request.getRequestDispatcher("enterprise_user/jsp/JobInfoView.jsp").forward(request, response);
		} else if("updateJobInfo".equals(type)){
			// 从会话对象中获取当前职位标识
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			int companyId = (int) request.getSession().getAttribute("SESSION_ENTERPRISEINFOID");
			Job job = this.requestDataObj(request,companyId);
			// 向数据库中添加当前企业的信息
			dao.updateJobByJobId(job,jobId);
			request.getSession().setAttribute("jobId", jobId);
			request.setAttribute("job", job);
			// 操作成功，转向“企业信息查看”页面
			response.sendRedirect("JobServlet?type=viewJobInfo&jobId="+jobId);
		} else if("deleteJobInfo".equals(type)){
			// 从会话对象中获取当前职位标识
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			dao.deleteByManager(jobId);
			// 操作成功，转向“企业信息查看”页面
			response.sendRedirect("CompanyServlet?type=viewEnterpriseInfo");
		}
	}
	
	/**
	 * 将请求的职位信息数据封装成一个对象
	 * 
	 * @param request
	 * @return
	 * @throws ItOfferException
	 */
	private Job requestDataObj(HttpServletRequest request,int companyId) {
		// 获得请求数据
		String jobName = "";
		if(request.getParameter("jobName")!=null){
			jobName = request.getParameter("jobName");
		}
		int jobHiringnum = 0;
		if(request.getParameter("jobHiringnum")!=null){
			jobHiringnum = Integer.parseInt(request.getParameter("jobHiringnum"));
		}
		String jobSalary = "";
		if(request.getParameter("jobSalary")!=null){
			jobSalary = request.getParameter("jobSalary");
		}
		String jobArea = "";
		if(request.getParameter("jobArea")!=null){
			jobArea = request.getParameter("jobArea");
		}
		String jobAgeRequirements = "";
		if(request.getParameter("jobAgeRequirements")!=null){
			jobAgeRequirements = request.getParameter("jobAgeRequirements");
		}
		String jobEducationRequirements = "";
		if(request.getParameter("jobEducationRequirements")!=null){
			jobEducationRequirements = request.getParameter("jobEducationRequirements");
		}
		String jobSexRequirements = "";
		if(request.getParameter("jobSexRequirements")!=null){
			jobSexRequirements = request.getParameter("jobSexRequirements");
		}
		String jobForeignLanguages = "";
		if(request.getParameter("jobForeignLanguages")!=null){
			jobForeignLanguages = request.getParameter("jobForeignLanguages");
		}
		String jobDesc = "";
		if(request.getParameter("jobDesc")!=null){
			jobDesc = request.getParameter("jobDesc");
		}
		int jobState = 0;
		if(request.getParameter("jobState")!=null){
			jobState =Integer.parseInt(request.getParameter("jobState"));
		}
		
		Company company = new Company();
		company.setCompanyId(companyId);
		
		// 将请求数据封装成一个企业基本信息对象
		Job Job= new Job(company, jobName, jobHiringnum, jobSalary, jobArea,
				jobAgeRequirements, jobEducationRequirements, jobSexRequirements,
				jobForeignLanguages, jobDesc, jobState);
		return Job;
	}
}
