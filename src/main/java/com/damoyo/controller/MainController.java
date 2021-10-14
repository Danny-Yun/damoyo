package com.damoyo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MainPageDTO;
import com.damoyo.domain.MainSearchCriteria;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
	
	@Autowired
	private MainService service;
	
	@GetMapping("/")
	public String list(Model model, HttpSession session, MainSearchCriteria cri) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		// 유저 정보
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		log.info(userInfo);
		
		// 카테고리 및 모임 리스트 조회
		if(cri.getKeyword()==null)
			cri.setKeyword("");
		if(cri.getSearchType() == null)
			cri.setSearchType("");
		int total = service.getTotalMeet(cri);
		log.info("컨트롤러");
		log.info(cri.getSearchType());
		log.info(total);
		List<InterestVO> interestList = service.get();
		List<MeetVO> meetList = service.getListMeet(cri);
		MainPageDTO meetPages = new MainPageDTO(total, cri);
		
		
		model.addAttribute("interest", interestList);
		model.addAttribute("meetList", meetList);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("meetPages", meetPages);
		return "/main";
	}
	
	@GetMapping("/register")
	public String register(Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		// 관심사 카테고리
		List<InterestVO> vo = service.get();
		model.addAttribute("category", vo);
		return "/main/register";
	}
	@PostMapping("/register")
	public String register(RedirectAttributes rttr, MeetVO vo) {
		// 모임 생성
		service.registerMeet(vo);
		// 모임 개설자 모임 회원 리스트 등록
		MeetMemberVO member = new MeetMemberVO();
		member.setM_num(vo.getM_num());
		member.setU_id(vo.getU_id());
		member.setMember_list_position("모임장");
		service.joinMeet(member);
		// 내가 가입한 모임에도 추가
		MyJoinMeetVO myMeet = new MyJoinMeetVO();
		myMeet.setU_id(vo.getU_id());
		myMeet.setM_num(vo.getM_num());
		service.saveMyJoinMeet(myMeet);
		return "redirect:/main/";
	}
	
}
