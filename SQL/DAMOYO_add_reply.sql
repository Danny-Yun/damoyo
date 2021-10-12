-- 모임 내 게시판 댓글
--CREATE SEQUENCE  "MYTEST"."BOARD_COMMENTS_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--CREATE TABLE board_comments(
--    b_comment_num NUMBER PRIMARY KEY NOT NULL,
--    b_comment_content VARCHAR2(500) NOT NULL,
--    m_num NUMBER NOT NULL,
--    b_num NUMBER NOT NULL,
--    u_id VARCHAR2(100) NOT NULL,
--    CONSTRAINT bc_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
--    CONSTRAINT bc_b_num_fk FOREIGN KEY (b_num) REFERENCES board(b_num),
--    CONSTRAINT bc_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
--);
-- select
SELECT * FROM board_comments  WHERE b_num=2311 ORDER BY b_comment_num DESC;
SELECT * FROM board WHERE b_num=2311;

-- create
INSERT INTO board_comments(b_comment_num, b_comment_content, m_num, b_num, u_id)
VALUES (BOARD_COMMENTS_SEQ.nextval, '댓글테스트', 2305, 2311, 'wake');

-- uptate
UPDATE board_comments SET b_comment_content='수정 댓글 테스트'
WHERE b_comment_num=0;

-- delete
DELETE FROM board_comments WHERE b_comment_num=1;

-- 댓글 수 파악
SELECT COUNT(*) FROM board_comments WHERE b_num=2311;

COMMIT;
