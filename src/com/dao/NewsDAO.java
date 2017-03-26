package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.NewsVO;
import org.apache.ibatis.annotations.Param;

public interface NewsDAO extends BaseDao<NewsVO>{

	
	
	public NewsVO find(NewsVO vo);
	
	
	public int insert(NewsVO vo);
	
	public void update(NewsVO vo);
	
	public void delete(NewsVO vo);

	public int queryTotalNum();


	public List<NewsVO> findPageList(@Param("leftIndex") int leftIndex, @Param("rightIndex") int rightIndex);


}
