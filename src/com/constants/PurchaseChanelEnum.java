package com.constants;

/**
 * Created by yetao on 17/4/16.
 */
public enum PurchaseChanelEnum {
    COUNTER(1, "柜面"),
    CVBER(2, "网银"),
    MOBILE_BAK(3, "手机银行"),
    FINANACE_SELF(4, "金融自助通"),
    PHONE_BANK(5, "电话银行");

    private PurchaseChanelEnum(int code, String desc) {
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
