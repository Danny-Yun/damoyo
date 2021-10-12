package com.damoyo.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.BoardCateVO;
import com.damoyo.domain.BoardLikeVO;
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
		
//		service.getBoard(5L);
	}
	
	//@Test
	public void getBoardsTest() {
//		service.getBoards(13L);
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
	
//	@Test
	public void deleteTest() {
		service.delete(6L);
	}
	
//	@Test
	public void insertCate() {
		String[] arr = {"전체보기", "자유게시판", "관심사 공유", "정모후기", "가입인사", "공지사항"};
		for (int i = 0; i < arr.length-1; i++) {
			BoardCateVO vo = new BoardCateVO();
			vo.setM_num(16L);
			vo.setB_cate_name(arr[i]);
			log.info(vo);
			service.insertCate(vo);
		}
	}
	
	@Test
	public void testcheckLike() {
		log.info("테스트");
		log.info(service.checkLike(2312L, "wls"));
	}
}
