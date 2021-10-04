package com.damoyo.controller;

import com.damoyo.domain.PhotoVO;
import com.damoyo.domain.PhotolikeVO;
import com.damoyo.mapper.PhotoMapper;
import com.damoyo.service.PhotoService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/photo/*") // 클래스 위에 작성시
//이 클래스를 사용하는 모든 메서드의 연결주소 앞에 /board/ 추가
@AllArgsConstructor
public class PhotoController {
	
	@Autowired
	private PhotoService service;
	
	
	@GetMapping("/lists")
	public void list() {
		
	}
	
	@PostMapping("/create")
	public void create() {
		log.info("사진 등록");
		
	}
	
	@PostMapping("/update")
	public String update(PhotoVO vo) {
		log.info("수정");
		service.revise(vo);
		return "redirect:/photo/p_num=" + vo.getM_num();
	}
	
	@PostMapping("/delete")
	public String delete(Long p_num, RedirectAttributes rttr, HttpSession session) {
		PhotoVO photo = (PhotoVO) session.getAttribute("photo");
		service.delete(p_num);
		rttr.addFlashAttribute("photo", photo);
		return "redirect:/main/";
		
	}
	@PostMapping("/like")
	public String like(PhotolikeVO vo) {
		log.info("좋아요");
		service.like(vo);
		return "/like";
		
	}
}
