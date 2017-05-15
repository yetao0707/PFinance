package com.web.admin;

import com.DTO.CustomerDTO;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BaseController {

    private Logger logger = Logger.getLogger(BaseController.class);


    protected void writeObject(Object object, HttpServletResponse response) {
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
