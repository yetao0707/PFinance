package com.web.module.demo;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.module.AbstractBaseController;

@Controller
@RequestMapping("demo")
public class DemoController extends AbstractBaseController {

	Logger log = Logger.getLogger(DemoController.class);
	@RequestMapping("/go_test")
	public String go_test(){
		return "index";
	}
}
