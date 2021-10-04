package com.damoyo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.PhotolikeVO;
import com.damoyo.mapper.PhotoLikeMapper;

@Service
public class LikeServiceImpl implements likeService{
	
	@Autowired
	private PhotoLikeMapper mapper;
	
	@Override
	public void create(PhotolikeVO vo) {
		mapper.create(vo);
		
	}

	@Override
	public void update(Long p_like_num) {
		mapper.update(p_like_num);
		
	}


	@Override
	public void delete(Long p_num) {
		mapper.delete(p_num);
		
	}

}
