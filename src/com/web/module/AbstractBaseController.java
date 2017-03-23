package com.web.module;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.app.utils.PropsConfig;
import com.google.gson.Gson;




public abstract class AbstractBaseController{
	
	private static Logger logger = Logger.getLogger(AbstractBaseController.class);
	
	public Gson gson=new Gson();
	/**
	 * 根据指定的KEY从配置文件中获取对应的值
	 * 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-20 下午3:29:26
	 * @param key
	 * @param obj
	 * @return
	 * @throws Exception 
	 */
	public String getResValByKey(String key, Object[] obj) throws Exception {
		if (key!=null) {
			return PropsConfig.getPropValue(key);
		} else {
			logger.info("BaseController.getResValByKey KEY值为空:" + key + " " + obj);
			return null;
		}
	}

	/**
	 * 根据指定的KEY从配置文件中获取对应的值 提供静态方法调用
	 * 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-20 下午4:07:41
	 * @param key
	 * @param obj
	 * @return
	 * @throws Exception 
	 */
	public static String getResValByKeyStatis(String key, Object[] obj) throws Exception {
		if (key!=null) {
			return PropsConfig.getPropValue(key);
		} else {
			logger.info("BaseController.getResValByKey KEY值为空:" + key + " "+ obj);
			return null;
		}
	}

   /**
    * 输出json数据
    * wangb
    * @param response
    * @param map
    */
	public void writeJson(HttpServletResponse response,Object map) {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter pw=null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
		}
		pw.write(gson.toJson(map));
		pw.close();
	}
}
