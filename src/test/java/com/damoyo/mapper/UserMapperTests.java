package com.damoyo.mapper;

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
public class UserMapperTests {
	@Autowired
	private UserMapper userMapper;
	
	//@Test
	public void testJoin() {
		UserVO vo = new UserVO();
		vo.setU_id("riudiu");
		vo.setU_pw("1111");
		vo.setU_name("윤지우");
		vo.setU_sex(0);
		vo.setU_birth(Date.valueOf("2001-05-14"));
		vo.setU_area("동탄");
		userMapper.join(vo);
	}
	
	//@Test
	public void testGetInterestCate() {
		userMapper.getInterestCate();
	}
	
	//@Test
	public void testGetInterestDetail() {
		int i_cate_num = 0;
		userMapper.getInterestDetail(i_cate_num);
	}

	//@Test
	public void testGetICateName() {
		ICateNumDTO dto = new ICateNumDTO();
		dto.setI_cate_num(new int[]{0, 1, 16});
		userMapper.getICateName(dto);
	}
	
	//@Test
	public void testSaveUserInterest() {
		MyInterestVO vo = new MyInterestVO();
		vo.setU_id("riudiu");
		vo.setI_detail_name("영어");
		userMapper.saveUserInterest(vo);
	}
	
	//@Test
	public void testLogin() {
		UserVO vo = new UserVO();
		vo.setU_id("riudiu");
		userMapper.login(vo);
	}

}