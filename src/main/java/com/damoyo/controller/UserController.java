package com.damoyo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.ICateNumDTO;
import com.damoyo.domain.ICateVO;
import com.damoyo.domain.ITotalDTO;
import com.damoyo.domain.MyIMeetDTO;
import com.damoyo.domain.MyInterestDTO;
import com.damoyo.domain.MyInterestVO;
import com.damoyo.domain.MyJoinMeetDTO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService userService;
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
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
		session.setAttribute("userInfo", vo);

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
	public String getInterestDetail(ICateNumDTO dto, Model model, RedirectAttributes rttr, HttpSession session) {
		log.info("사용자가 선택한 관심사 카테고리 번호 - " + dto);
		if(dto.getI_cate_num() == null) {
			rttr.addFlashAttribute("warn","warn");
			return "redirect:/user/interest";
		}
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
		if(dto.getI_detail_name() == null) {
			rttr.addFlashAttribute("warn","warn");
			return "redirect:/user/interest";
		}
		
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
	public String updateProfile(UserVO vo, RedirectAttributes rttr, @Param("u_profile")MultipartFile profile) {
		log.info("유저가 수정한 내용 - " + vo);
		log.info("프로필 : " + profile);
		if(profile.getSize() != 0) {
			String uploadFolder = "C:\\upload_data\\temp\\user_profile";
			String uploadFolderPath = getFolder();
			File uploadPath = new File(uploadFolder, uploadFolderPath);
			vo.setU_profilepath(uploadFolderPath);
			
			if(uploadPath.exists() == false)
				uploadPath.mkdirs();
			
			String fileName = profile.getOriginalFilename();
			vo.setU_profile(fileName);
			
			UUID uuid = UUID.randomUUID();
			vo.setU_uuid(uuid.toString());
			
			fileName = uuid + "_" + fileName;
			
			try {
				File saveFile = new File(uploadPath, fileName);
				profile.transferTo(saveFile);
				
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + fileName));
					Thumbnailator.createThumbnail(profile.getInputStream(), thumbnail, 50, 50);
					thumbnail.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		userService.modifyProfile(vo);
		return "redirect:/user/mypage";
	}
	// 프로필 보이기_썸네일
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String u_id){
		UserVO profile = userService.showProfile(u_id);
		String uploadPath = profile.getU_profilepath();
		String uuid = profile.getU_uuid();
		String fileName = profile.getU_profile();
		
		File file = null;
		
		ResponseEntity<byte[]> result = null;
		
		if(uploadPath == null) {
			try {
				file = new File("c:\\upload_data\\temp\\user_profile\\s_noimg.jpg");
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),
													header,
													HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		try {
			file = new File("c:\\upload_data\\temp\\user_profile\\" + uploadPath + "/s_" + uuid + "_" + fileName);
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
										header,
										HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 프로필 보이기_크게
	@GetMapping("/display2")
	@ResponseBody
	public ResponseEntity<byte[]> getFile2(String u_id){
		UserVO profile = userService.showProfile(u_id);
		String uploadPath = profile.getU_profilepath();
		String uuid = profile.getU_uuid();
		String fileName = profile.getU_profile();
		log.info("프로필 : " + profile);
		log.info("파일 이름 : " + fileName);
		log.info("uuid : " + uuid);
		log.info("파일 경로 : " + uploadPath);
		
		File file = null;
		
		ResponseEntity<byte[]> result = null;
		
		if(uploadPath == null) {
			try {
				file = new File("c:\\upload_data\\temp\\user_profile\\noimg.jpg");
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),
													header,
													HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		try {
			file = new File("c:\\upload_data\\temp\\user_profile\\" + uploadPath + "\\" + uuid + "_" + fileName);
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
										header,
										HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
	
	// 내 모임 조회
	@GetMapping("/myMeet")
	public String myMeet(Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		List<MyJoinMeetDTO> myMeetList = userService.showMyMeet(u_id);
		model.addAttribute("list", myMeetList);
		model.addAttribute("u_id", u_id);
		return "/user/mymeet";
	}
	
	// 내 관심모임 조회
	@GetMapping("/interest/meet")
	public String myInterestMeet(Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		List<MyIMeetDTO> interestMeetList = userService.showInterestMeet(u_id);
		model.addAttribute("list", interestMeetList);
		return "/user/interest_meet";
	}
	
	// 즐겨찾는 모임 추가
	@PostMapping("/user/addStar")
	public String addStar(MyJoinMeetVO vo, RedirectAttributes rttr) {
		userService.addStar(vo);
		return "redirect:/user/myMeet";
	}
	
	// 즐겨찾는 모임 삭제 
	@PostMapping("/user/deleteStar")
	public String deleteStar(MyJoinMeetVO vo, RedirectAttributes rttr) {
		userService.deleteStar(vo);
		return "redirect:/user/myMeet";
	}
	
}
