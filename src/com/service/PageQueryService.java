package com.service;

import com.commons.page.Page;
import com.commons.page.PageUtils;
import com.dao.CurrencyDAO;
import com.vo.fp.CurrencyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by yetao on 17/3/5.
 */
public interface PageQueryService {

    public Page queryPage(PageUtils pageUtils);

    public Page searchPage(PageUtils pageUtils, Object object);

}
