<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>로그인 - DA!MOYO</title>
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
	<header class="login-header">
		<h1 class="login-header__logo">DA!MOYO</h1>
	</header>
	<!-- END header -->
	
	<!-- Start login-form -->
	<div class="login-form-outer">
		<form class="login-form" action="/user/login" method="post">
			<div class="login-form__input">
				<i class="far fa-user"></i>
				<input class="login-form__input-id" type="text" name="u_id" 
					placeholder="아이디" required />
			</div>
			<div class="login-form__input">
				<i class="fas fa-key"></i>
				<input class="login-form__input-pw" type="password" name="u_pw" 
					placeholder="비밀번호" required />
			</div>
			<div class="login-form__btn">
				<input type="submit" value="로그인" />
				<button type="button" onclick="location.href='/user/join'">회원가입</button>
			</div>
		</form>
	</div>
	<!-- END login-form -->
	
	<!-- Start footer -->
	<footer class="login-footer">
		<div class="login-footer__info">
			Made by Riudiu, Wakebro &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
			Contact by GitHub : github.com/Riudiu
		</div>
		<div class="login-footer__copyright">Copyright 2021. DAMOYO. All rights reserved. </div>
	</footer>
	<!-- END footer -->
  </div>		
	<script>
		const result = "${result}";
		console.log(result);
		
		if(result === "fail") {
			alert("아이디와 비밀번호가 일치하지 않습니다.");
		} else if (result === "leaveOK") {
			alert("정상적으로 탈퇴 처리되었습니다.");
		}
		
		$(".login-form__input-id").focus(function() {
			$(".login-form__input:first-child").css({"opacity":"1", "border-color":"#ae93ff"});
		});
		$(".login-form__input-id").blur(function() {
			$(".login-form__input:first-child").css({"opacity":"0.6", "border-color":"rgba(192, 171, 171, 0.7)"});
		});
		
		$(".login-form__input-pw").focus(function() {
			$(".login-form__input:nth-child(2)").css({"opacity":"1", "border-color":"#ae93ff"});
		});
		$(".login-form__input-pw").blur(function() {
			$(".login-form__input:nth-child(2)").css({"opacity":"0.6", "border-color":"rgba(192, 171, 171, 0.7)"});
		});
	</script>
</body>
</html>