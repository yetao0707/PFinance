package com.web.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.app.utils.PropsConfig;





/**
 * 处理所有servlet请求
 * 对需要登陆的请求进行安全拦截，做相应的处理,以及部分公共数据的处理
 */
public class ControllerInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LogManager.getLogger(ControllerInterceptor.class);

	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		logger.info("preHandle-----");
		//全局变量设置到请求作用域中
		setContextVariable(request,response);
		return true;
	}
	
	public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
		logger.info("postHandle-----");
    }

    /**
     * 在Controller方法后进行拦截
     */
    public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    	logger.info("afterCompletion-----");
    }
    /**
     * 设置上下文全局变量
     * @param request
     * @throws Exception 
     */
    private void setContextVariable(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
    	//域名
    	request.setAttribute("base_url",PropsConfig.getPropValue("base_url"));
    }
}
