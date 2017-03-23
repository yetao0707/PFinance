package com.web.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("index")
public class IndexController  {

	Logger log = Logger.getLogger(IndexController.class);
	@RequestMapping("/main")
	public String go_test(){
		return "admin/main";
	}
	
	@RequestMapping(value = "/getUsersHomePage")
	
	public String getUsersHomePage( HttpServletRequest request) {

		return "admin/show";
	}
}
