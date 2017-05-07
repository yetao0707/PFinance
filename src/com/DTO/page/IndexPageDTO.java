package com.DTO.page;

import com.DTO.CustomerDTO;
import com.DTO.NewsDTO;

import java.io.Serializable;
import java.util.List;

/**
 * Created by yetao on 17/4/25.
 */

public class IndexPageDTO implements Serializable{

    private static final long serialVersionUID = 1934804633190775822L;

    private CustomerDTO customerDTO;

    private List<NewsDTO> newsDTOs;

    public CustomerDTO getCustomerDTO() {
        return customerDTO;
    }

    public void setCustomerDTO(CustomerDTO customerDTO) {
        this.customerDTO = customerDTO;
    }

    public List<NewsDTO> getNewsDTOs() {
        return newsDTOs;
    }

    public void setNewsDTOs(List<NewsDTO> newsDTOs) {
        this.newsDTOs = newsDTOs;
    }
}
