package com.web.admin;

import com.DTO.FundPurchaseDTO;
import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.FundPurchaseDAO;
import com.google.gson.Gson;
import com.service.PageQueryService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.FundPurchaseVO;
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
@RequestMapping("fundPurchase")
public class FundPurchaseController {

	@Resource
	private PageQueryService fundPurchasePageQueryService;

	@Autowired
	private FundPurchaseDAO fundPurchaseDAO;

	private final String navTabId="fundPurchaseListView";

	Logger log = Logger.getLogger(FundPurchaseController.class);

	@RequestMapping("/fundPurchaseList")
	public String fundPurchaseList(PageUtils pageUtils,HttpServletRequest request,HttpServletResponse response){
		if (pageUtils.getNumPerPage()<=0){
			pageUtils.setNumPerPage(20);
			pageUtils.setCurrentPage(1);
		}
		try {
			Page page=fundPurchasePageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseFundPurchaseVO2DTO(page.getList()));
			request.setAttribute("page",page);
			return "fundPurchase/fundPurchaseListView";
		}catch (Exception e){
			log.error("fundPurchaseList failed pageUtils="+pageUtils,e);
			return "error";
		}

	}

	@RequestMapping("update")
	public String update(FundPurchaseVO vo, HttpServletRequest request) {
		try {
			if (vo.getId()==null){
				request.setAttribute("dto",vo);
				return "fundPurchase/editfundPurchase";
			}
            vo=fundPurchaseDAO.find(vo);
            FundPurchaseDTO dto=ParseBeanUtil.parseFundPurchaseVO2DTO(vo);
			request.setAttribute("dto",dto);
			return "fundPurchase/editfundPurchase";
		} catch (Exception e){
			log.error("fundPurchaseController update failed dto="+vo,e);
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
			fundPurchaseDAO.batchDelete(list);
			dwzAjaxBea= DwzAjaxUtil.constructDelSuccessBean(navTabId);

		} catch (Exception e){
			log.error("fundPurchaseController del faild ids="+ids,e);
			dwzAjaxBea= DwzAjaxUtil.constructDelFailBean("fundPurchaseListView");
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;

	}


	@RequestMapping("save")
	@ResponseBody
	public Object save(FundPurchaseDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
        FundPurchaseVO vo = ParseBeanUtil.parseFundPurchaseDTO2VO(dto);
        try {
			if (vo.getId()==null||vo.getId()<=0){
				fundPurchaseDAO.insert(vo);
				dwzAjaxBea= DwzAjaxUtil.constructAddSuccessBean(navTabId);
			}else {
				fundPurchaseDAO.update(vo);
				dwzAjaxBea= DwzAjaxUtil.constructUpdateSuccessBean(navTabId);
			}
		} catch (Exception e){
			log.error("fundPurchaseController del faild fundPurchaseDTO="+dto,e);
			dwzAjaxBea= DwzAjaxUtil.constructEditFailBean(navTabId);
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;
	}
}
