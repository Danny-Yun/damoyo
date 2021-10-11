package com.damoyo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardLikeVO;
import com.damoyo.domain.BoardSearchCriteria;
import com.damoyo.domain.BoardVO;

public interface BoardMapper {

	// 게시판 리스트
	public List<BoardVO> getBoards(@Param("cri")BoardSearchCriteria cri, 
			@Param("m_num")Long m_num);
	
	// 게시판 디테일
	public BoardVO getBoard(Long b_num);
	
	// 게시판 생성
	public void insert(BoardVO vo);
	
	// 게시판 수정
	public void update(BoardVO vo);
	
	// 게시판 삭제
	public void delete(Long b_num);
	
	// 게시판 전체 갯수
	public int getTotalBoard(@Param("cri")BoardSearchCriteria cri, 
							@Param("m_num")Long m_num);
	
	// 게시판 카테고리 생성
	public void insertCate(BoardCateVO vo);
	
	// 게시판 카테고리 불러오기
	public List<BoardCateVO> getBoardCate();
	
	// 게시판 뷰 업데이트
	public void upView(Long b_num);
	
	// 댓글 갯수
	public int replyCnt(Long b_num);
	
	// 게시판 좋아요 수
	public int likeCnt(Long b_num);
	
	// 게시판 좋아요 본인 확인
	public BoardLikeVO checkLike(@Param("b_num")Long b_num, @Param("u_id")String u_id);
	
	// 게시판 좋아요 클릭
	public void clickLike(BoardLikeVO vo);
	
	// 게시판 좋아요 취소
	public void clickLikeCancel(BoardLikeVO vo);

}