package com.damoyo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		log.info("사용자 회원가입 로직 실행 - " + vo);
		userMapper.join(vo);
	}
	
}
