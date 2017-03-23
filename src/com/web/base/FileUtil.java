package com.web.base;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.net.URLConnection;

import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;





public class FileUtil {
	
	private static Logger log = Logger.getLogger(FileUtil.class);  
	
	public static void main(String[] args) {
		try {
			System.out.println(getWebContentPath());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void saveFile(String Url, String FileName){
		try {
			int mun = Url.indexOf('/',8);
			int extnum = Url.lastIndexOf(".");
			String u = Url.substring(0, mun);
			String ext = Url.substring(extnum + 1, Url.length());
			long time = System.currentTimeMillis();
			String path ="C://" + FileName;
			URL url = new URL(Url);
			URLConnection conection = url.openConnection();
			conection.setDoOutput(true);
			conection.setRequestProperty("referer", u);
			//Buffer
			FileOutputStream fout = new FileOutputStream(path + time);
			//ImageIO.w
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
	}
	
	/**
	 * 获取项目webconte路径
	 * @author chenchao 991722899@qq.com
	 * @date 2014-12-15 上午10:13:21
	 */
	public static String getWebContentPath() throws Exception{
		String webContentPath = FileUtil.class.getResource("").getPath();
		log.info("项目路径："+webContentPath);
		return webContentPath.substring(0,webContentPath.indexOf("WEB-INF"));
	}
	
	/**
	 * 获取项目webconte路径
	 * @author chenchao 991722899@qq.com
	 * @date 2014-12-15 上午10:13:21
	 */
	public static String getClassPath() throws Exception{
		String webContentPath = FileUtil.class.getResource("").getPath();
		log.info("项目路径："+webContentPath);
//		return webContentPath.substring(0,webContentPath.indexOf("WEB-INF")).concat("WEB-INF").concat(File.separator).concat("classes").concat(File.separator);
		return webContentPath.substring(0,webContentPath.indexOf("WEB-INF")).concat("WEB-INF").concat(File.separator).concat("classes").concat(File.separator);
	}
	
	/**
	 * 移动文件
	 * @author chenchao 991722899@qq.com
	 * @date 2014-12-22 上午10:41:19
	 * @param filePath
	 * @param newFilePath
	 * @return
	 */
	public static boolean moveFile(String filePath,String newFilePath) throws Exception{
		BufferedInputStream in=null;
		BufferedOutputStream out=null;
		File file=new File(filePath);
		if(file.exists()){
			in = new  BufferedInputStream(new FileInputStream(file));
			out = new BufferedOutputStream(new FileOutputStream(new File(newFilePath)));
			Streams.copy(in, out, true);
			return true;
		}
		return false;
	}

}
