package com.service.impl;


import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyDAO;
import com.dao.CustomerDAO;
import com.dao.FundDAO;
import com.service.PageQueryService;
import com.vo.fp.CurrencyVO;
import com.vo.fp.CustomerVO;
import com.vo.fp.FundVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;


@Component("customerPageQueryService")
public class CustomerPageQueryServiceImpl implements PageQueryService{

    @Autowired
    private CustomerDAO customerDAO;

    @Override
    public Page queryPage(PageUtils pageUtils){
        if (pageUtils==null){
            return null;
        }
        Page<CustomerVO> page=new Page<CustomerVO>();
        int totalNum=customerDAO.queryTotalNum();
        int leftIndex=(pageUtils.getCurrentPage()-1)*pageUtils.getNumPerPage();
        int rightIndex=pageUtils.getCurrentPage()*pageUtils.getNumPerPage();
        if (rightIndex>totalNum){
            rightIndex=totalNum;
        }
        List<CustomerVO> list=customerDAO.findPageList(leftIndex,rightIndex-leftIndex);
        int totalPage=totalNum%pageUtils.getNumPerPage()==0?totalNum/pageUtils.getNumPerPage():totalNum/pageUtils.getNumPerPage()+1;
        pageUtils.setTotalCount(totalNum);
        pageUtils.setTotalPage(totalPage);
        page.setPage(pageUtils);
        page.setList(list);
        return page;
    }

    @Override
    public Page searchPage(PageUtils pageUtils, Object object) {
        return null;
    }
}
