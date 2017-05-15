package com.web.user;

import com.DTO.CurrencyDTO;
import com.DTO.CustomerAccountDTO;
import com.DTO.CustomerDTO;
import com.DTO.FundDTO;
import com.dao.*;
import com.util.ParseBeanUtil;
import com.util.ResponseBOUtil;
import com.util.bean.ResponseBO;
import com.vo.fp.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("user")
public class PurchaseController extends BaseController{
    private Logger logger = Logger.getLogger(PurchaseController.class);

    @Autowired
    private CurrencyDAO currencyDAO;

    @Autowired
    private FundDAO fundDAO;

    @Autowired
    private CustomerAccountDAO customerAccountDAO;

    @Autowired
    private CurrencyPurchaseDAO currencyPurchaseDAO;

    @Autowired
    private FundPurchaseDAO fundPurchaseDAO;

    @RequestMapping("customerRead")
    public String customerRead(HttpServletRequest request) {
        return "user/product/customerRead";
    }

    @RequestMapping("protocolRead")
    public String protocolRead(HttpServletRequest request) {
        return "user/product/protocol";
    }

    @RequestMapping("purchaseConfirm")
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
            double m=Double.parseDouble(strs[2]);
            money += m;
            if (type == 1) {
                CurrencyVO vo=new CurrencyVO();
                vo.setId(productId);
                vo = currencyDAO.findByPK(vo);
                CurrencyDTO currencyDTO=ParseBeanUtil.parseCurrencyVO2DTO(vo);
                currencyDTO.setRecommendMoney2Buy(m);
                currencyDTOS.add(currencyDTO);
            } else {
                FundVO vo=new FundVO();
                vo.setId(productId);
                vo = fundDAO.findByPK(vo);
                FundDTO fundDTO=ParseBeanUtil.parseFundVO2DTO(vo);
                fundDTO.setRecommendMoney2Buy(m);
                fundDTOs.add(fundDTO);
            }
        }

        request.setAttribute("currencyDTOS",currencyDTOS);
        request.setAttribute("fundDTOs",fundDTOs);
        request.setAttribute("money",money);

        return "user/product/purchaseConfirm";
    }

    @RequestMapping("singlePurchase")
    public String singlePurchase(HttpServletRequest request, String paramStr) {
        String[] strs = paramStr.split("_");
        Long productId = Long.parseLong(strs[0]);
        int type = Integer.parseInt(strs[1]);
        if (type == 1) {
            CurrencyVO vo=new CurrencyVO();
            vo.setId(productId);
            vo = currencyDAO.findByPK(vo);
            request.setAttribute("dto",ParseBeanUtil.parseCurrencyVO2DTO(vo));;
            request.setAttribute("type",1);
        } else {
            FundVO vo=new FundVO();
            vo.setId(productId);
            vo = fundDAO.findByPK(vo);
            request.setAttribute("dto",ParseBeanUtil.parseFundVO2DTO(vo));;
            request.setAttribute("type",2);

        }
        return "user/product/singlePurchase";
    }

    /**
     *
     * @param request
     * @param paramStr productId_type_money,productId_type_money
     * @return
     */
    @RequestMapping("purchase")
    @ResponseBody
    public void purchase(HttpServletRequest request, String paramStr, HttpServletResponse response) {
        ResponseBO responseBO = new ResponseBO();
        CustomerDTO customerDTO = getCustomerDTO(request);
        CustomerAccountVO customerAccountVO=new CustomerAccountVO();
        customerAccountVO.setCustomerId(customerDTO.getId());
        customerAccountVO = customerAccountDAO.find(customerAccountVO);
        CustomerAccountDTO accountDTO = ParseBeanUtil.parseCustomerAccountVO2DTO(customerAccountVO);
        boolean isOk=valid(customerAccountVO, paramStr);
        if (!isOk) {
            responseBO = ResponseBOUtil.buildResponseBO(ResponseBOUtil.ERROR, "余额不足");
            writeObject(responseBO,response);
            return ;
        }
        String[] params = paramStr.split(",");
        for (int i=0;i<params.length;i++) {
            String[] strs = params[i].split("_");
            int productId = Integer.parseInt(strs[0]);
            int type = Integer.parseInt(strs[1]);
            double money = Double.parseDouble(strs[2]);
            if (type == 1) {
                purchaseCurrency(customerDTO, accountDTO, productId, money);
            } else {
                purchaseFund(customerDTO, accountDTO, productId, money);

            }
        }
        responseBO = ResponseBOUtil.buildResponseBO(ResponseBOUtil.SUCCESS, "购买成功");
        writeObject(responseBO,response);
    }

    private void purchaseFund(CustomerDTO customerDTO, CustomerAccountDTO accountDTO, int productId, double money) {
        FundVO fundVO = new FundVO();
        fundVO.setId((long) productId);
        fundVO = fundDAO.findByPK(fundVO);
        accountDTO.setExtraMoney(accountDTO.getExtraMoney() - money);
        CustomerAccountVO accountVO = ParseBeanUtil.parseCustomerAccountDTO2VO(accountDTO);
        customerAccountDAO.update(accountVO);
        FundPurchaseVO purchaseVO = new FundPurchaseVO();
        purchaseVO.setCustomerId(customerDTO.getId());
        purchaseVO.setFundId((long) productId);
        purchaseVO.setNum(money/fundVO.getAccumulatedValue());
        purchaseVO.setPurchaseDate(new Date());
        fundPurchaseDAO.insert(purchaseVO);
    }

    private void purchaseCurrency(CustomerDTO customerDTO, CustomerAccountDTO accountDTO, int productId, double money) {
        accountDTO.setExtraMoney(accountDTO.getExtraMoney() - money);
        CustomerAccountVO accountVO = ParseBeanUtil.parseCustomerAccountDTO2VO(accountDTO);
        customerAccountDAO.update(accountVO);
        CurrencyPurchaseVO purchaseVO = new CurrencyPurchaseVO();
        purchaseVO.setCustomerId(customerDTO.getId());
        purchaseVO.setCurrencyId((long) productId);
        purchaseVO.setNum(money);
        purchaseVO.setPurchaseDate(new Date());
        currencyPurchaseDAO.insert(purchaseVO);
    }

    private boolean valid(CustomerAccountVO customerAccountVO, String paramStr) {
        double money=0;
        String[] params = paramStr.split(",");
        for (int i=0;i<params.length;i++) {
            String[] strs = params[i].split("_");
            money += Double.parseDouble(strs[2]);
        }
        if (money < customerAccountVO.getExtraMoney()) {
            return true;
        }
        return false;
    }
}
