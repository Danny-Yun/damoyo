package ict.sjh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ict.sjh.service.PhotoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/photo/*")

@AllArgsConstructor
public class PhotoController {
	
	@Autowired
	private PhotoService serives;
	
}
