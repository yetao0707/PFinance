package com.vo.fp;

import com.vo.BaseVO;

import java.util.Date;


public class CurrencyPurchaseVO extends BaseVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long customerId;
    private Long currencyId;
    private double num;

    private Date purchaseDate;

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getCurrencyId() {
        return currencyId;
    }

    public void setCurrencyId(Long currencyId) {
        this.currencyId = currencyId;
    }

    public double getNum() {
        return num;
    }

    public void setNum(double num) {
        this.num = num;
    }


    @Override
    public String toString() {
        return "CurrencypurchaseVO [id=" + id + ", customerId=" + customerId + ", CurrencyId=" + currencyId + ", num=" + num + "]";
    }


}
