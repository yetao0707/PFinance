package com.vo;

/**
 * Manager entity. @author MyEclipse Persistence Tools
 */

public class ManagerVO implements java.io.Serializable {

	// Fields

	private Integer id;
	private String accountNo;
	private String password;
	private String tel;
	private String email;
	private String qq;
	private String linkAddress;
	private Integer power;

	// Constructors

	/** default constructor */
	public ManagerVO() {
	}

	/** minimal constructor */
	public ManagerVO(Integer power) {
		this.power = power;
	}

	/** full constructor */
	public ManagerVO(String accountNo,String password, String tel, String email, String qq,
			String linkAddress, Integer power) {
		this.accountNo = accountNo;
		this.password = password;
		this.tel = tel;
		this.email = email;
		this.qq = qq;
		this.linkAddress = linkAddress;
		this.power = power;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getTel() {
		return this.tel;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getLinkAddress() {
		return this.linkAddress;
	}

	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}

	public Integer getPower() {
		return this.power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

}