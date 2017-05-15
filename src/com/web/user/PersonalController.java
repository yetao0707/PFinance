package com.web.user;

import com.DTO.CustomerAccountDTO;
import com.DTO.CustomerDTO;
import com.DTO.PurchaseDTO;
import com.dao.*;
import com.service.impl.PurchaseService;
import com.util.ParseBeanUtil;
import com.vo.fp.CustomerAccountVO;
import com.vo.fp.CustomerVO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yetao on 17/4/29.
 */
@Controller
@RequestMapping("user")
public class PersonalController extends BaseController{

    private Logger log = Logger.getLogger(PersonalController.class);

    @Autowired
    private CustomerDAO customerDAO;


    @Autowired
    private CustomerAccountDAO customerAccountDAO;

    @Autowired
    private PurchaseService purchaseService;

    @RequestMapping("personIndex")
    public String personIndex(HttpServletRequest request) {
        return "user/person/personIndex";
    }

    @RequestMapping("personalInfo")
    public String personalnalInfo(HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
        customerVO = customerDAO.find(customerVO);
        customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);

        CustomerAccountVO customerAccountVO = new CustomerAccountVO();
        customerAccountVO.setCustomerId(customerDTO.getId());
        customerAccountVO = customerAccountDAO.find(customerAccountVO);
        CustomerAccountDTO customerAccountDTO = ParseBeanUtil.parseCustomerAccountVO2DTO(customerAccountVO);

        PurchaseDTO purchaseDTO = purchaseService.getPurchaseDTO(customerDTO.getId());

        request.setAttribute("customerDTO",customerDTO);
        request.setAttribute("purchaseDTO",purchaseDTO);
        request.setAttribute("customerAccountDTO",customerAccountDTO);

        return "user/person/personInfo";
    }

    @RequestMapping("personalResult")
    public String personalResult(HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        if (StringUtils.isEmpty(customerDTO.getEvaluateResult())) {
            return "user/person/questionS";
        } else {
            CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
            customerVO = customerDAO.find(customerVO);
            customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);
            request.setAttribute("dto", customerDTO);
            return "user/person/financeReportS";
        }
    }

    @RequestMapping("personalProduct")
    public String personalProduce(HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
        customerVO = customerDAO.find(customerVO);
        customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);

        CustomerAccountVO customerAccountVO = new CustomerAccountVO();
        customerAccountVO.setCustomerId(customerDTO.getId());
        customerAccountVO = customerAccountDAO.find(customerAccountVO);
        CustomerAccountDTO customerAccountDTO = ParseBeanUtil.parseCustomerAccountVO2DTO(customerAccountVO);

        PurchaseDTO purchaseDTO = purchaseService.getPurchaseDTO(customerDTO.getId());

//        request.setAttribute("customerDTO",customerDTO);
        request.setAttribute("purchaseDTO",purchaseDTO);
        request.setAttribute("customerAccountDTO",customerAccountDTO);

        return "user/person/myPFinanceS";
    }
}
