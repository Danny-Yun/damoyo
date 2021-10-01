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
	public void list(Model model, HttpSession session) {
		log.info("");
		// user, meet 정보
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		MeetVO meetInfo = (MeetVO) session.getAttribute("meetInfo");
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("user", userInfo);
		infos.put("meet", meetInfo);
		
		// 게시판 카테고리
		List<BoardCateVO> category = service.getBoardCate();
		
		
		// 게시판
		List<BoardVO> boards = service.getBoards();
		
		model.addAttribute("infos", infos);
		model.addAttribute("category", category);
		model.addAttribute("list", boards);
	}
	
	@GetMapping("/detail")
	public void detail(Model model, Long b_num) {
		
		BoardVO vo = service.getBoard(b_num);
		
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/delete")
	public String delete(Long b_num, RedirectAttributes rttr) {
		
		service.delete(b_num);
		
		rttr.addFlashAttribute("delete", "success");
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/write")
	public void write() {
		
	}
	
	
}
