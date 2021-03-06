package com.damoyo.service;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.MainCriteria;
import com.damoyo.domain.MainSearchCriteria;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MainServiceTests {
	
	@Autowired
	private MainService service;

//	@Test
	// 생성된 모임 리스트 조회
	public void testGetListMeet() {
		MainSearchCriteria cri = new MainSearchCriteria();
		log.info(cri.getPageNum());
		log.info(cri.getAmount());
		log.info(cri.getSearchType());
		log.info(cri.getKeyword());
	}
	
	// 모임 생성
//	@Test
	public void testRegisterMeet() {
		MeetVO vo = new MeetVO();
		log.info("모임 생성중...");
		vo.setM_name("홍대 방송댄스");
		vo.setM_content("취미로 방송댄스 하실분 모집! 초보 환영~");
		vo.setM_people_cnt(20);
		vo.setM_area("마포구");
		vo.setM_profile("");
		vo.setI_cate_num(8);
		vo.setU_id("wake");
		service.registerMeet(vo);
	}
	
//	@Test
	// 모임 디테일 조회
	public void testGetDetailMeet() {
		log.info(service.getDetailMeet(0L));
	}
	
//	@Test
	// 모임 삭제
	public void testRemoveMeet() {
		service.removeMeet(8L);
	}
	
//	@Test
	public void testUpdateMeet() {
		MeetVO vo = new MeetVO();
		log.info("모임 수정중");
		vo.setM_num(0L);
		vo.setM_name("한강 러닝/따릉이");
		vo.setM_content("러닝과 자전거 메이트 구합니다");
		vo.setM_people_cnt(18);
		vo.setM_area("용산구");
		vo.setM_profile("");
		vo.setI_cate_num(1);
		vo.setU_id("wake");
		service.updateMeet(vo);
	}
	
//	@Test
	// 모임 생성시 방장 모임 가입
	public void testAdminJoinMeet() {
		MeetMemberVO member = new MeetMemberVO();
		log.info("방장 모임 가입");
		member.setM_num(2L);
		member.setMember_list_position("모임장");
		member.setU_id("wake");
//		service.adminJoinMeet(member);
	}
	
//	@Test
	// 모임 멤버 리스트 조회
	public void testGetMeetMemberList() {
		log.info("모임 멤버 리스트 조회 중...");
		service.getMeetMemberList(1L);
	}
	
//	@Test
	// 모임 가입
	public void testJoinMeet() {
		MeetMemberVO vo = new MeetMemberVO();
		vo.setM_num(2L);
		vo.setU_id("wjddus");
		vo.setMember_list_position("");
		service.joinMeet(vo);
	}
	
//	@Test
	public void testCheckMeetJoin() {
		MeetMemberVO vo = new MeetMemberVO();
		vo.setM_num(14L);
		vo.setU_id("ekgus");
		service.checkMeetJoin(vo);
	}
	
//	@Test
	public void testWithdrawMeet() {
		MeetMemberVO vo = new MeetMemberVO();
		vo.setM_num(13L);
		vo.setU_id("thffk");
		service.withdrawMeet(vo);
	}
	
	@Test
	public void testGetMeetList() {
		log.info("테스트_모임리스트 가져오기");
		MainSearchCriteria cri = new MainSearchCriteria();
		log.info("cri : " + cri);
		for (int i = 0; i < cri.getAmount(); i++) {
			log.info(i);
		}
	}
	
}
