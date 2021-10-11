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
INSERT INTO board_like(b_like_num, m_num, b_num, u_id)
VALUES(BOARD_LIKE_SEQ.nextval, 2305, 2311, 'wls');















