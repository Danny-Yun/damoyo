package com.damoyo.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.damoyo.domain.BoardSearchCriteria;
import com.damoyo.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	public BoardMapper mapper;
	
//	@Test
	public void getBoardsTest() {
		BoardSearchCriteria cri = new BoardSearchCriteria();
		cri.setSearchType("가입인사");
		cri.setKeyword("인사");
//		log.info(cri);
		log.info("pageNum : " + cri.getPageNum());
		log.info("amount : " + cri.getAmount());
		log.info("searchtype : " + cri.getSearchType());
		log.info("keyword : " + cri.getKeyword());
		log.info(mapper.getBoards(cri, 2L));
	}
	
//	@Test
	public void insertTest() {
		BoardVO vo = new BoardVO();
		
		vo.setB_cate_name("운동");
		vo.setB_title("Delete 할 것");
		vo.setB_content("이 글은 Delete 될 것입니다.");
		vo.setU_id("wake");
		
		mapper.insert(vo);
	}
	
	//@Test
	public void updateTest() {
		BoardVO vo = new BoardVO();
		
		vo.setB_num(5L);
		vo.setB_title("수정완료");
		vo.setB_content("수정이 완료되었습니다.");
		
		mapper.update(vo);
		
	}
	
//	@Test
	public void deleteTest() {
		mapper.delete(6L);
	}
	
//	@Test
	// 게시판 카테고리 조회
	public void testGetBoardCate() {
		mapper.getBoardCate();
	}
	
//	@Test
	public void testGetTotalBoard() {
		BoardSearchCriteria cri = new BoardSearchCriteria();
		cri.setSearchType("");
		cri.setKeyword("인사");
		log.info(mapper.getTotalBoard(cri, 2L));
	}
	
	@Test
	public void testCheckLike() {
		log.info("테스트");
		
		log.info("결과 : "+mapper.checkLike(2311L, "wlss"));
	}
	
}
