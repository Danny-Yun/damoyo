<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>모임 수정 - DA!MOYO</title>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/css/styles.css">
<!-- font-awesome code kit -->
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</head>
<body>
  <div id="wrapper">
  
  	<!-- Start header -->
  	<header class="main-header">
  		<div class="main-header__column">
  			<a href="/main/">
  			<img class="main-header__logo" src="/resources/img/logo.jpg" /></a>
  		</div>
		<div class="main-header__column">
			<span class="main-header__username">${userInfo.u_name }님, 환영합니다.</span>
			<span class="main-header__logout">
				<form action="/user/logout" method="post">
					<input type="submit" class="main-header__logout" value="로그아웃" />
				</form>
			</span>
		</div>
  	</header>
	<!-- END header -->
	
	<!-- Start meet-detail -->
	<div class="meet-detail">
		<div class="meet-detail__name">${infos.meet.m_name }</div>
	</div>
	<!-- END meet-detail -->
	
  	<!-- Start nav -->
  	<nav class="main-nav">
	  	<ul class="main-nav__list">
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/meet/info?num=${infos.meet.m_num }"
						style="color: black">
					<i class="fab fa-fort-awesome fa-lg"></i>
					<span>모임방</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/meet/board/list">
					<i class="fas fa-feather-alt fa-lg"></i>
					<span>게시판</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<c:if test="${infos.checkJoin eq null }">
					<a class="main-nav__link-checkJoin" href="#">
						<div class="main-nav__link">
							<i class="fas fa-comments fa-lg"></i>
							<span>채팅</span>
						</div>
					</a>
				</c:if>
				<c:if test="${infos.checkJoin ne null }">
					<a class="main-nav__link-checkJoin" href="/chatting?room_id=${infos.meet.m_num }">
						<div class="main-nav__link">
							<i class="fas fa-comments fa-lg"></i>
							<span>채팅</span>
						</div>
					</a>
				</c:if>
			</li>  		 		
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/main/">
					<i class="far fa-compass fa-lg"></i>
					<span>모임 찾기</span>
				</a>
			</li>  			
	  	</ul>
  	</nav>
  	<!-- END nav -->
  	
  	<!-- Start screen-header -->
  	<div class="screen-header">
		<h1 class="screen-header__title">모임 정보 수정</h1>
	</div>
	<!-- END screen-header -->
  	
  	<!-- Start main -->
	<main>
		<form class="meet-update-form" action="/meet/update/process" method="post" enctype="multipart/form-data">
			<input type="hidden" name="m_num" value="${meetInfo.m_num }">
			<div class="register-form__column">
				<span>모임 이름</span>
				<input type="text" name="m_name" value="${meetInfo.m_name }"/>
			</div>
			<div class="register-form__column">
				<span>모임 인원</span>
				<select name="m_people_cnt">
					<c:forEach var="num" begin="1" end="200">
						<option value="${num }">${num }
					</c:forEach>
				</select>
			</div>
			<div class="register-form__column">
				<span>모임 지역 </span>
				<input type="text" name="m_area" value="${meetInfo.m_area }" />
			</div>
			<div class="register-form__column">
				<span>모임 사진</span>
				<input type="file" name="profile" value="">${meetInfo.m_profile }
			</div>
			<div class="register-form__column">
				<span>모임 종류</span>
				<select name="i_cate_num">
					<c:forEach var="cate" items="${category }">
					    <option value=${cate.i_cate_num }
					    <c:out value="${cate.i_cate_num eq meetInfo.i_cate_num ? 'selected' : '' }"/>>${cate.i_cate_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="register-form__column">
				<span>모임 방장</span>
				<input type="text" name="u_id" value="${userInfo.u_id }" readonly="readonly" />
			</div>
			<div class="register-form__column">
				<span>모임 내용</span>
				<textarea rows="7px" name="m_content">${meetInfo.m_content }</textarea>
			</div>
			<div class="register-form__btn">
				<button type="button" class="btn btn-outline-danger"
					onclick="history.back()">이전</button>
				<input class="btn btn-outline-primary" type="submit" value="수정" />	
			</div>
		</form>
	</main>
	<!-- END main -->
	
	<!-- Start footer -->
	<footer class="main-footer">
		<div class="main-footer__info">
			Made by Riudiu, Wakebro &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
			Contact by GitHub : github.com/Riudiu
		</div>
		<div class="main-footer__copyright">Copyright 2021. DAMOYO. All rights reserved. </div>
	</footer>
	<!-- END footer -->
  </div>	
</body>
</html>