package com.web.statistics;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yetao on 17/3/28.
 */
@Controller
@RequestMapping("purchaseStatistic")
public class PurchaseStatisticsController {

    private static Logger logger = Logger.getLogger(PurchaseStatisticsController.class);

    @RequestMapping("index")
    public String index(HttpServletRequest request) {
        return "statistics/purchaseSum";
    }
}
