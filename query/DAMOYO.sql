-- 유저 정보
CREATE SEQUENCE  "MYTEST"."USER_INFO_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE user_info (
    u_id varchar2(100) PRIMARY KEY NOT NULL,
    u_pw varchar2(100) NOT NULL,
    u_name varchar2(50) NOT NULL,
    u_sex number(3) NOT NULL,
    u_birth date NOT NULL,
    u_area varchar2(50) NOT NULL,
    u_intro varchar2(1000),
    u_profile varchar2(1000)
);

-- 유저 관심사 카테고리
CREATE SEQUENCE  "MYTEST"."INTEREST_CATEGORY_SEQ"  MINVALUE 0 MAXVALUE 99 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE interest_category (
    i_cate_num NUMBER(3) PRIMARY KEY NOT NULL,
    i_cate_name VARCHAR2(100) NOT NULL
);

-- 유저 관심사 상세내용
CREATE SEQUENCE  "MYTEST"."INTEREST_DETAIL_SEQ"  MINVALUE 0 MAXVALUE 999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE interest_detail (
    i_detail_num NUMBER(3) PRIMARY KEY NOT NULL,
    i_detail_name VARCHAR2(100) NOT NULL,
    i_cate_num NUMBER(3) NOT NULL,
    CONSTRAINT i_cate_fk FOREIGN KEY (i_cate_num) REFERENCES interest_category(i_cate_num),
    CONSTRAINT uni_detail_name UNIQUE (i_detail_name)
);

-- 유저 관심사 내용
CREATE SEQUENCE  "MYTEST"."MY_FAVORIT_INTEREST_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE my_favorit_interest (
    f_interest_num NUMBER(3) PRIMARY KEY NOT NULL,
    u_id varchar2(100) NOT NULL,
    i_detail_name VARCHAR2(100) NOT NULL,
    CONSTRAINT mfi_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id),
    CONSTRAINT mfi_i_detail_fk FOREIGN KEY (i_detail_name) REFERENCES interest_detail(i_detail_name)
);
-- FK 삭제
ALTER TABLE my_favorit_interest DROP CONSTRAINT mfi_u_id_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE my_favorit_interest ADD CONSTRAINT mfi_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id) ON DELETE CASCADE;


-- 모임
CREATE SEQUENCE  "MYTEST"."MEET_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE meet (
    m_num NUMBER PRIMARY KEY NOT NULL,
    m_name VARCHAR2(100) NOT NULL,
    m_content VARCHAR2(500) NOT NULL,
    m_people_cnt NUMBER DEFAULT 0,
    m_area VARCHAR2(50) NOT NULL,
    m_profile VARCHAR2(1000),
    i_cate_num NUMBER(3) NOT NULL,
    u_id varchar2(100) NOT NULL,
    CONSTRAINT meet_i_cate_fk FOREIGN KEY (i_cate_num) REFERENCES interest_category(i_cate_num),
    CONSTRAINT meet_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
);

