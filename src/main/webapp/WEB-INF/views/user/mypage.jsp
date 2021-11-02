<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지 - DA!MOYO</title>
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
				<a class="main-nav__link" href="/user/mypage"
						style="color: black">
					<i class="fas fa-shoe-prints fa-lg"></i>
					<span>마이페이지</span>
				</a>
			</li>  				
	  	</ul>
  	</nav>
  	<!-- END nav -->

  	<!-- Start main -->
	<main>
		<div class="user-info">
			<div class="user-info__column">
				<img class="user-info__profile" src="#" />
				<div class="user-info__text">
					<div class="user-info__text-top">
						<h3 class="user-info__name">${profile.u_name}</h3>
						<h5 class="user-info__birth">${profile.u_birth}</h5>
					</div>
					<div class="user-info__text-bottom">
						<i class="fas fa-map-marker-alt"></i>
						<h4 class="user-info__area">${profile.u_area}</h4>
					</div>
				</div>
			</div>
			<div class="user-info__column">
				<a class="user-info__modify" href="/user/modify">내 정보 수정</a>
			</div>
		</div>
	
		<div class="my-page">
			<a href="/user/myinterest">
				<div class="my-page__column">
					<div class="my-page__text">
						<i style="color:lime" class="far fa-check-circle"></i>
						<span>내 관심사 편집</span>
					</div>
					<i class="fas fa-angle-right fa-lg"></i>
				</div>
			</a>
			<a href="/user/interest/meet">
				<div class="my-page__column">
					<div class="my-page__text">
						<i style="color:coral" class="fas fa-thumbtack"></i>
						<span>내 관심 모임</span>
					</div>
					<i class="fas fa-angle-right fa-lg"></i>
				</div>
			</a>
			<a href="/user/password">
				<div class="my-page__column">
					<div class="my-page__text">
						<i class="fas fa-lock"></i>
						<span>비밀번호 변경</span>
					</div>
					<i class="fas fa-angle-right fa-lg"></i>
				</div>
			</a>
			<a href="/user/leave">
				<div class="my-page__column">
					<div class="my-page__text">
						<i style="color:red" class="fas fa-sign-out-alt"></i>
						<span>회원 탈퇴</span>
					</div>
					<i class="fas fa-angle-right fa-lg"></i>
				</div>
			</a>
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
  	
	<script>
		let result = "${result}";
		console.log(result);
		if(result === "changePwOK") {
			alert("비밀번호가 변경되었습니다.");
		} 
	</script>
</body>
</html>