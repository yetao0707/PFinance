package com.DTO;

import com.vo.BaseVO;


public class CustomerDTO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private String userName;
    private String password;
    private String sex;
    private Long age;
    private String phoneNum;
    private String email;
    private String adderss;
    private String idNum;
    private String evaluateResult;
    private Double profit;
    private double shareRate;
    private double bondRate;
    private double currencyRate;
    private String desc;

    public double getShareRate() {
        return shareRate;
    }

    public void setShareRate(double shareRate) {
        this.shareRate = shareRate;
    }

    public double getBondRate() {
        return bondRate;
    }

    public void setBondRate(double bondRate) {
        this.bondRate = bondRate;
    }

    public double getCurrencyRate() {
        return currencyRate;
    }

    public void setCurrencyRate(double currencyRate) {
        this.currencyRate = currencyRate;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Double getProfit() {
        return profit;
    }

    public void setProfit(Double profit) {
        this.profit = profit;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Long getAge() {
        return age;
    }

    public void setAge(Long age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdderss() {
        return adderss;
    }

    public void setAdderss(String adderss) {
        this.adderss = adderss;
    }

    public String getEvaluateResult() {
        return evaluateResult;
    }

    public void setEvaluateResult(String evaluateResult) {
        this.evaluateResult = evaluateResult;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the phoneNum
     */
    public String getPhoneNum() {
        return phoneNum;
    }

    /**
     * @param phoneNum the phoneNum to set
     */
    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    /**
     * @return the idNum
     */
    public String getIdNum() {
        return idNum;
    }

    /**
     * @param idNum the idNum to set
     */
    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CustomerVO [id=" + id + ", userName=" + userName
                + ", password=" + password + ", sex=" + sex + ", age="
                + age + ", phoneNum=" + phoneNum + ", email=" + email
                + ", adderss=" + adderss + ", idNum=" + idNum
                + ", evaluateResult=" + evaluateResult + "]";
    }


}
