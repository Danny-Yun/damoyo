package com.damoyo.mapper;

import com.damoyo.domain.PhotolikeVO;

public interface PhotoLikeMapper {
	public void create(PhotolikeVO vo);
	
	public void delete(Long p_num);
	
	public void update(Long p_like_num);
	
	public void read(PhotolikeVO vo);
	
	public void update_cancel(Long p_like_num);
}
