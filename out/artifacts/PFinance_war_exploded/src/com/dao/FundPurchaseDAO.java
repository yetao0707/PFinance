package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.FundPurchaseVO;

public interface FundPurchaseDAO extends BaseDao<FundPurchaseVO>{

	
	
	public FundPurchaseVO find(FundPurchaseVO vo);
	
	
	public int insert(FundPurchaseVO vo);
	
	public void update(FundPurchaseVO vo);
	
	public void delete(FundPurchaseVO vo);



	public List<FundPurchaseVO> findPageList(Page<FundPurchaseVO> page);


}
