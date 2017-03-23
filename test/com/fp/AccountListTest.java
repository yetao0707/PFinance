package com.fp;


import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.util.Assert;

import com.BaseTest;
import com.dao.AccountListDAO;
import com.vo.fp.AccountListVO;

public class AccountListTest extends BaseTest{
	
	public Logger log = Logger.getLogger(AccountListTest.class);
	
	@Autowired
	AccountListDAO dao;

	

	
	@Rollback(false)
	@Test
	public void find(){

		AccountListVO vo = new AccountListVO();
		vo.setId(1l);


		log.info("AccountListTest insert:" + dao.find(vo).toString());
	}
	
	@Rollback(false)
	@Test
	public void insert(){

		AccountListVO vo = new AccountListVO();

		vo.setAccountId(1l);
		vo.setItemContent("kkkk");
		vo.setItemVolume(99999d);

		int i=dao.insert(vo);
		Assert.isTrue(i>0);
		log.info("AccountListTest insert:" );
	}

	

}
