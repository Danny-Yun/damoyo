package com.damoyo.mapper;

import java.util.List;

import com.damoyo.domain.PhotoVO;
import com.damoyo.domain.PhotocategoryVO;
import com.damoyo.domain.PhotocommentsVO;
import com.damoyo.domain.PhotolikeVO;
import com.damoyo.service.Photocomments;



public interface PhotoMapper {
	
	// 사진 리스트
	public List<PhotocommentsVO> getList();
	
	// 사진 등록
	public void insert(PhotoVO vo);
	
	// 사진 번호 조회
	public PhotoVO select(Long p_num);
	
	// 사진 삭제
	public void delete(Long p_num);
	
	// 사진 수정
	public void update(PhotoVO vo);
	
	public PhotoVO get(Long p_num);
	
	// 사진 좋아요
	public void like(PhotolikeVO vo);
	
	

}
