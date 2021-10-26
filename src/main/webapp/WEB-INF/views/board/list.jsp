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
<style>

	.box_left {
		margin-left:350px;
		float:left;
	}
	
	.box {
		padding-top:20px;
		padding-bottom:20px;
		width:500px;
		display:block;
		float:right;
		/*border:1px solid black;*/
	}
	
	.left_side{
		clear:both;
		float:left;
	}
	
	.right_side {
		float:right;
	}
	
	.u_id {
		clear:both;
		width:50px;
		float:left;
	}
	
	.b_date {
		/*padding-left:300px;*/
		width:100px;
		float:right;
	}
	
	hr {
		clear:both;
	}
	
	.titlecontent {
		width:200px;
		heigth:50px;
		float:left;
	}
	
	.b_image1 {
		width:150px;
		height:70px;
		border:1px solid black;
		float:right;
	}
	
	.b_like {
		clear:both;
		width:100px;
		float:left;
	}
	
	.b_cate_name {
		width:50px;
		float:right;
	}
</style>
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
  	
  	<!-- Start main -->
	<main>
	<br><br/>
	
	<form action="/board/list">
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
		<input type="text" name="keyword" placeholder="검색어" value="${boardPages.cri.keyword }">
		<input type="submit" value="검색">
	</form>
	<br>
	<hr>
	<c:forEach var="list" items="${list}">
		<div class="left_side">
			<div class="box_left"/></div>
			<div class="box" onclick="location.href='/board/detail?b_num=${list.b_num}';" style="cursor:pointer;">
				<div class="u_id">${list.u_id}</div> <div class="b_date">${list.b_date}</div><br><br>
				<div class="titlecontent">
					<strong>${list.b_title}</strong><br>
					<script>
						var b_content = "${list.b_content}";
						if(b_content.length > 10) {
							document.write(b_content.substring(0, 11) + "...");
						} else {
							document.write(b_content);
						}
					</script>
					<br>
				</div>
				<div class="b_image1"></div><br>
				<hr>
				<div class="b_like">좋아요 ${list.b_like}</div> <div class="b_cate_name">${list.b_cate_name}</div>
					<hr>
			</div>
		</div>
			<div class="right_side">
		</div>
	</c:forEach>
	<div>
		<form action="/board/write" method="get">
			<input type="submit" value="글쓰기">
		</form>
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