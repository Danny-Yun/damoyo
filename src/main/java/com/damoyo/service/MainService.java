package com.damoyo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MainSearchCriteria;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyIMeetVO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.UserVO;

public interface MainService {
	// 임시_사용자 정보 가져오기
	public UserVO get(String u_id);
	
	// 관심사 카테고리 가져오기
	public List<InterestVO> get();
	
	// 생성된 모임 리스트 가져오기
	public List<MeetVO> getListMeet(MainSearchCriteria cri);
	
	// 모임 생성_프로필 null이 아닌 경우
	public void registerMeet(MeetVO vo);
	
	// 모임 생성_프로필 null인 경우
	public void registerMeet2(MeetVO vo);
	
	// 모임 디테일 가져오기
	public MeetVO getDetailMeet(Long m_num);
	
	// 모임 삭제
	public void removeMeet(Long m_num);
	
	// 모임 수정
	public void updateMeet(MeetVO vo);
	
	// 모임 수정_프로필 안 바꿀 경우
	public void updateMeet2(MeetVO vo);
	
	// 모입 생성 시 방장 모임 가입
	//public void adminJoinMeet(MeetMemberVO vo);
	
	// 모임 멤버 리스트 조회
	public List<MeetMemberVO> getMeetMemberList(Long num);
	
	// 모임 가입
	public void joinMeet(MeetMemberVO vo);
	
	// 모임 가입 여부
	public MeetMemberVO checkMeetJoin(MeetMemberVO vo);
	
	// 모임 탈퇴
	public void withdrawMeet(MeetMemberVO vo);
	
	// 모임 총 개수
	public int getTotalMeet(@Param("cri")MainSearchCriteria cri);
	
	// 모임 가입시 내가 가입한 모임에 저장
	public void saveMyJoinMeet(MyJoinMeetVO vo);
	
	// 모임 탈퇴시 내가 가입한 모임에서 삭제
	public void removeMyJoinMeet(MyJoinMeetVO vo);
	
	// 관심 모임 추가 여부
	public MyIMeetVO checkAddIMeet(MyIMeetVO vo);
	
	// 내 관심모임에 추가
	public void addIMeet(MyIMeetVO vo);
	
	// 내 관심모임에서 삭제
	public void deleteIMeet(MyIMeetVO vo);
}
