package com.service.impl;


import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyDAO;
import com.service.PageQueryService;
import com.vo.fp.CurrencyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by yetao on 17/3/5.
 */
@Component("currencyPageQueryService")
public class CurrencyPageQueryServiceImpl implements PageQueryService{

    @Autowired
    private CurrencyDAO currencyDAO;

    @Override
    public Page queryPage(PageUtils pageUtils){
        if (pageUtils==null){
            return null;
        }
        Page<CurrencyVO> page=new Page<CurrencyVO>();
        int totalNum=currencyDAO.queryTotalNum();
        int leftIndex=(pageUtils.getCurrentPage()-1)*pageUtils.getNumPerPage();
        int rightIndex=pageUtils.getCurrentPage()*pageUtils.getNumPerPage();
        if (rightIndex>totalNum){
            rightIndex=totalNum;
        }
        List<CurrencyVO> currencyVOList=currencyDAO.findPageList(leftIndex,rightIndex);
        int totalPage=pageUtils.getTotalCount()%pageUtils.getNumPerPage()==0?pageUtils.getTotalCount()/pageUtils.getNumPerPage():pageUtils.getTotalCount()/pageUtils.getNumPerPage()+1;
        pageUtils.setTotalCount(totalNum);
        pageUtils.setTotalPage(totalPage);
        page.setPage(pageUtils);
        page.setList(currencyVOList);
        return page;
    }

    @Override
    public Page searchPage(PageUtils pageUtils, Object object) {
        if (pageUtils==null){
            return null;
        }
        Page<CurrencyVO> page=new Page<CurrencyVO>();
        int totalNum=currencyDAO.searchCount((CurrencyVO) object);
        int leftIndex=(pageUtils.getCurrentPage()-1)*pageUtils.getNumPerPage();
        int rightIndex=pageUtils.getCurrentPage()*pageUtils.getNumPerPage();
        if (rightIndex>totalNum){
            rightIndex=totalNum;
        }
        List<CurrencyVO> currencyVOList=currencyDAO.search(leftIndex,rightIndex, (CurrencyVO) object);
        int totalPage=pageUtils.getTotalCount()%pageUtils.getNumPerPage()==0?pageUtils.getTotalCount()/pageUtils.getNumPerPage():pageUtils.getTotalCount()/pageUtils.getNumPerPage()+1;
        pageUtils.setTotalCount(totalNum);
        pageUtils.setTotalPage(totalPage);
        page.setPage(pageUtils);
        page.setList(currencyVOList);
        return page;
    }
}
