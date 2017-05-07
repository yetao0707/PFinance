package com.DTO;

import com.dao.FundPurchaseDAO;

import java.io.Serializable;
import java.util.List;

/**
 * Created by yetao on 17/4/29.
 */
public class PurchaseDTO implements Serializable {

    private static final long serialVersionUID = 5516395287685567733L;

    private Long customerId;

    private List<FundPurchaseDTO> fundPurchaseDTOs;

    private List<CurrencyPurchaseDTO> currencyPurchaseDTOs;

    private double purchaseSum;

    private double dayEarning;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public List<FundPurchaseDTO> getFundPurchaseDTOs() {
        return fundPurchaseDTOs;
    }

    public void setFundPurchaseDTOs(List<FundPurchaseDTO> fundPurchaseDTOs) {
        this.fundPurchaseDTOs = fundPurchaseDTOs;
    }

    public List<CurrencyPurchaseDTO> getCurrencyPurchaseDTOs() {
        return currencyPurchaseDTOs;
    }

    public void setCurrencyPurchaseDTOs(List<CurrencyPurchaseDTO> currencyPurchaseDTOs) {
        this.currencyPurchaseDTOs = currencyPurchaseDTOs;
    }

    public double getPurchaseSum() {
        return purchaseSum;
    }

    public void setPurchaseSum(double purchaseSum) {
        this.purchaseSum = purchaseSum;
    }

    public double getDayEarning() {
        return dayEarning;
    }

    public void setDayEarning(double dayEarning) {
        this.dayEarning = dayEarning;
    }
}
