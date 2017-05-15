package com.DTO.page;

import com.DTO.CurrencyDTO;
import com.DTO.FundDTO;

import java.io.Serializable;
import java.util.List;


public class ProductPageDTO implements Serializable{

    private static final long serialVersionUID = -696036454002517533L;

    private List<CurrencyDTO> currencyDTOs;

    private List<FundDTO> fundDTOs;

    public List<CurrencyDTO> getCurrencyDTOs() {
        return currencyDTOs;
    }

    public void setCurrencyDTOs(List<CurrencyDTO> currencyDTOs) {
        this.currencyDTOs = currencyDTOs;
    }

    public List<FundDTO> getFundDTOs() {
        return fundDTOs;
    }

    public void setFundDTOs(List<FundDTO> fundDTOs) {
        this.fundDTOs = fundDTOs;
    }
}
