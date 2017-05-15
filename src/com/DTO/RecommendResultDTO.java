package com.DTO;

import com.vo.fp.CurrencyVO;

import java.io.Serializable;
import java.util.List;


public class RecommendResultDTO implements Serializable {

    private static final long serialVersionUID = 2223558620025950224L;

    private Double val;

    private List<CurrencyDTO> recommendCurrencys;

    private List<FundDTO> recommendFunds;

    public Double getVal() {
        return val;
    }

    public void setVal(Double val) {
        this.val = val;
    }

    public List<CurrencyDTO> getRecommendCurrencys() {
        return recommendCurrencys;
    }

    public void setRecommendCurrencys(List<CurrencyDTO> recommendCurrencys) {
        this.recommendCurrencys = recommendCurrencys;
    }

    public List<FundDTO> getRecommendFunds() {
        return recommendFunds;
    }

    public void setRecommendFunds(List<FundDTO> recommendFunds) {
        this.recommendFunds = recommendFunds;
    }

    @Override
    public String toString() {
        return "RecommendResultDTO{" +
                "val=" + val +
                ", recommendCurrencys=" + recommendCurrencys +
                ", recommendFunds=" + recommendFunds +
                '}';
    }
}
