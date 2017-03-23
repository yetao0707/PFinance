package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.FundVO;

public interface FundDAO extends BaseDao<FundVO>{

	
	
	public FundVO find(FundVO vo);
	
	
	public int insert(FundVO vo);
	
	public void update(FundVO vo);
	
	public void delete(FundVO vo);



	public List<FundVO> findPageList(Page<FundVO> page);


}
