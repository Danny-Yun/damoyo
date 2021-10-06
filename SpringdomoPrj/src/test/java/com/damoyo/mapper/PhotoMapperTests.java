package com.damoyo.mapper;

import com.damoyo.mapper.PhotoMapperTests;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PhotoMapperTests {
	@Autowired
	private PhotoMapper mapper;
	
	//@Test
	public void testExits() {
		log.info(mapper);
		
		assertNotNull(mapper);
	}
	@Test
		public void testGetList() {
			// mapper 내부의 getList 메서드를 호출하려면?
			log.info(mapper.getList());
		}
}
