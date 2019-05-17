package com.itoffer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.itoffer.bean.Company;
import com.itoffer.bean.Job;
import com.itoffer.util.DBUtil;

/**
 * 职位数据操作
 * 
 * @author TianYanan
 *
 */
public class JobDAO {
	/**
	 * 通过企业id添加职业信息
	 * @param company
	 * @param uid
	 * @return
	 */
	public int addJobByUserId(Job job,int cid) {
		int jobId = 0;
		String sql = "INSERT INTO tb_job(job_id, company_id, "
				+ "job_name, job_hiringnum, job_salary, job_area, "
				+ "job_age_requirements, job_education_requirements, "
				+ "job_sex_requirements, job_foreign_languages, "
				+ "job_desc, job_state, job_viewnum_number, "
				+ "job_applicants_number, job_passing_number) "
				+ "VALUES(ITOFFER_JOB.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setString(2, job.getJobName());
			pstmt.setInt(3, job.getJobHiringnum());
			pstmt.setString(4, job.getJobSalary());
			pstmt.setString(5, job.getJobArea());
			pstmt.setString(6, job.getJobAgeRequirements());
			pstmt.setString(7, job.getJobEducationRequirements());
			pstmt.setString(8, job.getJobSexRequirements());
			pstmt.setString(9, job.getJobForeignLanguages());
			pstmt.setString(10, job.getJobDesc());
			pstmt.setInt(11, job.getJobState());
			pstmt.setInt(12, job.getJobViewNumber());
			pstmt.setInt(13, job.getJobApplicantsNumber());
			pstmt.setInt(14, job.getJobPassingNumber());
			pstmt.executeUpdate();
			pstmt.close();
			// 获取当前生成的简历标识
			String sql2 = "SELECT ITOFFER_JOB.CURRVAL FROM dual";
			pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				jobId = rs.getInt(1);
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
		
		return jobId;
	}

