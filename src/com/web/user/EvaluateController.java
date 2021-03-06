package com.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vo.fp.CustomerVO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.ResponseVOStatusCode;
import com.vo.ResponseVO;

@Controller
@RequestMapping("evaluate")
public class EvaluateController extends BaseController{
	
	private Logger log = Logger.getLogger(EvaluateController.class);
	
	@ResponseBody
	@RequestMapping(value = "/update")
	public void updateEvaluateResult(CustomerVO customerVO, HttpServletRequest request,HttpServletResponse response) {

		ResponseVO responseVO=new ResponseVO();
		try {
			if (StringUtils.isEmpty(customerVO.getEvaluateResult())) {
				responseVO.setStatusCode(ResponseVOStatusCode.STATUS_ERROR);
				responseVO.setMsg("测评结果不正确");
				writeObject(responseVO, response);
				return ;
			}
			//TODO update
			responseVO.setStatusCode(ResponseVOStatusCode.STATUS_OK);;
		} catch (Exception e) {
			log.error("EvaluateController updateEvaluateResult failed customerVo ="+customerVO.toString(), e);
			responseVO.setStatusCode(ResponseVOStatusCode.STATUS_ERROR);
			writeObject(responseVO, response);
			return ;
		}
		writeObject(responseVO, response);
		return ;
	}
	
	@RequestMapping("getQuestionPage")
	public String getQuestionPage(HttpServletRequest request,HttpServletResponse response){
		return "evaluate/question";
	}

}
