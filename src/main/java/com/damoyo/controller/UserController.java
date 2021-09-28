package com.damoyo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.IDetailVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// 회원가입 폼
	@GetMapping("/join")
	public String joinForm() {
		return "/user/join";
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes rttr) {
		log.info("join 로직 접속 - " + vo);
		userService.userJoin(vo);
		rttr.addFlashAttribute("joinUserId", vo.getU_id());
		rttr.addFlashAttribute("success", "joinOk");
		return "redirect:/user/join/interest";
	}
	
	// 관심사 카테고리 조회
	@GetMapping("/join/interest")
	public String getInterestCate(Model model) {
		log.info("interest 카테고리 조회 로직 접속");
		List<ICateVO> iCateList = userService.showInterestCate();
		log.info("관심사 카테고리 리스트 - " + iCateList);
		model.addAttribute("list", iCateList);
		return "/user/interest";
	}
	
	// 상세 관심사 조회
	@PostMapping("/join/interest")
	public String getInterestDetail(ICateNumDTO dto, Model model) {
		log.info("사용자가 선택한 관심사 카테고리 번호 - " + dto);
		List<IDetailVO> iDetailList = userService.showInterestDetail(dto);
		List<ICateVO> iCateNameList = userService.showICateName(dto);
		model.addAttribute("detailList", iDetailList);
		model.addAttribute("cateNameList", iCateNameList);
		return "/user/interest_detail";
	}
	
	
}
