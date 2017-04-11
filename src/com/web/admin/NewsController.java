package com.web.admin;

import com.DTO.NewsDTO;
import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.NewsDAO;
import com.google.gson.Gson;
import com.service.PageQueryService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.NewsVO;
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
@RequestMapping("news")
public class NewsController {

	@Resource
	private PageQueryService newsPageQueryService;

	@Autowired
	private NewsDAO newsDAO;

	private final String navTabId="newsListView";

	Logger log = Logger.getLogger(NewsController.class);

	@RequestMapping("/newsList")
	public String newsList(PageUtils pageUtils,HttpServletRequest request,HttpServletResponse response){
		if (pageUtils.getNumPerPage()<=0){
			pageUtils.setNumPerPage(20);
			pageUtils.setCurrentPage(1);
		}
		try {
			Page page=newsPageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseNewsVO2DTO(page.getList()));
			request.setAttribute("page",page);
			return "news/newsListView";
		}catch (Exception e){
			log.error("newsList failed pageUtils="+pageUtils,e);
			return "error";
		}

	}

	@RequestMapping("update")
	public String update(NewsVO vo, HttpServletRequest request) {
		try {
			if (vo.getId()==null){
				request.setAttribute("dto",vo);
				return "news/editNews";
			}
            vo=newsDAO.find(vo);
            NewsDTO dto=ParseBeanUtil.parseNewsVO2DTO(vo);
			request.setAttribute("dto",dto);
			return "news/editNews";
		} catch (Exception e){
			log.error("NewsController update failed dto="+vo,e);
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
			newsDAO.batchDelete(list);
			dwzAjaxBea= DwzAjaxUtil.constructDelSuccessBean(navTabId);

		} catch (Exception e){
			log.error("NewsController del faild ids="+ids,e);
			dwzAjaxBea= DwzAjaxUtil.constructDelFailBean("newsListView");
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;

	}


	@RequestMapping("save")
	@ResponseBody
	public Object save(NewsDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
        NewsVO vo = ParseBeanUtil.parseNewsDTO2VO(dto);
        try {
			if (vo.getId()==null||vo.getId()<=0){
				newsDAO.insert(vo);
				dwzAjaxBea= DwzAjaxUtil.constructAddSuccessBean(navTabId);
			}else {
				newsDAO.update(vo);
				dwzAjaxBea= DwzAjaxUtil.constructUpdateSuccessBean(navTabId);
			}
		} catch (Exception e){
			log.error("NewsController del faild NewsDTO="+dto,e);
			dwzAjaxBea= DwzAjaxUtil.constructEditFailBean(navTabId);
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;
	}
}
