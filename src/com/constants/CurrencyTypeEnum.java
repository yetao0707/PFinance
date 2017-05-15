package com.constants;


public enum CurrencyTypeEnum {

    EVEN_FLOAT(1, "保本浮动收益"),
    NOT_EVENT_FLOAT(2, "非保本浮动收益"),
    EVEN_FIX(3, "保本稳定收益"),
    NOT_EVENT_FIX(4, "非保本稳定收益");

    private CurrencyTypeEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    private int code;
    private String desc;


    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