-- 모임 멤버수
CREATE SEQUENCE  "MYTEST"."MEET_MEMBER_LIST_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE meet_member_list(
    member_list_num NUMBER PRIMARY KEY NOT NULL,
    m_num NUMBER,
    u_id varchar2(100) NOT NULL,
    member_list_position VARCHAR2(10) DEFAULT NULL,
    CONSTRAINT mml_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT mml_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
);
-- FK 삭제
ALTER TABLE meet_member_list DROP CONSTRAINT mml_m_mum_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE meet_member_list ADD CONSTRAINT mml_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 내가 가입한 모임
CREATE SEQUENCE  "MYTEST"."MY_JOIN_MEET_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE my_join_meet (
    my_join_num NUMBER PRIMARY KEY NOT NULL,
    u_id varchar2(100) NOT NULL,
    m_num NUMBER,
    my_join_star CHAR(1) DEFAULT '0',
    CONSTRAINT mjm_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id),
    CONSTRAINT mjm_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT mjm_m_star_ck CHECK(my_join_star IN ('0','1'))
);
-- FK 삭제
ALTER TABLE my_join_meet DROP CONSTRAINT mjm_m_mum_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE my_join_meet ADD CONSTRAINT mjm_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 내가 관심있는 모임(가입x)
CREATE SEQUENCE  "MYTEST"."MY_INTEREST_MEET_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE my_interest_meet(
    my_interest_num NUMBER PRIMARY KEY NOT NULL,
    u_id varchar2(100) NOT NULL,
    m_num NUMBER,
    CONSTRAINT mim_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id),
    CONSTRAINT mim_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num)
);
-- FK 삭제
ALTER TABLE my_interest_meet DROP CONSTRAINT mim_m_mum_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE my_interest_meet ADD CONSTRAINT mim_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 게시판 카테고리
CREATE SEQUENCE  "MYTEST"."BOARD_CATEGORY_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE board_category(
    b_cate_num NUMBER(3) PRIMARY KEY NOT NULL,
    b_cate_name VARCHAR2(40) NOT NULL,
    m_num NUMBER NOT NULL,
    CONSTRAINT bc_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT uni_b_cate_name UNIQUE (b_cate_name)
);
-- FK 삭제
ALTER TABLE board_category DROP CONSTRAINT bc_m_mum_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE board_category ADD CONSTRAINT bc_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 게시판
CREATE SEQUENCE  "MYTEST"."BOARD_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE board(
    b_num NUMBER PRIMARY KEY NOT NULL,
    b_cate_name VARCHAR2(100) NOT NULL,
    b_title VARCHAR2(100) NOT NULL,
    b_content VARCHAR(500) NOT NULL,
    b_date DATE DEFAULT SYSDATE,
    b_like NUMBER DEFAULT 0,
    b_image1 VARCHAR2(1000) DEFAULT NULL,
    b_image2 VARCHAR2(1000) DEFAULT NULL,
    b_image3 VARCHAR2(1000) DEFAULT NULL,
    b_view NUMBER DEFAULT 0,
    m_num NUMBER,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT b_cate_name_fk FOREIGN KEY (b_cate_name) REFERENCES board_category(b_cate_name),
    CONSTRAINT b_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id),
    CONSTRAINT b_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num)
);
-- FK 삭제
ALTER TABLE board DROP CONSTRAINT b_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE board ADD CONSTRAINT b_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 게시판 댓글
CREATE SEQUENCE  "MYTEST"."BOARD_COMMENTS_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE board_comments(
    b_comment_num NUMBER PRIMARY KEY NOT NULL,
    b_comment_content VARCHAR2(500) NOT NULL,
    m_num NUMBER NOT NULL,
    b_num NUMBER NOT NULL,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT bc_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT bc_b_num_fk FOREIGN KEY (b_num) REFERENCES board(b_num),
    CONSTRAINT bc_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
);
-- FK 삭제
ALTER TABLE board_comments DROP CONSTRAINT bc_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE board_comments ADD CONSTRAINT bc_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 게시판 좋아요
CREATE SEQUENCE  "MYTEST"."BOARD_LIKE_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE board_like(
    b_like_num NUMBER PRIMARY KEY NOT NULL,
    m_num NUMBER NOT NULL,
    b_num NUMBER NOT NULL,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT bl_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT bl_b_mum_fk FOREIGN KEY (b_num) REFERENCES board(b_num),
    CONSTRAINT bl_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
);
-- FK 삭제
ALTER TABLE board_like DROP CONSTRAINT bl_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE board_like ADD CONSTRAINT bl_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 갤러리 카테고리
CREATE SEQUENCE  "MYTEST"."PHOTO_CATEGORY_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE photo_category(
    p_cate_num NUMBER(3) PRIMARY KEY NOT NULL,
    p_cate_name VARCHAR2(10) NOT NULL,
    m_num NUMBER NOT NULL,
    CONSTRAINT pc_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT pc_p_cate_name UNIQUE (p_cate_name)
);
-- FK 삭제
ALTER TABLE photo_category DROP CONSTRAINT pc_m_mum_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE photo_category ADD CONSTRAINT pc_m_mum_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 갤러리
CREATE SEQUENCE  "MYTEST"."PHOTO_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE photo(
    p_num NUMBER PRIMARY KEY NOT NULL,
    P_cate_name VARCHAR2(100) NOT NULL,
    P_date DATE DEFAULT SYSDATE,
    P_like NUMBER DEFAULT 0,
    P_image1 VARCHAR2(1000) DEFAULT NULL,
    P_image2 VARCHAR2(1000) DEFAULT NULL,
    P_image3 VARCHAR2(1000) DEFAULT NULL,
    P_view NUMBER DEFAULT 0,
    m_num NUMBER,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT p_cate_name_fk FOREIGN KEY (P_cate_name) REFERENCES photo_category(P_cate_name),
    CONSTRAINT p_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id),
    CONSTRAINT p_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num)
);
-- FK 삭제
ALTER TABLE photo DROP CONSTRAINT p_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE photo ADD CONSTRAINT p_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 갤러리 댓글
CREATE SEQUENCE  "MYTEST"."PHOTO_COMMENTS_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE photo_comments(
    p_comment_num NUMBER PRIMARY KEY NOT NULL,
    p_comment_content VARCHAR2(500) NOT NULL,
    m_num NUMBER NOT NULL,
    p_num NUMBER NOT NULL,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT pc_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT pc_p_num_fk FOREIGN KEY (p_num) REFERENCES photo(p_num),
    CONSTRAINT pc_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
);
-- FK 삭제
ALTER TABLE photo_comments DROP CONSTRAINT pc_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE photo_comments ADD CONSTRAINT pc_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 갤러리 좋아요
CREATE SEQUENCE  "MYTEST"."PHOTO_LIKE_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE photo_like(
    p_like_num NUMBER PRIMARY KEY NOT NULL,
    m_num NUMBER NOT NULL,
    p_num NUMBER NOT NULL,
    u_id VARCHAR2(100) NOT NULL,
    CONSTRAINT pl_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num),
    CONSTRAINT pl_b_mum_fk FOREIGN KEY (p_num) REFERENCES photo(p_num),
    CONSTRAINT pl_u_id_fk FOREIGN KEY (u_id) REFERENCES user_info(u_id)
);
-- FK 삭제
ALTER TABLE photo_like DROP CONSTRAINT pl_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE photo_like ADD CONSTRAINT pl_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


-- 모임 내 번개
CREATE SEQUENCE  "MYTEST"."MEET_PLAN_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
CREATE TABLE meet_plan(
    m_plan_num NUMBER PRIMARY KEY NOT NULL,
    m_plan_name VARCHAR2(50) NOT NULL,
    m_plan_people_cnt NUMBER(3) NOT NULL,
    m_plan_startdate DATE,
    m_plan_money NUMBER DEFAULT 0,
    m_plan_area VARCHAR2(50) NOT NULL,
    m_num NUMBER NOT NULL,
    CONSTRAINT ml_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num)
);
-- FK 삭제
ALTER TABLE meet_plan DROP CONSTRAINT ml_m_num_fk;
-- FK 재설정__CASCADE설정
ALTER TABLE meet_plan ADD CONSTRAINT ml_m_num_fk FOREIGN KEY (m_num) REFERENCES meet(m_num) ON DELETE CASCADE;


COMMIT;

