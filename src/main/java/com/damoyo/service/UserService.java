package com.damoyo.service;

import java.util.List;

import com.damoyo.domain.ICateVO;
import com.damoyo.domain.UserVO;

public interface UserService {
	
	// 회원가입
	public void userJoin(UserVO vo);
	
	// 관심사 카테고리 조회
	public List<ICateVO> showInterestCate();
}
