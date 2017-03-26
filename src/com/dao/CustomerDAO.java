package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.CustomerVO;
import org.apache.ibatis.annotations.Param;

public interface CustomerDAO extends BaseDao<CustomerVO>{

	
	
	public CustomerVO find(CustomerVO vo);
	
	
	public int insert(CustomerVO vo);
	
	public void update(CustomerVO vo);
	
	public void delete(CustomerVO vo);


	public int queryTotalNum();


	public List<CustomerVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);


}
