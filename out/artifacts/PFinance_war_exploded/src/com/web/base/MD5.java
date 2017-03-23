package com.web.base;


import java.security.MessageDigest;
/*
@Author ZengWenLong
@Email zengwenlong@berchina.com
@Time 下午3:56:12
*/

import org.apache.log4j.Logger;

/**
 * 
 * MD5算法  
 * @author LiuSQ
 *
 */
public class MD5 {
	private static final Logger log = Logger.getLogger(MD5.class);
	public final static String getMD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] strTemp = s.getBytes();
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			
			mdTemp.update(strTemp);
			
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			return null;
		}
	}
	public static void main(String[] args) {
		log.info(MD5.getMD5("BER"));
		//System.out.println(MD5.getMD5("BER"));
	}

}
