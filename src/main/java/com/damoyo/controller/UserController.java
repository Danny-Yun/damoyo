package com.damoyo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.ITotalDTO;
import com.damoyo.domain.MyInterestDTO;
import com.damoyo.domain.MyInterestVO;
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
	public void joinForm() {
	}

	// 회원가입
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes rttr, HttpSession session) {
		// 가장 먼저 방금 가입한 사용자의 아이디를 세션에 저장
		session.setAttribute("u_id", vo.getU_id());

		log.info("join 로직 접속 - " + vo);
		userService.userJoin(vo);
		rttr.addFlashAttribute("joinUserId", vo.getU_id());
		rttr.addFlashAttribute("success", "joinOk");
		return "redirect:/user/interest";
	}

	// 관심사 카테고리 조회
	@GetMapping("/interest")
	public void getInterestCate(Model model) {
		log.info("interest 카테고리 조회 로직 접속");
		List<ICateVO> iCateList = userService.showInterestCate();
		log.info("관심사 카테고리 리스트 - " + iCateList);
		model.addAttribute("list", iCateList);
	}

	// 상세 관심사 조회
	@PostMapping("/interest")
	public String getInterestDetail(ICateNumDTO dto, Model model, HttpSession session) {
		log.info("사용자가 선택한 관심사 카테고리 번호 - " + dto);
		List<ICateVO> iCateNameList = userService.showICateName(dto);
		// 상세 관심사 조회를 도와주는 DTO
		List<ITotalDTO> iTotalList = new ArrayList<ITotalDTO>();

		for (ICateVO iCateVO : iCateNameList) {
			ITotalDTO totalDto = new ITotalDTO();
			totalDto.setI_cate_name(iCateVO.getI_cate_name());
			totalDto.setDetailList(userService.showInterestDetail(iCateVO.getI_cate_num()));
			iTotalList.add(totalDto);
		}
		
		model.addAttribute("list", iTotalList);
		model.addAttribute("sessionId", session.getAttribute("u_id"));
		return "/user/interest_detail";
	}

	// 유저가 선택한 (상세)관심사 저장
	@PostMapping("/interest/detail")
	public String saveInterestDetail(MyInterestDTO dto, RedirectAttributes rttr) {
		log.info("사용자가 선택한 상세 관심사 및 유저아이디 - " + dto);
		for(int i = 0; i < dto.getI_detail_name().length; i++) {
			MyInterestVO vo = new MyInterestVO();		
			vo.setU_id(dto.getU_id());
			vo.setI_detail_name(dto.getI_detail_name()[i]);
			userService.saveUserInterest(vo);
		}
		return "redirect:/user/mypage";
	}
	
	// 메인페이지 
	@GetMapping("/mypage")
	public void mypage(Model model) {
		log.info("메인 페이지(마이페이지)로 접속");
	}
	
	// 로그인 폼
	@GetMapping("/login")
	public void loginForm() {
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(UserVO vo ,RedirectAttributes rttr, HttpSession session) {
		log.info("사용자가 입력한 로그인 정보 - " + vo);
		UserVO user = userService.userLogin(vo);
		log.info("유저 정보 - " + user);
		
		if(user == null) {
			rttr.addFlashAttribute("result","fail");
			return "redirect:/user/login";
		}
		
		if(user.getU_id().equals(vo.getU_id()) 
				&& user.getU_pw().equals(vo.getU_pw()) ) {
			session.setAttribute("u_id", user.getU_id());
			session.setAttribute("u_pw", user.getU_pw());
			rttr.addFlashAttribute("id_session", session.getAttribute("u_id"));
			rttr.addFlashAttribute("pw_session", session.getAttribute("u_pw"));
			rttr.addFlashAttribute("result","loginOK");
			return "redirect:/user/mypage";
		} else {
			rttr.addFlashAttribute("result","fail");
			return "redirect:/user/login";
		}
	}
	
	
}
