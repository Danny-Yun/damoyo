package com.damoyo.mapper;

import java.util.List;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardVO;

public interface BoardMapper {

	public BoardVO getBoard(Long b_num);
	
	public List<BoardVO> getBoards();
	
	public List<BoardCateVO> getBoardCate();
	
	public void insert(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public void delete(Long b_num);
	
}
