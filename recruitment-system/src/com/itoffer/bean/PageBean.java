package com.itoffer.bean;

import java.util.ArrayList;
import java.util.List;

import com.itoffer.dao.CompanyDAO;

public class PageBean<T> {
		// 每页显示记录数
		private int pageSize = 5;
		// 当前页码
		private int pageNo = 1;
		// 总页数
		private int totalPages;
		//总记录数
		private int recordCount;
		// 每页数据记录集合
		private List<T> pageData = new ArrayList<T>();
		// 是否有下一页
		private boolean hasNextPage;
		// 是否有上一页
		private boolean hasPreviousPage;

		public PageBean() {
		}

		public PageBean(int pageSize, int pageNo) {
			this.pageSize = pageSize;
			this.pageNo = pageNo;
		}

		public int getTotalPages() {
			/*// 获取总记录数
			CompanyDAO dao = new CompanyDAO();
			int recordCount = dao.getRecordCount();*/
			// 获取并返回总页数
			return (recordCount + pageSize - 1) / pageSize;
		}

		public void setTotalPages(int totalPages) {
			this.totalPages = totalPages;
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
		
		public int getRecordCount() {
			return recordCount;
		}

		public void setRecordCount(int recordCount) {
			this.recordCount = recordCount;
		}

		/**
		 * 后台获取数据（管理员企业列表显示）
		 * @return
		 */
		public List<T> getPageData() {
			/*// 查询当页记录
			CompanyDAO dao = new CompanyDAO();
			List<Company> list = dao.getALLCompanyList2(pageNo, pageSize);
			return list;*/
			return pageData;
		}

		public void setPageData(List<T> pageData) {
			this.pageData = pageData;
		}
		
		/*public void setPageData(List<T> pageData,List<T> pageData2) {
			this.pageData = pageData;
			
		}*/

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
