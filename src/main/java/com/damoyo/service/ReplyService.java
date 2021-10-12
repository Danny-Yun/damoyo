package com.damoyo.service;

import java.util.List;

import com.damoyo.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> getList(Long b_num);
	
	public void create(ReplyVO vo);
	
	public void update(ReplyVO vo);
	
	public void delete(Long b_comment_num);
}
