package com.vo;

import java.io.Serializable;

public class BaseVO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String fileBase64;
	
	
	

	public String getFileBase64() {
		return fileBase64;
	}

	public void setFileBase64(String fileBase64) {
		this.fileBase64 = fileBase64;
	}

	@Override
	public String toString() {
		return "BaseVO [fileBase64=" + fileBase64 + "]";
	}
	
}
