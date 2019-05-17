package com.itoffer.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.User;
import com.itoffer.dao.UserDAO;

/**
 * 用户添加
 * @author TianYanan
 *
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		//请求解决乱码
		request.setCharacterEncoding("utf-8");
		//响应解决乱码
		response.setCharacterEncoding("utf-8");
		//获取操作类型
		String type = request .getParameter ("type");
		UserDAO dao = new UserDAO() ;
		if("addHrInfo".equals(type)){
			// 从会话对象中获取当前登录用户标识
			User user = (User)request.getSession().getAttribute("SESSION_USER");
			String userLogname = request.getParameter("userLogname");
			String userRealname = request.getParameter("userRealname");
			dao.saveRealOrLoginName(userLogname,userRealname,user.getUserId());
			response.sendRedirect("enterprise_user/enterpriseUserGuide.jsp");
		}
	}
}
