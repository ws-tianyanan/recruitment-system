package com.itoffer.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.User;
import com.itoffer.bean.JobApply;
import com.itoffer.bean.PageBean;
import com.itoffer.dao.JobApplyDAO;

/**
 * 职位申请处理Servlet
 * 
 * @author TianYanan
 *
 */
@WebServlet("/JobApplyServlet")
public class JobApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JobApplyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取操作类型
		String type = request.getParameter("type");
		JobApplyDAO dao = new JobApplyDAO();
		if ("apply".equals(type)) {
			// 获取职位编号
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			// 获取登录用户
			User User = (User) request.getSession()
					.getAttribute("SESSION_USER");
			// 添加此用户对此职位的申请
			dao.save(jobId, User.getUserId());
			response.sendRedirect("JobApplyServlet?type=myapply");
		} else if ("myapply".equals(type)) {
			// 获取登录用户
			User User = (User) request.getSession()
					.getAttribute("SESSION_USER");
			// 根据用户标识查询此用户申请的所有职位
			List<JobApply> jobList = dao.getJobApplyList(User
					.getUserId());
			request.setAttribute("jobList", jobList);
			request.getRequestDispatcher("applicant/jobApply.jsp").forward(
					request, response);
		}if ("listByUser".equals(type)) {
			// 获取职位编号
			int jobId = Integer.parseInt(request.getParameter("jobId"));
			//获取请求页码
			int pageNo = Integer.parseInt(request.getParameter("pageNo")==null?"1":request.getParameter ("pageNo"));
			int recordCount=dao.getRecordCountByManager();
			List<JobApply> jobApplyList=dao.getJobApplyListByUser(pageNo,5,jobId);
			
			//将分页信息封装到PageBean对象中
			PageBean<JobApply> pageBean = new PageBean<JobApply>();
			pageBean.setPageNo(pageNo);
			pageBean.setRecordCount(recordCount);
			pageBean.setPageData(jobApplyList);
			
			// 将查询到企业列表存入request请求域
			request.setAttribute("pageBean", pageBean);
			/*/recruitment-system/WebContent/enterprise_user/jsp/applyList.jsp*/
			request.getRequestDispatcher("enterprise_user/jsp/applyList.jsp").forward(request,response);
		}
	}

}
