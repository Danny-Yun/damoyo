-- board 카테고리 샘플 생성
-- 전체보기, 자유게시판, 관심사 공유, 정모후기, 가입인사, 공지사항

SELECT * FROM board_category;


INSERT INTO board_category(b_cate_num, b_cate_name)
VALUES(BOARD_CATEGORY_SEQ.nextval, '자유게시판');
INSERT INTO board_category(b_cate_num, b_cate_name)
VALUES(BOARD_CATEGORY_SEQ.nextval, '관심사 공유');
INSERT INTO board_category(b_cate_num, b_cate_name)
VALUES(BOARD_CATEGORY_SEQ.nextval, '정모후기');
INSERT INTO board_category(b_cate_num, b_cate_name)
VALUES(BOARD_CATEGORY_SEQ.nextval, '가입인사');
INSERT INTO board_category(b_cate_num, b_cate_name)
VALUES(BOARD_CATEGORY_SEQ.nextval, '공지사항');



-- board 샘플 생성
SELECT * FROM board;
INSERT INTO board(b_num, b_cate_name, b_title, b_content, m_num, u_id)
VALUES(BOARD_NUM.nextval, '자유게시판', 'SQLDeveloper로 쓴 게시판 내용', 'SQL', 14, 'thffk');


COMMIT;













