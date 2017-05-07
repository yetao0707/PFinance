package com.web.user;

import com.DTO.CustomerDTO;
import com.dao.CustomerDAO;
import com.google.gson.Gson;
import com.util.ParseBeanUtil;
import com.util.ResponseBOUtil;
import com.util.bean.ResponseBO;
import com.vo.fp.CustomerVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("user")
public class UserLoginController extends BaseController {

    private Logger logger = Logger.getLogger(UserLoginController.class);

    @Autowired
    private CustomerDAO customerDAO;

    @RequestMapping("loginIndex")
    public String loginIndex(HttpServletRequest request) {
        return "user/userLogin";
    }

    @RequestMapping("login")
    @ResponseBody
    public void login(HttpServletRequest request, HttpServletResponse response, CustomerDTO customerDTO) {
        ResponseBO responseBO = new ResponseBO();
        try {
            CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
            customerVO = customerDAO.find(customerVO);
            if (customerVO != null) {
                customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);
                refreshCustoerDTO(request, customerDTO);
                responseBO = ResponseBOUtil.buildLoginSuccess();
            } else {
                responseBO = ResponseBOUtil.buildLoginError("登录失败 请重新登录");
            }
        } catch (Exception e) {
            logger.error("login failed customerDto=" + customerDTO, e);
            responseBO = ResponseBOUtil.buildLoginError("未知错误");
        }
        writeObject(responseBO, response);
    }
}
