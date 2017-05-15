package com.web.statistics;

import com.DTO.CurrencyPurchaseDTO;
import com.DTO.PurchaseSumDTO;
import com.constants.FundTypeEnum;
import com.dao.CurrencyDAO;
import com.dao.CurrencyPurchaseDAO;
import com.dao.FundDAO;
import com.dao.FundPurchaseDAO;
import com.util.ParseBeanUtil;
import com.vo.fp.CurrencyPurchaseVO;
import com.vo.fp.FundPurchaseVO;
import com.vo.fp.FundVO;
import com.web.admin.BaseController;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by yetao on 17/3/28.
 */
@Controller
@RequestMapping("purchaseStatistic")
public class PurchaseStatisticsController extends BaseController{

    private static Logger logger = Logger.getLogger(PurchaseStatisticsController.class);

    @Autowired
    private CurrencyDAO currencyDAO;

    @Autowired
    private CurrencyPurchaseDAO currencyPurchaseDAO;

    @Autowired
    private FundDAO fundDAO;

    @Autowired
    private FundPurchaseDAO fundPurchaseDAO;

//    @RequestMapping("purchaseSum")
//    public String purchaseStatistic(HttpServletRequest request) {
//        return "statistics/purchaseSum";
//    }

    @RequestMapping("userSum")
    public String userStatistic(HttpServletRequest request) {
        return "statistics/userStatistic";
    }

    @RequestMapping("productSum")
    public String productSum(HttpServletRequest request) {
        return "statistics/productStatistic";
    }

    @RequestMapping("purchaseSumIndex")
    public String productSumIndex(HttpServletRequest request) {
        return "statistics/purchaseSum";
    }
    @RequestMapping("purchaseSum")
    @ResponseBody
    public void productStatistic(HttpServletRequest request, HttpServletResponse response, String startTime, String endTime) {
        if (StringUtils.isEmpty(startTime) || StringUtils.isEmpty(endTime)) {
            return ;
        }
        try {
            double shareFundNum = 0;
            double bondFundNum = 0;
            double currencyFundNum = 0;
            double currencyNum = 0;
            List<CurrencyPurchaseVO> currencyPurchaseVOs = currencyPurchaseDAO.findBetweenTime(startTime, endTime);
            if (!CollectionUtils.isEmpty(currencyPurchaseVOs)) {
                for (CurrencyPurchaseVO purchaseVO : currencyPurchaseVOs) {
                    currencyNum += purchaseVO.getNum();
                }
            }
            List<FundPurchaseVO> fundPurchaseVOs = fundPurchaseDAO.findBetweenTime(startTime, endTime);
            if (!CollectionUtils.isEmpty(fundPurchaseVOs)) {
                for (FundPurchaseVO purchase : fundPurchaseVOs) {
                    FundVO fudVO = new FundVO();
                    fudVO.setId(purchase.getFundId());
                    fudVO = fundDAO.findByPK(fudVO);
                    if (fudVO.getFundType() == FundTypeEnum.CURRENCY_TYPE.getCode()) {
                        currencyFundNum += purchase.getNum();
                    } else if (fudVO.getFundType() == FundTypeEnum.BOND_TYPE.getCode()) {
                        bondFundNum += purchase.getNum();
                    } else if (fudVO.getFundType() == FundTypeEnum.SHARE_TYPE.getCode()) {
                        shareFundNum += purchase.getNum();
                    }
                }
            }
            PurchaseSumDTO dto=new PurchaseSumDTO();
            dto.setBondFundNum(bondFundNum);
            dto.setCurrencyFundNum(currencyFundNum);
            dto.setCurrencyNum(currencyNum);
            dto.setShareFundNum(shareFundNum);
            writeObject(dto, response);
        } catch (Exception e) {
            logger.error("",e);
        }
    }

}
