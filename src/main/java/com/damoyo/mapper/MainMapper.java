package com.damoyo.mapper;

import java.util.List;

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.UserVO;

public interface MainMapper {
	
	// 유저 정보
	public UserVO getUserInfo(String u_id);
	
	// 관심사 카테고리
	public List<InterestVO> getInterest();
	
	// 모임 출력
	public List<MeetVO> getListMeet();
	
	// 모임 1개 디테일 출력
	public MeetVO getDetailMeet(Long m_num);
	
	// 모임 생성 및 모임 가입
	public void insertMeet(MeetVO vo);
	
	// 모임 삭제
	public void removeMeet(Long m_num);
	
	// 모임 수정
	public void updateMeet(MeetVO vo);
	
	// 모임 회원 리스트
	public List<MeetMemberVO> getMeetMemberList(Long m_num);
	
	// 모임 가입
	public void joinMeet(MeetMemberVO vo);
}
