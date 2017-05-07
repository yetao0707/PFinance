package com.service.impl;

import com.DTO.CurrencyDTO;
import com.DTO.FundDTO;
import com.DTO.RecommendResultDTO;
import com.constants.FundTypeEnum;
import com.constants.PInvestmentPortfolioEnum;
import com.dao.CurrencyDAO;
import com.dao.CustomerDAO;
import com.dao.FundDAO;
import com.request.RecommendRequest;
import com.util.EnumUtil;
import com.util.MoneyCalculateUtil;
import com.util.ParseBeanUtil;
import com.vo.fp.CurrencyVO;
import com.vo.fp.CustomerVO;
import com.vo.fp.FundVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;

/**
 * Created by yetao on 17/4/11.
 */
@Service
public class RecommendService {

    @Autowired
    private CurrencyDAO currencyDAO;

    @Autowired
    private FundDAO fundDAO;

    @Autowired
    private CustomerDAO customerDAO;

    public RecommendResultDTO getRecommendResult(RecommendRequest recommendRequest) throws ParseException {

        List<CurrencyVO> currencyVOs = currencyDAO.findList(new CurrencyVO());
        List<FundVO> fundVOs = fundDAO.find(new FundVO());
        CustomerVO customerVO = new CustomerVO();
        customerVO.setId(recommendRequest.getCustomerId());
        customerVO = customerDAO.find(customerVO);
        Object[] paramers = new Object[5];
        buildEarnings(paramers, currencyVOs, fundVOs);
        buildPrices(paramers, currencyVOs, fundVOs);
        buildRadio(paramers, customerVO);
        buildSingleRadio(paramers, currencyVOs, fundVOs);
        buildMoney(paramers, recommendRequest.getMoney());
        Object[] result = new Object[2];

        //TODO

        buildTestData(currencyVOs.size() + fundVOs.size(), result);


        RecommendResultDTO dto= buildRecommendResultDTO(currencyVOs,fundVOs,result);
        return dto;

    }

    private void buildTestData(int i, Object[] result) {
        double[] nums = new double[i];
        for (int j=0;j<i;j++) {
            nums[j]= j*1000;
        }
        double temp=12345;
        result[0]=nums;
        result[1]=temp;
    }

    private RecommendResultDTO buildRecommendResultDTO(List<CurrencyVO> currencyVOs, List<FundVO> fundVOs, Object[] result) throws ParseException {
        RecommendResultDTO dto = new RecommendResultDTO();
        double[] x = (double[]) result[0];
        dto.setVal((Double) result[1]);
        List<CurrencyDTO> recommendCurrencys = ParseBeanUtil.parseCurrencyVO2DTO(currencyVOs);
        List<FundDTO> recommendFunds = ParseBeanUtil.parseFundVO2DTO(fundVOs);
        int index=0;
        for (CurrencyDTO recommendDto : recommendCurrencys) {
            recommendDto.setRecommendMoney2Buy(x[index]);
            index++;
        }
        for (FundDTO fundDTO : recommendFunds) {
            fundDTO.setRecommendMoney2Buy(fundDTO.getAccumulatedValue() * x[index]);
            index++;
        }
        dto.setRecommendFunds(recommendFunds);
        dto.setRecommendCurrencys(recommendCurrencys);
        return dto;
    }

    private void buildSingleRadio(Object[] paramers, List<CurrencyVO> currencyVOs, List<FundVO> fundVOs) {
        double[][] singleRadio = new double[currencyVOs.size() + fundVOs.size()][3];
        for (int i = 0; i < currencyVOs.size(); i++) {
            singleRadio[i][0] = 0;
            singleRadio[i][1] = 0;
            singleRadio[i][2] = 1;
        }
        for (int i =0; i < fundVOs.size();i++ ) {
            FundTypeEnum fundType = EnumUtil.getFundTypeEnum(fundVOs.get(i).getFundType());
            singleRadio[i][0] = fundType.getShareRate();
            singleRadio[i][1] = fundType.getBondRate();
            singleRadio[i][2] = fundType.getCurrencyRate();
        }
        paramers[3] = singleRadio;
    }

    private void buildRadio(Object[] paramers, CustomerVO customerVO) {
        PInvestmentPortfolioEnum portfolioEnum = EnumUtil.getPInvestmentPortfolioEnum(customerVO.getEvaluateResult());
        double[] radio = new double[3];
        radio[0] = portfolioEnum.getBondRate();
        radio[1] = portfolioEnum.getCurrencyRate();
        radio[2] = portfolioEnum.getShareRate();
        paramers[2] = radio;

    }

    private void buildPrices(Object[] paramers, List<CurrencyVO> currencyVOs, List<FundVO> fundVOs) {

        double[] prices = new double[currencyVOs.size() + fundVOs.size()];
        int index = 0;
        for (CurrencyVO currencyVO : currencyVOs) {
            prices[index] = MoneyCalculateUtil.getSingleCurrencyPrice();
            index++;
        }
        for (FundVO fundVO : fundVOs) {
            prices[index] = MoneyCalculateUtil.getSingleFundPrice(fundVO);
            index++;
        }
        paramers[1] = prices;
    }

    private void buildEarnings(Object[] paramers, List<CurrencyVO> currencyVOs, List<FundVO> fundVOs) {
        double[] earnings = new double[currencyVOs.size() + fundVOs.size()];
        int index = 0;
        for (CurrencyVO currencyVO : currencyVOs) {
            earnings[index] = MoneyCalculateUtil.getSingleExceptedCurrencyEarning(currencyVO);
            index++;
        }
        for (FundVO fundVO : fundVOs) {
            earnings[index] = MoneyCalculateUtil.getSingleExceptedFundEarning(fundVO);
            index++;
        }
        paramers[0] = earnings;
    }

    private void buildMoney(Object[] paramers, double money) {
        paramers[4] = money;
    }
}
