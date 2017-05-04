package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.FundPurchaseVO;
import org.apache.ibatis.annotations.Param;

public interface FundPurchaseDAO extends BaseDao<FundPurchaseVO>{

	
	
	public FundPurchaseVO find(FundPurchaseVO vo);

	public List<FundPurchaseVO> findList(FundPurchaseVO vo);

	
	public int insert(FundPurchaseVO vo);
	
	public void update(FundPurchaseVO vo);
	
	public void delete(FundPurchaseVO vo);


	public int queryTotalNum();


	public List<FundPurchaseVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);


}
