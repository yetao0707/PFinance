package com.util;

import com.constants.FundTypeEnum;
import com.constants.PInvestmentPortfolioEnum;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yetao on 17/4/19.
 */
public class EnumUtil {

    private volatile static Map<Integer, FundTypeEnum> fundTypeEnumMap;

    private volatile static Map<String, PInvestmentPortfolioEnum> pInvestmentPortfolioEnumMap;

    public static FundTypeEnum getFundTypeEnum(Integer typeCode) {
        if (fundTypeEnumMap == null) {
            fundTypeEnumMap = new HashMap<Integer, FundTypeEnum>();
            for (FundTypeEnum fundTypeEnum : FundTypeEnum.values()) {
                fundTypeEnumMap.put(fundTypeEnum.getCode(), fundTypeEnum);
            }
        }
        return fundTypeEnumMap.get(typeCode);
    }

    public static PInvestmentPortfolioEnum getPInvestmentPortfolioEnum(String code) {
        if (pInvestmentPortfolioEnumMap == null) {
            pInvestmentPortfolioEnumMap = new HashMap<String, PInvestmentPortfolioEnum>();
            for (PInvestmentPortfolioEnum enumType : PInvestmentPortfolioEnum.values()) {
                pInvestmentPortfolioEnumMap.put(enumType.getCode(), enumType);
            }
        }
        return pInvestmentPortfolioEnumMap.get(code);
    }
}
