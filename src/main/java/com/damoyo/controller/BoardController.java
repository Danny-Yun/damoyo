package com.damoyo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardCriteria;
import com.damoyo.domain.BoardPageDTO;
import com.damoyo.domain.BoardVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model, HttpSession session, BoardCriteria cri) {
		// user, meet 정보
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		MeetVO meetInfo = (MeetVO) session.getAttribute("meetInfo");
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("user", userInfo);
		infos.put("meet", meetInfo);
		
		// 게시판 카테고리
		List<BoardCateVO> category = service.getBoardCate();
		
		// 게시판_Meet에 해당하는 것만 출력
		log.info("list 내의 cri 값 : "+cri);
		int total = service.getTotalBoard(meetInfo.getM_num());
		BoardPageDTO boardPages = new BoardPageDTO(total, cri);
		List<BoardVO> boardList = service.getBoards(cri, meetInfo.getM_num());
		
		model.addAttribute("infos", infos);
		model.addAttribute("category", category);
		model.addAttribute("list", boardList);
		model.addAttribute("boardPages", boardPages);
	}
	
	@GetMapping("/detail")
	public void detail(Model model, Long b_num, HttpSession session) {
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		MeetVO meetInfo = (MeetVO) session.getAttribute("meetInfo");
		//BoardVO boardInfo = service.getBoard(b_num);
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("user", userInfo);
		infos.put("meet", meetInfo);
		//infos.put("board", boardInfo);
		
		model.addAttribute("infos", infos);
	}
	
	@PostMapping("/delete")
	public String delete(Long b_num, RedirectAttributes rttr) {
		log.info(b_num);
		
		service.delete(b_num);
//		service.delete(6L);
		
//		rttr.addFlashAttribute("delete", "success");
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/write")
	public void write(HttpSession session, Model model) {
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		MeetVO meetInfo = (MeetVO) session.getAttribute("meetInfo");
		List<BoardCateVO> category = service.getBoardCate();
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("user", userInfo);
		infos.put("meet", meetInfo);
		infos.put("category", category);
		
		model.addAttribute("infos", infos);
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		service.insert(vo);
		return "redirect:/board/list";
	}
	
	
}
