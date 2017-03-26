package com.web.admin;

import com.DTO.CustomerDTO;
import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CustomerDAO;
import com.google.gson.Gson;
import com.service.PageQueryService;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.CustomerVO;
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
@RequestMapping("customer")
public class CustomerController {

	@Resource
	private PageQueryService customerPageQueryService;

	@Autowired
	private CustomerDAO customerDAO;

	private final String navTabId="customerListView";

	Logger log = Logger.getLogger(CustomerController.class);

	@RequestMapping("/customerList")
	public String customerList(PageUtils pageUtils,HttpServletRequest request,HttpServletResponse response){
		if (pageUtils.getNumPerPage()<=0){
			pageUtils.setNumPerPage(20);
			pageUtils.setCurrentPage(1);
		}
		try {
			Page page=customerPageQueryService.queryPage(pageUtils);
            page.setList(ParseBeanUtil.parseCustomerVO2DTO(page.getList()));
			request.setAttribute("page",page);
			return "customer/customerListView";
		}catch (Exception e){
			log.error("customerList failed pageUtils="+pageUtils,e);
			return "error";
		}

	}

	@RequestMapping("update")
	public String update(CustomerVO vo, HttpServletRequest request) {
		try {
			if (vo.getId()==null){
				request.setAttribute("dto",vo);
				return "customer/editCustomer";
			}
            vo=customerDAO.find(vo);
            CustomerDTO dto=ParseBeanUtil.parseCustomerVO2DTO(vo);
			request.setAttribute("dto",dto);
			return "customer/editCustomer";
		} catch (Exception e){
			log.error("CustomerController update failed dto="+vo,e);
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
			customerDAO.batchDelete(list);
			dwzAjaxBea= DwzAjaxUtil.constructDelSuccessBean(navTabId);

		} catch (Exception e){
			log.error("CustomerController del faild ids="+ids,e);
			dwzAjaxBea= DwzAjaxUtil.constructDelFailBean("customerListView");
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;

	}


	@RequestMapping("save")
	@ResponseBody
	public Object save(CustomerDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Gson gson=new Gson();
		DwzAjaxBean dwzAjaxBea=new DwzAjaxBean();
        CustomerVO vo = ParseBeanUtil.parseCustomerDTO2VO(dto);
        try {
			if (vo.getId()==null||vo.getId()<=0){
				customerDAO.insert(vo);
				dwzAjaxBea= DwzAjaxUtil.constructAddSuccessBean(navTabId);
			}else {
				customerDAO.update(vo);
				dwzAjaxBea= DwzAjaxUtil.constructUpdateSuccessBean(navTabId);
			}
		} catch (Exception e){
			log.error("CustomerController del faild CustomerDTO="+dto,e);
			dwzAjaxBea= DwzAjaxUtil.constructEditFailBean(navTabId);
		}
		final PrintWriter out = response.getWriter();
		out.print(gson.toJson(dwzAjaxBea));
		return null;
	}
}
