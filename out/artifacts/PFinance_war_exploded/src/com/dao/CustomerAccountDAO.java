package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.CustomerAccountVO;

public interface CustomerAccountDAO extends BaseDao<CustomerAccountVO>{

	
	
	public CustomerAccountVO find(CustomerAccountVO vo);
	
	
	public int insert(CustomerAccountVO vo);
	
	public void update(CustomerAccountVO vo);
	
	public void delete(CustomerAccountVO vo);

	public List<CustomerAccountVO> findPageList(Page<CustomerAccountVO> page);


}
