package com.damoyo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MainSearchCriteria;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyIMeetVO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.UserVO;

public interface MainMapper {
	
	// 유저 정보
	public UserVO getUserInfo(String u_id);
	
	// 관심사 카테고리
	public List<InterestVO> getInterest();
	
	// 모임 출력
	public List<MeetVO> getListMeet(@Param("cri") MainSearchCriteria cri);
	
	// 모임 1개 디테일 출력
	public MeetVO getDetailMeet(Long m_num);
	
	// 모임 생성 및 모임 가입_프로필 null값이 아닌 경우
	public void insertMeet(MeetVO vo);
	
	// 모임 생성 및 모임 가입_프로필 null값인 경우
	public void insertMeet2(MeetVO vo);
	
	// 모임 삭제
	public void removeMeet(Long m_num);
	
	// 모임 수정
	public void updateMeet(MeetVO vo);

	// 모임 수정_프로필 안 바꿀 경우
	public void updateMeet2(MeetVO vo);
	
	// 모임 회원 리스트
	public List<MeetMemberVO> getMeetMemberList(Long m_num);
	
	// 모입 가입 여부
	public MeetMemberVO checkMeetJoin(MeetMemberVO vo);
	
	// 모임 가입
	public void joinMeet(MeetMemberVO vo);
	
	// 모임에 가입한 인원수 변경
	public void updateJoinPeopleCnt(@Param("vo")MeetMemberVO vo, @Param("amount")int amount);
	
	// 모임 탈퇴
	public void withdrawMeet(MeetMemberVO vo);
	
	// 모임 총 개수
	public int getTotalMeet(@Param("cri")MainSearchCriteria cri);
	
	// 모임 가입시 내가 가입한 모임에 저장
	public void saveMyJoinMeet(MyJoinMeetVO vo);
	
	// 모임 탈퇴시 내가 가입한 모임에서 삭제
	public void removeMyJoinMeet(MyJoinMeetVO vo);
	
	// 관심모임 추가 여부
	public MyIMeetVO checkAddIMeet(MyIMeetVO vo);
	
	// 내 관심모임에 추가
	public void addIMeet(MyIMeetVO vo);
	
	// 내 관심모임에서 삭제
	public void deleteIMeet(MyIMeetVO vo);
}
