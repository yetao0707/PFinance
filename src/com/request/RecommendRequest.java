package com.request;

import java.io.Serializable;

/**
 * Created by yetao on 17/4/11.
 */
public class RecommendRequest implements Serializable {

    private static final long serialVersionUID = 7215043915181477135L;

    private Long customerId;

    private double money;

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    @Override
    public String toString() {
        return "RecommendRequest{" +
                "customerId=" + customerId +
                ", money=" + money +
                '}';
    }
}
