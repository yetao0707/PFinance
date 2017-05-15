package com.constants;


public enum PInvestmentPortfolioEnum {
    ACCUMULATE_ENTERPRISE_REALITY("111",0.75,0.05,0.2,"累积阶段进取型现实主义"),
    ACCUMULATE_ENTERPRISE_IDEA("112",0.8,0.12,0.08,"累积阶段进取型理想主义"),
    ACCUMULATE_ENTERPRISE_ACTION("113",0.85,0.07,0.08,"累积阶段进取型行动主义"),
    ACCUMULATE_ENTERPRISE_PRATICAL("114",0.75,0.1,0.15,"累积阶段进取型实用主义"),
    ACCUMULATE_BALANCED_REALITY("121",0.6,0.15,0.25,"累积阶段均衡型现实主义"),
    ACCUMULATE_BALANCED_IDEA("122",0.65,0.2,0.15,"累积阶段均衡型理想主义"),
    ACCUMULATE_BALANCED_ACTION("123",0.7,0.15,0.15,"累积阶段均衡型行动主义"),
    ACCUMULATE_BALANCED_PRATICAL("124",0.65,0.1,0.25,"累积阶段均衡型实用主义"),
    ACCUMULATE_KEEP_REALITY("131",0.45,0.15,0.4,"累积阶段保守型现实主义"),
    ACCUMULATE_KEEP_IDEA("132",0.5,0.3,0.2,"累积阶段保守型理想主义"),
    ACCUMULATE_KEEP_ACTION("133",0.6,0.2,0.2,"累积阶段保守型行动主义"),
    ACCUMULATE_KEEP_PRATICAL("134",0.5,0.2,0.3,"累积阶段保守型实用主义"),
    STRENGTHEN_ENTERPRISE_REALITY("211",0.5,0.35,0.15,"巩固阶段进取型现实主义"),
    STRENGTHEN_ENTERPRISE_IDEA("212",0.6,0.3,0.1,"巩固阶段进取型理想主义"),
    STRENGTHEN_ENTERPRISE_ACTION("213",0.65,0.27,0.08,"巩固阶段进取型行动主义"),
    STRENGTHEN_ENTERPRISE_PRATICAL("214",0.55,0.35,0.1,"巩固阶段进取型实用主义"),
    STRENGTHEN_BALANCED_REALITY("221",0.45,0.25,0.3,"巩固阶段均衡型现实主义"),
    STRENGTHEN_BALANCED_IDEA("222",0.5,0.35,0.15,"巩固阶段均衡型理想主义"),
    STRENGTHEN_BALANCED_ACTION("223",0.55,0.35,0.1,"巩固阶段均衡型行动主义"),
    STRENGTHEN_BALANCED_PRATICAL("224",0.5,0.3,0.2,"巩固阶段均衡型实用主义"),
    STRENGTHEN_KEEP_REALITY("231",0.3,0.3,0.4,"巩固阶段保守型现实主义"),
    STRENGTHEN_KEEP_IDEA("232",0.4,0.4,0.2,"巩固阶段保守型理想主义"),
    STRENGTHEN_KEEP_ACTION("233",0.45,0.35,0.2,"巩固阶段保守型行动主义"),
    STRENGTHEN_KEEP_PRATICAL("234",0.4,0.3,0.3,"巩固阶段保守型实用主义"),
    PAY_ENTERPRISE_REALITY("311",0.1,0.4,0.5,"支出阶段进取型现实主义"),
    PAY_ENTERPRISE_IDEA("312",0.15,0.5,0.35,"支出阶段进取型理想主义"),
    PAY_ENTERPRISE_ACTION("313",0.2,0.6,0.2,"支出阶段进取型行动主义"),
    PAY_ENTERPRISE_PRATICAL("314",0.15,0.45,0.4,"支出阶段进取型实用主义"),
    PAY_BALANCED_REALITY("321",0.08,0.4,0.52,"支出阶段均衡型现实主义"),
    PAY_BALANCED_IDEA("322",0.1,0.55,0.35,"支出阶段均衡型理想主义"),
    PAY_BALANCED_ACTION("323",0.15,0.65,0.2,"支出阶段均衡型行动主义"),
    PAY_BALANCED_PRATICAL("324",0.1,0.5,0.4,"支出阶段均衡型实用主义"),
    PAY_KEEP_REALITY("331",0,0.5,0.5,"支出阶段保守型现实主义"),
    PAY_KEEP_IDEA("332",0.05,0.6,0.35,"支出阶段保守型理想主义"),
    PAY_KEEP_ACTION("333",0.08,0.65,0.27,"支出阶段保守型行动主义"),
    PAY_KEEP_PRATICAL("334",0.05,0.5,0.45,"支出阶段保守型实用主义"),
    ;

    private PInvestmentPortfolioEnum(String code, double shareRate, double bondRate, double currencyRate,String desc) {
        this.code = code;
        this.bondRate = bondRate;
        this.currencyRate = currencyRate;
        this.shareRate = shareRate;
        this.desc=desc;
    }
    private String code;
    private double shareRate;
    private double bondRate;
    private double currencyRate;

    private String desc;

    public String getCode() {
        return code;
    }

    public double getShareRate() {
        return shareRate;
    }

    public double getBondRate() {
        return bondRate;
    }

    public double getCurrencyRate() {
        return currencyRate;
    }

    public String getDesc() {
        return desc;
    }

    public static PInvestmentPortfolioEnum getPInvestmentPortfolioEnum(String code) {
        for (PInvestmentPortfolioEnum pInvestmentPortfolioEnum : PInvestmentPortfolioEnum.values()) {
            if (pInvestmentPortfolioEnum.getCode().equals(code)) {
                return pInvestmentPortfolioEnum;
            }
        }
        return null;
    }
}
