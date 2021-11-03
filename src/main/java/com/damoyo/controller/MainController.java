package com.damoyo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
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

import com.damoyo.domain.InterestVO;
import com.damoyo.domain.MainPageDTO;
import com.damoyo.domain.MainSearchCriteria;
import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyJoinMeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.MainService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
	
	@Autowired
	private MainService service;
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
	
	@GetMapping("/")
	public String list(Model model, HttpSession session, MainSearchCriteria cri) {
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		// 로그인 한 유저 정보 저장
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		// DB에 저장된 카테고리 정보 저장
		List<InterestVO> interestList = service.get();
		
		// 카테고리와 검색 키워드 내용으로 모임 조회 준비
		if(cri.getKeyword()==null)
			cri.setKeyword("");
		if(cri.getSearchType() == null)
			cri.setSearchType("");
		int total = service.getTotalMeet(cri);
		// 모임 리스트 조회
		List<MeetVO> meetList = service.getListMeet(cri);
		// 모임 리스트 페이지네이션
		MainPageDTO meetPages = new MainPageDTO(total, cri);
		
		// 조회 후 저장한 내용을 View에서 출력하기 위한 준비
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
	public String register(RedirectAttributes rttr, MeetVO vo, @Param("m_profile")MultipartFile profile) {
		// 모임 생성
		log.info(profile);
		if(profile.getSize() != 0) {
			log.info("모임 생성 사진 이름 : " + profile.getOriginalFilename());
			log.info("모임 생성 사진 크기 : " + profile.getSize());
			
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
		// 모임 생성
		service.registerMeet(vo);
		// 모임 생성자를 생성한 모임의 모임장으로 MEET_MEMBERLIST 테이블에 등록
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
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(Long m_num){
		MeetVO profile = service.getDetailMeet(m_num);
		String uploadPath = profile.getM_profilepath();
		String uuid = profile.getM_uuid();
		String fileName = profile.getM_profile();
		
		File file = null; 
		
		ResponseEntity<byte[]> result = null;
		
		if(uploadPath == null) {
			try {
				file = new File("c:\\upload_data\\temp\\meet_profile\\s_noimg.jpg"); 
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
		
		try {
			file = new File("c:\\upload_data\\temp\\meet_profile\\" + uploadPath + "/s_" + uuid + "_" + fileName);
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
	
	@GetMapping("/display2")
	@ResponseBody
	public ResponseEntity<byte[]> getFile2(Long m_num){
		log.info(m_num);
		MeetVO profile = service.getDetailMeet(m_num);
		String uploadPath = profile.getM_profilepath();
		String uuid = profile.getM_uuid();
		String fileName = profile.getM_profile();
		
		File file = null; 
		
		ResponseEntity<byte[]> result = null;
		
		if(uploadPath == null) {
			try {
				file = new File("c:\\upload_data\\temp\\meet_profile\\noimg.jpg"); 
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
		
		try {
			file = new File("c:\\upload_data\\temp\\meet_profile\\" + uploadPath + "/" + uuid + "_" + fileName);
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
	
}
