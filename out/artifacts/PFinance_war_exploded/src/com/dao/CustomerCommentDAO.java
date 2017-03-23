package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.CustomerCommentVO;

public interface CustomerCommentDAO extends BaseDao<CustomerCommentVO>{

	
	
	public CustomerCommentVO find(CustomerCommentVO vo);
	
	
	public int insert(CustomerCommentVO vo);
	
	public void update(CustomerCommentVO vo);
	
	public void delete(CustomerCommentVO vo);



	public List<CustomerCommentVO> findPageList(Page<CustomerCommentVO> page);


}
