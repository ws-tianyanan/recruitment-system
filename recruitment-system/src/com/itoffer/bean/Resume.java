package com.itoffer.bean;
import java.util.Date;

import com.itoffer.dao.ResumeDAO;

public class Resume {
	// 简历标识
	private int basicinfoId;
	// 用户id
	private int userId;
	// 姓名 
	private String realName;
	// 性别
	private String gender;
	// 出生日期
	private Date birthday;
	// 当前所在地
	private String currentLoca;
	// 户口所在地
	private String residentLoca;
	// 手机
	private String telephone;
	// 邮箱
	private String email;
	// 求职意向
	private String jobIntension;
	// 工作经验
	private String jobExperience;
	// 头像
	private String headShot;
	// 简历信息更新结果
	private String resumeUpdateResult;
//========================================================================
	//================教育经历================
	private String graduateSchool;
	//就读时间
	private Date studyStartTime;
	//学历
	private String education;
	//专业
	private String major;
	//================项目经验================
	//项目名称
	private String entryName;
	//参与开始时间
	private Date entryStartTime;
	//参与结束时间
	private Date entryStopTime;
	//担任职位
	private String assumeOffice;
	//================简历附件================
	//简历附件
	private String resumeEnclosure;
	//================简历完整度================
	//简历完整度
	private String completionOfResume;
	
	public Resume() {
		super();
	}

	public Resume(String realName, String gender, Date birthday,
			String currentLoca, String residentLoca, String telephone,
			String email, String jobIntension, String jobExperience) {
		super();
		this.realName = realName;
		this.gender = gender;
		this.birthday = birthday;
		this.currentLoca = currentLoca;
		this.residentLoca = residentLoca;
		this.telephone = telephone;
		this.email = email;
		this.jobIntension = jobIntension;
		this.jobExperience = jobExperience;
	}

	/**
	 * 全部参数
	 * @param basicinfoId
	 * @param userId
	 * @param realName
	 * @param gender
	 * @param birthday
	 * @param currentLoca
	 * @param residentLoca
	 * @param telephone
	 * @param email
	 * @param jobIntension
	 * @param jobExperience
	 * @param headShot
	 * @param resumeUpdateResult
	 * @param graduateSchool
	 * @param studyTime
	 * @param education
	 * @param major
	 * @param entryName
	 * @param entryStartTime
	 * @param entryStopTime
	 * @param assumeOffice
	 * @param resumeEnclosure
	 */
	public Resume(int basicinfoId, int userId, String realName, String gender, Date birthday,
			String currentLoca, String residentLoca, String telephone, String email, String jobIntension,
			String jobExperience, String headShot, String resumeUpdateResult, String graduateSchool,
			Date studyTime, String education, String major, String entryName, Date entryStartTime, Date entryStopTime,
			String assumeOffice, String resumeEnclosure,String completionOfResume) {
		super();
		this.basicinfoId = basicinfoId;
		this.userId = userId;
		this.realName = realName;
		this.gender = gender;
		this.birthday = birthday;
		this.currentLoca = currentLoca;
		this.residentLoca = residentLoca;
		this.telephone = telephone;
		this.email = email;
		this.jobIntension = jobIntension;
		this.jobExperience = jobExperience;
		this.headShot = headShot;
		this.resumeUpdateResult = resumeUpdateResult;
		this.birthday = birthday;
		this.graduateSchool = graduateSchool;
		this.studyStartTime = studyTime;
		this.education = education;
		this.major = major;
		this.entryName = entryName;
		this.entryStartTime = entryStartTime;
		this.entryStopTime = entryStopTime;
		this.assumeOffice = assumeOffice;
		this.resumeEnclosure = resumeEnclosure;
		this.completionOfResume = completionOfResume;
	}
	
