package com.itoffer.servlet.backstage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itoffer.bean.User;
import com.itoffer.dao.UserDAO;

/**
 * 求职者登录功能实现
 * 
 * @author TianYanan
 *
 */
@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerLoginServlet() {
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
		String email = request.getParameter("userEmail");
		String password = request.getParameter("userPwd");
		//获取操作类型
		String type = request.getParameter("type");
		if("managerLogin".equals(type)){
			//获取用户提交的验证码
			String validateCode = request.getParameter("validateCode");
			// 判断验证码是否正确
			String sessionValidateCode = (String)request.getSession().getAttribute("SESSION_VALIDATECODE");
			if(!sessionValidateCode.equals(validateCode)){
				out.print("<script type='text/javascript'>");
				out.print("alert('请输入正确验证码！');");
				out.print("window.location = 'system_administrator/administrator_login.jsp'");
				out.print("</script>");
				return;
			}else{
				// 登录验证
				UserDAO dao = new UserDAO();
				User LoginUser = dao.managerLogin(email, password);
				int userID = LoginUser.getUserId();
				int userRole = LoginUser.getUserRole();
				if (userID != 0) {
					User sessionUser = new User(userID, email, password,userRole);
					request.getSession().setAttribute("SESSION_USER", sessionUser);
					User user = dao.selectById(userID);
					userRole = user.getUserRole();
					if(userRole == 4){
						/*/recruitment-system/WebContent/system_administrator/html/main.html*/
						response.sendRedirect("system_administrator/html/main.html");
					}else{
						out.print("<script type='text/javascript'>");
						out.print("alert('您不是管理员，请通过用户登录渠道登录!');");
						out.print("</script>");
						response.sendRedirect("login.jsp");
					}
				} else {
					// 用户登录信息错误，进行错误提示
					out.print("<script type='text/javascript'>");
					out.print("alert('用户名或密码错误，请重新输入！');");
					out.print("window.location = 'system_administrator/administrator_login.jsp'");
					out.print("</script>");
				}
			}
		}
	}
}
