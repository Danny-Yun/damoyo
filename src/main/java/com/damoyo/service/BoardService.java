package com.damoyo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardLikeVO;
import com.damoyo.domain.BoardSearchCriteria;
import com.damoyo.domain.BoardVO;

public interface BoardService {

	
	public BoardVO getBoard(Long b_num);
	
	public List<BoardVO> getBoards(BoardSearchCriteria cri, Long m_num);
	
	public void insertCate(BoardCateVO vo);
	
	public List<BoardCateVO> getBoardCate();
	
	public void insert(BoardVO vo);
	
	public void update(BoardVO vo);
	
	public void delete(Long b_num);
	
	public int getTotalBoard(BoardSearchCriteria cri ,Long m_num);
	
	public int replyCnt(Long b_num);
	
	public int likeCnt(Long b_num);
	
	public BoardLikeVO checkLike(@Param("b_num")Long b_num, @Param("u_id")String u_id);
	
	public void clickLike(BoardLikeVO vo);
	
	public void clickLikeCancel(BoardLikeVO vo);
}
