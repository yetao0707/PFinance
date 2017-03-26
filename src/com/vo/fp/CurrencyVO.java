package com.vo.fp;

import java.util.Date;
import java.util.List;

import com.vo.BaseVO;


public class CurrencyVO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private String currencyName;
    private String registerId;
    private Date subscriptionStartDate;
    private Date subscriptionEndDate;
    private Date foundingDate;
    private Date dueDate;
    private Date cashingDay;
    private Long durationDays;
    private Long productType;
    private Double purchaseAmount;
    private Double incrementalAmount;
    private Double profitYield;
    private Double tradeRate;
    private Long purchaseChannel;
    private Double recruitmentScale;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the currencyName
     */
    public String getCurrencyName() {
        return currencyName;
    }

    /**
     * @param currencyName the currencyName to set
     */
    public void setCurrencyName(String currencyName) {
        this.currencyName = currencyName;
    }

    /**
     * @return the registerId
     */
    public String getRegisterId() {
        return registerId;
    }

    /**
     * @param registerId the registerId to set
     */
    public void setRegisterId(String registerId) {
        this.registerId = registerId;
    }

    /**
     * @return the subscriptionStartDate
     */
    public Date getSubscriptionStartDate() {
        return subscriptionStartDate;
    }

    /**
     * @param subscriptionStartDate the subscriptionStartDate to set
     */
    public void setSubscriptionStartDate(Date subscriptionStartDate) {
        this.subscriptionStartDate = subscriptionStartDate;
    }

    /**
     * @return the subscriptionEndDate
     */
    public Date getSubscriptionEndDate() {
        return subscriptionEndDate;
    }

    /**
     * @param subscriptionEndDate the subscriptionEndDate to set
     */
    public void setSubscriptionEndDate(Date subscriptionEndDate) {
        this.subscriptionEndDate = subscriptionEndDate;
    }

    /**
     * @return the foundingDate
     */
    public Date getFoundingDate() {
        return foundingDate;
    }

    /**
     * @param foundingDate the foundingDate to set
     */
    public void setFoundingDate(Date foundingDate) {
        this.foundingDate = foundingDate;
    }

    /**
     * @return the dueDate
     */
    public Date getDueDate() {
        return dueDate;
    }

    /**
     * @param dueDate the dueDate to set
     */
    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    /**
     * @return the cashingDay
     */
    public Date getCashingDay() {
        return cashingDay;
    }

    /**
     * @param cashingDay the cashingDay to set
     */
    public void setCashingDay(Date cashingDay) {
        this.cashingDay = cashingDay;
    }

    /**
     * @return the durationDays
     */
    public Long getDurationDays() {
        return durationDays;
    }

    /**
     * @param durationDays the durationDays to set
     */
    public void setDurationDays(Long durationDays) {
        this.durationDays = durationDays;
    }

    /**
     * @return the productType
     */
    public Long getProductType() {
        return productType;
    }

    /**
     * @param productType the productType to set
     */
    public void setProductType(Long productType) {
        this.productType = productType;
    }

    /**
     * @return the purchaseAmount
     */
    public Double getPurchaseAmount() {
        return purchaseAmount;
    }

    /**
     * @param purchaseAmount the purchaseAmount to set
     */
    public void setPurchaseAmount(Double purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
    }

    /**
     * @return the incrementalAmount
     */
    public Double getIncrementalAmount() {
        return incrementalAmount;
    }

    /**
     * @param incrementalAmount the incrementalAmount to set
     */
    public void setIncrementalAmount(Double incrementalAmount) {
        this.incrementalAmount = incrementalAmount;
    }

    /**
     * @return the profitYield
     */
    public Double getProfitYield() {
        return profitYield;
    }

    /**
     * @param profitYield the profitYield to set
     */
    public void setProfitYield(Double profitYield) {
        this.profitYield = profitYield;
    }

    /**
     * @return the tradeRate
     */
    public Double getTradeRate() {
        return tradeRate;
    }

    /**
     * @param tradeRate the tradeRate to set
     */
    public void setTradeRate(Double tradeRate) {
        this.tradeRate = tradeRate;
    }

    /**
     * @return the purchaseChannel
     */
    public Long getPurchaseChannel() {
        return purchaseChannel;
    }

    /**
     * @param purchaseChannel the purchaseChannel to set
     */
    public void setPurchaseChannel(Long purchaseChannel) {
        this.purchaseChannel = purchaseChannel;
    }

    /**
     * @return the recruitmentScale
     */
    public Double getRecruitmentScale() {
        return recruitmentScale;
    }

    /**
     * @param recruitmentScale the recruitmentScale to set
     */
    public void setRecruitmentScale(Double recruitmentScale) {
        this.recruitmentScale = recruitmentScale;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CurrencyVO [id=" + id + ", currencyName=" + currencyName
                + ", registerId=" + registerId + ", subscriptionStartDate="
                + subscriptionStartDate + ", subscriptionEndDate="
                + subscriptionEndDate + ", foundingDate=" + foundingDate
                + ", dueDate=" + dueDate + ", cashingDay=" + cashingDay
                + ", durationDays=" + durationDays + ", productType="
                + productType + ", purchaseAmount=" + purchaseAmount
                + ", incrementalAmount=" + incrementalAmount
                + ", profitYield=" + profitYield + ", tradeRate="
                + tradeRate + ", purchaseChannel=" + purchaseChannel
                + ", recruitmentScale=" + recruitmentScale + "]";
    }


}
