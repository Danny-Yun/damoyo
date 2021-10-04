package com.damoyo.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.damoyo.domain.PhotocommentsVO;
import com.damoyo.service.Photocomments;

@RestController
@RequestMapping("/inserts/*")
public class CommentsController {
	
	@Autowired
	private Photocomments service;
	
	@PostMapping(value="", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	// produces에 TEXT_PLAIN_VALUE를 줬으므로 결과코드와 문자열을 넘김
	public ResponseEntity<String> register(
			@RequestBody PhotocommentsVO vo){
		ResponseEntity<String> entity=null;
		try {
			// 먼저 글쓰기 로직 실행 후 에러가 없다면...
			service.addcomments(vo);
			entity = new ResponseEntity<String>(
					"SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			// catch로 넘어왔다라는건 글쓰기 로직에 문제가 생긴 상황
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 위의 try블럭이나 catch블럭에서 얻어온 entity변수 리턴
		return entity;
	}
	
	@GetMapping(value="/all/{p_num}",
			// 단일 숫자데이터 bno만 넣기도 하고
			// PathVarible 어노테이션으로 이미 입력데이터가
			// 명시되었으므로 consumes는 따로 주지 않아도 됩니다.
			// produces는 댓글 목록이 XML로도, JSON으로도 표현될수있도록
			// 아래와같이 2개를 모두 놓아둡니다.
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PhotocommentsVO>> list(
			@PathVariable("p_num") Long p_num){
		
		ResponseEntity<List<PhotocommentsVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(
				service.listcomments(p_num), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	@DeleteMapping(value="/{p_num}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(
			@PathVariable("p_num") Long p_num){
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(p_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
				return entity;
	}
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{p_num}",
			consumes = "application/json",
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(
			// VO는 우선 payload에 적힌 데이터로 받아옵니다.
			// @RequestBody가 붙은 VO는
			// payload에 적힌 데이터를 VO로 환산해서 가져옵니다.
			@RequestBody PhotocommentsVO vo, 
			// 단, 댓글번호는 주소에 기입된 숫자를 자원으로 받아옵니다.
			@PathVariable("p_cate_num") Long p_cate_num){
		
		ResponseEntity<String> entity = null;
		try {
			// payload에는 reply만 넣어줘도 되는데 그 이유는
			// rno는 요청주소로 받아오기 때문입니다.
			// 단, rno를 주소로 받아오는 경우는 아직 replyVO에
			// rno가 세팅이 되지 않은 상태이므로 setter로 rno까지
			// 지정해줍니다.
			vo.setP_comment_num(p_cate_num);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
