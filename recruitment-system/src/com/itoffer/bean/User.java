package com.itoffer.bean;

import java.util.Date;

/**
 * 用户实体类
 * 
 * @author TianYanan
 *
 */
public class User {
	// 用户标识
	private int userId;
	// 用户邮箱
	private String userEmail;
	// 用户密码
	private String userPwd;
	// 用户登录名
	private String userLogname;
	// 用户真实姓名
	private String userRealname;
	// 用户角色：1--普通用户，2--企业用户，3--猎头用户，4--系统管理员
	private int userRole;
	// 用户状态：1--启用，2--禁用
	private int userState;
	
	private Resume resume;
	// 用户注册时间
	private Date userRegistDate;

	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	//管理员用户
	public User(String userEmail, String userPwd) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
	}
	
	//用户登录
	public User(int userId, String userEmail, String userPwd,int userRole ) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userRole = userRole;
	}
	
	//注册时使用
	public User(String userEmail, String userPwd, int userRole) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userRole = userRole;
	}

	//求职者注册
	public User(int userId, String userEmail, String userPwd, int userRole, int userState, Date userRegistDate) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userRole = userRole;
		this.userState = userState;
		this.userRegistDate = userRegistDate;
	}
	
	//管理员添加用户
	public User(String userEmail, String userPwd, String userLogname, String userRealname, int userRole,
			int userState) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userLogname = userLogname;
		this.userRealname = userRealname;
		this.userRole = userRole;
		this.userState = userState;
	}
	
	//管理员登录
	public User(int userId, String userEmail, String userPwd, String userLogname, int userRole, int userState,
			Date userRegistDate) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userLogname = userLogname;
		this.userRole = userRole;
		this.userState = userState;
		this.userRegistDate = userRegistDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	

	public String getUserLogname() {
		return userLogname;
	}

	public void setUserLogname(String userLogname) {
		this.userLogname = userLogname;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public int getUserRole() {
		return userRole;
	}

	public void setUserRole(int userRole) {
		this.userRole = userRole;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

	public Date getUserRegistDate() {
		return userRegistDate;
	}

	public void setUserRegistDate(Date userRegistDate) {
		this.userRegistDate = userRegistDate;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}
}
