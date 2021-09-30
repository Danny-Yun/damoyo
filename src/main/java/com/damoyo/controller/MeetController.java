package com.damoyo.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/meet/*")
@Log4j
@AllArgsConstructor
public class MeetController {
	
	@Autowired
	private MainService service;
	
	@GetMapping("/info")
	// 모임 상세 정보
	public String detail(Long num, Model model, HttpSession session) {
		// 유저 정보 받기
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		log.info("meet 유저 : " + userInfo);
		
		// 모임 정보
		MeetVO detail = service.getDetailMeet(num);
		
		// 내 가입 여부
		MeetMemberVO checkMeetJoin = new MeetMemberVO();
		checkMeetJoin.setM_num(num);
		checkMeetJoin.setU_id(userInfo.getU_id());
		checkMeetJoin = service.checkMeetJoin(checkMeetJoin);
		log.info("/info : " + checkMeetJoin);
		
		// 모임 회원
		List<MeetMemberVO> memberList = service.getMeetMemberList(num);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("detail", detail);
		model.addAttribute("memberList", memberList);
		model.addAttribute("checkJoin", checkMeetJoin);
		return "/meet/info";
	}
	
	@PostMapping("/remove")
	// 모임 삭제
	public String remove(Long num, RedirectAttributes rttr, HttpSession session) {
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		service.removeMeet(num);
		rttr.addFlashAttribute("userInfo", userInfo);
		return "redirect:/main/";
	}
	
	@PostMapping("/update/process")
	// 모임 수정
	public String updateMeet(MeetVO vo) {
		service.updateMeet(vo);
		return "redirect:/meet/info?num=" + vo.getM_num();
	}
	
	@PostMapping("/update")
	// 모임 수정
	public void updateMeet(Long num, Model model) {
		MeetVO vo = service.getDetailMeet(num);
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/join")
	// 모임 가입
	public String joinMeet(MeetMemberVO vo, RedirectAttributes rttr) {
		vo.setMember_list_position("");
		log.info(vo);
		service.joinMeet(vo);
		
		rttr.addAttribute("num", vo.getM_num());
		return "redirect:/meet/info";
	}
	
	@PostMapping("/withdraw")
	// 모임 탈퇴
	public String withdrawMeet(MeetMemberVO vo, HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		
		log.info(vo);
		service.withdrawMeet(vo);
		rttr.addFlashAttribute(userInfo);
		
		return "redirect:/main/";
	}
}
