package com.damoyo.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
	//@Test
	public void getBoardTest() {
		
		service.getBoard(5L);
	}
	
	//@Test
	public void getBoardsTest() {
		service.getBoards();
	}
	
	//@Test
	public void insertTest() {
		BoardVO vo = new BoardVO();
		
		vo.setB_cate_name("운동");
		vo.setB_title("테스트용");
		vo.setB_content("이것은 테스트 용입니다.");
		vo.setU_id("홍길동");
		
		service.insert(vo);
		
	}
	
	//@Test
	public void updateTest() {
		BoardVO vo = new BoardVO();
		
		vo.setB_num(8L);
		vo.setB_title("수정완료");
		vo.setB_content("수정이 완료되었습니다.");
		
		service.update(vo);
	}
	
	@Test
	public void deleteTest() {
		service.delete(5L);
	}
}
