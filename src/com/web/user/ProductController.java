package com.web.user;

import com.DTO.CurrencyDTO;
import com.DTO.FundDTO;
import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyDAO;
import com.dao.FundDAO;
import com.service.PageQueryService;
import com.util.ParseBeanUtil;
import com.vo.fp.CurrencyVO;
import com.vo.fp.FundVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by yetao on 17/4/25.
 */
@Controller
@RequestMapping("user")
public class ProductController {

    private Logger log = Logger.getLogger(ProductController.class);

    @Resource
    private PageQueryService fundPageQueryService;

    @Resource
    private PageQueryService currencyPageQueryService;

    @Autowired
    private CurrencyDAO currencyDAO;

    @Autowired
    private FundDAO fundDAO;


    @RequestMapping("productIndex")
    public String productIndex(HttpServletRequest request) {
        return "user/product/product";
    }


    @RequestMapping("/fundList")
    public String fundList(PageUtils pageUtils, HttpServletRequest request, HttpServletResponse response) {
        if (pageUtils.getNumPerPage() <= 0) {
            pageUtils.setNumPerPage(20);
            pageUtils.setCurrentPage(1);
        }
        try {
            Page page = fundPageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseFundVO2DTO(page.getList()));
            request.setAttribute("page", page);
            return "user/product/fundProduct";
        } catch (Exception e) {
            log.error("fundList failed pageUtils=" + pageUtils, e);
            return "error";
        }

    }

    @RequestMapping("/fundDetail")
    public String fundDetail(HttpServletRequest request,FundDTO fundDTO, HttpServletResponse response) {
        try {
            FundVO fundVO = ParseBeanUtil.parseFundDTO2VO(fundDTO);
            fundVO = fundDAO.findByPK(fundVO);
            fundDTO = ParseBeanUtil.parseFundVO2DTO(fundVO);
            request.setAttribute("dto", fundDTO);
            return "user/product/fundDetail";
        } catch (Exception e) {
            log.error("fundDetail failed fundDTO=" + fundDTO, e);
            return "error";
        }

    }

    @RequestMapping("/searchFundList")
    public String searchFundList(PageUtils pageUtils, FundDTO fundDTO, HttpServletRequest request, HttpServletResponse response) {
        if (pageUtils.getNumPerPage() <= 0) {
            pageUtils.setNumPerPage(20);
            pageUtils.setCurrentPage(1);
        }
        try {
            FundVO fundVO = ParseBeanUtil.parseFundDTO2VO(fundDTO);
            Page page = fundPageQueryService.searchPage(pageUtils, fundVO);
            page.setList(ParseBeanUtil.parseFundVO2DTO(page.getList()));
            request.setAttribute("page", page);
            return "user/product/fundProduct";
        } catch (Exception e) {
            log.error("fundList failed pageUtils=" + pageUtils, e);
            return "error";
        }

    }

    @RequestMapping("/currencyList")
    public String currencyList(PageUtils pageUtils, HttpServletRequest request, HttpServletResponse response) {
        if (pageUtils.getNumPerPage() <= 0) {
            pageUtils.setNumPerPage(20);
            pageUtils.setCurrentPage(1);
        }
        try {
            Page page = currencyPageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseCurrencyVO2DTO(page.getList()));
            request.setAttribute("page", page);
            return "user/product/currencyProduct";
        } catch (Exception e) {
            log.error("currencyList failed pageUtils=" + pageUtils, e);
            return "error";
        }

    }

    @RequestMapping("/currencyDetail")
    public String currencyDetail(CurrencyDTO currencyDTO, HttpServletRequest request, HttpServletResponse response) {
        try {
            CurrencyVO currencyVO = ParseBeanUtil.parseCurrencyDTO2VO(currencyDTO);
            currencyVO = currencyDAO.findByPK(currencyVO);
            currencyDTO = ParseBeanUtil.parseCurrencyVO2DTO(currencyVO);
            request.setAttribute("dto", currencyDTO);
            return "user/product/currencyDetail";
        } catch (Exception e) {
            log.error("currencyDetail failed currencyDTO=" + currencyDTO, e);
            return "error";
        }

    }

    @RequestMapping("/searchCurrencyList")
    public String searchCurrencyList(PageUtils pageUtils, CurrencyDTO currencyDTO, HttpServletRequest request, HttpServletResponse response) {
        if (pageUtils.getNumPerPage() <= 0) {
            pageUtils.setNumPerPage(20);
            pageUtils.setCurrentPage(1);
        }
        try {
            CurrencyVO currencyVO = ParseBeanUtil.parseCurrencyDTO2VO(currencyDTO);
            Page page = currencyPageQueryService.searchPage(pageUtils, currencyVO);
            page.setList(ParseBeanUtil.parseCurrencyVO2DTO(page.getList()));
            request.setAttribute("page", page);
            return "user/product/currencyProduct";
        } catch (Exception e) {
            log.error("currencyList failed pageUtils=" + pageUtils, e);
            return "error";
        }

    }
}
