package com.DTO;

import com.vo.BaseVO;

import java.util.Date;


public class FundPurchaseDTO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long fundId;
    private Long customerId;
    private String purchaseDate;
    private int num;
    private FundDTO fundDTO;

    public FundDTO getFundDTO() {
        return fundDTO;
    }

    public void setFundDTO(FundDTO fundDTO) {
        this.fundDTO = fundDTO;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the fundId
     */
    public Long getFundId() {
        return fundId;
    }

    /**
     * @param fundId the fundId to set
     */
    public void setFundId(Long fundId) {
        this.fundId = fundId;
    }

    /**
     * @return the customerId
     */
    public Long getCustomerId() {
        return customerId;
    }

    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    /**
     * @return the purchaseDate
     */
    public String getPurchaseDate() {
        return purchaseDate;
    }

    /**
     * @param purchaseDate the purchaseDate to set
     */
    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "FundPurchaseVO [id=" + id + ", fundId=" + fundId
                + ", customerId=" + customerId + ", purchaseDate="
                + purchaseDate + "]";
    }


}
