package com.constants;

/**
 * Created by yetao on 17/4/16.
 */
public enum  PlanTypeEnum {
    LIMIT(1,"限定性"),
    NOT_LIMIT(2,"非限定性"),
    FIXSUM_LIMIT(3,"限额特定理财");

    private PlanTypeEnum(int code,String dec){
        this.code = code;
        this.dec = dec;
    }
    private int code;

    private String dec;

    public int getCode() {
        return code;
    }

    public String getDec() {
        return dec;
    }
}
