<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>비밀번호 변경 - DA!MOYO</title>
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
		<h1 class="screen-header__title">비밀번호 변경</h1>
	</div>	
	<!-- END screen-header -->
  	
  	<!-- Start main -->
	<main>
		<div class="password-box-outer">
		  <div class="password-box">
			<form action="/user/password" method="post" id="password-form">
				<h3 class="password-form__info">기존 비밀번호를 입력하세요.</h3>
				<input class="password-form__pw" type="password" name="u_pw" required />
				<div class="password-form__btn">
					<button type="button" class="btn btn-outline-danger" onclick="history.back()">취소</button>
					<button type="button" class="btn btn-outline-primary" onclick="confirm()">확인</button>
				</div>
			</form>
		  </div>
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
		function confirm() {
			let confirm = document.getElementById("password-form");
			confirm.submit();
		}
	
		let result = "${result}";
		console.log(result);
		if(result === "fail") {
			alert("비밀번호가 일치하지 않습니다.");
		}
	</script>
</body>
</html>