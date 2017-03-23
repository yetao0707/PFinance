package com.web.base.fileUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.app.utils.PropsConfig;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.web.base.MD5;
import com.web.module.AbstractBaseController;
/*
@Author ZengWenLong
@Email zengwenlong@berchina.com
@Time 下午3:56:12
*/

public class HttpClientUtils extends AbstractBaseController {
	private static Logger logger = Logger.getLogger(HttpClientUtils.class);

	/**
	 * 根据请求地址和请求参数以及请求返回的数据类型来处理一个HTTP请求
	 * 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-10 下午5:32:21
	 * @param requestUrl
	 * @param params
	 * @param reaultType
	 * @return
	 */
	public static <T> T sendRequest1(String requestUrl, String params,
			Class<T> reaultType) {
		logger.info("参数：requestUrl = 【" + requestUrl + "】,params = 【" + params
				+ "】,reaultType = 【" + reaultType + "】");
		PrintWriter out = null;
		HttpURLConnection httpURLConnection = null;
		BufferedReader in = null;
		String sResult = "";
		try {
			URL url = new URL(requestUrl);
			httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			System.setProperty("sun.net.client.defaultConnectTimeout",
					String.valueOf(30000));
			System.setProperty("sun.net.client.defaultReadTimeout",
					String.valueOf(30000));
			httpURLConnection.setDoInput(true);
			httpURLConnection.setDoOutput(true);
			httpURLConnection.connect();
			out = new PrintWriter(httpURLConnection.getOutputStream());

			out.write(params);
			out.flush();
			in = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream()));
			String line = "";
			while ((line = in.readLine()) != null) {
				if (line.length() > 0) {
					sResult += line;
				}
			}
			if (sResult != null && sResult.length() > 0) {
				return new Gson().fromJson(sResult, reaultType);

				// Gson gson = new Gson();
				// return gson.fromJson(gson.toJson(sResult),new
				// TypeToken<Map>(){}.getType());
			}
		} catch (Exception e) {
			logger.error("HttpClientUtils.sendRequest()方法出现异常", e);
			e.printStackTrace();
		} finally {
			try {
				if (in!=null)
					in.close();
				if (out!=null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 根据参数调用solr,并将结果集封闭为指定的JAVABEAN
	 * 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-20 下午2:47:51
	 * @param requestUrl
	 * @param params
	 * @param reaultType
	 * @return
	 */
	public static <T> T sendRequest(String requestUrl, String params,
			TypeToken<T> t) {
		PrintWriter out = null;
		HttpURLConnection httpURLConnection = null;
		BufferedReader in = null;
		String sResult = "";
		try {
			URL url = new URL(requestUrl);
			httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			System.setProperty("sun.net.client.defaultConnectTimeout",
					getResValByKeyStatis("defaultconnecttimeout", null));
			System.setProperty("sun.net.client.defaultReadTimeout",
					getResValByKeyStatis("defaultreadtimeout", null));
			httpURLConnection.setDoInput(true);
			httpURLConnection.setDoOutput(true);
			httpURLConnection.connect();
			out = new PrintWriter(httpURLConnection.getOutputStream());
			out.write(params);
			logger.info("solr请求参数:" + params);
			out.flush();
			in = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream()));
			String line = "";
			while ((line = in.readLine()) != null) {
				if (line.length() > 0) {
					sResult += line;
				}
			}
			if (sResult != null && sResult.length() > 0) {
				return new Gson().fromJson(sResult, t.getType());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * @author ex_kjkfb_yanjf 模拟Http请求，将param封装到map中
	 * @param requestUrl
	 * @param paramsMap
	 * @param reaultType
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public static <T> T sendRequest(String requestUrl,
			Map<String, String> paramsMap, TypeToken<T> t) throws Exception {
		logger.info("HttpClientUtils.sendRequest,请求参数:requestUrl=" + requestUrl
				+ ",paramsMap=" + paramsMap + ",t" + t);
		PrintWriter out = null;
		HttpURLConnection httpURLConnection = null;
		BufferedReader in = null;
		String sResult = "";

		// 拼接url字符串
		StringBuffer urlParams = new StringBuffer();
		StringBuffer urlParams2 = new StringBuffer();
		String params = "";
		if (null != paramsMap && paramsMap.size() > 0) {
			Iterator<Entry<String, String>> it = paramsMap.entrySet()
					.iterator();
			while (it.hasNext()) {
				Entry entry = it.next();
				String key = (String) entry.getKey();
				String value = (String) entry.getValue();
				//
				if (StringUtils.isNotEmpty(key)
						&& StringUtils.isNotEmpty(value)) {
					// 排序字段 排序方式 当前页 每面显示个数使用orderfield=plan_rate & ordertype=1
					// & current=x & pagesize=x格式
					if (key.equals("orderfield") || key.equals("ordertype")
							|| key.equals("current") || key.equals("pagesize")) {
						urlParams2.append(key).append("=").append(value)
								.append("&");
					} else {
						// 另一种格式:params=goods_type:1-plan_rate:{a TO b}-time:{a
						// TO b}
						urlParams.append(key).append(":").append(value)
								.append("-");
					}
				}
			}
			if (urlParams.length() > 0) {
				params = "params="
						+ urlParams.substring(0, urlParams.length() - 1)
								.toString();
			}
			if (urlParams2.length() > 0) {
				params += (urlParams.length() > 0 ? "&" : "")
						+ urlParams2.substring(0, urlParams2.length() - 1)
								.toString();
			}
			if (params.indexOf("__") != -1) {
				params = params.replace("__", ":");
			}
		}
		try {
			URL url = new URL(requestUrl);
			httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			httpURLConnection
					.setReadTimeout(Integer.parseInt(getResValByKeyStatis(
							"defaultreadtimeout", null)));
			httpURLConnection.setConnectTimeout(Integer
					.parseInt(getResValByKeyStatis("defaultconnecttimeout",
							null)));
			httpURLConnection.setDoInput(true);
			httpURLConnection.setDoOutput(true);

			httpURLConnection.connect();
			out = new PrintWriter(httpURLConnection.getOutputStream());
			out.write(params);
			logger.info("solr请求参数:" + params);
			out.flush();
			in = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream()));
			String line = "";
			while ((line = in.readLine()) != null) {
				if (line.length() > 0) {
					sResult += line;
				}
			}
			if (sResult != null && sResult.length() > 0) {
				logger.info("solr请求结果:" + sResult);
				return new Gson().fromJson(sResult, t.getType());
			}
		} catch (Exception e) {
			logger.error("HttpClientUtils.sendRequest,请求异常", e);
			throw e;
		} finally {
			try {
				if (in!=null) {
					in.close();
				}
				if (out!=null) {
					out.close();
				}
			} catch (IOException e) {
				logger.error("HttpClientUtils.sendRequest" + params, e);
			}
		}
		return null;
	}

	/**
	 * 上传加密
	 * 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-14 下午7:04:36
	 * @param module
	 * @param userid
	 * @return
	 * @throws Exception 
	 */
	public static String doSign(String module, String userid, String web_domain) throws Exception {
		String callback = web_domain.concat(PropsConfig
				.getPropValue("call_back_url"));
		return MD5.getMD5(PropsConfig.getPropValue("key") + "|" + module + "|"
				+ callback + "|" + userid);
	}
	
	public static String doSign(String module,String userid) throws Exception{
		String callback=PropsConfig.getPropValue("web_domain").concat(PropsConfig.getPropValue("call_back_url"));
		return MD5.getMD5(PropsConfig.getPropValue("key")+"|"+module+"|"+callback+"|"+userid);
	}
	
	/**
	 * 根据请求地址和请求参数以及请求返回的数据类型来处理一个HTTP请求
	 * 
	 * @author chenchao 991722899@qq.com
	 * @date 2014-3-10 下午5:32:21
	 * @param requestUrl
	 * @param params
	 * @param reaultType
	 * @return
	 */
	public static <T> T sendRequest(String requestUrl, String params,
			Class<T> reaultType) {
		PrintWriter out = null;
		HttpURLConnection httpURLConnection = null;
		BufferedReader in = null;
		String sResult = "";
		try {
			URL url = new URL(requestUrl);
			httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			System.setProperty("sun.net.client.defaultConnectTimeout",
					String.valueOf(30000));
			System.setProperty("sun.net.client.defaultReadTimeout",
					String.valueOf(30000));
			httpURLConnection.setDoInput(true);
			httpURLConnection.setDoOutput(true);
			httpURLConnection.connect();
			out = new PrintWriter(httpURLConnection.getOutputStream());

			out.write(params);
			out.flush();
			in = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream()));
			String line = "";
			while ((line = in.readLine()) != null) {
				if (line.length() > 0) {
					sResult += line;
				}
			}
			if (sResult != null && sResult.length() > 0) {
				return new Gson().fromJson(sResult, reaultType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

//	/**
//	 * 图片移动参数初始化
//	 * 
//	 * @author chenchao 991722899@qq.com
//	 * @date 2014-3-10 下午5:36:43
//	 * @param imgs
//	 * @param userid
//	 * @return
//	 */
//	public static ResultVo movePicInfo(final String[] imgs, final String userid) {
//		String simg = "";
//		String thumb = "";
//
//		for (String img : imgs) {
//			if (img != null) {
//				if (StringUtils.contains(img, "?")) {
//					img = StringUtils.substringBefore(img, "?");
//				}
//				simg += "&imgs="
//						+ PropsConfig.getPropValue("image_temp_director")
//								.concat(img);
//				thumb += PropsConfig.getPropValue("image_temp_director")
//						.concat(img) + "|";
//			}
//		}
//		String sign = MD5.getMD5(thumb + PropsConfig.getPropValue("key") + "|"
//				+ userid);
//		String parmas = "userid=" + userid + "&sign=" + sign + simg;
//
//		// 获取内网图片服务器URL
//		String pic_server_domain = PropsConfig.getPropValue("pic_move_url");
//		ResultVo resultVo = null;
//		if (pic_server_domain.indexOf("https") == -1) {
//			resultVo = sendRequest(PropsConfig.getPropValue("pic_move_url"),
//					parmas, ResultVo.class);
//			if ((Utils.isNotEmpty(resultVo) && !resultVo.getCode().equals("0"))
//					|| Utils.isEmpty(resultVo)) {// 如果第一天失败则执行第二台
//				// 移动接口,第二台服务器地址;无论是否成功都返回
//				resultVo = sendRequest(
//						PropsConfig.getPropValue("pic_move_url2"), parmas,
//						ResultVo.class);
//			}
//		} else {
//			String result = HttpClientUtil.sendRequest(
//					PropsConfig.getPropValue("pic_move_url"),
//					parmas.getBytes(), false);
//			resultVo = new Gson().fromJson(result, new TypeToken<ResultVo>() {
//			}.getType());
//			if ((Utils.isNotEmpty(resultVo) && !resultVo.getCode().equals("0"))
//					|| Utils.isEmpty(resultVo)) {// 如果第一天失败则执行第二台
//				// 移动接口,第二台服务器地址;无论是否成功都返回
//				result = HttpClientUtil.sendRequest(
//						PropsConfig.getPropValue("pic_move_url2"),
//						parmas.getBytes(), false);
//				resultVo = new Gson().fromJson(result,
//						new TypeToken<ResultVo>() {
//						}.getType());
//			}
//		}
//		return resultVo;
//	}

}
