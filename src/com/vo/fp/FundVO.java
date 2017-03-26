package com.vo.fp;

import java.util.Date;
import java.util.List;

import com.vo.BaseVO;


public class FundVO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private String fundName;
    private Long fundType;
    private Double netassetValue;
    private Double accumulatedValue;
    private Double weekValue;
    private Double monthValue;
    private Date foundingDate;
    private Long planType;
    private String custodian;
    private String trustee;
    private Date startDate;
    private Date endDate;
    private Date duration;
    private Double totalRecruitment;
    private Double purchaseAmount;
    private Double objective;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the fundName
     */
    public String getFundName() {
        return fundName;
    }

    /**
     * @param fundName the fundName to set
     */
    public void setFundName(String fundName) {
        this.fundName = fundName;
    }

    /**
     * @return the fundType
     */
    public Long getFundType() {
        return fundType;
    }

    /**
     * @param fundType the fundType to set
     */
    public void setFundType(Long fundType) {
        this.fundType = fundType;
    }

    /**
     * @return the netassetValue
     */
    public Double getNetassetValue() {
        return netassetValue;
    }

    /**
     * @param netassetValue the netassetValue to set
     */
    public void setNetassetValue(Double netassetValue) {
        this.netassetValue = netassetValue;
    }

    /**
     * @return the accumulatedValue
     */
    public Double getAccumulatedValue() {
        return accumulatedValue;
    }

    /**
     * @param accumulatedValue the accumulatedValue to set
     */
    public void setAccumulatedValue(Double accumulatedValue) {
        this.accumulatedValue = accumulatedValue;
    }

    /**
     * @return the weekValue
     */
    public Double getWeekValue() {
        return weekValue;
    }

    /**
     * @param weekValue the weekValue to set
     */
    public void setWeekValue(Double weekValue) {
        this.weekValue = weekValue;
    }

    /**
     * @return the monthValue
     */
    public Double getMonthValue() {
        return monthValue;
    }

    /**
     * @param monthValue the monthValue to set
     */
    public void setMonthValue(Double monthValue) {
        this.monthValue = monthValue;
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
     * @return the planType
     */
    public Long getPlanType() {
        return planType;
    }

    /**
     * @param planType the planType to set
     */
    public void setPlanType(Long planType) {
        this.planType = planType;
    }

    /**
     * @return the custodian
     */
    public String getCustodian() {
        return custodian;
    }

    /**
     * @param custodian the custodian to set
     */
    public void setCustodian(String custodian) {
        this.custodian = custodian;
    }

    /**
     * @return the trustee
     */
    public String getTrustee() {
        return trustee;
    }

    /**
     * @param trustee the trustee to set
     */
    public void setTrustee(String trustee) {
        this.trustee = trustee;
    }

    /**
     * @return the startDate
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the duration
     */
    public Date getDuration() {
        return duration;
    }

    /**
     * @param duration the duration to set
     */
    public void setDuration(Date duration) {
        this.duration = duration;
    }

    /**
     * @return the totalRecruitment
     */
    public Double getTotalRecruitment() {
        return totalRecruitment;
    }

    /**
     * @param totalRecruitment the totalRecruitment to set
     */
    public void setTotalRecruitment(Double totalRecruitment) {
        this.totalRecruitment = totalRecruitment;
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
     * @return the objective
     */
    public Double getObjective() {
        return objective;
    }

    /**
     * @param objective the objective to set
     */
    public void setObjective(Double objective) {
        this.objective = objective;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "FundVO [id=" + id + ", fundName=" + fundName
                + ", fundType=" + fundType + ", netassetValue="
                + netassetValue + ", accumulatedValue=" + accumulatedValue
                + ", weekValue=" + weekValue + ", monthValue=" + monthValue
                + ", foundingDate=" + foundingDate + ", planType="
                + planType + ", custodian=" + custodian + ", trustee="
                + trustee + ", startDate=" + startDate + ", endDate="
                + endDate + ", duration=" + duration
                + ", totalRecruitment=" + totalRecruitment
                + ", purchaseAmount=" + purchaseAmount + ", objective="
                + objective + "]";
    }


}
