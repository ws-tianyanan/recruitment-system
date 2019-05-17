package com.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.itoffer.bean.Company;
import com.itoffer.bean.Job;
import com.itoffer.bean.JobApply;
import com.itoffer.bean.Resume;
import com.itoffer.bean.User;
import com.itoffer.util.DBUtil;

/**
 * 职位申请信息数据处理类
 * 
 * @author TianYanan
 *
 */
public class JobApplyDAO {

	/**
	 * 保存职位申请信息
	 * 
	 * @param jobid
	 * @param UserId
	 */
	public void save(int jobid, int UserId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO tb_jobapply(" + "APPLY_ID,JOB_ID,User_ID,APPLY_DATE,APPLY_STATE"
				+ ") VALUES(itoffer_jobapply.nextval,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, jobid);
			pstmt.setInt(2, UserId);
			pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
			pstmt.setInt(4, 1);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	/**
	 * 用户查询职位申请列表
	 * 
	 * @param UserId
	 * @return
	 */
	public List<JobApply> getJobApplyList(int userId) {
		List<JobApply> list = new ArrayList<JobApply>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT a.apply_id,a.apply_state,a.apply_date,j.job_id,j.job_name,c.company_id,c.company_name "
				+ "FROM tb_jobapply a , tb_job j ,tb_company c "
				+ "WHERE a.job_id=j.job_id and j.company_id=c.company_id " + "and a.User_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JobApply ja = new JobApply();
				ja.setApplyId(rs.getInt(1));
				ja.setApplyState(rs.getInt(2));
				ja.setUserId(userId);
				ja.setApplyDate(rs.getTimestamp(3));
				Job job = new Job();
				job.setJobId(rs.getInt(4));
				job.setJobName(rs.getString(5));
				Company company = new Company();
				company.setCompanyId(rs.getInt(6));
				company.setCompanyName(rs.getString(7));
				job.setCompany(company);

				ja.setJob(job);
				list.add(ja);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}

	public List<JobApply> query(String companyId, String jobId, String startDate, String endDate) {
		// TODO Auto-generated method stub
		List<JobApply> list = new ArrayList<JobApply>();
		Connection conn = DBUtil.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer("SELECT a.apply_id,a.apply_state,a.apply_date,"
				+ "j.job_id,j.job_name, u.user_id,d.basicinfo_id,d.realname"
				+ "FROM tb_jobapply a,tb_job j , tb_user u ,tb_resume_basicinfo d"
				+ "WHERE a.job_id=j.job_id and a.user_id=u.user_id and u.user_id=d.user_id");
		try {
			stmt = conn.createStatement();
			int cid = Integer.parseInt(companyId == null ? "0" : companyId);
			int jid = Integer.parseInt(jobId == null ? "0" : jobId);
			if (cid != 0)
				sql.append(" and j.company_id =" + cid);
			if (jid != 0)
				sql.append(" and a.job_id = " + jid);
			if (!"".equals(startDate))
				sql.append(" and a.apply_date >= to_timestamp('" + startDate + "', 'yyyy-MM-dd HH24:mi:ss')");
			if (!"".equals(endDate))
				sql.equals(" and a.apply_date <= to_timestamp('" + endDate + "', 'yyyy-MM-dd HH24:mi:ss')");
			rs = stmt.executeQuery(sql.toString());
			System.out.println(sql.toString());
			while (rs.next()) {
				// 姓名、申请职位、申请状态、申请日期
				JobApply ja = new JobApply();
				ja.setApplyId(rs.getInt(1));
				ja.setApplyState(rs.getInt(2));
				ja.setApplyDate(rs.getTimestamp(3));
				Job job = new Job();
				job.setJobId(rs.getInt(4));
				job.setJobName(rs.getString(5));
				User user = new User();
				user.setUserId(rs.getInt(6));
				Resume resume = new Resume();
				resume.setBasicinfoId(rs.getInt(7));
				resume.setRealName(rs.getString(8));
				user.setResume(resume);
				ja.setJob(job);
				ja.setUser(user);
				list.add(ja);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, stmt, conn);
		}
		return list;
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
			String sql = "SELECT count(*) FROM tb_jobapply";
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
	 * 查询所有企业信息(从pagebean中获取list)
	 * 
	 * @return
	 */
	public List<JobApply> getALLJobApplyListByManager(int pageNo, int pageSize) {
		// 定义本页记录索引值
		int firstIndex = pageSize * (pageNo-1);
		List<JobApply> list = new ArrayList<JobApply>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT a.* , ROWNUM rn FROM ( "
					+ "SELECT * FROM tb_jobapply ORDER BY apply_id DESC) "
					+ "a WHERE ROWNUM<=? ) WHERE rn>? ");
			pstmt.setInt(1, firstIndex+pageSize);
			pstmt.setInt(2, firstIndex);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JobApply jobApply = new JobApply();
				jobApply.setApplyId(rs.getInt("apply_id"));
				jobApply.setJobId(rs.getInt("job_id"));
				jobApply.setUserId(rs.getInt("user_id"));
				jobApply.setApplyDate(rs.getDate("apply_date"));
				jobApply.setApplyState(rs.getInt("apply_state"));
				JobDAO jobDAO = new JobDAO();
				Job job = jobDAO.getJobByID(rs.getInt("job_id"));
				jobApply.setJob(job);
				UserDAO userDAO = new UserDAO();
				User user = userDAO.selectById(rs.getInt("user_id"));
				jobApply.setUser(user);
				list.add(jobApply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}
	
	public List<JobApply> getJobApplyListByUser(int pageNo, int pageSize,int jobId) {
		// 定义本页记录索引值
		int firstIndex = pageSize * (pageNo-1);
		List<JobApply> list = new ArrayList<JobApply>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT a.* , ROWNUM rn FROM ( "
					+ "SELECT * FROM tb_jobapply WHERE job_id=? ORDER BY apply_id DESC) "
					+ "a WHERE ROWNUM<=? ) WHERE rn>? ");
			pstmt.setInt(1, jobId);
			pstmt.setInt(2, firstIndex+pageSize);
			pstmt.setInt(3, firstIndex);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JobApply jobApply = new JobApply();
				jobApply.setApplyId(rs.getInt("apply_id"));
				jobApply.setJobId(rs.getInt("job_id"));
				jobApply.setUserId(rs.getInt("user_id"));
				jobApply.setApplyDate(rs.getDate("apply_date"));
				jobApply.setApplyState(rs.getInt("apply_state"));
				JobDAO jobDAO = new JobDAO();
				Job job = jobDAO.getJobByID(rs.getInt("job_id"));
				jobApply.setJob(job);
				UserDAO userDAO = new UserDAO();
				User user = userDAO.selectById(rs.getInt("user_id"));
				jobApply.setUser(user);
				list.add(jobApply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}

	
	/**
	 * 职位申请删除（管理员）
	 * 
	 * @param companyId
	 */
	public void deleteByManager(int applyId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		// 注册用户
		String sql = "DELETE FROM tb_jobapply WHERE apply_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, applyId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
}
