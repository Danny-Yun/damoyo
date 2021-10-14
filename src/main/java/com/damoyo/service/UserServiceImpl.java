package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyIMeetDTO;
import com.damoyo.domain.MyIMeetVO;
import com.damoyo.domain.MyInterestVO;
import com.damoyo.domain.MyJoinMeetDTO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	// 로그인
	@Override
	public UserVO userLogin(UserVO vo) {
		UserVO user = userMapper.login(vo);
		return user;
	}

	// 회원가입
	@Override
	public void userJoin(UserVO vo) {
		userMapper.join(vo);
	}
	
	// 아이디 중복확인
	@Override
	public int showIdCount(String u_id) {
		int result = userMapper.getIdCount(u_id);
		return result;
	}

	// 관심사 카테고리 조회
	@Override
	public List<ICateVO> showInterestCate() {
		List<ICateVO> iCateList = userMapper.getInterestCate();
		return iCateList;
	}

	// 상세 관심사 조회
	@Override
	public List<IDetailVO> showInterestDetail(int i_cate_num) {
		List<IDetailVO> iDetailList = userMapper.getInterestDetail(i_cate_num);
		return iDetailList;
	}
	
	// 상세 관심사 조회시 카테고리 이름 조회
	@Override
	public List<ICateVO> showICateName(ICateNumDTO dto) {
		List<ICateVO> iCateNameList = userMapper.getICateName(dto);
		return iCateNameList;
	}

	// 유저가 선택한 (상세)관심사 저장
	@Override
	public void saveUserInterest(MyInterestVO vo) {
		userMapper.saveUserInterest(vo);
	}

	// 사용자 프로필 정보 조회
	@Override
	public UserVO showProfile(String u_id) {
		UserVO profile = userMapper.getProfile(u_id);
		return profile;
	}

	// 사용자 프로필 정보 수정
	@Override
	public void modifyProfile(UserVO vo) {
		userMapper.modifyProfile(vo);
	}

	// 마이페이지에서 내 관심사 조회
	@Override
	public List<MyInterestVO> showUserInterest(String u_id) {
		List<MyInterestVO> myInterest = userMapper.getUserInterest(u_id);
		return myInterest;
	}

	// 내 관심사 삭제
	@Override
	public void deleteInterest(int f_interest_num) {
		userMapper.deleteInterest(f_interest_num);
	}

	// 비밀번호 변경
	@Override
	public void modifyPassword(UserVO vo) {
		userMapper.updatePassword(vo);
	}

	// 회원 탈퇴
	@Override
	public void removeAccount(String u_id) {
		userMapper.deleteAccount(u_id);
	}

	// 관심사 최대 개수를 제한하기 위해 유저의 관심사 개수 조회 
	@Override
	public int showDetailCount(String u_id) {
		int i_num = userMapper.getDetailCount(u_id);
		return i_num;
	}

	// 내 모임 조회
	@Override
	public List<MyJoinMeetDTO> showMyMeet(String u_id) {
		List<MyJoinMeetDTO> myMeetList = userMapper.getMyMeet(u_id);
		return myMeetList;
	}

	// 내 관심 모임 조회
	@Override
	public List<MyIMeetDTO> showInterestMeet(String u_id) {
		List<MyIMeetDTO> interestMeetList = userMapper.getInterestMeet(u_id);
		return interestMeetList;
	}

}
