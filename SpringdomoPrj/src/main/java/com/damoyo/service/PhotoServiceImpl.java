package com.damoyo.service;

import java.util.List;

import com.damoyo.mapper.PhotoMapper;
import com.damoyo.service.PhotoServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.PhotoVO;
import com.damoyo.domain.PhotocategoryVO;
import com.damoyo.domain.PhotolikeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j // 로깅을 위한 어노테이션 // x가 뜨면 pom.xml에서 추가수정
//자세한 사항은 pom.xml의 log4j 참조.
@Service // 의존성 등록을 위한 어노테이션
@AllArgsConstructor 
public class PhotoServiceImpl implements PhotoService{

	@Autowired
	private PhotoMapper mapper;
	
	@Override
	public void enrollment(PhotoVO vo) {
		log.info("사진 등록");
		mapper.insert(vo);
		
	}

	@Override
	public PhotoVO get(Long p_num) {
		PhotoVO photo = mapper.select(p_num);
		log.info(p_num + "번 사진 조회");
		return mapper.get(p_num);
	}

	@Override
	public void revise(PhotoVO vo) {
		
		log.info("사진 수정");
		mapper.update(vo);
	}

	@Override
	public void delete(Long p_num) {
		// TODO Auto-generated method stub
		mapper.delete(p_num);
	}

	@Override
	public List<PhotocategoryVO> getlist() {
		List<PhotocategoryVO> photolist = mapper.getList();
		return photolist;
	}

	@Override
	public void like(PhotolikeVO vo) {
		mapper.like(vo);
		
	}

}
