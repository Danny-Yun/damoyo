package com.damoyo.service;

import com.damoyo.domain.PhotolikeVO;

public interface likeService {
	
	public void create(PhotolikeVO vo);
	
	public void update(Long p_like_num);
	
	public void delete(Long p_num);

	
	
	
}
