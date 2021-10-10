package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.ReplyVO;
import com.damoyo.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> getList(Long b_num) {
		return mapper.getList(b_num);
	}

	@Override
	public void create(ReplyVO vo) {
		mapper.create(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(Long b_comment_num) {
		mapper.delete(b_comment_num);
	}

}
