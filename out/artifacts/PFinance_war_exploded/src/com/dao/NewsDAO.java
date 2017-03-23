package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.NewsVO;

public interface NewsDAO extends BaseDao<NewsVO>{

	
	
	public NewsVO find(NewsVO vo);
	
	
	public int insert(NewsVO vo);
	
	public void update(NewsVO vo);
	
	public void delete(NewsVO vo);



	public List<NewsVO> findPageList(Page<NewsVO> page);


}
