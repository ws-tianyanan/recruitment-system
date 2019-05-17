package com.itoffer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.User;
import com.itoffer.dao.CompanyDAO;
import com.itoffer.dao.UserDAO;
import com.itoffer.util.CookieEncryptTool;

/**
 * 求职者登录功能实现
 * 
 * @author TianYanan
 *
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
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
		PrintWriter out = response.getWriter();
		// 获取请求参数
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		String requestPath = request.getParameter("requestPath");
		// 登录验证
		UserDAO dao = new UserDAO();
		CompanyDAO companyDAO = new CompanyDAO();
		User user = dao.login(email, password);
		int userID = user.getUserId();
		int userRole = user.getUserRole();
		
		if (userID != 0) {
			// 将信息存入session
			User sessionUser = new User(userID, email, password,userRole);
			request.getSession().setAttribute("SESSION_USER", sessionUser);
			// 通过Cookie记住邮箱和密码
			rememberMe(rememberMe, email, password, request, response);
			//判断是否已存在请求路径
			if(!"".equals(requestPath) && null!=requestPath){
				response.sendRedirect(requestPath);
			}else{
				if(userRole == 1){//重定向到普通用户登录页面
					// 判断是否已填写简历
					int resumeID = dao.isExistResume(userID);
					if (resumeID != 0){
						request.getSession().setAttribute("SESSION_RESUMEID", userID);
						response.sendRedirect("index.jsp");
					}else
						// 若简历不存在，跳到简历填写向导页面
						response.sendRedirect("applicant/resumeGuide.jsp");
				}else if(userRole == 2){//重定向到企业用户登录页面
					// 判断是否已填写企业信息
					int enterpriseInfoID = companyDAO.isExistEnterpriseInfo(userID);
					if (enterpriseInfoID != 0){
						request.getSession().setAttribute("SESSION_ENTERPRISEINFOID", enterpriseInfoID);
						// 若企业信息已存在，跳到企业用户页
						response.sendRedirect("CompanyServlet?type=viewEnterpriseInfo");
					}else
						// 若简历不存在，跳到简历填写向导页面
						///recruitment-system/WebContent/enterprise_user/addHrInfo.jsp
						response.sendRedirect("enterprise_user/addHrInfo.jsp");
				}else if(userRole == 3){//重定向到猎头用户登录页面
					// 判断是否已填写简历
					int HeadhuntingInfoID = dao.isExistHeadhuntingInfo(userID);
					if (HeadhuntingInfoID != 0){
						request.getSession().setAttribute("SESSION_HEADHUNTINGINFOID", userID);
						int enterpriseID = companyDAO.isExistEnterpriseInfo(userID);
						if (enterpriseID != 0) {
							// 若猎头信息已存在，跳到猎头用户界面
							/*/recruitment-system/WebContent/headhunting_user/jsp/main.jsp*/
							response.sendRedirect("headhunting_user/jsp/main.jsp");
						}else {
							/*/recruitment-system/WebContent/headhunting_user/jsp/addCompany.jsp*/
							// 若猎头信息已存在，跳到企业信息登记页
							response.sendRedirect("headhunting_user/jsp/addCompany.jsp");
						}
					}else
						// 若简历不存在，跳到简历填写向导页面
						response.sendRedirect("headhunting_user/headhuntingUserGuide.jsp");
				}else if(userRole == 4){//重定向到系统管理员登录页面
					request.getSession().setAttribute("SESSION_HEADHUNTINGINFOID", userID);
					out.print("<script type='text/javascript'>");
					out.print("alert('您是管理员，请通过管理员登录渠道登录!');");
					out.print("</script>");
					response.sendRedirect("system_administrator/administrator_login.jsp");
				}else{//重定向到错误页面
					response.sendRedirect("error.jsp");
				}
			}
		} else {
			// 用户登录信息错误，进行错误提示
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码错误，请重新输入！');");
			out.print("window.location='login.jsp';");
			out.print("</script>");
		}
	}

	private void rememberMe(String rememberMe, String email, String password,
			HttpServletRequest request, HttpServletResponse response) {
		// 判断是否需要通过Cookie记住邮箱和密码
		if ("true".equals(rememberMe)) {
			// 记住邮箱及密码
			Cookie cookie = new Cookie("COOKIE_APPLICANTEMAIL",
					CookieEncryptTool.encodeBase64(email));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);

			cookie = new Cookie("COOKIE_APPLICANTPWD",
					CookieEncryptTool.encodeBase64(password));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);
		} else {
			// 将邮箱及密码Cookie清空
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if ("COOKIE_APPLICANTEMAIL".equals(cookie.getName())
							|| "COOKIE_APPLICANTPWD".equals(cookie.getName())) {
						cookie.setMaxAge(0);
						cookie.setPath("/");
						response.addCookie(cookie);
					}
				}
			}
		}
	}

}
