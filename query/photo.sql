-- 사진 생성
/*
CREATE TABLE photo(
    p_num NUMBER PRIMARY KEY NOT NULL,
    p_cate_name VARCHAR2(100) NOT NULL,
    p_date DATE DEFAULT SYSDATE,
    p_like NUMBER DEFAULT 0,
    p_image1 VARCHAR2(1000) DEFAULT NULL,
    p_image2 VARCHAR2(1000) DEFAULT NULL,
    p_image3 VARCHAR2(1000) DEFAULT NULL,
    p_view NUMBER DEFAULT 0,
    m_num NUMBER,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT p_cate_name_fk FOREIGN KEY (p_cate_name) REFERENCES photo_category(p_cate_name),
    CONSTRAINT p_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id),
    CONSTRAINT p_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num)
);*/

INSERT INTO photo(p_num, p_cate_name, p_date, p_like, p_image1, p_image2, p_image3, p_view, m_num, u_id)
VALUES(PHOTO_SEQ.nextval, '모임사진', '211001', 1, '사진', '사진1', '사진2', 1, '3' ,'wake'); 
select * from photo_comments;

commit;