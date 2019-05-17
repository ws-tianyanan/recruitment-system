package com.itoffer.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;

import com.itoffer.dao.CompanyDAO;
import com.itoffer.dao.JobDAO;
/**
 * 企业职位信息浏览次数统计监听器
 * @author TianYanan
 *
 */
@WebListener
public class JobViewCountListener implements ServletRequestListener {

	public JobViewCountListener() {

	}

	public void requestDestroyed(ServletRequestEvent sre) {

	}

	public void requestInitialized(ServletRequestEvent sre) {
		HttpServletRequest request = (HttpServletRequest) sre
				.getServletRequest();
		String requestURI = request.getRequestURI();
		String queryString = request.getQueryString() == null ? "" : request
				.getQueryString();
		// 判断是否是向企业职位处理Servlet发出的请求，并且含有表示企业职位信息查看的请求参数
		if (requestURI.indexOf("JobServlet") >= 0
				&& (queryString.indexOf("select") >= 0)) {
			// 从请求字符串参数中获取企业职位编号
			int id = Integer.parseInt(queryString.substring(queryString
					.lastIndexOf('=') + 1));
			// 更新此企业职位信息的浏览次数
			JobDAO dao = new JobDAO();
			dao.updateJobViewCount(id);
		}
	}

}
