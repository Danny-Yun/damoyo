package com.damoyo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
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

	@Override
	public List<IDetailVO> showInterestDetail(ArrayList<IDetailVO> voList) {
		log.info("상세 관심사 조회 서비스 실행 - " + voList);
		List<IDetailVO> iDetailList = userMapper.getInterestDetail(voList);
		return iDetailList;
	}
	
}
