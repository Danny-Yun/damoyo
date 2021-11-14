package com.damoyo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyIMeetVO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.PlanVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.MainService;
import com.damoyo.service.PlanService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/meet/*")
@Log4j
@AllArgsConstructor
public class MeetController {
	
	@Autowired
	private MainService service;
	@Autowired
	private PlanService pService;
	
	private boolean checkImageType(File file) {
		try {
			log.info("해당 파일 Path 객체화 : " + file.toPath());
			String contentType = Files.probeContentType(file.toPath());
			log.info("해당 파일 MIME 타입 : " + contentType);
			log.info("--------------------------------------------------");
			
			// startsWith - 문자열이 'image'로 시작하는지 판별 
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private String getFolder() {
		// 날짜 포맷
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 오늘 날짜 객체 생성
		Date date = new Date();
		// 설정한 날짜 포맷에 날짜 객체를 넣은 후 String으로 저장
		String str = sdf.format(date);
		// 문자열로 저장한 날짜 포맷의 '-'을 OS 규격에 맞추어 재조정 후 리턴
		return str.replace("-", File.separator);
	}
	
	
	// 모임 상세 정보
	@GetMapping("/info")
	public String detail(Long num, Model model, HttpSession session) {
		
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		
		// 유저 정보 받기
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		// 모임 정보 받기
		MeetVO meetInfo = service.getDetailMeet(num);
		session.setAttribute("meetInfo", meetInfo);
		log.info("meet 정보 : "+meetInfo);
		
		// 모임 내 정모 받기
		List<PlanVO> planInfo = pService.getPlans(meetInfo.getM_num());
		
		// 내 가입 여부
		MeetMemberVO checkMeetJoin = new MeetMemberVO();
		checkMeetJoin.setM_num(num);
		checkMeetJoin.setU_id(userInfo.getU_id());
		checkMeetJoin = service.checkMeetJoin(checkMeetJoin);
		
		// 내 관심모임 추가 여부
		MyIMeetVO checkAddIMeet = new MyIMeetVO();
		checkAddIMeet.setM_num(num);
		checkAddIMeet.setU_id(userInfo.getU_id());
		checkAddIMeet = service.checkAddIMeet(checkAddIMeet);
		
		// 모임 멤버 리스트
		List<MeetMemberVO> memberList = service.getMeetMemberList(num);
		
		// 화면에 전송
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("user", userInfo);
		infos.put("meet", meetInfo);
		infos.put("plan", planInfo);
		infos.put("checkJoin", checkMeetJoin);
		infos.put("checkAdd", checkAddIMeet);
		infos.put("memberList", memberList);
		model.addAttribute("infos", infos);
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
	public String updateMeet(MeetVO vo, @Param("m_profile")MultipartFile profile) {
		// 모임 프로필 수정 안할 경우
		if(profile.isEmpty()) {
			service.updateMeet2(vo);
			return "redirect:/meet/info?num=" + vo.getM_num();
		} 
		// 모임 프로필 수정 할 경우
		else {
			
			// before 프로필 이미지 삭제 로직
			File file = null;
			String fileBeforeName = "C:\\upload_data\\temp\\meet_profile\\";
			MeetVO beforeVo = service.getDetailMeet(vo.getM_num());
			
			// 프로필 이미지 삭제
			fileBeforeName += beforeVo.getM_profilepath() + "\\" + beforeVo.getM_uuid() + "_" + beforeVo.getM_profile();
			file = new File(fileBeforeName);
			file.delete();
			// 프로필 썸네일 이미지 삭제
			fileBeforeName = "C:\\upload_data\\temp\\meet_profile\\";
			fileBeforeName += beforeVo.getM_profilepath() + "\\s_" + beforeVo.getM_uuid() + "_" + beforeVo.getM_profile();
			file = new File(fileBeforeName);
			file.delete();
			
			
			// 프로필 이미지(+썸네일) 새로 생성 및 DB 저장 
			String uploadFolder = "C:\\upload_data\\temp\\meet_profile";
			String uploadFolderPath = getFolder();
			File uploadPath = new File(uploadFolder, uploadFolderPath);
			vo.setM_profilepath(uploadFolderPath);
			
			log.info("파일 저장 위치 : " + uploadPath);
			
			if(uploadPath.exists() == false)
				uploadPath.mkdirs();
			
			String fileName = profile.getOriginalFilename();
			vo.setM_profile(fileName);
			log.info("lastIndexof : " + fileName.lastIndexOf("\\"));
//			fileName = fileName.substring(fileName.lastIndexOf("\\" + 1));
			
			UUID uuid = UUID.randomUUID();
			vo.setM_uuid(uuid.toString());
			
			fileName = uuid + "_" + fileName;
			
			log.info("최종 VO값 : " + vo);
			service.updateMeet(vo);
			
			try {
				File saveFile = new File(uploadPath, fileName);
				profile.transferTo(saveFile);
				
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + fileName));
					Thumbnailator.createThumbnail(profile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		return "redirect:/meet/info?num=" + vo.getM_num();
	}
	
	
	@PostMapping("/update")
	// 모임 수정
	public void updateMeet(Long num, Model model) {
		log.info("모임 수정 프로세스");
		MeetVO meetInfo = service.getDetailMeet(num);
		List<InterestVO> interestList = service.get();
		model.addAttribute("category",interestList);
		model.addAttribute("meetInfo", meetInfo);
	}
	
	@PostMapping("/join")
	// 모임 가입
	public String joinMeet(MeetMemberVO vo, MyJoinMeetVO vo2, RedirectAttributes rttr) {
		vo.setMember_list_position("");
		log.info(vo);
		service.joinMeet(vo);
		service.saveMyJoinMeet(vo2);
		
		rttr.addAttribute("num", vo.getM_num());
		return "redirect:/meet/info";
	}
	
	@PostMapping("/withdraw")
	// 모임 탈퇴
	public String withdrawMeet(MeetMemberVO vo, MyJoinMeetVO vo2, HttpSession session, RedirectAttributes rttr) {
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		
		log.info(vo);
		service.withdrawMeet(vo);
		service.removeMyJoinMeet(vo2);
		rttr.addFlashAttribute(userInfo);
		
		return "redirect:/main/";
	}
	
	@RequestMapping("/board/*")
	public String sendBoard(RedirectAttributes rttr, HttpSession session) {
		return "redirect:/board/list";
	}
	
	// 내 관심모임에 추가
	@PostMapping("/add")
	public String addIMeet(MyIMeetVO vo, RedirectAttributes rttr) {
		service.addIMeet(vo);
		rttr.addAttribute("num", vo.getM_num());
		return "redirect:/meet/info";
	}
	
	// 내 관심모임에서 삭제
	@PostMapping("/anymore")
	public String deleteIMeet(MyIMeetVO vo, RedirectAttributes rttr) {
		service.deleteIMeet(vo);
		rttr.addAttribute("num", vo.getM_num());
		return "redirect:/meet/info";
	}
	
}
