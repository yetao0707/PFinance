package com.vo;

public class CustomerVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8548123221252789710L;
	
	private int id;
	
	private String userName;
	
	private String password;
	
	private String sex;
	
	private int age;
	
	private String phoneNum;
	
	private String email;
	
	private String IDNum;
	
	private String evaluateResult;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @return the phoneNum
	 */
	public String getPhoneNum() {
		return phoneNum;
	}

	/**
	 * @param phoneNum the phoneNum to set
	 */
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the iDNum
	 */
	public String getIDNum() {
		return IDNum;
	}

	/**
	 * @param iDNum the iDNum to set
	 */
	public void setIDNum(String iDNum) {
		IDNum = iDNum;
	}

	/**
	 * @return the evaluateResult
	 */
	public String getEvaluateResult() {
		return evaluateResult;
	}

	/**
	 * @param evaluateResult the evaluateResult to set
	 */
	public void setEvaluateResult(String evaluateResult) {
		this.evaluateResult = evaluateResult;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CustomerVO [id=" + id + ", userName=" + userName
				+ ", password=" + password + ", sex=" + sex + ", age=" + age
				+ ", phoneNum=" + phoneNum + ", email=" + email + ", IDNum="
				+ IDNum + ", evaluateResult=" + evaluateResult + "]";
	}
	
	

}
