package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.CurrencyPurchaseVO;

public interface CurrencyPurchaseDAO extends BaseDao<CurrencyPurchaseVO>{

	
	
	public CurrencyPurchaseVO find(CurrencyPurchaseVO vo);
	
	
	public int insert(CurrencyPurchaseVO vo);
	
	public void update(CurrencyPurchaseVO vo);
	
	public void delete(CurrencyPurchaseVO vo);



	public List<CurrencyPurchaseVO> findPageList(Page<CurrencyPurchaseVO> page);


}
