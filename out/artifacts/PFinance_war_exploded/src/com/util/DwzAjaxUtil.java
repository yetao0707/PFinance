package com.util;



import com.util.bean.DwzAjaxBean;


/**
 * <P>
 * FileName: DwzAjaxUtil.java
 * 
 * @author peiyy
 *         <P>
 *         CreateTime: 2012-09-20
 *         <P>
 *         Description: 放置与Ajax有关的工具方法
 *         <P>
 *         Version:v1.0
 *         <P>
 *         History:
 */
public class DwzAjaxUtil {

	public static final String DWZ_STATUS_CODE_OK = "200";

	public static final String DWZ_AUTH_CODE_ERROR = "210";
	
	public static final String DWZ_NAME_PWD_ERROR = "220";

	public static final String DWZ_STATUS_CODE_WARN = "260";

	public static final String DWZ_STATUS_CODE_ERROR = "300";

	public static final String DWZ_STATUS_CODE_TIMEOUT = "301";

	public static final String DWZ_CALLBACK_TYPE_CLOSE_CURRENT = "closeCurrent";

	public static final String DWZ_CALLBACK_TYPE_CLOSE_ALL = "closeAll";

	public static final String DWZ_DEFAULT_NAV_TAB_ID = "main";

	public static final String DWZ_DEFAULT_REL_CONTAINER = "mainContainer";

	public static final String DWZ_PRO_OUT_REL_CONTAINER = "productOutList";

	public static final String DWZ_PRO_PRICE_REL_CONTAINER = "productPriceList";
	
	public static final String DWZ_EMPLOYEE_LIST_REL_CONTAINER = "employeeList";

	/**
	 * 默认的构造方法
	 */
	private DwzAjaxUtil() {
	}

	public static DwzAjaxBean constructDelFailBean(String navTabId){
		DwzAjaxBean dwzAjaxBean=new DwzAjaxBean();
		dwzAjaxBean.setStatusCode(DWZ_STATUS_CODE_ERROR);
		dwzAjaxBean.setMessage("删除失败!");
		dwzAjaxBean.setNavTabId(navTabId);
		dwzAjaxBean.setCallbackType("");
		dwzAjaxBean.setRel("");
		dwzAjaxBean.setForwardUrl("");
		return dwzAjaxBean;
	}

	public static DwzAjaxBean constructDelSuccessBean(String navTabId){
		DwzAjaxBean dwzAjaxBean=new DwzAjaxBean();
		dwzAjaxBean.setStatusCode(DWZ_STATUS_CODE_OK);
		dwzAjaxBean.setMessage("删除成功!");
		dwzAjaxBean.setNavTabId(navTabId);
		dwzAjaxBean.setCallbackType("");
		dwzAjaxBean.setRel("");
		dwzAjaxBean.setForwardUrl("");
		return dwzAjaxBean;
	}
	public static DwzAjaxBean constructUpdateSuccessBean(String navTabId){
		DwzAjaxBean dwzAjaxBean=new DwzAjaxBean();
		dwzAjaxBean.setStatusCode(DWZ_STATUS_CODE_OK);
		dwzAjaxBean.setMessage("修改成功!");
		dwzAjaxBean.setNavTabId(navTabId);
		dwzAjaxBean.setCallbackType("closeCurrent");
		dwzAjaxBean.setRel("");
		dwzAjaxBean.setForwardUrl("");
		return dwzAjaxBean;
	}
	public static DwzAjaxBean constructAddSuccessBean(String navTabId){
		DwzAjaxBean dwzAjaxBean=new DwzAjaxBean();
		dwzAjaxBean.setStatusCode(DWZ_STATUS_CODE_OK);
		dwzAjaxBean.setMessage("添加成功!");
		dwzAjaxBean.setNavTabId(navTabId);
		dwzAjaxBean.setCallbackType("closeCurrent");
		dwzAjaxBean.setRel("");
		dwzAjaxBean.setForwardUrl("");
		return dwzAjaxBean;
	}

	public static DwzAjaxBean constructEditFailBean(String navTabId){
		DwzAjaxBean dwzAjaxBean=new DwzAjaxBean();
		dwzAjaxBean.setStatusCode(DWZ_STATUS_CODE_ERROR);
		dwzAjaxBean.setMessage("编辑失败!");
		dwzAjaxBean.setNavTabId(navTabId);
		dwzAjaxBean.setCallbackType("closeCurrent");
		dwzAjaxBean.setRel("");
		dwzAjaxBean.setForwardUrl("");
		return dwzAjaxBean;
	}
}
