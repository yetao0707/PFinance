package com;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations="classpath:spring-conf/ApplicationContext.xml")   
@RunWith(SpringJUnit4ClassRunner.class)
public class BaseTest extends  AbstractTransactionalJUnit4SpringContextTests {
	
	public Logger log = Logger.getLogger(BaseTest.class);
	@Rollback
	@Test
	public void findAll(){
		log.info("mongodb findAll:");
	}
}
