package com.util.bean;

import com.vo.BaseVO;


public class DwzAjaxBean extends BaseVO{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 状态代码 @see com.ap.constansts.DWZStatusCode
	 */
	private String statusCode;
	/**
	 * 返回信息
	 */
	private String message;
	/**
    * 
    */
	private String navTabId;
	/**
    * 
    */
	private String rel;
	/**
    * 
    */
	private String callbackType;
	/**
    * 
    */
	private String forwardUrl;
	
	/**
	 * 用来回传对象
	 */
	private Object obj;

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
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the navTabId
	 */
	public String getNavTabId() {
		return navTabId;
	}

	/**
	 * @param navTabId the navTabId to set
	 */
	public void setNavTabId(String navTabId) {
		this.navTabId = navTabId;
	}

	/**
	 * @return the rel
	 */
	public String getRel() {
		return rel;
	}

	/**
	 * @param rel the rel to set
	 */
	public void setRel(String rel) {
		this.rel = rel;
	}

	/**
	 * @return the callbackType
	 */
	public String getCallbackType() {
		return callbackType;
	}

	/**
	 * @param callbackType the callbackType to set
	 */
	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}

	/**
	 * @return the forwardUrl
	 */
	public String getForwardUrl() {
		return forwardUrl;
	}

	/**
	 * @param forwardUrl the forwardUrl to set
	 */
	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}

	/**
	 * @return the obj
	 */
	public Object getObj() {
		return obj;
	}

	/**
	 * @param obj the obj to set
	 */
	public void setObj(Object obj) {
		this.obj = obj;
	}


	
}
