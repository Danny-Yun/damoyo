package com.damoyo.service;

import java.util.List;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardCriteria;
import com.damoyo.domain.BoardVO;

public interface BoardService {

	
//	public BoardVO getBoard(Long b_num);
	
	public List<BoardVO> getBoards(BoardCriteria cri, Long m_num);
	
	public void insertCate(BoardCateVO vo);
	
	public List<BoardCateVO> getBoardCate();
	
	public void insert(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public void delete(Long b_num);
	
	public int getTotalBoard(Long m_num);
}
