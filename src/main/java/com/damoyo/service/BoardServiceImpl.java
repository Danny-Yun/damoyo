package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardVO;
import com.damoyo.mapper.BoardMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public BoardVO getBoard(Long b_num) {
		
		return mapper.getBoard(b_num);
	}

	@Override
	public List<BoardVO> getBoards() {
		
		return mapper.getBoards();
	}
	
	@Override
	public List<BoardCateVO> getBoardCate() {
		return mapper.getBoardCate();
	}

	@Override
	public void insert(BoardVO vo) {
		
		mapper.insert(vo);
		
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void delete(Long b_num) {
		mapper.delete(b_num);
	}



	
}
