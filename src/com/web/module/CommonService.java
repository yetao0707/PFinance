package com.web.module;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;


/**
 * 公共业务对象
 * @author chenchao 991722899@qq.com
 * @date 2014-3-4 下午3:27:49
 */
@Service
public class CommonService {
	
	private static Logger logger = Logger.getLogger(CommonService.class);
	
/*	*//**
	 * 根据参数查询一个指定LIST合集信息 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-4 下午3:29:31
	 * @param id
	 * @param c
	 * @return
	 * @throws Exception 
	 *//*
	public <T> List<T> findListByParams(String methodName,String paramsJson,TypeToken<List<T>> t) throws Exception{
		List<T> list=null;
		String resultData=sendRequestMessage(methodName, paramsJson);
		if(StringUtils.isNotEmpty(resultData)){
			list=Utils.gson.fromJson(resultData,t.getType());
		}else{
			logger.info("方法名:"+methodName+",参数:"+paramsJson+",请求结果为空");
		}
		return list;
	}*/
	
//	/**
//	 * 更新操作 增加 删除 修改 返回一个指定LIST集合
//	 * @author chenchao 991722899@qq.com
//	 * @date 2014-3-25 下午5:08:07
//	 * @param methodName
//	 * @param paramsJson
//	 * @param t
//	 * @return
//	 * @throws Exception 
//	 */
//	public <T> List<T> updateResultList(String methodName,String paramsJson,TypeToken<List<T>> t) throws Exception{
//		return findListByParams(methodName, paramsJson, t);
//	}
	
/*	*//**
	 * 更新操作 增加 删除 修改 返回指定对象
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-25 下午5:08:36
	 * @param methodName
	 * @param paramsJson
	 * @param t
	 * @return
	 * @throws Exception 
	 *//*
	public <T> T updateResultObj(String methodName,String paramsJson,TypeToken<T> t) throws Exception{
		return findObjectByParams(methodName, paramsJson, t);
	}*/
	
	
/*	*//**
	 * 根据参数查询一个对象
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-6 下午6:16:28
	 * @param methodName
	 * @param paramsJson
	 * @param t
	 * @return
	 *//*
	public <T> T findObjectByParams(String methodName,String paramsJson,TypeToken<T> t)throws Exception{
		T obj=null;
		String resultData=sendRequestMessage(methodName, paramsJson);
		if(StringUtils.isNotEmpty(resultData)){
			obj=Utils.gson.fromJson(resultData,t.getType());
		}else{
			logger.info("方法名:"+methodName+",参数:"+paramsJson+",请求结果为空");
		}
		return obj;
	}*/
	
/*	*//**
	 * 根据请求参数查询，返回原数据
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-28 下午4:56:54
	 * @param methodName
	 * @param paramsJson
	 * @return
	 *//*
	public Object findObjectByParams(String methodName,String paramsJson)throws Exception{
		String resultData=sendRequestMessage(methodName, paramsJson);
		if(resultData!=null){
			return resultData;
		}else{
			logger.info("方法名:"+methodName+",参数:"+paramsJson+",请求结果为空");
		}
		return null;
	}*/
	
	
/*	 *//**
	 * 公共的MINA请求
	 * @author chenchao 991722899@qq.com
	 * @date 2014-4-9 上午10:33:21
	 * @param methodName 方法名
	 * @param paramsJson 参数
	 * @return
	 * @throws Exception 
	 *//*
	public static String sendRequestMessage(String methodName,String paramsJson) throws Exception{
		 	MinaClientManager manager = MinaClientManager.getInstance();
	    	RequestMessage requestMessage=new RequestMessage(methodName,paramsJson);
	    	ResponseMessage responseMessage=manager.getMessage(requestMessage);
	    	if(Constants.SUCCESS_CODE.equals(responseMessage.getCode())){
	    		return responseMessage.getData();
	    	}else{
	    		logger.error("方法名:"+methodName+",参数:"+paramsJson+",出现异常"+ "异常码：" + responseMessage.getCode() + "异常消息: 【" + responseMessage.getDesc()+"】");	    		
	    		throw new Exception(responseMessage.getDesc(),responseMessage.getCode());
	    	}
	    	
    }*/
}
