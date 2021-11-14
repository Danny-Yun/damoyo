<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게시판 글쓰기 - DA!MOYO</title>
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
				<a class="main-nav__link" href="/meet/info?num=${infos.meet.m_num }">
					<i class="fab fa-fort-awesome fa-lg"></i>
					<span>모임방</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<a class="main-nav__link" href="/meet/board/list"
						style="color: black">
					<i class="fas fa-feather-alt fa-lg"></i>
					<span>게시판</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<a class="main-nav__link" href="#">
					<i class="far fa-images fa-lg"></i>
					<span>갤러리</span>
				</a>
			</li>  				
			<li class="main-nav__btn">
				<a class="main-nav__link" href="#">
					<i class="fas fa-comments fa-lg"></i>
					<span>채팅</span>
				</a>
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
		<h1 class="screen-header__title">게시판 글쓰기</h1>
	</div>
	<!-- END screen-header -->
  	
  	<!-- Start main -->
	<main>

 	<form action="/board/register" method="post">
		제목 : <input type="text" name="b_title"><br>
		작성자 : <input type="text" name="u_id" value=${infos.user.u_id } readonly><br>
		<input type="hidden" name="m_num" value=${infos.meet.m_num }>
		카테고리:
			<select name="b_cate_name">
				<c:forEach var="cate" items="${infos.category}">
					<option value=${cate.b_cate_name } 
						<c:out value="${cate.b_cate_name eq '자유게시판' ? 'selected' : ''}"/>
						<c:out value="${cate.b_cate_name eq '전체보기' ? 'hidden' : ''}"/>>
				    	${cate.b_cate_name}
				    </option>
				</c:forEach>
			</select>
		<br>
		글 내용 :<br>
		<textarea name="b_content"></textarea><br>
		게시판 사진 : <input type="text" name="b_image1"><br>
		게시판 사진 : <input type="text" name="b_image2"><br>
		게시판 사진 : <input type="text" name="b_image3"><br>
		<input type="submit" value="생성">
	</form>
	<button type="button" onclick="history.back()">이전</button><br>
	<a href="/main/"><button>메인화면</button></a>
 	
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