package com.damoyo.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.PlanVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PlanMapperTests {

	@Autowired
	private PlanMapper mapper;
	
	@Test
	public void testInsertPlan() {
		PlanVO vo = new PlanVO();
		vo.setM_plan_name("test");
		vo.setM_plan_people_cnt(10);
	}
}
