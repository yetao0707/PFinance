package com.web.user;

import com.DTO.CurrencyDTO;
import com.DTO.CustomerDTO;
import com.DTO.FundDTO;
import com.DTO.RecommendResultDTO;
import com.dao.CurrencyDAO;
import com.dao.CustomerDAO;
import com.dao.FundDAO;
import com.request.RecommendRequest;
import com.service.impl.RecommendService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.vo.fp.CurrencyVO;
import com.vo.fp.CustomerVO;
import com.vo.fp.FundVO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yetao on 17/4/28.
 */
@Controller
@RequestMapping("user")
public class PFinanceController extends BaseController{

    private Logger log = Logger.getLogger(PFinanceController.class);

    @Autowired
    private CustomerDAO customerDAO;
    @Autowired
    private RecommendService recommendService;

    @Autowired
    private CurrencyDAO currencyDAO;

    @Autowired
    private FundDAO fundDAO;


    @RequestMapping("pFinanceCustomerRead")
    public String customerRead(HttpServletRequest request) {
        return "user/pFinance/customerRead";
    }

    @RequestMapping("pFinanceProtocolRead")
    public String protocolRead(HttpServletRequest request) {
        return "user/pFinance/protocol";
    }

    @RequestMapping("pFinancePurchaseConfirm")
    public String purchaseConfirm(HttpServletRequest request, String paramStr) {
        request.setAttribute("customerDTO",getCustomerDTO(request));
        double money=0;
        List<CurrencyDTO> currencyDTOS = new ArrayList<CurrencyDTO>();
        List<FundDTO> fundDTOs = new ArrayList<FundDTO>();
        String[] params = paramStr.split(",");
        for (int i=0;i<params.length;i++) {
            String[] strs = params[i].split("_");
            Long productId = Long.parseLong(strs[0]);
            int type = Integer.parseInt(strs[1]);
            money += Double.parseDouble(strs[2]);
            if (type == 1) {
                CurrencyVO vo=new CurrencyVO();
                vo.setId(productId);
                vo = currencyDAO.findByPK(vo);
                currencyDTOS.add(ParseBeanUtil.parseCurrencyVO2DTO(vo));
            } else {
                FundVO vo=new FundVO();
                vo.setId(productId);
                vo = fundDAO.findByPK(vo);
                fundDTOs.add(ParseBeanUtil.parseFundVO2DTO(vo));
            }
        }

        request.setAttribute("currencyDTOS",currencyDTOS);
        request.setAttribute("fundDTOs",fundDTOs);
        request.setAttribute("money",money);

        return "user/pFinance/purchaseConfirm";
    }

    @RequestMapping("pFinanceIndex")
    public String pFinanceIndex(HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        if (StringUtils.isEmpty(customerDTO.getEvaluateResult())) {
            return "user/pFinance/question";
        } else {
            CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
            customerVO = customerDAO.find(customerVO);
            customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);
            request.setAttribute("dto", customerDTO);
            return "user/pFinance/financeReport";
        }
    }

    @RequestMapping("questionIndex")
    public String questionIndex(HttpServletRequest httpServletRequest) {
        return "evaluate/question";
    }

    @RequestMapping("saveEvaluateResult")
    @ResponseBody
    public Object saveEvaluateResult(String evaluateResult, HttpServletRequest request) {
        CustomerDTO customerDTO = getCustomerDTO(request);
        customerDTO.setEvaluateResult(evaluateResult);
        CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
        try {
            customerDAO.update(customerVO);
        } catch (Exception e) {
            log.error("customerDao update result failed customerVo=" + customerVO, e);
            return DwzAjaxUtil.constructEditFailBean();
        }
        refreshCustoerDTO(request,customerDTO);
        return DwzAjaxUtil.constructUpdateSuccessBean();
    }

    @RequestMapping("getPersonalFinance")
    public String getPersonalFinance(Double money, HttpServletRequest request) {
        if (money == null || money <= 0) {
            request.setAttribute("recommendDTO", buildDefaultRecommendDTO());
            return "user/pFinance/recommendPurchase";
        }
        CustomerDTO customerDTO = (CustomerDTO) request.getSession().getAttribute("customer");
        RecommendRequest recommendRequest = buildREcommendRequest(customerDTO, money);
        RecommendResultDTO dto = null;
        try {
            dto = recommendService.getRecommendResult(recommendRequest);
        } catch (ParseException e) {
            log.error("parse failed ", e);
        }
        request.setAttribute("recommendDTO", dto);
        return "user/pFinance/recommendPurchase";
    }

    private RecommendResultDTO buildDefaultRecommendDTO() {
        RecommendResultDTO dto=new RecommendResultDTO();
        dto.setRecommendCurrencys(new ArrayList<CurrencyDTO>());
        dto.setRecommendFunds(new ArrayList<FundDTO>());
        return dto;
    }

    @RequestMapping("getPersonalResult")
    public String getPersonalResult(Double money, HttpServletRequest request) {
        CustomerDTO customerDTO = (CustomerDTO) request.getSession().getAttribute("customer");
        CustomerVO customerVO = ParseBeanUtil.parseCustomerDTO2VO(customerDTO);
        customerVO = customerDAO.find(customerVO);
        customerDTO = ParseBeanUtil.parseCustomerVO2DTO(customerVO);
        request.setAttribute("dto", customerDTO);
        return "user/financeReport";
    }

    private RecommendRequest buildREcommendRequest(CustomerDTO customerDTO, double money) {
        if (customerDTO == null) {
            return null;
        }
        RecommendRequest request = new RecommendRequest();
        request.setCustomerId(customerDTO.getId());
        request.setMoney(money);
        return request;
    }
}