package com.itoffer.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.itoffer.bean.Company;
import com.itoffer.bean.Job;
import com.itoffer.bean.Resume;
import com.itoffer.util.DBUtil;

public class CompanyDAO {
	/**
	 * 通过hr用户id添加企业信息
	 * @param company
	 * @param uid
	 * @return
	 */
	public int addCompanyByUserId(Company company) {
		int companyId = 0;
		String sql = "INSERT INTO tb_company(company_id, company_name, company_registertime,"
				+ "company_registercapital,company_legalperson,company_creditcode,"
				+ "company_area,company_size,company_type,company_industry,"
				+ "company_brief,company_state,company_sort,company_viewnum,"
				+ "company_pic,company_tel,company_hr_id) "
				+ "VALUES(ITOFFER_COMPANY.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, company.getCompanyName());
			pstmt.setTimestamp(2, company.getCompanyRegisterTime() == null ? null
					: new Timestamp(company.getCompanyRegisterTime().getTime()));
			pstmt.setInt(3, company.getCompanyRegisterCapital());
			pstmt.setString(4, company.getCompanyLegalPerson());
			pstmt.setString(5, company.getCompanyCreditCode());
			pstmt.setString(6, company.getCompanyArea());
			pstmt.setString(7, company.getCompanySize());
			pstmt.setString(8, company.getCompanyType());
			pstmt.setString(9, company.getCompanyIndustry());
			pstmt.setString(10, company.getCompanyBrief());
			pstmt.setInt(11, company.getCompanyState());
			pstmt.setInt(12, company.getCompanySort());
			pstmt.setInt(13, company.getCompanyViewnum());
			pstmt.setString(14, company.getCompanyPic());
			pstmt.setString(15, company.getCompanyTel());
			pstmt.setInt(16, company.getCompanyHrId());
			pstmt.executeUpdate();
			pstmt.close();
			// 获取当前生成的简历标识
			String sql2 = "SELECT ITOFFER_COMPANY.CURRVAL FROM dual";
			pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				companyId = rs.getInt(1);
			// 事务提交
			conn.commit();
		} catch (SQLException e) {
			try {
				// 事务回滚
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		
		return companyId;
	}
	
	/**
	 * 判断是否已有企业信息
	 * 
	 * @param email
	 * @return
	 */
	public int isExistEnterpriseInfo(int userID) {
		int infoID = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT company_id FROM tb_company WHERE company_hr_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next())
				infoID = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return infoID;
	}
	
