package com.web.user;

import com.DTO.CustomerDTO;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class BaseController {

    private Logger logger = Logger.getLogger(BaseController.class);

    protected CustomerDTO getCustomerDTO(HttpServletRequest request) {
        if (request == null) {
            return null;
        }
        Object object=request.getSession().getAttribute("customer");
        if (object == null) {
            return null;
        }
        CustomerDTO customerDTO = (CustomerDTO) object;
        return customerDTO;
    }

    protected Long getCustomerId(HttpServletRequest request) {
        if (request == null) {
            return 0L;
        }
        CustomerDTO customerDTO = getCustomerDTO(request);
        if (customerDTO == null) {
            return 0L;
        }
        return customerDTO.getId();

    }

    protected void refreshCustoerDTO(HttpServletRequest request, CustomerDTO customerDTO) {
        request.getSession().setAttribute("customer", customerDTO);
    }

    void writeObject(Object object, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            final PrintWriter out;
            out = response.getWriter();
            out.print(new Gson().toJson(object));
        } catch (IOException e) {
            logger.error("writeObject failed", e);
        }
    }
}
