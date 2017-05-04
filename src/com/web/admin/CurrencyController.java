package com.web.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyDAO;
import com.google.gson.Gson;
import com.service.PageQueryService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.CurrencyVO;
import com.DTO.CurrencyDTO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("currency")
public class CurrencyController  {

	@Resource
	private PageQueryService currencyPageQueryService;

	@Autowired
	private CurrencyDAO currencyDAO;

	private final String navTabId="currencyListView";

	Logger log = Logger.getLogger(CurrencyController.class);

	@RequestMapping("/currencyList")
	public String currencyList(PageUtils pageUtils,HttpServletRequest request,HttpServletResponse response){
		if (pageUtils.getNumPerPage()<=0){
			pageUtils.setNumPerPage(20);
			pageUtils.setCurrentPage(1);
		}
		try {
			Page page=currencyPageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseCurrencyVO2DTO(page.getList()));
			request.setAttribute("page",page);
			return "currency/currencyListView";
		}catch (Exception e){
			log.error("currencyList failed pageUtils="+pageUtils,e);
			return "error";
		}

	}

	@RequestMapping("update")
	public String update(CurrencyVO vo, HttpServletRequest request) {
		try {
			if (vo.getId()==null){
				request.setAttribute("dto",vo);
				return "currency/editCurrency";
			}
			vo = currencyDAO.findByPK(vo);
			CurrencyDTO dto=ParseBeanUtil.parseCurrencyVO2DTO(vo);
			request.setAttribute("dto",dto);
			return "currency/editCurrency";
		} catch (Exception e){
			log.error("CurrencyController update failed dto="+vo,e);
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
			List<Long> list=new ArrayList<Long>();
			String [] idStr=ids.split(",");
			for (int i=0;i<idStr.length;i++){
                if (StringUtils.isEmpty(idStr[i])){
                    continue;
                }
				list.add(Long.parseLong(idStr[i]));
			}
			currencyDAO.batchDelete(list);
			dwzAjaxBea= DwzAjaxUtil.constructDelSuccessBean(navTabId);

		} catch (Exception e){
			log.error("CurrencyController del faild ids="+ids,e);
			dwzAjaxBea= DwzAjaxUtil.constructDelFailBean("currencyListView");
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;

	}


	@RequestMapping("save")
	@ResponseBody
	public Object save(CurrencyDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
        CurrencyVO vo = ParseBeanUtil.parseCurrencyDTO2VO(dto);
        try {
			if (vo.getId()==null||vo.getId()<=0){
				currencyDAO.insert(vo);
				dwzAjaxBea= DwzAjaxUtil.constructAddSuccessBean(navTabId);
			}else {
				currencyDAO.update(vo);
				dwzAjaxBea= DwzAjaxUtil.constructUpdateSuccessBean(navTabId);
			}
		} catch (Exception e){
			log.error("CurrencyController del faild CurrencyDTO="+dto,e);
			dwzAjaxBea= DwzAjaxUtil.constructEditFailBean(navTabId);
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;
	}
}
