package com.dao;

import java.util.List;

import com.commons.page.Page;
import com.vo.fp.AccountListVO;

public interface AccountListDAO extends BaseDao<AccountListVO>{

	
	
	public AccountListVO find(AccountListVO vo);
	
	
	public int insert(AccountListVO vo);
	
	public void update(AccountListVO vo);
	
	public void delete(AccountListVO vo);



	public List<AccountListVO> findPageList(Page<AccountListVO> page);


}
