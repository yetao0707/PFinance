package com.util;

import com.DTO.CurrencyDTO;
import com.DTO.CurrencyPurchaseDTO;
import com.DTO.FundDTO;
import com.DTO.FundPurchaseDTO;
import com.vo.fp.CurrencyVO;
import com.vo.fp.FundVO;


public class MoneyCalculateUtil {

    public static double getFundPurchasePrice(FundPurchaseDTO fundPurchaseDTO) {
        if (fundPurchaseDTO == null) {
            return 0;
        }
        FundDTO fundDTO = fundPurchaseDTO.getFundDTO();
        if (fundDTO == null) {
            return 0;
        }
        double price = fundPurchaseDTO.getNum() * getSingleFundPrice(ParseBeanUtil.parseFundDTO2VO(fundDTO));
        return price;
    }

    public static double getCurrencyPurchasePrice(CurrencyPurchaseDTO currencyPurchaseDTO) {
        if (currencyPurchaseDTO == null) {
            return 0;
        }
        CurrencyDTO currencyDTO = currencyPurchaseDTO.getCurrencyDTO();
        CurrencyVO currencyVO=ParseBeanUtil.parseCurrencyDTO2VO(currencyDTO);

        if (currencyDTO == null) {
            return 0;
        }
        double price = currencyPurchaseDTO.getNum() * getSingleCurrencyPrice(currencyVO);
        return price;
    }

    public static double getSingleFundPrice(FundVO fundVO) {
        if (fundVO == null) {
            return 0;
        }
        return 1;
    }

    public static double getSingleCurrencyPrice(CurrencyVO currencyVO) {
        return 1;
    }

    public static double getSingleExceptedFundEarning(FundVO fundVO) {
        if (fundVO == null) {
            return 0;
        }
        return fundVO.getExpectedYield();
    }

    public static double getSingleExceptedCurrencyEarning(CurrencyVO currencyVO) {
        if (currencyVO == null) {
            return 0;
        }
        return currencyVO.getProfitYield();
    }

    public static double getFundEarning(FundPurchaseDTO fundPurchaseDTO) {
        if (fundPurchaseDTO == null) {
            return 0;
        }
        FundDTO fundDTO = fundPurchaseDTO.getFundDTO();
        if (fundDTO == null) {
            return 0;
        }

        return fundPurchaseDTO.getNum() * (fundDTO.getAccumulatedValue() - fundDTO.getNetassetValue());
    }

    public static double getCurrencyEarning(CurrencyPurchaseDTO currencyPurchaseDTO) {
        if (currencyPurchaseDTO == null) {
            return 0;
        }
        CurrencyDTO currencyDTO = currencyPurchaseDTO.getCurrencyDTO();
        return currencyDTO.getProfitYield() * currencyPurchaseDTO.getNum();
    }


}
