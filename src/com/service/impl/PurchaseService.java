package com.service.impl;

import com.DTO.*;
import com.dao.CurrencyDAO;
import com.dao.CurrencyPurchaseDAO;
import com.dao.FundDAO;
import com.dao.FundPurchaseDAO;
import com.util.MoneyCalculateUtil;
import com.util.ParseBeanUtil;
import com.vo.fp.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Component("purchaseService")
public class PurchaseService {

    private Logger log = Logger.getLogger(PurchaseService.class);

    @Autowired
    private FundPurchaseDAO fundPurchaseDAO;

    @Autowired
    private CurrencyPurchaseDAO currencyPurchaseDAO;

    @Autowired
    private CurrencyDAO currencyDAO;

    @Autowired
    private FundDAO fundDAO;

    public PurchaseDTO getPurchaseDTO(Long customerId) {
        double purchaseSum = 0;
        double dayEarning = 0;
        FundPurchaseVO fundPurchaseVO = new FundPurchaseVO();
        fundPurchaseVO.setCustomerId(customerId);
        List<FundPurchaseVO> fundPurchaseVOs = fundPurchaseDAO.findList(fundPurchaseVO);
        List<FundPurchaseDTO> fundPurchaseDTOs = ParseBeanUtil.parseFundPurchaseVO2DTO(fundPurchaseVOs);
        if (!CollectionUtils.isEmpty(fundPurchaseDTOs)) {
            for (FundPurchaseDTO fundPurchaseDTO : fundPurchaseDTOs) {
                FundVO fundVO = new FundVO();
                fundVO.setId(fundPurchaseDTO.getFundId());
                fundVO = fundDAO.findByPK(fundVO);
                FundDTO fundDTO = ParseBeanUtil.parseFundVO2DTO(fundVO);
                fundPurchaseDTO.setFundDTO(fundDTO);
            }
            for (FundPurchaseDTO fundPurchaseDTO : fundPurchaseDTOs) {
                purchaseSum += MoneyCalculateUtil.getFundPurchasePrice(fundPurchaseDTO);
                dayEarning += MoneyCalculateUtil.getFundEarning(fundPurchaseDTO);
            }
        }
        CurrencyPurchaseVO currencyPurchaseVO = new CurrencyPurchaseVO();
        currencyPurchaseVO.setCustomerId(customerId);
        List<CurrencyPurchaseVO> currencyPurchaseVOs = currencyPurchaseDAO.findList(currencyPurchaseVO);
        List<CurrencyPurchaseDTO> currencyPurchaseDTOs = ParseBeanUtil.parseCurrencyPurchaseVO2DTO(currencyPurchaseVOs);

        if (!CollectionUtils.isEmpty(currencyPurchaseDTOs)) {
            for (CurrencyPurchaseDTO currencyPurchaseDTO : currencyPurchaseDTOs) {
                CurrencyVO currencyVO = new CurrencyVO();
                currencyVO.setId(currencyPurchaseDTO.getCurrencyId());
                currencyVO = currencyDAO.findByPK(currencyVO);
                CurrencyDTO currencyDTO = ParseBeanUtil.parseCurrencyVO2DTO(currencyVO);
                currencyPurchaseDTO.setCurrencyDTO(currencyDTO);
            }
            for (CurrencyPurchaseDTO currencyPurchaseDTO : currencyPurchaseDTOs) {
                purchaseSum += MoneyCalculateUtil.getCurrencyPurchasePrice(currencyPurchaseDTO);
                dayEarning += MoneyCalculateUtil.getCurrencyEarning(currencyPurchaseDTO);
            }
        }
        PurchaseDTO purchaseDTO=new PurchaseDTO();
        purchaseDTO.setCustomerId(customerId);
        purchaseDTO.setCurrencyPurchaseDTOs(currencyPurchaseDTOs);
        purchaseDTO.setFundPurchaseDTOs(fundPurchaseDTOs);
        purchaseDTO.setPurchaseSum(purchaseSum);
        purchaseDTO.setDayEarning(dayEarning);
        return purchaseDTO;
    }
}
