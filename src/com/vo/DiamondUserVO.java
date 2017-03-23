package com.vo;

import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;



/**
 * Diamonduser entity. @author MyEclipse Persistence Tools
 */

public class DiamondUserVO extends BaseVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	@Field
	private Long id;
	@Field("accountno")
	private String accountNo;
	@Field("password")
	private String password;
	private String name;
	private String tel;
	private String email;
	private String company;
	private String companyAddress;
	private Long managerId;


	private ManagerVO manager;
	private Date ttime;
	private String content;
	
	
	

	// Constructorssdfkkkkkkkkkkk

	@Override
	public String toString() {
		return "DiamondUserVO [id=" + id + ", accountNo=" + accountNo
				+ ", password=" + password + ", name=" + name + ", tel=" + tel
				+ ", email=" + email + ", company=" + company
				+ ", companyAddress=" + companyAddress + ", managerId="
				+ managerId + ", manager=" + manager + ", ttime=" + ttime
				+ ", content=" + content + "]";
	}
	
	
	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTtime() {
		return ttime;
	}

	public void setTtime(Date ttime) {
		this.ttime = ttime;
	}

	public ManagerVO getManager() {
		return manager;
	}

	public void setManager(ManagerVO manager) {
		this.manager = manager;
	}

	/** default constructor */
	public DiamondUserVO() {
	}

	/** full constructor */
	public DiamondUserVO(String accountNo, String password, String name,
			String tel, String email, String company, String companyAddress,
			ManagerVO manager) {
		this.accountNo = accountNo;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.company = company;
		this.companyAddress = companyAddress;
		this.manager = manager;
	}

	// Property accessors



	public String getAccountNo() {
		return this.accountNo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return this.tel;
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

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompanyAddress() {
		return this.companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}



}