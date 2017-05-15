package com.service.impl;


import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyDAO;
import com.dao.FundDAO;
import com.service.PageQueryService;
import com.vo.fp.CurrencyVO;
import com.vo.fp.FundVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;


@Component("fundPageQueryService")
public class FundPageQueryServiceImpl implements PageQueryService{

    @Autowired
    private FundDAO fundDAO;

    @Override
    public Page queryPage(PageUtils pageUtils){
        if (pageUtils==null){
            return null;
        }
        Page<FundVO> page=new Page<FundVO>();
        int totalNum=fundDAO.queryTotalNum();
        int leftIndex=(pageUtils.getCurrentPage()-1)*pageUtils.getNumPerPage();
        int rightIndex=pageUtils.getCurrentPage()*pageUtils.getNumPerPage();
        if (rightIndex>totalNum){
            rightIndex=totalNum;
        }
        List<FundVO> list=fundDAO.findPageList(leftIndex,rightIndex-leftIndex);
        int totalPage=totalNum%pageUtils.getNumPerPage()==0?totalNum/pageUtils.getNumPerPage():totalNum/pageUtils.getNumPerPage()+1;
        pageUtils.setTotalCount(totalNum);
        pageUtils.setTotalPage(totalPage);
        page.setPage(pageUtils);
        page.setList(list);
        return page;
    }

    @Override
    public Page searchPage(PageUtils pageUtils, Object fundVO) {
        if (pageUtils==null){
            return null;
        }
        Page<FundVO> page=new Page<FundVO>();
        int totalNum=fundDAO.searchCount((FundVO) fundVO);
        int leftIndex=(pageUtils.getCurrentPage()-1)*pageUtils.getNumPerPage();
        int rightIndex=pageUtils.getCurrentPage()*pageUtils.getNumPerPage();
        if (rightIndex>totalNum){
            rightIndex=totalNum;
        }
        List<FundVO> list=fundDAO.search(leftIndex,rightIndex-leftIndex, (FundVO) fundVO);
        int totalPage=pageUtils.getTotalCount()%pageUtils.getNumPerPage()==0?pageUtils.getTotalCount()/pageUtils.getNumPerPage():pageUtils.getTotalCount()/pageUtils.getNumPerPage()+1;
        pageUtils.setTotalCount(totalNum);
        pageUtils.setTotalPage(totalPage);
        page.setPage(pageUtils);
        page.setList(list);
        return page;
    }
}
