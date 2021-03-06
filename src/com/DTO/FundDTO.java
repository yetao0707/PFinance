package com.DTO;

import com.vo.BaseVO;

/**
 * Created by yetao on 17/3/25.
 */
public class FundDTO extends BaseVO {
    private static final long serialVersionUID = -7636919983263300648L;

    private Long id;
    private double expectedYield;
    private String registerId;
    private String fundName;
    private Integer fundType;
    private Double netassetValue;
    private Double accumulatedValue;
    private Double weekValue;
    private Double monthValue;
    private String foundingDate;
    private Long planType;
    private String custodian;
    private String trustee;
    private String startDate;
    private String endDate;
    private int duration;
    private Double totalRecruitment;
    private Double purchaseAmount;
    private Double objective;

    private Double recommendMoney2Buy;
    
    private double shareRate;
    private double bondRate;
    private double currencyRate;


    
    public String getRegisterId() {
        return registerId;
    }

    public void setRegisterId(String registerId) {
        this.registerId = registerId;
    }

    public Double getRecommendMoney2Buy() {
        return recommendMoney2Buy;
    }

    public void setRecommendMoney2Buy(Double recommendMoney2Buy) {
        this.recommendMoney2Buy = recommendMoney2Buy;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFundName() {
        return fundName;
    }

    public void setFundName(String fundName) {
        this.fundName = fundName;
    }

    public Integer getFundType() {
        return fundType;
    }

    public void setFundType(Integer fundType) {
        this.fundType = fundType;
    }

    public Double getNetassetValue() {
        return netassetValue;
    }

    public void setNetassetValue(Double netassetValue) {
        this.netassetValue = netassetValue;
    }

    public Double getAccumulatedValue() {
        return accumulatedValue;
    }

    public void setAccumulatedValue(Double accumulatedValue) {
        this.accumulatedValue = accumulatedValue;
    }

    public Double getWeekValue() {
        return weekValue;
    }

    public void setWeekValue(Double weekValue) {
        this.weekValue = weekValue;
    }

    public Double getMonthValue() {
        return monthValue;
    }

    public void setMonthValue(Double monthValue) {
        this.monthValue = monthValue;
    }

    public String getFoundingDate() {
        return foundingDate;
    }

    public void setFoundingDate(String foundingDate) {
        this.foundingDate = foundingDate;
    }

    public Long getPlanType() {
        return planType;
    }

    public void setPlanType(Long planType) {
        this.planType = planType;
    }

    public String getCustodian() {
        return custodian;
    }

    public void setCustodian(String custodian) {
        this.custodian = custodian;
    }

    public String getTrustee() {
        return trustee;
    }

    public void setTrustee(String trustee) {
        this.trustee = trustee;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Double getTotalRecruitment() {
        return totalRecruitment;
    }

    public void setTotalRecruitment(Double totalRecruitment) {
        this.totalRecruitment = totalRecruitment;
    }

    public Double getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(Double purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
    }

    public Double getObjective() {
        return objective;
    }

    public void setObjective(Double objective) {
        this.objective = objective;
    }

    @Override
    public String toString() {
        return "FundDTO{" +
                "id=" + id +
                ", fundName='" + fundName + '\'' +
                ", fundType=" + fundType +
                ", netassetValue=" + netassetValue +
                ", accumulatedValue=" + accumulatedValue +
                ", weekValue=" + weekValue +
                ", monthValue=" + monthValue +
                ", foundingDate='" + foundingDate + '\'' +
                ", planType=" + planType +
                ", custodian='" + custodian + '\'' +
                ", trustee='" + trustee + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", duration='" + duration + '\'' +
                ", totalRecruitment=" + totalRecruitment +
                ", purchaseAmount=" + purchaseAmount +
                ", objective=" + objective +
                '}';
    }

	/**
	 * @return the expectedyield
	 */
	public double getExpectedYield() {
		return expectedYield;
	}

	/**
	 * @param expectedyield the expectedyield to set
	 */
	public void setExpectedYield(double expectedyield) {
		this.expectedYield = expectedyield;
	}

	/**
	 * @return the shareRate
	 */
	public double getShareRate() {
		return shareRate;
	}

	/**
	 * @param shareRate the shareRate to set
	 */
	public void setShareRate(double shareRate) {
		this.shareRate = shareRate;
	}

	/**
	 * @return the bondRate
	 */
	public double getBondRate() {
		return bondRate;
	}

	/**
	 * @param bondRate the bondRate to set
	 */
	public void setBondRate(double bondRate) {
		this.bondRate = bondRate;
	}

	/**
	 * @return the currencyRate
	 */
	public double getCurrencyRate() {
		return currencyRate;
	}

	/**
	 * @param currencyRate the currencyRate to set
	 */
	public void setCurrencyRate(double currencyRate) {
		this.currencyRate = currencyRate;
	}
}
