package com.damoyo.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.damoyo.domain.PhotoVO;
import com.damoyo.domain.PhotocategoryVO;
import com.damoyo.domain.PhotocommentsVO;
import com.damoyo.domain.PhotolikeVO;


public interface PhotoService {
	
	// 사진 등록
	public void enrollment(PhotoVO vo);
	
	// 사진 조회
	public PhotoVO get(Long p_num);
	
	// 사진 수정
	public void revise(PhotoVO vo);
	
	// 사진 삭제
	public void delete(Long p_num);
	
	// 사진 리스트
	public List<PhotocategoryVO> getlist();
	
	// 사진 좋아요
	public void like(PhotolikeVO vo);
}
