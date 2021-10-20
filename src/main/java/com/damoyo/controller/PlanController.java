package com.damoyo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damoyo.domain.PlanVO;
import com.damoyo.service.PlanService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/plan/*")
@AllArgsConstructor
public class PlanController {
	
	@Autowired
	PlanService service;
	
	@PostMapping("/create")
	public String create(PlanVO vo, RedirectAttributes rttr) {
		log.info("Plan vo정보: " + vo);
		service.insertPlan(vo);
		rttr.addAttribute("num", vo.getM_num());
		return "redirect:/meet/info";
	}
}
