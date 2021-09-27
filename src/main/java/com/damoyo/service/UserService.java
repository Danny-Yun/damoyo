package com.damoyo.service;

import java.util.ArrayList;
import java.util.List;

import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.UserVO;

public interface UserService {
	
	// 회원가입
	public void userJoin(UserVO vo);
	
	// 관심사 카테고리 조회
	public List<ICateVO> showInterestCate();
	
	// 상세 관심사 조회
	public List<IDetailVO> showInterestDetail(ArrayList<IDetailVO> voList);
}
