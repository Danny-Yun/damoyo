<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>내 관심사 - DA!MOYO</title>
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
		<h1 class="screen-header__title">내 관심사</h1>
	</div>		
	<!-- END screen-header -->
	
  	<!-- Start main -->
	<main>

	<div class="d-grid gap-2">
		<a href="/user/interest"><button type="button" class="btn btn-primary">관심사 추가하기</button></a>
	</div>
	<br><br/>
	
	<b>선택한 상세관심사</b> (현재 개수 : ${i_num })
	<br><br/>
	<c:forEach var="myInterest" items="${myInterest}" >
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-light" value="${myInterest.f_interest_num }">${myInterest.i_detail_name }</button>
			<button type="button" class="btn-close" onclick="removeInterest(${myInterest.f_interest_num })" ></button>
		</div>&nbsp;&nbsp;
	</c:forEach>

	<form style='display:inline' action="/user/myinterest/remove" method="post" id="remove">
		<input type="hidden" value="" name="f_interest_num" />
	</form> 
	
	<p><button type="button" class="btn btn-warning"
			onclick="location.href='/user/mypage'">마이페이지로 돌아가기</button></p>
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
		function removeInterest(data) {
			let remove = document.getElementById("remove");
			remove.childNodes[1].setAttribute("value", data);
			console.log(remove.childNodes[1]);
			remove.submit(); 
		}
		
		let result = "${result}";
		console.log(result);
		if(result === "fail") {
			alert("선택한 관심사가 최대 개수인 30개를 초과하였습니다.");
		} 
	</script>
</body>
</html>