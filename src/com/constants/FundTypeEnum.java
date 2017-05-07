package com.constants;

/**
 * Created by yetao on 17/4/16.
 */
public enum FundTypeEnum {

    CURRENCY_TYPE(1, 0.15, 0.15, 0.7, "货币型基金"),
    BOND_TYPE(2, 0.15, 0.7, 0.15, "债券型基金"),
    SHARE_TYPE(3, 0.7, 0.15, 0.15, "股票型基金"),
    MIX_TYPE(4, 0.33, 0.33, 0.33, "混合型基金");

    private FundTypeEnum(int code, double shareRate, double bondRate, double currencyRate, String typeName) {
        this.code = code;
        this.bondRate = bondRate;
        this.currencyRate = currencyRate;
        this.shareRate = shareRate;
        this.typeName = typeName;
    }

    private int code;
    private double currencyRate;
    private double bondRate;
    private double shareRate;
    private String typeName;

    public static FundTypeEnum getFundTypeEnum(int typeCode) {
        for (FundTypeEnum fundTypeEnum : FundTypeEnum.values()) {
            if (fundTypeEnum.getCode() == typeCode) {
                return fundTypeEnum;
            }
        }
        return CURRENCY_TYPE;
    }


    public int getCode() {
        return code;
    }

    public double getCurrencyRate() {
        return currencyRate;
    }

    public double getBondRate() {
        return bondRate;
    }

    public double getShareRate() {
        return shareRate;
    }

    public String getTypeName() {
        return typeName;
    }
}
