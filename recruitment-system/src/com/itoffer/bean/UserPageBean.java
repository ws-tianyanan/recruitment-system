package com.itoffer.bean;

import java.util.ArrayList;
import java.util.List;

import com.itoffer.dao.UserDAO;

/**
 * 用户列表分页
 * @author TianYanan
 *
 */
public class UserPageBean {
	//每页显示记录数
	private int pageSize = 5;
	//当前页码
	private int pageNo = 1;
	//总页数
	private int totalPages;
	//每页数据记录集合
	private List<User> pageData = new ArrayList<User>();
	//是否有 下一页
	private boolean hasNextPage;
	//是否有上一页
	private boolean hasPreviousPage;
	
	public UserPageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserPageBean(int pageSize, int pageNo, int totalPages, List<User> pageData, boolean hasNextPage,
			boolean hasPreviousPage) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPages = totalPages;
		this.pageData = pageData;
		this.hasNextPage = hasNextPage;
		this.hasPreviousPage = hasPreviousPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPages() {
		// 获取总记录数
		UserDAO dao = new UserDAO();
		int recordCount = dao.getRecordCount();
		// 获取并返回总页数
		return (recordCount + pageSize - 1) / pageSize;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<User> getPageData() {
		// 查询当页记录
		UserDAO dao = new UserDAO();
		List<User> list = dao.getUserPageList(pageNo, pageSize);
		return list;
	}

	public void setPageData(List<User> pageData) {
		this.pageData = pageData;
	}

	public boolean isHasNextPage() {
		return (this.getPageNo() < this.getTotalPages());
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public boolean isHasPreviousPage() {
		return (this.getPageNo() > 1);
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
}
