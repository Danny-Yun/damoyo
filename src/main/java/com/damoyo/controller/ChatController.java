package com.damoyo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.damoyo.domain.MeetMemberVO;
import com.damoyo.domain.MeetVO;
import com.damoyo.domain.MyIMeetVO;
import com.damoyo.domain.PlanVO;
import com.damoyo.domain.UserVO;
import com.damoyo.service.MainService;
import com.damoyo.service.PlanService;

@Controller
public class ChatController {
	@Autowired
	private MainService service;
	@Autowired
	private PlanService pService;
	
	@GetMapping("/chatting")
	public String chat(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		String u_id = (String) session.getAttribute("u_id");
		// 세션이 비었을 땐 로그인 페이지로
		if(u_id == null) {
			return "/user/login";
		}
		
		// user, meet 정보
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		MeetVO meetInfo = (MeetVO) session.getAttribute("meetInfo");
		MeetMemberVO checkMeetJoin = new MeetMemberVO();
		checkMeetJoin.setM_num(meetInfo.getM_num());
		checkMeetJoin.setU_id(userInfo.getU_id());
		checkMeetJoin = service.checkMeetJoin(checkMeetJoin);
		Map<String, Object> infos = new HashMap<String, Object>();
		infos.put("user", userInfo);
		infos.put("meet", meetInfo);
		infos.put("checkJoin", checkMeetJoin);
		model.addAttribute("infos", infos);
		
		
		return "/chat/chat";
	}
}