	/**
	 * 封装简历信息
	 * @param userId
	 * @param realName
	 * @param gender
	 * @param birthday
	 * @param currentLoca
	 * @param residentLoca
	 * @param telephone
	 * @param email
	 * @param jobIntension
	 * @param jobExperience
	 * @param headShot
	 * @param graduateSchool
	 * @param studyStartTime
	 * @param education
	 * @param major
	 * @param entryName
	 * @param entryStartTime
	 * @param entryStopTime
	 * @param assumeOffice
	 * @param resumeEnclosure
	 */
	public Resume(int userId, String realName, String gender, Date birthday, String currentLoca, String residentLoca,
			String telephone, String email, String jobIntension, String jobExperience, String headShot,
			String graduateSchool, Date studyStartTime, String education, String major, String entryName,
			Date entryStartTime, Date entryStopTime, String assumeOffice, String resumeEnclosure) {
		super();
		this.userId = userId;
		this.realName = realName;
		this.gender = gender;
		this.birthday = birthday;
		this.currentLoca = currentLoca;
		this.residentLoca = residentLoca;
		this.telephone = telephone;
		this.email = email;
		this.jobIntension = jobIntension;
		this.jobExperience = jobExperience;
		this.headShot = headShot;
		this.graduateSchool = graduateSchool;
		this.studyStartTime = studyStartTime;
		this.education = education;
		this.major = major;
		this.entryName = entryName;
		this.entryStartTime = entryStartTime;
		this.entryStopTime = entryStopTime;
		this.assumeOffice = assumeOffice;
		this.resumeEnclosure = resumeEnclosure;
	}

	public void setResumeUpdate(Resume resumeBasicinfo){
		// 更新简历基本信息
		try{
			ResumeDAO dao = new ResumeDAO();
			dao.update(resumeBasicinfo);
		}catch(Exception e){
			resumeUpdateResult="更新失败！";
		}
		resumeUpdateResult="更新成功！";
	}
	
	public String getResumeUpdateResult(){
		return resumeUpdateResult;
	}
	
	public void setbirthday(Date birthday){
		this.birthday = birthday;
	}
	public Date getbirthday(){
		return birthday;
	}
	public int getBasicinfoId() {
		return basicinfoId;
	}
	public void setBasicinfoId(int basicinfoId) {
		this.basicinfoId = basicinfoId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getCurrentLoca() {
		return currentLoca;
	}
	public void setCurrentLoca(String currentLoca) {
		this.currentLoca = currentLoca;
	}
	public String getResidentLoca() {
		return residentLoca;
	}
	public void setResidentLoca(String residentLoca) {
		this.residentLoca = residentLoca;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJobIntension() {
		return jobIntension;
	}
	public void setJobIntension(String jobIntension) {
		this.jobIntension = jobIntension;
	}
	public String getJobExperience() {
		return jobExperience;
	}
	public void setJobExperience(String jobExperience) {
		this.jobExperience = jobExperience;
	}

	public String getHeadShot() {
		return headShot;
	}

	public void setHeadShot(String headShot) {
		this.headShot = headShot;
	}

	//================================================================
	public String getGraduateSchool() {
		return graduateSchool;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	public Date getStudyStartTime() {
		return studyStartTime;
	}

	public void setStudyStartTime(Date studyStartTime) {
		this.studyStartTime = studyStartTime;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getEntryName() {
		return entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	public Date getEntryStartTime() {
		return entryStartTime;
	}

	public void setEntryStartTime(Date entryStartTime) {
		this.entryStartTime = entryStartTime;
	}

	public Date getEntryStopTime() {
		return entryStopTime;
	}

	public void setEntryStopTime(Date entryStopTime) {
		this.entryStopTime = entryStopTime;
	}

	public String getAssumeOffice() {
		return assumeOffice;
	}

	public void setAssumeOffice(String assumeOffice) {
		this.assumeOffice = assumeOffice;
	}

	public String getResumeEnclosure() {
		return resumeEnclosure;
	}

	public void setResumeEnclosure(String resumeEnclosure) {
		this.resumeEnclosure = resumeEnclosure;
	}

	public void setResumeUpdateResult(String resumeUpdateResult) {
		this.resumeUpdateResult = resumeUpdateResult;
	}

	public String getCompletionOfResume() {
		return completionOfResume;
	}

	public void setCompletionOfResume(String completionOfResume) {
		this.completionOfResume = completionOfResume;
	}
}
