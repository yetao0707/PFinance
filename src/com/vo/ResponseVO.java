package com.vo;


public class ResponseVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9053787153294699094L;

	public ResponseVO(){
		
	}

	public ResponseVO(String statusCode, String msg) {
		this.statusCode = statusCode;
		this.msg = msg;
	}

	/**
	 * 正常：200
	 * 错误：300
	 */
	private String statusCode;
	
	private String msg;

	/**
	 * @return the statusCode
	 */
	public String getStatusCode() {
		return statusCode;
	}

	/**
	 * @param statusCode the statusCode to set
	 */
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
