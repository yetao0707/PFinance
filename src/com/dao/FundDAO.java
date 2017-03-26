package com.dao;

import com.vo.fp.FundVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FundDAO extends BaseDao<FundVO>{

	
	
	public FundVO find(FundVO vo);
	
	
	public int insert(FundVO vo);
	
	public void update(FundVO vo);
	
	public void delete(FundVO vo);


	public int queryTotalNum();


	public List<FundVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);


}
