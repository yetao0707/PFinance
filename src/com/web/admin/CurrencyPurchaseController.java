package com.web.admin;

import com.DTO.CurrencyPurchaseDTO;
import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyPurchaseDAO;
import com.google.gson.Gson;
import com.service.PageQueryService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.CurrencyPurchaseVO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("currencyPurchase")
public class CurrencyPurchaseController {

	@Resource
	private PageQueryService currencyPurchasePageQueryService;

	@Autowired
	private CurrencyPurchaseDAO currencyPurchaseDAO;

	private final String navTabId="currencyPurchaseListView";

	Logger log = Logger.getLogger(CurrencyPurchaseController.class);

	@RequestMapping("/currencyPurchaseList")
	public String currencyPurchaseList(PageUtils pageUtils,HttpServletRequest request,HttpServletResponse response){
		if (pageUtils.getNumPerPage()<=0){
			pageUtils.setNumPerPage(20);
			pageUtils.setCurrentPage(1);
		}
		try {
			Page page=currencyPurchasePageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseCurrencyPurchaseVO2DTO(page.getList()));
			request.setAttribute("page",page);
			return "currencyPurchase/currencyPurchaseListView";
		}catch (Exception e){
			log.error("currencyPurchaseList failed pageUtils="+pageUtils,e);
			return "error";
		}

	}

	@RequestMapping("update")
	public String update(CurrencyPurchaseVO vo, HttpServletRequest request) {
		try {
			if (vo.getId()==null){
				request.setAttribute("dto",vo);
				return "currencyPurchase/editcurrencyPurchase";
			}
            vo=currencyPurchaseDAO.find(vo);
            CurrencyPurchaseDTO dto=ParseBeanUtil.parseCurrencyPurchaseVO2DTO(vo);
			request.setAttribute("dto",dto);
			return "currencyPurchase/editcurrencyPurchase";
		} catch (Exception e){
			log.error("currencyPurchaseController update failed dto="+vo,e);
			return "error";
		}
	}

	@RequestMapping("delete")
	@ResponseBody
	public Object del(String ids,HttpServletRequest request,HttpServletResponse response) throws IOException {
		if (StringUtils.isEmpty(ids)){
			return DwzAjaxUtil.constructDelFailBean(navTabId);
		}
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
		try {
			List<Long> list=new ArrayList<>();
			String [] idStr=ids.split(",");
			for (int i=0;i<idStr.length;i++){
                if (StringUtils.isEmpty(idStr[i])){
                    continue;
                }
				list.add(Long.parseLong(idStr[i]));
			}
			currencyPurchaseDAO.batchDelete(list);
			dwzAjaxBea= DwzAjaxUtil.constructDelSuccessBean(navTabId);

		} catch (Exception e){
			log.error("currencyPurchaseController del faild ids="+ids,e);
			dwzAjaxBea= DwzAjaxUtil.constructDelFailBean("currencyPurchaseListView");
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;

	}


	@RequestMapping("save")
	@ResponseBody
	public Object save(CurrencyPurchaseDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
        CurrencyPurchaseVO vo = ParseBeanUtil.parseCurrencyPurchaseDTO2VO(dto);
        try {
			if (vo.getId()==null||vo.getId()<=0){
				currencyPurchaseDAO.insert(vo);
				dwzAjaxBea= DwzAjaxUtil.constructAddSuccessBean(navTabId);
			}else {
				currencyPurchaseDAO.update(vo);
				dwzAjaxBea= DwzAjaxUtil.constructUpdateSuccessBean(navTabId);
			}
		} catch (Exception e){
			log.error("currencyPurchaseController del faild currencyPurchaseDTO="+dto,e);
			dwzAjaxBea= DwzAjaxUtil.constructEditFailBean(navTabId);
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;
	}
}
