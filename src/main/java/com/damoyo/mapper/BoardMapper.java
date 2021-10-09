package com.damoyo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardSearchCriteria;
import com.damoyo.domain.BoardVO;

public interface BoardMapper {

//	public BoardVO getBoard(Long b_num);
	
	public List<BoardVO> getBoards(@Param("cri")BoardSearchCriteria cri, 
								@Param("m_num")Long m_num);
	
	public void insertCate(BoardCateVO vo);
	
	public List<BoardCateVO> getBoardCate();
	
	public void insert(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public void delete(Long b_num);
	
	public int getTotalBoard(@Param("cri")BoardSearchCriteria cri, 
							@Param("m_num")Long m_num);
}
