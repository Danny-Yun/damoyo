<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>내 모임 - DA!MOYO</title>
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
				<a class="main-nav__link" href="/user/myMeet"
						style="color: black">
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

  	<!-- Start main -->
	<main>
	
	<br><br/>
	
	<div class="meetDiv">
		<c:forEach var="list" items="${list}" >
			<c:if test="${list.my_join_star == 0}">
				<a class="star" onclick="addStar(${list.m_num})"><i class="far fa-star"></i></a>
			</c:if>
			<c:if test="${list.my_join_star == 1}">
				<a class="star" onclick="deleteStar(${list.m_num})"><i class="fas fa-star"></i></a>
			</c:if>
			<div class="meet" onclick="location.href='/meet/info?num=${list.m_num }'">
				<img src="/main/display?m_num=${list.m_num }">
				<div class="meet__column">
					<h6>${list.m_area}</h6>
					<h5>${list.m_name}</h5>
				</div>
				<span>${list.m_join_people_cnt}명</span>
			</div>
		</c:forEach>
	</div>
	
	<form action="/user/addStar" method="post" id="addStar">
		<input type="hidden" name="m_num" value="">
		<input type="hidden" name="u_id" value="${u_id }">
	</form>
	<form action="/user/deleteStar" method="post" id="deleteStar">
		<input type="hidden" name="m_num" value="">
		<input type="hidden" name="u_id" value="${u_id }">
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
	
	<script>
		function addStar(data) {
			let addStar = document.getElementById("addStar");
			addStar.childNodes[1].setAttribute("value", data);
			addStar.submit();
		}
		function deleteStar(data) {
			let deleteStar = document.getElementById("deleteStar");
			deleteStar.childNodes[1].setAttribute("value", data);
			deleteStar.submit();
		}
	</script>
</body>
</html>