package com.damoyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		rttr.addFlashAttribute("joinUserInfo", vo);
		return "redirect:/user/join/interest";
	}
	
//	@GetMapping("/join/interest")
//	public String 
	
	
}
