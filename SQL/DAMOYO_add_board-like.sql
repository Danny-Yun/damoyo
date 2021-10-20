-- 모임 내 게시판 좋아요
--CREATE TABLE board_like(
--    b_like_num NUMBER PRIMARY KEY NOT NULL,
--    m_num NUMBER NOT NULL,
--    b_num NUMBER NOT NULL,
--    u_id VARCHAR2(100) NOT NULL,
--    CONSTRAINT bl_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
--    CONSTRAINT bl_b_mum_fk FOREIGN KEY (b_num) REFERENCES board(b_num),
--    CONSTRAINT bl_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
--);

-- Sample
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305, 2311, 'wls');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'tbrk');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'wpdlghq');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'rm');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'wlals');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'qnl');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'wjdrnr');

INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'skdus');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'wjddus');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'ahah');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'tksk');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'wlgy');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'alsk');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'ekgus');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'codud');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2311, 'Wmdnl');

INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wls');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wls');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'tbrk');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wpdlghq');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'rm');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wlals');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'qnl');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wjdrnr');

INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'skdus');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wjddus');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'ahah');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'tksk');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'wlgy');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'alsk');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'ekgus');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'codud');
INSERT INTO board_like(b_like_num, m_num, b_num, u_id) VALUES(BOARD_LIKE_SEQ.nextval, 2305,2312, 'Wmdnl');

-- Like 누른 리스트
SELECT * FROM board_like WHERE b_num=2312 AND u_id='ansquf';
SELECT * FROM board_like WHERE b_num=2312 ORDER BY b_like_num DESC;
DELETE FROM board_like WHERE b_like_num=36;





commit;














