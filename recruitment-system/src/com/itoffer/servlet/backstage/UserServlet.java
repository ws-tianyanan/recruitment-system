package com.itoffer.servlet.backstage;

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
@WebServlet("/ManagerUserServlet")
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
		//获取响应字符输出流
		PrintWriter out = response.getWriter() ;
		//获取操作类型
		String type = request .getParameter ("type");
		UserDAO dao = new UserDAO() ;
		int uid = 0;
		if("addSelect".equals(type)){
			//获取用户添加信息
			String userLogname = request.getParameter("userLogname");
			String userPwd = request.getParameter("userPwd") ;
			String userRealname = request.getParameter("userRealname");
			String userEmail = request.getParameter("userEmail") ;
			int userRole = Integer.parseInt(request.getParameter("userRole"));
			int userState = Integer.parseInt(request.getParameter("userState"));
			//定义一个用来封装用户信息的JavaBean
			User user = new User(userEmail, userPwd, userLogname, userRealname, userRole, userState);
			//用户信息添加
			dao.save(user);
			//添加成功，重定向到响应页面
			response. sendRedirect ("system_administrator/jsp/userList.jsp");
		} else if("updateSelect".equals(type)){
			uid = Integer.parseInt(request.getParameter("userId"));
			User user = dao.selectById(uid);
			request.setAttribute ("user", user);
			request.getRequestDispatcher("system_administrator/jsp/userUpdate.jsp").forward(request,response);
		} else if("delectSelect".equals(type)){
			uid = Integer.parseInt(request.getParameter("userId"));
			dao.delete(uid);
			request.getRequestDispatcher("system_administrator/jsp/userList.jsp").forward(request,response);
		} else if("changePassword".equals(type)){
			uid = Integer.parseInt(request.getParameter("userId")) ;
			String oldPassword = request.getParameter("oldPassword") ;
			String newPassword = request.getParameter("newPassword") ;
			User user = dao.selectById(uid);
			if(oldPassword.equals(user.getUserPwd())){
				request.setAttribute("result", false);
			} else {
				user.setUserPwd(newPassword);
				dao.updatePwd(user);
				request.setAttribute("result", true);
			}
			request.getRequestDispatcher("system_administrator/jsp/passwordUpdateResult.jsp").forward(request,response);
		} else if("OnlineUserList".equals(type)){
			/*User user = (User) request.getSession().getAttribute("SESSION_USER");*/
			// 获取所有在线用户
			ServletContext application = request.getSession().getServletContext();
	    	Map<Integer,User> onlineUserMap = (Map<Integer,User>) application.getAttribute("ONLINE_USER");
	    	
	    	request.setAttribute("onlineUserMap", onlineUserMap);
			request.getRequestDispatcher("system_administrator/jsp/userOnline.jsp").forward(request,response);
		} else if("forceLogout".equals(type)){
			uid = Integer.parseInt(request.getParameter("userId"));
			if (uid != 0) {
				// 获取所有在线用户
				ServletContext application = request.getSession().getServletContext(); 
		    	Map<Integer,User> onlineUserMap = (Map<Integer,User>) application.getAttribute("ONLINE_USER");
		    	
				if(onlineUserMap!=null && onlineUserMap.containsKey(uid)){
					onlineUserMap.remove(uid);
		    		application.setAttribute("ONLINE_USER",onlineUserMap) ;
				} else {
					out.println("<script>alert('该用户不在线上！');</script>");
				}
			}
			request.getRequestDispatcher("system_administrator/jsp/userOnline.jsp").forward(request,response);
		}
	}
}
