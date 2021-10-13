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
import org.springframework.web.bind.annotation.ResponseBody;
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
			session.setAttribute("userInfo", user);
			rttr.addFlashAttribute("id_session", session.getAttribute("u_id"));
			rttr.addFlashAttribute("pw_session", session.getAttribute("u_pw"));
			rttr.addFlashAttribute("result","loginOK");
			return "redirect:/main/";
		} else {
			rttr.addFlashAttribute("result","fail");
			return "redirect:/user/login";
		}
	}
	
	// 로그아웃
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/user/login";
	}
		
	// 회원가입 폼
	@GetMapping("/join")
	public void joinForm() {
	}

	// 회원가입
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes rttr, HttpSession session) {
		
		// 방금 가입한 사용자의 아이디를 세션에 저장
		session.setAttribute("u_id", vo.getU_id());

		log.info("join 로직 접속 - " + vo);
		userService.userJoin(vo);
		rttr.addFlashAttribute("joinUserId", vo.getU_id());
		rttr.addFlashAttribute("success", "joinOk");
		return "redirect:/user/interest";
	}
	
	// 아이디 중복체크 
	@ResponseBody
	@PostMapping("/join/idCheck")
	public int checkIdDuplication(String u_id) {
		int result = userService.showIdCount(u_id);
		return result;
	}

	// 관심사 카테고리 조회
	@GetMapping("/interest")
	public String getInterestCate(Model model, HttpSession session) {
		log.info("interest 카테고리 조회 로직 접속");
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		
		List<ICateVO> iCateList = userService.showInterestCate();
		log.info("관심사 카테고리 리스트 - " + iCateList);
		model.addAttribute("list", iCateList);
		return "/user/interest";
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
		// 만약 사용자가 이미 선택한 관심사의 개수와 새로 추가한 관심사의 개수를 합친 값이 
		// 우리가 정한 최대 개수인 30개를 초과하면 저장하지 않고 돌려보낸다. 
		int i_num = userService.showDetailCount(dto.getU_id());
		if(i_num + dto.getI_detail_name().length > 30) {
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/user/myinterest";
		}
		
		for(int i = 0; i < dto.getI_detail_name().length; i++) {
			MyInterestVO vo = new MyInterestVO();		
			vo.setU_id(dto.getU_id());
			vo.setI_detail_name(dto.getI_detail_name()[i]);
			userService.saveUserInterest(vo);
		}
		return "redirect:/main/";
	}
	
	// 마이페이지 
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		log.info("메인 페이지(마이페이지)로 접속");
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		UserVO profile = userService.showProfile(u_id);
		model.addAttribute("profile", profile);
		return "/user/mypage";
	}
	
	// 내 정보 수정
	@GetMapping("/modify")
	public String userProfile(Model model, HttpSession session) {
		log.info("사용자 프로필 수정 접속");
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		UserVO profile = userService.showProfile(u_id);
		model.addAttribute("profile", profile);
		return "/user/profile";
	}
	
	// 내 정보 수정 후 저장
	@PostMapping("/modify")
	public String updateProfile(UserVO vo, RedirectAttributes rttr) {
		log.info("유저가 수정한 내용 - " + vo);
		userService.modifyProfile(vo);
		return "redirect:/user/mypage";
	}
	
	// 마이페이지에서 내 관심사 조회
	@GetMapping("/myinterest")
	public String myInterest(Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		List<MyInterestVO> myInterest = userService.showUserInterest(u_id);
		System.out.println("사용자 관심사 리스트 : " + myInterest);
		int i_num = userService.showDetailCount(u_id);
		System.out.println("사용자 관심사 개수 : " + i_num);
		
		model.addAttribute("i_num", i_num);
		model.addAttribute("myInterest", myInterest);
		return "/user/myinterest";
	}
	
	// 내 관심사 삭제 
	@PostMapping("/myinterest/remove")
	public String removeInterest(int f_interest_num, RedirectAttributes rttr) {
		log.info("유저가 삭제한 요청한 고유관심사 번호 - " + f_interest_num);
		userService.deleteInterest(f_interest_num);
		return "redirect:/user/myinterest";
	}
	
	// 유저 비밀번호 변경시 기존 비밀번호 입력 폼
	@GetMapping("/password")
	public String passwordForm(HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		return "/user/password";
	}
	
	// 유저 비밀번호 변경시 기존 비밀번호 일치여부 검사
	@PostMapping("/password")
	public String checkPassword(String u_pw, RedirectAttributes rttr, HttpSession session) {
		log.info("유저가 입력한 비밀번호 - " + u_pw);
		String u_id = (String) session.getAttribute("u_id");
		UserVO user = userService.showProfile(u_id);
		if(u_pw.equals(user.getU_pw())) {
			return "redirect:/user/password/change";
		} else {
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/user/password";
		}
	}
	
	// 비밀번호 변경 폼
	@GetMapping("/password/change")
	public String changePasswordForm(HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		return "/user/change_password";
	}
	
	// 비밀번호 변경
	@PostMapping("/password/change")
	public String changePassword(String u_pw, String re_pw, RedirectAttributes rttr, HttpSession session) {
		if(!u_pw.equals(re_pw)) {
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/user/password/change";
		}
		
		UserVO vo = new UserVO();
		String u_id = (String) session.getAttribute("u_id");
		vo.setU_id(u_id);
		vo.setU_pw(u_pw);
		userService.modifyPassword(vo);
		rttr.addFlashAttribute("result", "changePwOK");
		return "redirect:/user/mypage";
	}
	
	// 회원 탈퇴 폼
	@GetMapping("/leave")
	public String userLeaveForm(HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		return "/user/leave";
	}
	
	// 회원 탈퇴
	@PostMapping("/leave")
	public String userLeave(String u_pw, RedirectAttributes rttr, HttpSession session) {
		log.info("유저가 입력한 비밀번호 - " + u_pw);
		String u_id = (String) session.getAttribute("u_id");
		UserVO user = userService.showProfile(u_id);
		if(u_pw.equals(user.getU_pw())) {
			userService.removeAccount(u_id);
			session.invalidate();
			rttr.addFlashAttribute("result", "leaveOK");
			return "redirect:/user/login";
		} else {
			rttr.addFlashAttribute("result", "fail");
			return "redirect:/user/leave";
		}
	}
	
}
