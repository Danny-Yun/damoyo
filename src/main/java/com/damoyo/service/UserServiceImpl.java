package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.MyInterestVO;
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
		log.info("사용자 로그인 서비스 실행 - " + vo);
		UserVO user = userMapper.login(vo);
		return user;
	}

	// 회원가입
	@Override
	public void userJoin(UserVO vo) {
		log.info("사용자 회원가입 서비스 실행 - " + vo);
		userMapper.join(vo);
	}

	// 관심사 카테고리 조회
	@Override
	public List<ICateVO> showInterestCate() {
		log.info("회원가입 후 관심사 조회 서비스 실행");
		List<ICateVO> iCateList = userMapper.getInterestCate();
		return iCateList;
	}

	// 상세 관심사 조회
	@Override
	public List<IDetailVO> showInterestDetail(int i_cate_num) {
		log.info("상세 관심사 조회 서비스 실행 - " + i_cate_num);
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
		log.info("관심사 저장 서비스 실행 - " + vo);
		userMapper.saveUserInterest(vo);
	}

	// 사용자 프로필 정보 조회
	@Override
	public UserVO showProfile(String u_id) {
		log.info("마이페이지 프로필 조회 서비스 실행 - " + u_id);
		UserVO profile = userMapper.getProfile(u_id);
		return profile;
	}

	// 사용자 프로필 정보 수정
	@Override
	public void modifyProfile(UserVO vo) {
		log.info("사용자 프로필 수정 서비스 실행 - " + vo);
		userMapper.modifyProfile(vo);
	}
	
}
