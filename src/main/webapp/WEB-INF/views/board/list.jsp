<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>모임 게시판 - DA!MOYO</title>
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
  	
  	<!-- Start main -->
	<main>
		<!-- Start board-search-form -->
		<form class="board-search-form" action="/board/list">
		  <div class="board-search-form__column">
			<select name="searchType">
				<option selected="${boardPages.cri.searchType eq null ? 'selected' : ''}" value="">
						전체보기
				</option>
				<c:forEach var="c" items="${category }">
					<option value="${c.b_cate_name}"
						<c:out value="${boardPages.cri.searchType eq c.b_cate_name ? 'selected' : ''}"  />>
						 ${c.b_cate_name }
					</option>
				</c:forEach>	
			</select>
		  </div>
		  <div class="board-search-form__column">
			<input class="board-search-form__text" type="text" name="keyword" 
				placeholder="검색어" value="${boardPages.cri.keyword }">
		  </div>
		  <div class="board-search-form__column">
			<input class="btn btn-outline-success" type="submit" value="검색">
		  </div>
		</form>
		<!-- END board-search-form -->
	    <hr>
	    <div class="meet-plus-outter">
			<a class="meet-plus" href="/board/write">
				<i class="fas fa-plus fa-lg"></i>
				<span>작성</span>
			</a>
		</div>
	    <!-- Start board-list -->
	    <div class="board-list">
			<c:forEach var="list" items="${list}">
				<div class="board-list-single" onclick="location.href='/board/detail?b_num=${list.b_num}'">
					<div class="board-list__column">
						<span class="board-list__id">${list.u_id}</span> 
						<span class="board-list__date">${list.b_date}</span>
					</div>
					<div class="board-list__column">
					  <div class="board-list__info">
						<span class="board-list__title">${list.b_title}</span>
						<script>
							var b_content = "${list.b_content}";
							if(b_content.length > 10) {
								document.write(b_content.substring(0, 11) + "...");
							} else {
								document.write(b_content);
							}
						</script>
					  </div>
					  <div class="board-list__cate">
						<span>${list.b_cate_name}</span>
					  </div>
					</div>
					<hr class="end-line"> 
					<div class="board-list__column">
						<i class="far fa-thumbs-up"></i>
						<div class="board-list__like">
							<span>좋아요</span>
							<span>${list.b_like}</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<ul class="pagination">
			<c:if test="${boardPages.prev }">
				<a class="page-link" href="/board/list?pageNum=${boardPages.startPage - 1 }&searchType=${boardPages.cri.searchType}&keyword=${boardPages.cri.keyword}">Prev</a>
			</c:if>
			<c:forEach var="page" begin="${boardPages.startPage }" end="${boardPages.endPage }">
				<li class="page-item ${boardPages.cri.pageNum eq page ? 'active' : '' }"><a class="page-link" href="/board/list?pageNum=${page }&searchType=${boardPages.cri.searchType}&keyword=${boardPages.cri.keyword}">${page}</a></li>
			</c:forEach>
			<c:if test="${boardPages.next }">
				<a class="page-link" href="/board/list?pageNum=${boardPages.endPage + 1 }&searchType=${boardPages.cri.searchType}&keyword=${boardPages.cri.keyword}">Next</a>
			</c:if>
		</ul>
		<!-- END board-list -->
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