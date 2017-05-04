package com.dao;

import java.util.List;

import com.DTO.CurrencyDTO;
import com.commons.page.Page;
import com.vo.fp.CurrencyVO;
import org.apache.ibatis.annotations.Param;

public interface CurrencyDAO extends BaseDao<CurrencyVO>{

	
	
	public CurrencyVO findByPK(CurrencyVO vo);

	public List<CurrencyVO> findList(CurrencyVO vo);
	
	public int insert(CurrencyVO vo);
	
	public void update(CurrencyVO vo);
	
	public void delete(CurrencyVO vo);

	public int queryTotalNum();


	public List<CurrencyVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);

	public List<CurrencyVO> search(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex, @Param("vo")CurrencyVO vo);
	public int searchCount(@Param("vo")CurrencyVO vo);
}
