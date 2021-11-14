<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>프로필 수정 - DA!MOYO</title>
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
	
  	<!-- Start nav -->
  	<nav class="main-nav">
	  	<ul class="main-nav__list">
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/main/">
					<i class="far fa-compass fa-lg"></i>
					<span>모임 찾기</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/user/myMeet">
					<i class="far fa-map fa-lg"></i>
					<span>내 모임</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/user/mypage">
					<i class="fas fa-shoe-prints fa-lg"></i>
					<span>마이페이지</span>
				</a>
			</li>  				
	  	</ul>
  	</nav>
  	<!-- END nav -->

	<!-- Start screen-header -->
	<div class="screen-header">
		<h1 class="screen-header__title">프로필 수정</h1>
	</div>
	<!-- END screen-header -->
	
  	<!-- Start main -->
	<main>	
	  <div class="profile-outer">
		<img class="profile-pic" src="/user/display2?u_id=${profile.u_id }"><br>
		<form class="profile-form" action="/user/modify" method="post" enctype="multipart/form-data">
			
			<div class="profile-form__column">
				<input type="file" name="profile" multiple />
			</div>
			
			<div class="profile-form__column">
				<input type="text" name="u_id" value="${profile.u_id}" readonly />
			</div>
	
			<div class="profile-form__column">
				<input class="profile-form__name" type="text" name="u_name" value="${profile.u_name}" required />
				
				<div class="profile-form__sex">
					<c:choose>
					  <c:when test="${profile.u_sex == 0}">
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off" checked>
						  <label class="btn btn-outline-primary" for="0">  남성  </label>
						
						  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off">
						  <label class="btn btn-outline-primary" for="1">  여성  </label>
						</div>
					  </c:when>
					  <c:otherwise>
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off">
						  <label class="btn btn-outline-primary" for="0">  남성  </label>
						
						  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off" checked>
						  <label class="btn btn-outline-primary" for="1">  여성  </label>
						</div>
					  </c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="profile-form__column">
				<input type="date" name="u_birth" value="${profile.u_birth}" required />
				<input type="text" name="u_area" value="${profile.u_area}" required />
			</div>
			
			<div class="profile-form__textarea">
				<textarea cols="70px" rows="10px" name="u_intro" 
					required="required">${profile.u_intro}</textarea>
			</div>
			
			<div class="password-form__btn">
				<button type="button" class="btn btn-outline-danger"
					onclick="history.back()">이전</button>
				<input class="btn btn-outline-primary" type="submit" value="저장" />	
			</div>
		</form>
	  </div> 
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