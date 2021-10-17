package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardLikeVO;
import com.damoyo.domain.BoardSearchCriteria;
import com.damoyo.domain.BoardVO;
import com.damoyo.mapper.BoardMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
/*	@Override
	public BoardVO getBoard(Long b_num) {
		
		return mapper.getBoard(b_num);
	}*/
	@Transactional
	@Override
	public BoardVO getBoard(Long b_num) {
		mapper.upView(b_num);
		return mapper.getBoard(b_num);
	}

	@Override
	public List<BoardVO> getBoards(BoardSearchCriteria cri, Long m_num) {
		
		return mapper.getBoards(cri, m_num);
	}
	
	@Override
	public void insertCate(BoardCateVO vo) {
		mapper.insertCate(vo);
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

	@Override
	public int getTotalBoard(BoardSearchCriteria cri ,Long m_num) {
		return mapper.getTotalBoard(cri, m_num);
	}
	
	@Override
	public int replyCnt(Long b_num) {
		return mapper.replyCnt(b_num);
	}
	
	@Override
	public int likeCnt(Long b_num) {
		return mapper.likeCnt(b_num);
	}
	
	@Override
	public BoardLikeVO checkLike(Long b_num, String u_id) {
		return mapper.checkLike(b_num, u_id);
	}
	
	@Override
	public void clickLike(BoardLikeVO vo) {
		mapper.clickLike(vo);
		mapper.updatelike(vo.getB_num());
	}
	
	@Override
	public void clickLikeCancel(BoardLikeVO vo) {
		mapper.clickLikeCancel(vo);
		mapper.updatelike(vo.getB_num());
	}

}
