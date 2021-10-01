package com.damoyo.service;

import java.util.List;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.MyInterestVO;
import com.damoyo.domain.UserVO;

public interface UserService {
	
	// 로그인
	public UserVO userLogin(UserVO vo);
	
	// 회원가입
	public void userJoin(UserVO vo);
	
	// 관심사 카테고리 조회
	public List<ICateVO> showInterestCate();
	
	// 상세 관심사 조회
	public List<IDetailVO> showInterestDetail(int i_cate_num);
	
	// 상세 관심사 조회시 카테고리 이름 조회
	public List<ICateVO> showICateName(ICateNumDTO dto);
	
	// 유저가 선택한 (상세)관심사 저장
	public void saveUserInterest(MyInterestVO vo);
}
