package com.itoffer.servlet.backstage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.PageBean;
import com.itoffer.bean.Resume;
import com.itoffer.dao.ResumeDAO;
import com.itoffer.dao.UserDAO;

/**
 * 简历基本信息操作Servlet
 * 
 * @author TianYanan
 *
 */
@WebServlet("/ManagerResumeServlet")
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
		if("list".equals(type)){
			//获取请求页码
			int pageNo = Integer.parseInt(request.getParameter("pageNo")==null?"1":request.getParameter ("pageNo"));
			ResumeDAO dao = new ResumeDAO() ;
			//查询总记录数
			int recordCount = dao.getRecordCount();
			//查询请求页码数据
			List<Resume> list = dao.getResumePageList(pageNo, 5);
			
			//将分页信息封装到PageBean对象中
			PageBean<Resume> pageBean = new PageBean<Resume>() ;
			pageBean.setPageNo(pageNo);
			pageBean.setRecordCount(recordCount);
			pageBean.setPageData(list);
			//将分页数据对象PageBean对象存入请求域属性中
			request.setAttribute("pageBean", pageBean) ;
			//将请求转发到简历列表页面
			request.getRequestDispatcher("system_administrator/jsp/resumeList.jsp").forward(request, response);
		} else if("viewOper".equals(type)){
			int basicinfoId = Integer.parseInt(request.getParameter("basicinfoId"));
			ResumeDAO dao = new ResumeDAO();
			Resume resume=dao.selectListinfoByID(basicinfoId);
			request.setAttribute("resume", resume);
			request.getRequestDispatcher("system_administrator/jsp/resumeView.jsp").forward(request, response);
		}else if("delectOper".equals(type)){
			int basicinfoId = Integer.parseInt(request.getParameter ("basicinfoId")) ;
			ResumeDAO dao = new ResumeDAO();
			dao.delete(basicinfoId);
			
			//获取请求页码
			int pageNo = Integer.parseInt(request.getParameter("pageNo")==null?"1":request.getParameter ("pageNo"));
			//查询总记录数
			int recordCount = dao.getRecordCount();
			//查询请求页码数据
			List<Resume> list = dao.getResumePageList(pageNo, 5);
			//将分页信息封装到PageBean对象中
			PageBean<Resume> pageBean = new PageBean<Resume>() ;
			pageBean.setPageNo(pageNo);
			pageBean.setRecordCount(recordCount);
			pageBean.setPageData(list);
			// 将查询到企业列表存入request请求域
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("system_administrator/jsp/resumeList.jsp").forward(request, response);
		}
	}

}