	/**
	 * 通过企业id添加职业信息
	 * @param company
	 * @param uid
	 * @return
	 */
	public void updateJobByJobId(Job job,int jid) {
		String sql = "UPDATE tb_job SET job_name=?, job_hiringnum=?, "
				+ "job_salary=?, job_area=?, "
				+ "job_age_requirements=?, job_education_requirements=?, "
				+ "job_sex_requirements=?, job_foreign_languages=?, "
				+ "job_desc=?, job_state=? WHERE job_id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, job.getJobName());
			pstmt.setInt(2, job.getJobHiringnum());
			pstmt.setString(3, job.getJobSalary());
			pstmt.setString(4, job.getJobArea());
			pstmt.setString(5, job.getJobAgeRequirements());
			pstmt.setString(6, job.getJobEducationRequirements());
			pstmt.setString(7, job.getJobSexRequirements());
			pstmt.setString(8, job.getJobForeignLanguages());
			pstmt.setString(9, job.getJobDesc());
			pstmt.setInt(10, job.getJobState());
			pstmt.setInt(11, jid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
	
	/**
	 * 根据企业编号查询此企业的所有招聘职位
	 * 
	 * @param companyID
	 * @return
	 */
	public List<Job> getJobListByCompanyID(int companyID) {
		List<Job> list = new ArrayList<Job>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM tb_job WHERE company_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,companyID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setJobId(rs.getInt("job_id"));
				job.setJobName(rs.getString("job_name"));
				job.setJobSalary(rs.getString("job_salary"));
				job.setJobHiringnum(rs.getInt("job_hiringnum"));
				job.setJobArea(rs.getString("job_area"));
				list.add(job);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return list;
	}

	/**
	 * 根据职位编号查询职位详细信息
	 * @param jobid
	 * @return
	 */
	public Job getJobByID(int jobid) {
		Job job = new Job();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT tb_job.*,company_name,company_pic FROM tb_job "
					+ "INNER JOIN tb_company on tb_job.company_id = tb_company.company_id "
					+ "WHERE job_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,jobid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				job.setJobId(rs.getInt("job_id"));
				job.setJobName(rs.getString("job_name"));
				job.setJobHiringnum(rs.getInt("job_hiringnum"));
				job.setJobSalary(rs.getString("job_salary"));
				job.setJobArea(rs.getString("job_area"));
				job.setJobDesc(rs.getString("job_desc"));
				job.setJobAgeRequirements(rs.getString("job_age_requirements"));
				job.setJobEducationRequirements(rs.getString("job_education_requirements"));
				job.setJobSexRequirements(rs.getString("job_sex_requirements"));
				job.setJobForeignLanguages(rs.getString("job_foreign_languages"));
				job.setJobState(rs.getInt("job_state"));
				job.setJobViewNumber(rs.getInt("job_viewnum_number"));
				job.setJobApplicantsNumber(rs.getInt("job_applicants_number"));
				job.setJobPassingNumber(rs.getInt("job_passing_number"));
				Company company = new Company();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyPic(rs.getString("company_pic"));
				company.setCompanyName(rs.getString("company_name"));
				job.setCompany(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return job;
	}
	
	/**
	 * 根据企业编号查询职位详细信息
	 * @param jobid
	 * @return
	 */
	public Job getJobByCompanyID(int cid) {
		Job job = new Job();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM tb_job WHERE company_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				job.setJobId(rs.getInt("job_id"));
				job.setJobName(rs.getString("job_name"));
				job.setJobHiringnum(rs.getInt("job_hiringnum"));
				job.setJobSalary(rs.getString("job_salary"));
				job.setJobArea(rs.getString("job_area"));
				job.setJobDesc(rs.getString("job_desc"));
				job.setJobAgeRequirements(rs.getString("job_age_requirements"));
				job.setJobEducationRequirements(rs.getString("job_education_requirements"));
				job.setJobSexRequirements(rs.getString("job_sex_requirements"));
				job.setJobForeignLanguages(rs.getString("job_foreign_languages"));
				job.setJobState(rs.getInt("job_state"));
				job.setJobViewNumber(rs.getInt("job_viewnum_number"));
				job.setJobApplicantsNumber(rs.getInt("job_applicants_number"));
				job.setJobPassingNumber(rs.getInt("job_passing_number"));
				Company company = new Company();
				company.setCompanyId(rs.getInt("company_id"));
				job.setCompany(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return job;
	}
	
	/**
	 * 根据用户编号查询职位详细信息
	 * @param jobid
	 * @return
	 */
	public Job getJobByUserID(int cid) {
		Job job = new Job();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT tb_job.*,company_name FROM tb_job "
					+ "INNER JOIN tb_company on tb_job.company_id = tb_company.company_id "
					+ "WHERE job_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				job.setJobId(rs.getInt("job_id"));
				job.setJobName(rs.getString("job_name"));
				job.setJobHiringnum(rs.getInt("job_hiringnum"));
				job.setJobSalary(rs.getString("job_salary"));
				job.setJobArea(rs.getString("job_area"));
				job.setJobDesc(rs.getString("job_desc"));
				job.setJobAgeRequirements(rs.getString("job_age_requirements"));
				job.setJobEducationRequirements(rs.getString("job_education_requirements"));
				job.setJobSexRequirements(rs.getString("job_sex_requirements"));
				job.setJobForeignLanguages(rs.getString("job_foreign_languages"));
				job.setJobState(rs.getInt("job_state"));
				job.setJobViewNumber(rs.getInt("job_viewnum_number"));
				job.setJobApplicantsNumber(rs.getInt("job_applicants_number"));
				job.setJobPassingNumber(rs.getInt("job_passing_number"));
				Company company = new Company();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyName(rs.getString("company_name"));
				job.setCompany(company);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return job;
	}
	
	/**
	 * 查询所需分页的总记录数（管理员）
	 * @return
	 */
	public int getRecordCountByManager() {
		int recordCount = 0;
		Connection conn = DBUtil.getConnection() ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT count(*) FROM tb_job";
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
	 * 查询所有职位信息(从pagebean中获取list)
	 * 
	 * @return
	 */
	public List<Job> getJobListByManager(int pageNo,int pageSize) {
		//定义本页记录索引值
		int firstIndex = pageSize * (pageNo-1);
		List<Job> list = new ArrayList<Job>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM (SELECT a.* , ROWNUM rn FROM ( "
							+ "SELECT tb_job.*,company_name FROM tb_job INNER JOIN tb_company on "
							+ "tb_job.company_id=tb_company.company_id) a WHERE ROWNUM<=? ) WHERE rn>? ");
			pstmt.setInt(1, firstIndex+pageSize);
			pstmt.setInt(2, firstIndex);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				//查询某个职位的申请人数
				pstmt2 = conn.prepareStatement("SELECT COUNT(*) FROM tb_jobapply WHERE job_id=?");
				pstmt2.setInt(1, job.getJobId());
				rs2 = pstmt2.executeQuery();
				if(rs2.next()){
					job.setJobApplicantsNumber(rs2.getInt(1));
				} else {
					job.setJobApplicantsNumber(0);
				}
				
				job.setJobId(rs.getInt("Job_id"));
				job.setJobName(rs.getString("Job_name"));
				job.setJobArea(rs.getString("Job_area"));
				job.setJobHiringnum(rs.getInt("job_hiringnum"));
				job.setJobState(rs.getInt("Job_state"));
				Company company=new Company();
				company.setCompanyId(rs.getInt("company_id"));
				company.setCompanyName(rs.getString("company_name"));
				job.setCompany(company);
				list.add(job);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
			DBUtil.closeJDBC(rs2, pstmt2, conn);
		}
		return list;
	}
	
	/**
	 * 职业信息删除（管理员）
	 * 
	 * @param jobId
	 */
	public void deleteByManager(int jobId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		//注册用户
		String sql = "DELETE FROM tb_job WHERE job_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, jobId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
	
	/**
	 * 职业信息修改（管理员）
	 * 
	 * @param email
	 * @param password
	 */
	public void updateByManager(Job job) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		//注册用户
		String sql = "UPDATE tb_job SET job_name=? ,job_hiringnum=? ,job_salary=? ,job_area=? ,job_age_requirements=? ,job_education_requirements=? ,job_sex_requirements=? ,job_foreign_languages=? ,job_desc=? ,job_state=? where job_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, job.getJobName());
			pstmt.setInt(2, job.getJobHiringnum());
			pstmt.setString(3, job.getJobSalary());
			pstmt.setString(4, job.getJobArea());
			pstmt.setString(5, job.getJobAgeRequirements());
			pstmt.setString(6, job.getJobEducationRequirements());
			pstmt.setString(7, job.getJobSexRequirements());
			pstmt.setString(8, job.getJobForeignLanguages());
			pstmt.setString(9, job.getJobDesc());
			pstmt.setInt(10, job.getJobState());
			pstmt.setInt(11, job.getJobId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	public List<Job> selectJobNameByCompany(int companyId) {
		// TODO Auto-generated method stub
		List<Job> list = new ArrayList<Job>();
		Connection conn = DBUtil.getConnection() ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String sql = "SELECT job_id, job_name FROM tb_job WHERE company_id=?";
			pstmt = conn. prepareStatement(sql) ;
			pstmt. setInt (1, companyId) ;
			rs = pstmt . executeQuery () ;
			while (rs.next ()) {
			Job job = new Job() ;
			job.setJobId(rs.getInt("job_ id"));
			job . setJobName (rs.getString("job_name"));
			list.add(job) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				DBUtil.closeJDBC(rs, pstmt, conn) ;
		}
		return list;
	}
	
	/**
	 * 更新企业的浏览次数
	 * 
	 * @param id
	 */
	public void updateJobViewCount(int id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "UPDATE tb_job SET job_viewnum_number=job_viewnum_number+1 WHERE job_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
	}
}
