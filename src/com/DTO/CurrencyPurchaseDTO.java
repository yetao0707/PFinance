package com.DTO;

import com.vo.BaseVO;


public class CurrencyPurchaseDTO extends BaseVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long customerId;
    private Long currencyId;
    private double num;
    private String purchaseDate;

    private CurrencyDTO currencyDTO;

    public CurrencyDTO getCurrencyDTO() {
        return currencyDTO;
    }

    public void setCurrencyDTO(CurrencyDTO currencyDTO) {
        this.currencyDTO = currencyDTO;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
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
