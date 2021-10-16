package com.damoyo.mapper;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.MyInterestVO;
import com.damoyo.domain.MyJoinMeetVO;
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
	public void testGetIdCount() {
		String u_id = "asdasdddd";
//		String u_id = "riudiu";
		
		userMapper.getIdCount(u_id);
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

	//@Test
	public void testGetProfile() {
		String u_id = "riudiu";
		userMapper.getProfile(u_id);
	}
	
	//@Test
	public void testModifyProfile() {
		UserVO vo = new UserVO();
		vo.setU_profile("null");
		vo.setU_name("윤지우");
		vo.setU_sex(1);
		vo.setU_birth(Date.valueOf("2001-05-14"));
		vo.setU_area("동탄2신도시");
		vo.setU_intro("21살 청년입니다.");
		vo.setU_id("riudiu");
		userMapper.modifyProfile(vo);
	}
	
	//@Test
	public void testGetUserInterest() {
		String u_id = "riudiu";
		userMapper.getUserInterest(u_id);
	}
	
	//@Test
	public void testDeleteInterest() {
		int f_interest_num = 3;
		userMapper.deleteInterest(f_interest_num);
	}
	
	//@Test
	public void testUpdatePassword() {
		UserVO vo = new UserVO();
		vo.setU_id("riudiu");
		vo.setU_pw("jiu123123");
		userMapper.updatePassword(vo);
	}

	//@Test 
	public void testGetDetailCount() {
		String u_id = "riudiu";
		userMapper.getDetailCount(u_id);
	}
	
	//@Test
	public void testDeleteAccount() {
		String u_id = "riudiu";
		userMapper.deleteAccount(u_id);
	}
	
	//@Test 
	public void testGetMyMeet() {
		String u_id = "riudiu";
		userMapper.getMyMeet(u_id);
	}
	
	//@Test 
	public void testGetInterestMeet() {
		String u_id = "riudiu";
		userMapper.getInterestMeet(u_id);
	}
	
	//@Test 
	public void testAddStar() {
		MyJoinMeetVO vo = new MyJoinMeetVO();
		vo.setU_id("riudiu");
		vo.setM_num(1L);
		userMapper.addStar(vo);
	}
	
	//@Test 
	public void testDeleteStar() {
		MyJoinMeetVO vo = new MyJoinMeetVO();
		vo.setU_id("riudiu");
		vo.setM_num(1L);
		userMapper.deleteStar(vo);
	}
}
