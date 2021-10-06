package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MainCriteria;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.mapper.MainMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mapper;

	@Override
	public UserVO get(String u_id) {
		log.info("user정보 조회");
		UserVO user = mapper.getUserInfo(u_id);
		return user;
	}
	
	@Override
	public List<InterestVO> get() {
		log.info("관심사 카테고리 조회");
		List<InterestVO> interestList = mapper.getInterest();
		return interestList;
	}

	@Override
	public List<MeetVO> getListMeet(MainCriteria cri) {
		log.info("생성된 모임 리스트 조회");
		List<MeetVO> listMeet = mapper.getListMeet(cri);
		return listMeet;
	}

	@Override
	public void registerMeet(MeetVO vo) {
		log.info("모임 생성");
		mapper.insertMeet(vo);
	}
	
	@Override
	public MeetVO getDetailMeet(Long m_num) {
		log.info("모임 디테일");
		MeetVO meet = mapper.getDetailMeet(m_num);
		return meet;
	}
	
	@Override
	public void removeMeet(Long m_num) {
		log.info("모임 삭제");
		mapper.removeMeet(m_num);
	}
	
	@Override
	public void updateMeet(MeetVO vo) {
		log.info("모임 수정");
		mapper.updateMeet(vo);
	}
	
	/*
	 * @Override public void adminJoinMeet(MeetMemberVO vo) {
	 * mapper.masterJoinMeet(vo); }
	 */
	
	@Override
	public List<MeetMemberVO> getMeetMemberList(Long num) {
		log.info("Mapper : 모임 가입한 멤버 조회");
		List<MeetMemberVO> memberList = mapper.getMeetMemberList(num);
		return memberList;
	}
	
	@Override
	public void joinMeet(MeetMemberVO vo) {
		mapper.joinMeet(vo);
	}
	
	@Override
	public MeetMemberVO checkMeetJoin(MeetMemberVO vo) {
		return mapper.checkMeetJoin(vo);
	}
	
	@Override
	public void withdrawMeet(MeetMemberVO vo) {
		mapper.withdrawMeet(vo);
	}
	
	@Override
	public int getTotalMeet() {
		return mapper.getTotalMeet();
	}
}