	/**
	 * 查询所有企业信息(从servlet中获取list；管理员用户)
	 * 
	 * @return
	 */
	public List<Company> getALLCompanyList() {
		// 定义本页记录索引值
		List<Company> list = new ArrayList<Company>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM tb_company ORDER BY company_id DESC)";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyHrId(rs.getInt("company_hr_id"));
				company.setCompanyName(rs.getString("company_name"));
				company.setCompanyRegisterTime(rs.getDate("company_registertime"));
				company.setCompanyRegisterCapital(rs.getInt("company_registercapital"));
				company.setCompanyLegalPerson(rs.getString("company_legalperson"));
				company.setCompanyCreditCode(rs.getString("company_creditcode"));
				company.setCompanyArea(rs.getString("company_area"));
				company.setCompanySize(rs.getString("company_size"));
				company.setCompanyType(rs.getString("company_type"));
				company.setCompanyIndustry(rs.getString("company_industry"));
				company.setCompanyBrief(rs.getString("company_brief"));
				company.setCompanyState(rs.getInt("company_state"));
				company.setCompanySort(rs.getInt("company_sort"));
				company.setCompanyViewnum(rs.getInt("company_viewnum"));
				company.setCompanyPic(rs.getString("company_pic"));
				company.setCompanyTel(rs.getString("company_tel"));
				list.add(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查询所有的企业名称和标识
	 * 
	 * @return
	 */
	public List<Company> selectALLCompanyName() {
		// 定义本页记录索引值
		List<Company> list = new ArrayList<Company>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "SELECT company_id,company_name FROM tb_company ORDER BY company_id DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyName(rs.getString("company_name"));
				list.add(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查询所有企业信息(从pagebean中获取list)
	 * 
	 * @return
	 */
	public List<Company> getALLCompanyListByManager(int pageNo, int pageSize) {
		// 定义本页记录索引值
		int firstIndex = pageSize * (pageNo - 1);
		List<Company> list = new ArrayList<Company>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT a.* , ROWNUM rn FROM ( "
					+ "SELECT company_id,company_name,company_pic,company_registertime,"
					+ "company_legalperson,company_area,company_size"
					+ ",company_type,company_state,company_sort,company_viewnum,company_hr_id,company_tel"
					+ " FROM tb_company ORDER BY company_id DESC) a WHERE ROWNUM<=? ) WHERE rn>? ");
			pstmt.setInt(1, firstIndex + pageSize);
			pstmt.setInt(2, firstIndex);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyName(rs.getString("company_name"));
				company.setCompanyPic(rs.getString("company_pic"));
				company.setCompanyRegisterTime(rs.getDate("company_registertime"));
				company.setCompanyLegalPerson(rs.getString("company_legalperson"));
				company.setCompanyArea(rs.getString("company_area"));
				company.setCompanySize(rs.getString("company_size"));
				company.setCompanyType(rs.getString("company_type"));
				company.setCompanyState(rs.getInt("company_state"));
				company.setCompanySort(rs.getInt("company_sort"));
				company.setCompanyViewnum(rs.getInt("company_viewnum"));
				company.setCompanyHrId(rs.getInt("company_hr_id"));
				company.setCompanyTel(rs.getString("company_tel"));
				list.add(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}

	/**
	 * 查询所有正在招聘中的企业信息以及该企业的最新职位信息
	 * 
	 * @return
	 */
	public List<Company> getCompanyList() {
		List<Company> list = new ArrayList<Company>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT tb_company.company_id,company_hr_id,company_pic,job_id,job_name,job_salary,job_area "
					+ "FROM tb_company LEFT OUTER JOIN tb_job ON tb_job.company_id=tb_company.company_id "
					+ "WHERE company_state=1 and job_id IN ("
					+ "SELECT MAX(job_id) FROM tb_job WHERE job_state=1 GROUP BY company_id" + ")";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				Job job = new Job();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyHrId(rs.getInt("company_hr_id"));
				company.setCompanyPic(rs.getString("company_pic"));
				job.setJobId(rs.getInt("job_id"));
				job.setJobName(rs.getString("job_name"));
				job.setJobSalary(rs.getString("job_salary"));
				job.setJobArea(rs.getString("job_area"));
				company.getJobs().add(job);
				list.add(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}

	/**
	 * 根据企业标识查询企业详情
	 * 
	 * @param cid
	 * @return
	 */
	public Company getCompanyByID(int cid) {
		Company company = new Company();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_company WHERE company_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyName(rs.getString("company_name"));
				company.setCompanyRegisterTime(rs.getDate("company_registertime"));
				company.setCompanyRegisterCapital(rs.getInt("company_registercapital"));
				company.setCompanyLegalPerson(rs.getString("company_legalperson"));
				company.setCompanyCreditCode(rs.getString("company_creditcode"));
				company.setCompanyArea(rs.getString("company_area"));
				company.setCompanySize(rs.getString("company_size"));
				company.setCompanyType(rs.getString("company_type"));
				company.setCompanyIndustry(rs.getString("company_industry"));
				company.setCompanyBrief(rs.getString("company_brief"));
				company.setCompanyState(rs.getInt("company_state"));
				company.setCompanySort(rs.getInt("company_sort"));
				company.setCompanyViewnum(rs.getInt("company_viewnum"));
				company.setCompanyPic(rs.getString("company_pic"));
				company.setCompanyHrId(rs.getInt("company_hr_id"));
				company.setCompanyTel(rs.getString("company_tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return company;
	}
	
	/**
	 * 根据用户标识查询企业详情
	 * 
	 * @param cid
	 * @return
	 */
	public Company getCompanyByUserID(int uid) {
		Company company = new Company();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_company WHERE company_hr_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyName(rs.getString("company_name"));
				company.setCompanyRegisterTime(rs.getDate("company_registertime"));
				company.setCompanyRegisterCapital(rs.getInt("company_registercapital"));
				company.setCompanyLegalPerson(rs.getString("company_legalperson"));
				company.setCompanyCreditCode(rs.getString("company_creditcode"));
				company.setCompanyArea(rs.getString("company_area"));
				company.setCompanySize(rs.getString("company_size"));
				company.setCompanyType(rs.getString("company_type"));
				company.setCompanyIndustry(rs.getString("company_industry"));
				company.setCompanyBrief(rs.getString("company_brief"));
				company.setCompanyState(rs.getInt("company_state"));
				company.setCompanySort(rs.getInt("company_sort"));
				company.setCompanyViewnum(rs.getInt("company_viewnum"));
				company.setCompanyPic(rs.getString("company_pic"));
				company.setCompanyHrId(rs.getInt("company_hr_id"));
				company.setCompanyTel(rs.getString("company_tel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return company;
	}

	/**
	 * 分页查询首页所需要的所有企业信息及职位信息
	 * 
	 * @return
	 */
	public List<Company> getCompanyPageList(int pageNo, int pageSize) {
		// 定义本页记录索引值
		int firstIndex = pageSize * (pageNo - 1);
		List<Company> list = new ArrayList<Company>();
		Connection connection = DBUtil.getConnection();
		if (connection == null)
			return null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement("SELECT * FROM ( SELECT a.* , ROWNUM rn FROM ( "
					+ "SELECT tb_company.company_id,company_pic,job_id," + "job_name,job_salary,job_area,job_hiringnum "
					+ "FROM tb_company " + "LEFT OUTER JOIN tb_job ON tb_company.company_id=tb_job.company_id "
					+ "WHERE company_state=1 and job_id IN ("
					+ "SELECT MAX(job_id) FROM tb_job WHERE job_state=1 GROUP BY company_id"
					+ ")) a WHERE ROWNUM<=? ) WHERE rn>? ");
			pstmt.setInt(1, firstIndex + pageSize);
			pstmt.setInt(2, firstIndex);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Company company = new Company();
				Job job = new Job();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyPic(rs.getString("company_pic"));
				job.setJobId(rs.getInt("job_id"));
				job.setJobName(rs.getString("job_name"));
				job.setJobSalary(rs.getString("job_salary"));
				job.setJobArea(rs.getString("job_area"));
				job.setJobHiringnum(rs.getInt("job_hiringnum"));
				company.getJobs().add(job);
				list.add(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, connection);
		}
		return list;
	}

	/**
	 * 查询所需分页的总记录数
	 * 
	 * @param pageSize
	 * @return
	 */
	public int getRecordCount() {
		int recordCount = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT count(*) FROM tb_company "
					+ "LEFT OUTER JOIN tb_job ON tb_job.company_id=tb_company.company_id "
					+ "WHERE company_state=1 and job_id IN ("
					+ "SELECT MAX(job_id) FROM tb_job WHERE job_state=1 GROUP BY company_id)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				recordCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return recordCount;
	}

	/**
	 * 更新企业的浏览次数
	 * 
	 * @param id
	 */
	public void updateCompanyViewCount(int id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "UPDATE tb_company " + "SET company_viewnum=company_viewnum+1 " + "WHERE company_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
	}

	/**
	 * 企业信息删除（管理员）
	 * 
	 * @param companyId
	 */
	public void deleteByManager(int companyId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		// 注册用户
		String sql = "DELETE FROM tb_company WHERE company_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, companyId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	/**
	 * 企业信息修改（管理员）
	 * 
	 * @param email
	 * @param password
	 */
	public void updateByManager(Company company) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		// 注册用户
		String sql = "UPDATE tb_company SET company_name=? ,company_registercapital=? ,company_pic=? ,company_legalperson=? ,company_creditcode=? ,company_area=? ,company_size=? ,company_type=? ,company_industry=? ,company_brief=? ,company_state=? ,company_hr_id=? ,company_tel=?  WHERE company_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, company.getCompanyName());
			pstmt.setInt(2, company.getCompanyRegisterCapital());
			pstmt.setString(3, company.getCompanyPic());
			pstmt.setString(4, company.getCompanyLegalPerson());
			pstmt.setString(5, company.getCompanyCreditCode());
			pstmt.setString(6, company.getCompanyArea());
			pstmt.setString(7, company.getCompanySize());
			pstmt.setString(8, company.getCompanyType());
			pstmt.setString(9, company.getCompanyIndustry());
			pstmt.setString(10, company.getCompanyBrief());
			pstmt.setInt(11, company.getCompanyState());
			pstmt.setInt(12, company.getCompanyHrId());
			pstmt.setString(13, company.getCompanyTel());
			pstmt.setInt(14, company.getCompanyId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	/**
	 * 查询所需分页的总记录数（管理员）
	 * @return
	 */
	public int getRecordCountByManager() {
		int recordCount = 0;
		Connection conn = DBUtil .getConnection() ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT count(*) FROM tb_company";
			pstmt = conn.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			if (rs.next())
				recordCount = rs.getInt(1) ;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				DBUtil.closeJDBC(rs, pstmt, conn) ;
		}
		return recordCount;
	}

	/**
	* 查询所有企业的名称和标识
	* return
	*/
	public List<Company> selectAllCompanyName (){
		List<Company> list = new ArrayList<Company>();
		Connection conn = DBUtil.getConnection() ;
		PreparedStatement pstmt = null;
		String sq1 = "SELECT company_id, company_name FROM tb_company ORDER BY company_id DESC";
		try {
			pstmt = conn. prepareStatement(sq1) ;
			ResultSet rs = pstmt.executeQuery() ;
			while (rs.next()) {
				Company company = new Company() ;
				company. setCompanyId(rs.getInt(1)) ;
				company. setCompanyName (rs.getString(2) ) ;
				list.add(company);
			}
		} catch (SQLException e) {
			e.printStackTrace() ;
		}
		return list;
	}
	
}
