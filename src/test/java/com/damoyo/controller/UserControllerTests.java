package com.damoyo.controller;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		 "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"}
		)
@Log4j
@WebAppConfiguration
public class UserControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	// 브라우저 없이 모의로 접속하는 기능을 가진 객체
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testJoin() throws Exception {
		String resultPage = mockMvc.perform(
			MockMvcRequestBuilders.post("/user/join")
			.param("u_id", "lacvert")
			.param("u_pw", "1111")
			.param("u_name", "이지우")
			.param("u_sex", "1")
			.param("u_birth", "2000-04-14")
			.param("u_area", "인천"))
			.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	//@Test
	public void testGetInterestCate() throws Exception {
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.get("/user/interest"))
				.andReturn().getModelAndView().getViewName();
			log.info(resultPage);
	}
	
	//@Test
	public void testGetInterestDetail() throws Exception {
		int[] values = {1, 2, 3};
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/user/interest")
				.param("i_cate_num", Arrays.toString(values)))
				.andReturn().getModelAndView().getViewName();
			log.info(resultPage);
	}
	
	//@Test
	public void testSaveInterestDetail() throws Exception {
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/user/interest/detail")
				.param("u_id", "lacvert")
				.param("i_detail_name", "해외여행"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	//@Test
	public void testLogin() throws Exception {
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/user/login")
				.param("u_id", "lacvert"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
}
