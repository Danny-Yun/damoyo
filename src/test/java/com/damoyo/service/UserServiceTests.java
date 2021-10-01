package com.damoyo.service;

import static org.junit.Assert.assertNotNull;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.MyInterestDTO;
import com.damoyo.domain.MyInterestVO;
import com.damoyo.domain.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {
	
	@Autowired
	private UserService userService;
	
	// 서비스가 제대로 주입되었는지 여부만 확인
	//@Test
	public void testExist() {
		log.info(userService);
		// assertNotNull은 해당 객체가 주입이 되지 않아 null인 경우 에러를 발생시킨다.
		assertNotNull(userService);
	}
	
	//@Test
	public void testUserJoin() {
		UserVO vo = new UserVO();
		vo.setU_id("danny");
		vo.setU_pw("1234");
		vo.setU_name("지우");
		vo.setU_sex(0);
		vo.setU_birth(Date.valueOf("2001-05-13"));
		vo.setU_area("서울");
		userService.userJoin(vo);
	}
	
	//@Test
	public void testShowInterestCate() {
		userService.showInterestCate();
	}
	
	//@Test
	public void testShowInterestDetail() {
		int i_cate_num = 16;
		userService.showInterestDetail(i_cate_num);
	}
	
	//@Test
	public void testShowICateName() {
		ICateNumDTO dto = new ICateNumDTO();
		dto.setI_cate_num(new int[]{0, 3, 16});
		userService.showICateName(dto);
	}
	
	//@Test
	public void testSaveUserInterest() {
		MyInterestVO vo = new MyInterestVO();
		vo.setU_id("danny");
		vo.setI_detail_name("국내여행");
		userService.saveUserInterest(vo);
	}
	
	//@Test
	public void testUserLogin() {
		UserVO vo = new UserVO();
		vo.setU_id("danny");
		userService.userLogin(vo);
	}
}
