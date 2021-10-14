package com.damoyo.service;

import java.util.List;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.MyIMeetDTO;
import com.damoyo.domain.MyInterestVO;
import com.damoyo.domain.MyJoinMeetDTO;
import com.damoyo.domain.UserVO;

public interface UserService {
	
	// 로그인
	public UserVO userLogin(UserVO vo);
	
	// 회원가입
	public void userJoin(UserVO vo);
	
	// 아이디 중복확인 
	public int showIdCount(String u_id);
	
	// 관심사 카테고리 조회
	public List<ICateVO> showInterestCate();
	
	// 상세 관심사 조회
	public List<IDetailVO> showInterestDetail(int i_cate_num);
	
	// 상세 관심사 조회시 카테고리 이름 조회
	public List<ICateVO> showICateName(ICateNumDTO dto);
	
	// 유저가 선택한 (상세)관심사 저장
	public void saveUserInterest(MyInterestVO vo);
	
	// 사용자 프로필 정보 조회
	public UserVO showProfile(String u_id);
	
	// 사용자 프로필 정보 수정
	public void modifyProfile(UserVO vo);
	
	// 마이페이지에서 내 관심사 조회
	public List<MyInterestVO> showUserInterest(String u_id);
	
	// 내 관심사 삭제
	public void deleteInterest(int f_interest_num);
	
	// 비밀번호 변경
	public void modifyPassword(UserVO vo);
	
	// 회원 탈퇴
	public void removeAccount(String u_id);
	
	// 관심사 최대 개수를 제한하기 위해 유저의 관심사 개수 조회 
	public int showDetailCount(String u_id);
	
	// 내 모임 조회
	public List<MyJoinMeetDTO> showMyMeet(String u_id);
	
	// 내 관심 모임 조회
	public List<MyIMeetDTO> showInterestMeet(String u_id);
}
