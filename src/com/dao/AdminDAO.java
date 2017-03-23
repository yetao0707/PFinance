package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.AdminVO;

public interface AdminDAO extends BaseDao<AdminVO>{

	
	
	public AdminVO find(AdminVO vo);
	
	
	public int insert(AdminVO vo);
	
	public void update(AdminVO vo);
	
	public void delete(AdminVO vo);



	public List<AdminVO> findPageList(Page<AdminVO> page);


}
