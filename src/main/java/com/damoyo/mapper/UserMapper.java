package com.damoyo.mapper;

import java.util.ArrayList;
import java.util.List;

import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.UserVO;

public interface UserMapper {
	
	// 회원가입
	public void join(UserVO vo);
	
	// 관심사 카테고리 조회
	public List<ICateVO> getInterestCate();
	
	// 상세 관심사 조회
	public List<IDetailVO> getInterestDetail(ArrayList<IDetailVO> voList);
}
