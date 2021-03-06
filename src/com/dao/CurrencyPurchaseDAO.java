package com.dao;

import java.util.Date;
import java.util.List;

import com.commons.page.Page;
import com.vo.fp.CurrencyPurchaseVO;
import org.apache.ibatis.annotations.Param;

public interface CurrencyPurchaseDAO extends BaseDao<CurrencyPurchaseVO>{

	
	
	public CurrencyPurchaseVO find(CurrencyPurchaseVO vo);

	public List<CurrencyPurchaseVO> findList(CurrencyPurchaseVO vo);
	
	public int insert(CurrencyPurchaseVO vo);
	
	public void update(CurrencyPurchaseVO vo);
	
	public void delete(CurrencyPurchaseVO vo);


	public int queryTotalNum();


	public List<CurrencyPurchaseVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);

	public List<CurrencyPurchaseVO> findBetweenTime(@Param("beginDate")String beginDate, @Param("endDate") String endDate);

}
