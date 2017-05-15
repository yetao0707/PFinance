package com.dao;

import com.vo.fp.FundPurchaseVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FundPurchaseDAO extends BaseDao<FundPurchaseVO>{

	
	
	public FundPurchaseVO find(FundPurchaseVO vo);

	public List<FundPurchaseVO> findList(FundPurchaseVO vo);

	
	public int insert(FundPurchaseVO vo);
	
	public void update(FundPurchaseVO vo);
	
	public void delete(FundPurchaseVO vo);


	public int queryTotalNum();


	public List<FundPurchaseVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);

	public List<FundPurchaseVO> findBetweenTime(@Param("beginDate")String beginDate, @Param("endDate") String endDate);



}
