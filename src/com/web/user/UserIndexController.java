package com.web.user;

import com.DTO.CustomerAccountDTO;
import com.DTO.CustomerDTO;
import com.DTO.NewsDTO;
import com.DTO.PurchaseDTO;
import com.DTO.page.IndexPageDTO;
import com.constants.ResponseVOStatusCode;
import com.dao.CustomerAccountDAO;
import com.dao.CustomerDAO;
import com.dao.NewsDAO;
import com.service.impl.PurchaseService;
import com.util.ParseBeanUtil;
import com.vo.ResponseVO;
import com.vo.fp.CustomerAccountVO;
import com.vo.fp.CustomerVO;
import com.vo.fp.NewsVO;
import com.web.admin.IndexController;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserIndexController extends BaseController {

    private Logger log = Logger.getLogger(UserIndexController.class);

    @Autowired
    private CustomerDAO customerDAO;

    @Autowired
    private NewsDAO newsDAO;

    @Resource
    private PurchaseService purchaseService;

    @Autowired
    private CustomerAccountDAO customerAccountDAO;

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        List<NewsVO> list = newsDAO.findList(new NewsVO());
        List<NewsDTO> newsDTOs = null;
        newsDTOs = ParseBeanUtil.parseNewsVO2DTO(list);
        PurchaseDTO purchaseDTO = null;
        if (customerDTO != null) {
            purchaseDTO = purchaseService.getPurchaseDTO(customerDTO.getId());
        }
        request.setAttribute("customerDTO", customerDTO);
        request.setAttribute("newsDTOS", newsDTOs);
        request.setAttribute("purchaseDTO", purchaseDTO);
        return "user/home";
    }

    @RequestMapping("indexPage")
    public String indexPage(HttpServletRequest request) {
        return "user/index";
    }

    @RequestMapping("test")
    public String test(HttpServletRequest request) {
        return "user/home";
    }

    private IndexPageDTO buildIndexPageDto(List<NewsDTO> newsDTOs, CustomerDTO customerDTO) {
        IndexPageDTO dto = new IndexPageDTO();
        dto.setNewsDTOs(newsDTOs);
        dto.setCustomerDTO(customerDTO);
        return dto;
    }

    @RequestMapping("personalResult4Home")
    public String personalResult(HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
        customerVO = customerDAO.find(customerVO);
        customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);
        request.setAttribute("dto", customerDTO);
        return "user/financeReport";
    }

    @RequestMapping("personalProduct4Home")
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

        return "user/myPFinance";
    }


}
