# :two_men_holding_hands: DA!MOYO

> 자기계발 및 취미, 관심사 등을 공유할 수 있는 모임 기반 플랫폼 서비스

PPT : https://docs.google.com/presentation/d/143LuWc2uxJhblTUNMheN8FCG6YmtcwyZ98Svo6rzn0k/edit?usp=sharing

<br>

## :pushpin: 제작 기간 & 참여 인원
+ 2021년 9월 24일 ~ 11월 4일
+ 팀 프로젝트 (2명)

<br>

## :pushpin: 사용 기술 및 개발 환경

+ Java 8
+ JavaScript ES6
+ Spring 5.0.7
+ Oracle 18c
+ Junit
+ jQuery
+ Ajax
+ MyBatis
+ lombok
+ HikariCP
+ Json
+ Eclipse 2020-09

<br>

## :pushpin: ERD 설계 

+ 크게 모임(meet), 유저(user_info), 관심사(interest), 게시판(board), 사진갤러리(photo) 5개로 분류할 수 있으며, 총 17개의 테이블 사용하였습니다. 

![ERD](https://user-images.githubusercontent.com/86466976/138418433-322dce61-da73-4213-b242-512817f6a239.jpg)

<br>

+ 초안

![damoyo_DB설계초안 drawio](https://user-images.githubusercontent.com/45350620/138692001-b0a12476-59c5-4f6e-a665-46e467045842.png)

<br>

## :pushpin: 핵심 기능

- 회원(유저)
  - 로그인 및 회원가입
  - 관심사 및 상세관심사 저장, 편집
  - 관심 모임 및 가입한 모임 조회, 수정
  - 내 정보 조회 및 수정
  - 회원 탈퇴 / 비밀번호 변경

- 모임 리스트(메인 페이지)
  - 모임 카테고리 및 키워드 검색
  - 모임 개설
  - 모임 조회 및 페이지네이션

- 모임 상세
  - 모임 정보
  - 정모 개설
  - 게시판 카테고리별 조회
  - 게시판 댓글 / 좋아요
  - 모임 채팅방

