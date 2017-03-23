package com.web.base.fileUtil;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.net.URLEncoder;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.log4j.Logger;

import sun.misc.BASE64Encoder;

import com.app.utils.PropsConfig;


/*
@Author ZengWenLong
@Email zengwenlong@berchina.com
@Time 下午3:56:12
*/
/**
 * httpclient 工具类
 * @author lubang713
 * @date 2014-8-1
 */
public class HttpClientUtil {
	
	private static Logger logger = Logger.getLogger(HttpClientUtil.class);
	private static final String ibmJavaVmVendor = "IBM Corporation";
	private static int iProviderType = 0; // 0-Sun,1-IBM
	
	private static int getVendorType() {
		Properties tSysProperties = System.getProperties();
		String tJvmVendor = tSysProperties.getProperty("java.vm.vendor");

		if (tJvmVendor.equals(ibmJavaVmVendor)) {
			iProviderType = 1;
		} else {
			iProviderType = 0;
		}

		logger.info("common_info" + "Current Jvm Vendor Type is :["+ iProviderType + "][" + tJvmVendor + "]");
		
		return iProviderType;
	}
	
	
    private static HostnameVerifier ignoreHostnameVerifier = new HostnameVerifier() {
        public boolean verify(String s, SSLSession sslsession) {
        	logger.info("WARNING: Hostname is not matched for cert.");
            return true;
        }
    };

     /**
     * Ignore Certification
     */
    private static TrustManager ignoreCertificationTrustManger = new X509TrustManager() {

         private X509Certificate[] certificates;
 
        @Override
        public void checkClientTrusted(X509Certificate certificates[],
                String authType) throws CertificateException {
            if (this.certificates == null) {
                this.certificates = certificates;
                logger.info("init at checkClientTrusted");
            }
        }

        @Override
        public void checkServerTrusted(X509Certificate[] ax509certificate,
                String s) throws CertificateException {
            if (this.certificates == null) {
                this.certificates = ax509certificate;
                logger.info("init at checkServerTrusted");
            } 
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
     };
     
     public static String sendRequest(String targetUrl, Map<String, Object> params, boolean isProxy) {
    	 StringBuilder sb = new StringBuilder();
    	 try{
    	 for(Entry<String,Object> entry : params.entrySet()){
    		 sb.append(entry.getKey().toString()+"="+URLEncoder.encode(entry.getValue().toString(),"UTF-8")+"&");
		 }
    	 }catch(Exception e){
    		 logger.error(e);
    	 }
    	 return sendRequest(targetUrl,sb.toString().getBytes(),isProxy);
     }
     
     
    public static String sendRequest(String urlString,byte[] sendData,boolean isProxy) {
    	getVendorType();
    	SSLContext sslContext;
    	
         ByteArrayOutputStream buffer = new ByteArrayOutputStream(512);
        try {
             URL url = new URL(urlString);
            HttpsURLConnection.setDefaultHostnameVerifier(ignoreHostnameVerifier);
            HttpURLConnection connection ;
//            HttpURLConnection connection = (HttpsURLConnection) url.openConnection();

            boolean ishttps = urlString.startsWith("https");
    		
            if (isProxy) {
            	
            	connection = (HttpURLConnection) url.openConnection(new Proxy(Proxy.Type.HTTP, new InetSocketAddress(PropsConfig.getPropValue("txt_proxy_ip","127.0.0.1"),PropsConfig.getPropValue("txt_proxy_port",8080))));
    		} else {
    			connection = (HttpURLConnection) url.openConnection();
    		}
            
            if(ishttps){
            	 TrustManager[] tm = {ignoreCertificationTrustManger};
            	//Prepare SSL Context
            	 //SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
            	 
            	
				if (iProviderType == 1) {
					sslContext = SSLContext.getInstance("TLS", "IBMJSSE2");
				} else {
					sslContext = SSLContext.getInstance("TLS", "SunJSSE");
				}
            
                 sslContext.init(null, tm, new java.security.SecureRandom());
                 // 从上述SSLContext对象中得到SSLSocketFactory对象
                 SSLSocketFactory ssf = sslContext.getSocketFactory();
                 ((HttpsURLConnection)connection).setSSLSocketFactory(ssf);
            }
            
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setAllowUserInteraction(false);
            connection.setUseCaches(false);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Connection", "close");
            connection.setRequestProperty("User-Agent","sdb client");
            connection.setRequestProperty("Content-Length", String.valueOf(sendData.length));
            
            connection.setConnectTimeout(PropsConfig.getPropValue("txt_connection_timeout", 3000));
            connection.setReadTimeout(PropsConfig.getPropValue("txt_read_timeout", 10000));
            
            
            OutputStream out = connection.getOutputStream();

            logger.info("request url:"+urlString);
            logger.info("request data:"+new String(sendData));

            
    		out.write(sendData);
    		out.flush();
    		
            InputStream reader = connection.getInputStream();
            int code = connection.getResponseCode();
    		if (code != 200) {
    			throw new Exception("请求"+urlString+"服务异常");
    		}
    		
            byte[] bytes = new byte[512];
            int length = reader.read(bytes);

            do {
                buffer.write(bytes, 0, length);
                length = reader.read(bytes);
            } while (length > 0);

            logger.info("response data:"+buffer.toString());
            reader.close();
            out.close();
            
            connection.disconnect();
            
        } catch (Exception ex) {
        	logger.error(ex);
        } finally {
        }
        String repString= new String (buffer.toByteArray());
        return repString;
    }


//    public static void main(String[] args) throws UnsupportedEncodingException {
//        String urlString = "http://localhost:8080/fileServer_mvc/fileServer/fileServerDown.xhtml";
//        
//        Map<String,Object> map = new HashMap<String,Object>();
//        map.put("id", "111");
//        map.put("accountNo", "kkkkkkk");
//        
//        String output = new String(HttpClientUtil.sendRequest(urlString,map,true));
//    }
    
    public static void main(String[] args) throws UnsupportedEncodingException {
        String urlString = "http://localhost:8080/fileServer_mvc/fileServer/fileServerDown.xhtml";
		byte[] data = null;
		InputStream in=null;
		try {
			in = new FileInputStream("F:/test/李强-简历.doc");
			
			data = new byte[in.available()];
			
			in.read(data);	
			in.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BASE64Encoder encoder = new BASE64Encoder();
		String base64String = encoder.encode(data);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id", "111");
        map.put("accountNo", "kkkkkkk");
        map.put("fileBase64", base64String);
        
        String output = new String(HttpClientUtil.sendRequest(urlString,map,true));
    }
}


