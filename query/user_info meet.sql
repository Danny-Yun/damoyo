-- 환결설정에서 날짜 포맷 변경 후
-- 기본 유저 등록
DESC user_info;
INSERT INTO user_info(u_id, u_pw, u_name, u_sex, u_birth, u_area, u_intro, u_profile) 
    VALUES('wake', '1111', '형기상', 0, TO_DATE('1993-01-19 00:00:00','YYYY-MM-DD HH24:MI:SS'),'은평구', '안녕하세요', null);

SELECT * FROM user_info;


-- 관심사 등록
DESC interest_category;
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '아웃도어/여행');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '운동/스포츠');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '인문학/책/글');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '외국/언어');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '문화/공연/축제');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '음악/악기');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '공예/만들기');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '댄스/무용');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '봉사활동');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '사교/인맥');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '차/오토바이');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '사진/영상');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '야구관람');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '게임/오락');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '요리/제조');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '반려동물');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '가족/결혼');
INSERT INTO interest_category(I_CATE_NUM, I_CATE_NAME)
    VALUES(INTEREST_CATEGORY_SEQ.nextval, '자유주제');

SELECT * FROM interest_category;


-- 상세 관심사
SELECT * FROM interest_detail;
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '자전거', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '배드민턴', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '볼링', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '테니스', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '스키/보드', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '골프', 1);
    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '등산', 0);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '산책/트래킹', 0);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '캠핑/백패킹', 0);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '국내여행', 0);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '해외여행', 0);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '낚시', 0);

INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '결혼/웨딩', 16);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '육아/맘', 16);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '아빠/대디', 16);

INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'DSLR', 11);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '필름카메라', 11);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '영상제작', 11);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '디지털카메라', 11);

INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '영어', 3);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '일본어', 3);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '중국어', 3);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '프랑스어', 3);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '스페인어', 3);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '러시아어', 3);

SELECT * FROM interest_detail ORDER BY i_cate_num;

INSERT INTO meet(M_NUM, M_NAME, M_CONTENT, M_PEOPLE_CNT, M_AREA, M_PROFILE, I_CATE_NUM, u_id)
VALUES(MEET_SEQ.nextval,'배트민턴부','본문',1,'서울','안녕',1,'wake');

INSERT INTO 
meet(m_num, m_name, m_content, m_people_cnt, m_area, m_profile, i_cate_num, u_id)
VALUES(MEET_SEQ.nextval, '한강 러닝', '안녕하세요. 한강에서 러닝할 사람들의 모임입니다.', 20, '마포구', null, 1, 'wake');

INSERT INTO 
meet(m_num, m_name, m_content, m_people_cnt, m_area, m_profile, i_cate_num, u_id)
VALUES(MEET_SEQ.nextval, '삭제', '안녕하세요. 한강에서 러닝할 사람들의 모임입니다.', 20, '마포구', null, 1, 'wake');


select * from meet;

SELECT meet.*, interest_category.i_cate_name FROM meet INNER JOIN interest_category 
    ON meet.i_cate_num=interest_category.i_cate_num WHERE m_num=3;

DELETE FROM meet WHERE m_num=4;

UPDATE meet SET m_name='홍대신촌 댄스', m_content='홍대와 신촌에 있는 방송댄스', m_people_cnt=40, m_area='서대문구',i_cate_num=7, m_profile=null
WHERE m_num=2;


-- 모임방 가입
SELECT * FROM meet_member_list WHERE m_num=2;

SELECT user_info.u_profile,user_info.u_name,user_info.u_intro, meet_member_list.* 
FROM meet_member_list INNER JOIN user_info 
ON meet_member_list.u_id=user_info.u_id WHERE m_num=1;

-- 모임방 탈퇴
DELETE meet_member_list WHERE member_list_num=4;




INSERT INTO photo_category(P_CATE_NUM,P_CATE_NAME, M_NUM) VALUES(PHOTO_CATEGORY_SEQ.nextval, '모임사진',3);

INSERT INTO photo(p_num, p_cate_name, p_date, p_like, p_image1, p_image2, p_image3, p_view, m_num, u_id)
VALUES(PHOTO_SEQ.nextval, '모임사진', '211001', 1, '사진', '사진1', '사진2', 1, '3' ,'wake'); 
select * from photo;

INSERT INTO photo_comments(p_comment_num, p_comment_content, m_num, p_num, u_id) VALUES(PHOTO_COMMENTS_SEQ.nextval, 2, 3, 1, 'wake');

INSERT INTO photo_like(p_like_num, m_num, p_num, u_id) VALUES(PHOTO_LIKE_SEQ.nextval, 3, 1, 'wake');

select * from photo_like;

COMMIT;