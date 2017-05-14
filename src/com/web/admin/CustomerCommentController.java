package com.web.admin;

import com.DTO.CustomerCommentDTO;
import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CustomerCommentDAO;
import com.google.gson.Gson;
import com.service.PageQueryService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.CustomerCommentVO;
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
@RequestMapping("customerComment")
public class CustomerCommentController {

	@Resource
	private PageQueryService customerCommentPageQueryService;

	@Autowired
	private CustomerCommentDAO customerCommentDAO;

	private final String navTabId="customerCommentListView";

	Logger log = Logger.getLogger(CustomerCommentController.class);

	@RequestMapping("/customerCommentList")
	public String customerCommentList(PageUtils pageUtils,HttpServletRequest request,HttpServletResponse response){
		if (pageUtils.getNumPerPage()<=0){
			pageUtils.setNumPerPage(20);
			pageUtils.setCurrentPage(1);
		}
		try {
			Page page=customerCommentPageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseCustomerCommentVO2DTO(page.getList()));
			request.setAttribute("page",page);
			return "customerComment/customerCommentListView";
		}catch (Exception e){
			log.error("customerCommentList failed pageUtils="+pageUtils,e);
			return "error";
		}

	}

	@RequestMapping("update")
	public String update(CustomerCommentVO vo, HttpServletRequest request) {
		try {
			if (vo.getId()==null){
				request.setAttribute("dto",vo);
				return "customerComment/editCustomerComment";
			}
            vo=customerCommentDAO.find(vo);
            CustomerCommentDTO dto=ParseBeanUtil.parseCustomerCommentVO2DTO(vo);
			request.setAttribute("dto",dto);
			return "customerComment/editCustomerComment";
		} catch (Exception e){
			log.error("CustomerCommentController update failed dto="+vo,e);
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
			customerCommentDAO.batchDelete(list);
			dwzAjaxBea= DwzAjaxUtil.constructDelSuccessBean(navTabId);

		} catch (Exception e){
			log.error("CustomerCommentController del faild ids="+ids,e);
			dwzAjaxBea= DwzAjaxUtil.constructDelFailBean("customerCommentListView");
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;

	}


	@RequestMapping("save")
	@ResponseBody
	public Object save(CustomerCommentDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
        CustomerCommentVO vo = ParseBeanUtil.parseCustomerCommentDTO2VO(dto);
        try {
			if (vo.getId()==null||vo.getId()<=0){
				customerCommentDAO.insert(vo);
				dwzAjaxBea= DwzAjaxUtil.constructAddSuccessBean(navTabId);
			}else {
				vo.setReplyBy("Admin");
				customerCommentDAO.update(vo);
				dwzAjaxBea= DwzAjaxUtil.constructUpdateSuccessBean(navTabId);
				dwzAjaxBea.setMessage("回复成功");
			}
		} catch (Exception e){
			log.error("CustomerCommentController del faild CustomerCommentDTO="+dto,e);
			dwzAjaxBea= DwzAjaxUtil.constructEditFailBean(navTabId);
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;
	}
}
