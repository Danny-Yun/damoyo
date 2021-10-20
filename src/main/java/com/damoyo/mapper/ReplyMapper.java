package com.damoyo.mapper;

import java.util.List;

import com.damoyo.domain.ReplyVO;

public interface ReplyMapper {
	
	// 특정 게시판 글의 전체 댓글 목록 가져오기
	public List<ReplyVO> getList(Long b_num);
	
	public void create(ReplyVO vo);
	
	public void update(ReplyVO vo);
	
	public void delete(Long b_comment_num);

}
