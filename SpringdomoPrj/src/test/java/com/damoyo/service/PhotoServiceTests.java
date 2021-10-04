package com.damoyo.service;


import com.damoyo.domain.PhotoVO;
import com.damoyo.service.PhotoServiceTests;

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
public class PhotoServiceTests {
	@Autowired
	private PhotoService service;
	
	//@Test
	public void testExits() {
		log.info(service);
		
		assertNotNull(service);
	}
	
	//@Test
//	public void testregister() {
//		PhotoVO vo = new PhotoVO();
//		
//		vo.setP_cate_name("사진");
//		vo.setU_id("wa");
//		vo.setP_image1("첫번째 사진");
//		
//		service.enrollment(vo);
//	}
//	
	@Test
	public void testRemove() {
		service.delete(1L);
	}
}
