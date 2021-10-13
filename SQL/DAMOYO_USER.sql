-- 환결설정에서 날짜 포맷 변경 후
-- 기본 유저 등록
DESC user_info;
INSERT INTO user_info(u_id, u_pw, u_name, u_sex, u_birth, u_area, u_intro, u_profile) 
    VALUES('wake', '1111', '형기상', 0, TO_DATE('1993-01-19 00:00:00','YYYY-MM-DD HH24:MI:SS'),'은평구', '안녕하세요', null);
    
SELECT * FROM user_info;
SELECT * FROM my_favorit_interest;

SELECT * FROM my_join_meet;
SELECT * FROM my_interest_meet;

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

SELECT * FROM interest_category;


-- 상세 관심사 추가
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
    VALUES(INTEREST_DETAIL_SEQ.nextval, '클라이밍', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '헬스', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '다이어트', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '요가/필라테스', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '축구/풋살/족구', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '농구', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '야구', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '탁구', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '당구/포켓볼', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '수영/스쿠버다이빙', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '서핑/웨이크보드', 1);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '펜싱', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '무술/주짓수', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '태권도/유도', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '검도', 1);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '승마', 1);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '복싱', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '스케이트/인라인', 1);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '양궁', 1);    


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '책/독서', 2);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '인문학', 2);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '심리학', 2);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '철학', 2);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '역사', 2);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '시사/경제', 2);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '작문/글쓰기', 2);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '뇌과학', 2);


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
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '독일어', 3);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '이탈리아어', 3);        


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '뮤지컬/오페라', 4);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '공연/연극', 4);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '영화', 4);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '전시회', 4);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '연기/공연제작', 4);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '문화재탐방', 4);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '파티/페스티벌', 4);


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '노래/보컬', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '작사/작곡', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '기타/베이스/우쿨렐레', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '드럼', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '피아노', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '바이올린', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '밴드/합주', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '인디음악', 5);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '클래식', 5);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '재즈', 5);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'R&B', 5);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '랩/힙합', 5);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'EDM/DJ', 5);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '국악/사물놀이', 5);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '발라드', 5);    
    
    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '미술/그림', 6);   
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '캘리그라피', 6);      
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '천연비누/화장품', 6);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '캔들/디퓨저', 6);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '가죽공예', 6);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '소품공예', 6);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '가구/목공예', 6);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '자수/뜨개질', 6);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '도자/점토공예', 6);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '메이크업/네일', 6);  


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '라틴댄스', 7);  
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '방송/힙합', 7); 
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '스트릿댄스', 7); 
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '발레', 7); 
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '현대무용', 7); 
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '재즈댄스', 7); 
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '한국무용', 7); 
   
    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '양로원', 8);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '보육원', 8);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '환경봉사', 8);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '사회봉사', 8);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '교육/재능나눔', 8);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '유기동물보호', 8);     
    
    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '지역', 9);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '나이', 9);        
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '성별', 9);        
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '싱글/연애/썸', 9);        
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '기혼/유부', 9);       
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '돌싱', 9);        
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '와인/커피/차', 9);        
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '맛집/미식회', 9);        
 
 
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '현대/기아', 10);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '르노/GM/쌍용', 10);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '테슬라', 10);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '스포츠카', 10);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '국산차', 10);     
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '미국차', 10);       
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '유럽차', 10);       
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '일본차', 10);       
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '바이크', 10);       
  
    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'DSLR', 11);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '필름카메라', 11);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '영상제작', 11);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '디지털카메라', 11);    
    
    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '삼성라이온즈', 12);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '두산베어스', 12);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '기아타이거즈', 12);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'LG트윈스', 12);    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '롯데자이언츠', 12);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '한화이글스', 12);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '키움히어로즈', 12);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'SSG랜더스', 12);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'NC다이노스', 12);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, 'KT위즈', 12);


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '보드게임', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '두뇌심리게임', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '온라인게임', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '콘솔게임', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '단체놀이', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '마술', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '바둑/오목/장기', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '다트', 13);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '타로카드', 13);


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '한식', 14);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '양식', 14);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '중식', 14);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '일식', 14);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '베이킹/제과', 14);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '소믈리에/와인', 14);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '주류제조/칵테일', 14);


INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '강아지', 15);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '고양이', 15);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '포유류', 15);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '물고기', 15);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '파충류', 15);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '설치류/중치류', 15);

    
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '결혼/웨딩', 16);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '육아/맘', 16);
INSERT INTO interest_detail(I_DETAIL_NUM, I_DETAIL_NAME, I_CATE_NUM) 
    VALUES(INTEREST_DETAIL_SEQ.nextval, '아빠/대디', 16);

SELECT * FROM interest_detail ORDER BY i_cate_num;

COMMIT;
