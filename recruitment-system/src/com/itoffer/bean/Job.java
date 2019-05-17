package com.itoffer.bean;

/**
 * 职位信息实体类
 * 
 * @author TianYanan
 *
 */
public class Job {
	// 职位编号
	private int jobId;
	// 所属企业
	private Company company;
//====职位描述===============================================
	// 职位名称
	private String jobName;
	// 招聘人数
	private int jobHiringnum;
	// 职位薪资
	private String jobSalary;
	// 工作地区
	private String jobArea;
//====任职要求===============================================
	private String jobAgeRequirements;
	private String jobEducationRequirements;
	private String jobSexRequirements;
	private String jobForeignLanguages;
//====岗位职责===============================================
	private String jobDesc;
//====其他===============================================	
	// 招聘状态:1招聘中 2已暂停 3已结束
	private int jobState;
	//浏览数
	private int jobViewNumber;
	//申请数
	private int jobApplicantsNumber;
	//通过人数
	private int jobPassingNumber;

	public Job() {
		super();
	}

	public Job(int jobId, Company company, String jobName, int jobHiringnum,
			String jobSalary, String jobArea, String jobDesc, int jobState) {
		super();
		this.jobId = jobId;
		this.company = company;
		this.jobName = jobName;
		this.jobHiringnum = jobHiringnum;
		this.jobSalary = jobSalary;
		this.jobArea = jobArea;
		this.jobDesc = jobDesc;
		this.jobState = jobState;
	}
	
	//企业用户添加职位
	public Job(Company company, String jobName, int jobHiringnum, String jobSalary, String jobArea,
			String jobAgeRequirements, String jobEducationRequirements, String jobSexRequirements,
			String jobForeignLanguages, String jobDesc, int jobState) {
		super();
		this.company = company;
		this.jobName = jobName;
		this.jobHiringnum = jobHiringnum;
		this.jobSalary = jobSalary;
		this.jobArea = jobArea;
		this.jobAgeRequirements = jobAgeRequirements;
		this.jobEducationRequirements = jobEducationRequirements;
		this.jobSexRequirements = jobSexRequirements;
		this.jobForeignLanguages = jobForeignLanguages;
		this.jobDesc = jobDesc;
		this.jobState = jobState;
	}

	//职业信息修改（管理员）
	public Job(int jobId, Company company, String jobName, int jobHiringnum, String jobSalary, String jobArea,
			String jobAgeRequirements, String jobEducationRequirements, String jobSexRequirements,
			String jobForeignLanguages, String jobDesc, int jobState) {
		super();
		this.jobId = jobId;
		this.company = company;
		this.jobName = jobName;
		this.jobHiringnum = jobHiringnum;
		this.jobSalary = jobSalary;
		this.jobArea = jobArea;
		this.jobAgeRequirements = jobAgeRequirements;
		this.jobEducationRequirements = jobEducationRequirements;
		this.jobSexRequirements = jobSexRequirements;
		this.jobForeignLanguages = jobForeignLanguages;
		this.jobDesc = jobDesc;
		this.jobState = jobState;
	}

	//全部
	public Job(int jobId, Company company, String jobName, int jobHiringnum, String jobSalary, String jobArea,
			String jobAgeRequirements, String jobEducationRequirements, String jobSexRequirements,
			String jobForeignLanguages, String jobDesc, int jobState, int jobViewNumber, int jobApplicantsNumber,
			int jobPassingNumber) {
		super();
		this.jobId = jobId;
		this.company = company;
		this.jobName = jobName;
		this.jobHiringnum = jobHiringnum;
		this.jobSalary = jobSalary;
		this.jobArea = jobArea;
		this.jobAgeRequirements = jobAgeRequirements;
		this.jobEducationRequirements = jobEducationRequirements;
		this.jobSexRequirements = jobSexRequirements;
		this.jobForeignLanguages = jobForeignLanguages;
		this.jobDesc = jobDesc;
		this.jobState = jobState;
		this.jobViewNumber = jobViewNumber;
		this.jobApplicantsNumber = jobApplicantsNumber;
		this.jobPassingNumber = jobPassingNumber;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public int getJobHiringnum() {
		return jobHiringnum;
	}

	public void setJobHiringnum(int jobHiringnum) {
		this.jobHiringnum = jobHiringnum;
	}

	public String getJobSalary() {
		return jobSalary;
	}

	public void setJobSalary(String jobSalary) {
		this.jobSalary = jobSalary;
	}

	public String getJobArea() {
		return jobArea;
	}

	public void setJobArea(String jobArea) {
		this.jobArea = jobArea;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public int getJobState() {
		return jobState;
	}

	public void setJobState(int jobState) {
		this.jobState = jobState;
	}

	public String getJobAgeRequirements() {
		return jobAgeRequirements;
	}

	public void setJobAgeRequirements(String jobAgeRequirements) {
		this.jobAgeRequirements = jobAgeRequirements;
	}

	public String getJobEducationRequirements() {
		return jobEducationRequirements;
	}

	public void setJobEducationRequirements(String jobEducationRequirements) {
		this.jobEducationRequirements = jobEducationRequirements;
	}

	public String getJobSexRequirements() {
		return jobSexRequirements;
	}

	public void setJobSexRequirements(String jobSexRequirements) {
		this.jobSexRequirements = jobSexRequirements;
	}

	public String getJobForeignLanguages() {
		return jobForeignLanguages;
	}

	public void setJobForeignLanguages(String jobForeignLanguages) {
		this.jobForeignLanguages = jobForeignLanguages;
	}

	public int getJobViewNumber() {
		return jobViewNumber;
	}

	public void setJobViewNumber(int jobViewNumber) {
		this.jobViewNumber = jobViewNumber;
	}

	public int getJobApplicantsNumber() {
		return jobApplicantsNumber;
	}

	public void setJobApplicantsNumber(int jobApplicantsNumber) {
		this.jobApplicantsNumber = jobApplicantsNumber;
	}

	public int getJobPassingNumber() {
		return jobPassingNumber;
	}

	public void setJobPassingNumber(int jobPassingNumber) {
		this.jobPassingNumber = jobPassingNumber;
	}

}
