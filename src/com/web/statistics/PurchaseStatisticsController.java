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

    @RequestMapping("purchaseSum")
    public String purchaseStatistic(HttpServletRequest request) {
        return "statistics/purchaseSum";
    }

    @RequestMapping("userSum")
    public String userStatistic(HttpServletRequest request) {
        return "statistics/userStatistic";
    }
    @RequestMapping("productSum")
    public String productStatistic(HttpServletRequest request) {
        return "statistics/productStatistic";
    }
}
