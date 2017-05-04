package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.CustomerAccountVO;
import com.vo.fp.CustomerCommentVO;
import org.apache.ibatis.annotations.Param;

public interface CustomerCommentDAO extends BaseDao<CustomerCommentVO>{

	
	
	public CustomerCommentVO find(CustomerCommentVO vo);
	public List<CustomerCommentVO> findList(CustomerCommentVO vo);

	
	public int insert(CustomerCommentVO vo);
	
	public void update(CustomerCommentVO vo);
	
	public void delete(CustomerCommentVO vo);




	public int queryTotalNum();


	public List<CustomerCommentVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);

}
