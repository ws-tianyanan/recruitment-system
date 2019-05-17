package com.itoffer.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(
	urlPatterns ={"/system_administrator/jsp/*" }, 
	servletNames = {
			"com.itoffer.servlet.backstage.CompanyServlet",
			"com.itoffer.servlet.backstage.JobServlet",
			"com.itoffer.servlet.backstage.JobApplyServlet",
			"com.itoffer.servlet.backstage.ResumeServlet",
			"com.itoffer.servlet.backstage.UserServlet",
	},
	initParams = {@WebInitParam (name = "loginPage", value = "system_administrator/administrator_login.jsp")})
public class AuthorityManagerFilter implements Filter {
		private String loginPage;
		public AuthorityManagerFilter() {
		}
		
		public void destroy (){
			this.loginPage = null;
		}
		@Override
		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
				throws IOException, ServletException {
			// TODO Auto-generated method stub
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session = req.getSession ();
			//判断如果是登录请求则放行
			if("/ManagerLoginServlet".equals(req.getServletPath()) && "type=managerLogin".equals(req.getQueryString())){
				chain.doFilter(request,response);
				return;
			}
			//判断被拦截的请求用户是否处于登录状态，若未登录，返回登录页面
			if (session.getAttribute("SESSION_USER") == null) {
				resp.sendRedirect (req. getContextPath() + "/" + loginPage) ;
			} else {
				chain.doFilter (request,response) ;
			}
		}
		@Override
		public void init(FilterConfig fConfig) throws ServletException {
			// TODO Auto-generated method stub
			//获取当请求被拦截时转向的页面
			loginPage = fConfig.getInitParameter("loginPage");
			if (null == loginPage) {
				loginPage = "system_administrator/administrator_login.jsp";
			}
		}
}