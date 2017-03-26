package com.vo.fp;

import java.util.Date;
import java.util.List;

import com.vo.BaseVO;


public class CustomerAccountVO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long customerId;
    private Double allMoney;
    private Double extraMoney;

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

    public Double getAllMoney() {
        return allMoney;
    }

    public void setAllMoney(Double allMoney) {
        this.allMoney = allMoney;
    }

    public Double getExtraMoney() {
        return extraMoney;
    }

    public void setExtraMoney(Double extraMoney) {
        this.extraMoney = extraMoney;
    }

    @Override
    public String toString() {
        return "CustomeraccountVO [id=" + id + ", customerId=" + customerId + ", allMoney=" + allMoney + ", extraMoney=" + extraMoney
                + "]";
    }


}
