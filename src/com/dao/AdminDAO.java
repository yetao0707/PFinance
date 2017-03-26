package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.AdminVO;
import org.apache.ibatis.annotations.Param;

public interface AdminDAO extends BaseDao<AdminVO>{

	
	
	public AdminVO find(AdminVO vo);
	
	
	public int insert(AdminVO vo);
	
	public void update(AdminVO vo);
	
	public void delete(AdminVO vo);


	public int queryTotalNum();


	public List<AdminVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);

}
