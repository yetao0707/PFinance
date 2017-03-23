package com.fp;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import com.BaseTest;
import com.dao.AdminDAO;
import com.vo.fp.AdminVO;

public class AdminTest extends BaseTest{
	
	public Logger log = Logger.getLogger(AdminTest.class);
	
	@Autowired
	AdminDAO dao;

	

	
	@Rollback(false)
	@Test
	public void find(){

		AdminVO vo = new AdminVO();
		vo.setId(1l);
		try {
			System.out.println(dao.find(vo).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		

		log.info("AdminTest insert:" + dao.find(vo).toString());
	}
	
	@Rollback(false)
	@Test
	public void insert(){

		AdminVO vo = new AdminVO();

		vo.setUserName("kkk");
		vo.setPassword("11111");

		log.info("AdminTest insert:" + dao.insert(vo));
	}

	

}
