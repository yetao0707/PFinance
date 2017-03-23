package com.web.base;

import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.google.gson.reflect.TypeToken;
import com.vo.RedisCacheVo;
import com.web.module.CommonService;


@Service
public class RedisCacheService extends CommonService {
	private static final Logger log = Logger.getLogger(RedisCacheService.class);
	private final static String pwdKey = "0123456789abcdef";
	private static final String ValidateCodeKey = "ValidateCodeKey";
	/**
	 * 设置缓存
	 * @param cacheVo
	 * @return
	 */
	public boolean setCache(RedisCacheVo cacheVo) {
		RedisCacheVo redisCacheVo = null;
		try {
//			redisCacheVo = findObjectByParams(CommonMapping.SET_CACHE, GsonUtils.toJson(cacheVo), new TypeToken<RedisCacheVo>(){});
		
			return redisCacheVo.getValue()!=null;
		} catch (Exception e) {
			log.error("RedisCacheService.setCache,"+cacheVo,e);
		}
		return false;
	}
	
	public RedisCacheVo getCache(RedisCacheVo cacheVo) {
		RedisCacheVo redisCacheVo = null;
		try {
		
//			redisCacheVo = findObjectByParams(CommonMapping.GET_CACHE, GsonUtils.toJson(cacheVo), new TypeToken<RedisCacheVo>(){});

		} catch (Exception e) {
			log.error("RedisCacheService.setCache,"+cacheVo,e);
		}
		return redisCacheVo;
	}

//	/**
//	 * 设置验证码到缓存
//	 * 
//	 * @param value
//	 */
//	public void setValidateCode(String value) {
//		BuyerSession buyer = UserThreadLocal.getBuyerSession();
//		try {
//			String key = ValidateCodeKey + "_" + buyer.getTrackId();
//			RedisCacheVo cacheVo = new RedisCacheVo(key, value, 120);
//			setCache(cacheVo);
//		} catch (Exception e) {
//			log.error("setValidateCode Exception,trackId=" + buyer.getTrackId(),e);
//		}
//	}
	
//	public void setValidateCode(String key,String value) {
//		BuyerSession buyer = UserThreadLocal.getBuyerSession();
//		try {
//			RedisCacheVo cacheVo = new RedisCacheVo(key, value, 120);
//			setCache(cacheVo);
//		} catch (Exception e) {
//			log.error("setValidateCode Exception,trackId=" + buyer.getTrackId(),e);
//		}
//	}
	public void setValidateCode(String key,String value,int time) {
		try {
			RedisCacheVo cacheVo = new RedisCacheVo(key, value, time);
			setCache(cacheVo);
		} catch (Exception e) {
			
		}
	}
//	public void setValidateCode(String key,String value,int time,boolean isDecode) {
//		try {
//			if(isDecode)
//			 {
//				 EncryptUtil encryptUtil = new EncryptUtil();
//				 try {
//					value = encryptUtil.desedeDecoder(value,pwdKey);
//				} catch (Exception e) {
//				}
//			 }
//			RedisCacheVo cacheVo = new RedisCacheVo(key, value, time);
//			setCache(cacheVo);
//		} catch (Exception e) {
//		}
//	}
//	/**
//	 * 从缓存里取出验证码
//	 * @return
//	 */
//	public String getValidateCode(){
//		BuyerSession buyer = UserThreadLocal.getBuyerSession();
//		try{
//			String key = ValidateCodeKey+"_"+buyer.getTrackId();
//			RedisCacheVo cacheVo = new RedisCacheVo();
//			cacheVo.setKey(key);
//			
//			RedisCacheVo resultVo = getCache(cacheVo);
//			if(resultVo!=null && resultVo.getValue()!=null){
//				return resultVo.getValue().toString();
//			}
//		}catch(Exception e){
//			log.error("getValidateCode Exception,trackId=" + buyer.getTrackId(),e);
//		}
//		
//		return null;
//	}
	
//	public String getValidateCode(String key){
//		BuyerSession buyer = UserThreadLocal.getBuyerSession();
//		try{
//			RedisCacheVo cacheVo = new RedisCacheVo();
//			cacheVo.setKey(key);
//			
//			RedisCacheVo resultVo = getCache(cacheVo);
//			if(resultVo!=null && resultVo.getValue()!=null){
//				return resultVo.getValue().toString();
//			}
//		}catch(Exception e){
//			log.error("getValidateCode Exception,trackId=" + buyer.getTrackId(),e);
//		}
//		
//		return null;
//	}
	
//	public String getValidateCode(String key,boolean isDecode){
//		BuyerSession buyer = UserThreadLocal.getBuyerSession();
//		try{
//			String redusValue="" ;
//			RedisCacheVo cacheVo = new RedisCacheVo();
//			cacheVo.setKey(key);
//			
//			RedisCacheVo resultVo = getCache(cacheVo);
//			if(resultVo!=null && resultVo.getValue()!=null){
//				redusValue = resultVo.getValue().toString() ;
//				if(isDecode)
//				{
//					 EncryptUtil encryptUtil = new EncryptUtil();
//					 redusValue = encryptUtil.desedeDecoder(redusValue,pwdKey);
//				}
//				return redusValue;
//			}
//		}catch(Exception e){
//			log.error("getValidateCode Exception,trackId=" + buyer.getTrackId(),e);
//		}
//		
//		return null;
//	}
	
	public static void main(String[] args){
		RedisCacheVo cacheVo = new RedisCacheVo();
		RedisCacheService cacheService = new RedisCacheService();
		cacheVo.setKey("checkCode_"+1000);
		cacheVo.setValue("100000000");
		
		//System.out.println(">>>>>>>>>>>--"+cacheVo);
		//cacheService.setCache(cacheVo);
		
		//RedisCacheVo cacheVo_= cacheService.getCache(cacheVo);
		//System.out.println(">>>>>>>>>>>"+cacheVo_);
		
		
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid);
	}
}
