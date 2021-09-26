package com.damoyo.mapper;

import com.damoyo.domain.UserVO;

public interface UserMapper {
	
	// 회원가입
	public void join(UserVO vo);
}
