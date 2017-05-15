package com.DTO;

import java.io.Serializable;

/**
 * Created by yetao on 17/5/15.
 */
public class PurchaseSumDTO implements Serializable {
    private static final long serialVersionUID = 8396270041681575715L;
    private double shareFundNum ;
    private double bondFundNum ;
    private double currencyFundNum ;
    private double currencyNum ;

    public double getShareFundNum() {
        return shareFundNum;
    }

    public void setShareFundNum(double shareFundNum) {
        this.shareFundNum = shareFundNum;
    }

    public double getBondFundNum() {
        return bondFundNum;
    }

    public void setBondFundNum(double bondFundNum) {
        this.bondFundNum = bondFundNum;
    }

    public double getCurrencyFundNum() {
        return currencyFundNum;
    }

    public void setCurrencyFundNum(double currencyFundNum) {
        this.currencyFundNum = currencyFundNum;
    }

    public double getCurrencyNum() {
        return currencyNum;
    }

    public void setCurrencyNum(double currencyNum) {
        this.currencyNum = currencyNum;
    }
}
