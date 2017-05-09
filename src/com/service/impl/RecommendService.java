package com.service.impl;

import com.DTO.CurrencyDTO;
import com.DTO.FundDTO;
import com.DTO.RecommendResultDTO;
import com.constants.FundTypeEnum;
import com.constants.PInvestmentPortfolioEnum;
import com.dao.CurrencyDAO;
import com.dao.CustomerDAO;
import com.dao.FundDAO;
import com.google.gson.Gson;
import com.mathworks.toolbox.javabuilder.MWException;
import com.mathworks.toolbox.javabuilder.MWNumericArray;
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
import java.util.Iterator;
import java.util.List;

import liqi.PFinance;

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
        Gson gson=new Gson();
        String sterString=gson.toJson(paramers);
        Object[] result = new Object[2];

        PFinance pFinanaceRecommend;
		try {
			pFinanaceRecommend = new PFinance();
			result=pFinanaceRecommend.getResult(2,paramers);
		} catch (MWException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        //TODO

//        buildTestData(currencyVOs.size() + fundVOs.size(), result);


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
        MWNumericArray temp = (MWNumericArray)result[0];

		double [][] weights=(double[][])temp.toDoubleArray();
		int n=currencyVOs.size()+fundVOs.size();
		double[] x = new double[n];
		for(int i=0;i<n;i++){
			x[i]=weights[i][0];
		}
		
		MWNumericArray temp2 = (MWNumericArray)result[0];

		double [][] weights2=(double[][])temp.toDoubleArray();
        
        dto.setVal(weights2[0][0]);
        List<CurrencyDTO> recommendCurrencys = ParseBeanUtil.parseCurrencyVO2DTO(currencyVOs);
        List<FundDTO> recommendFunds = ParseBeanUtil.parseFundVO2DTO(fundVOs);
        int index=0;
        for (CurrencyDTO recommendDto : recommendCurrencys) {
            recommendDto.setRecommendMoney2Buy(fliterRecommendMoney2Buy(x[index]));
            index++;
        }
        for (FundDTO fundDTO : recommendFunds) {
            fundDTO.setRecommendMoney2Buy(fliterRecommendMoney2Buy(x[index]));
            index++;
        }
        fliterProducts(recommendCurrencys,recommendFunds);
        dto.setRecommendFunds(recommendFunds);
        dto.setRecommendCurrencys(recommendCurrencys);
        return dto;
    }
    
    private void fliterProducts(List<CurrencyDTO> recommendCurrencys,
			List<FundDTO> recommendFunds) {
		for (Iterator<CurrencyDTO> i=recommendCurrencys.iterator();i.hasNext();) {
			CurrencyDTO currencyDTO=i.next();
			if (currencyDTO.getRecommendMoney2Buy()<=0) {
				i.remove();
			}
		}
		for (Iterator<FundDTO> i=recommendFunds.iterator();i.hasNext();) {
			FundDTO fundDTO=i.next();
			if (fundDTO.getRecommendMoney2Buy()<=0) {
				i.remove();
			}
		}
		
	}

	private double fliterRecommendMoney2Buy(double money){
    	int m=(int) (money%1000);
    	int n=(int) (money/1000);
    	if (m<500) {
			return n*1000;
		} else {
			return (n+1)*1000;
		}
    	
    }

    private void buildSingleRadio(Object[] paramers, List<CurrencyVO> currencyVOs, List<FundVO> fundVOs) {
        double[][] singleRadio = new double[currencyVOs.size() + fundVOs.size()][3];
        for (int i = 0; i < currencyVOs.size(); i++) {
            singleRadio[i][0] = 0;
            singleRadio[i][1] = 0;
            singleRadio[i][2] = 1;
        }
        for (int i =0; i < fundVOs.size();i++ ) {
//            FundTypeEnum fundType = EnumUtil.getFundTypeEnum(fundVOs.get(i).getFundType());
//            singleRadio[currencyVOs.size()+i][0] = fundType.getShareRate();
//            singleRadio[currencyVOs.size()+i][1] = fundType.getBondRate();
//            singleRadio[currencyVOs.size()+i][2] = fundType.getCurrencyRate();
        	FundVO fundVO=fundVOs.get(i);
        	singleRadio[currencyVOs.size()+i][0]=fundVO.getShareRate();
        	singleRadio[currencyVOs.size()+i][1]=fundVO.getBondRate();
        	singleRadio[currencyVOs.size()+i][2]=fundVO.getCurrencyRate();
        	
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
            prices[index] = MoneyCalculateUtil.getSingleCurrencyPrice(currencyVO);
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
