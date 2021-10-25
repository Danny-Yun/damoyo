<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>모임 찾기 - DA!MOYO</title>
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
  <div id="wrap">
  
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
  	
  	<!-- Start main -->
	<main>
		<h1>main 페이지</h1>
		${userInfo }<br>
		
		<a href="/main/"><button>DAMOYO LIST</button></a>
		<a href="/user/myMeet"><button>내 모임</button></a>
		<a href="/user/mypage"><button>My Page</button></a><br>
		<form action="/main/" method="get">
			<select name="searchType">
	 			<option selected="${meetPages.cri.searchType eq null ? 'selected' : ''}" value="">
					전체보기
				</option>
				<c:forEach var="interest" items="${interest }">
					<option value="${interest.i_cate_num }"
						<c:out value="${meetPages.cri.searchType eq interest.i_cate_num ? 'selected' : '' }"/>>
						${interest.i_cate_name }
					</option>
				</c:forEach>
			</select>
			<input type="text" name="keyword" placeholder="검색어" value="${meetPages.cri.keyword }">
			<input type="submit">
		<br>
		<br>
		</form>
		<a href="/main/register"><button>생성</button></a>
		<form action="/user/logout" method="post">
			<input type="submit" value="로그아웃" />
		</form>
		<table border="1">
			<c:forEach var="m" items="${meetList }">
				<tr>
					<td id="meetProfile" rowspan="3">
						<a href="/meet/info?num=${m.m_num }">
							<img src="/main/display?m_num=${m.m_num }">
						</a>
					</td>
					<td>${m.m_area }</td>
					<td rowspan="3">${m.i_cate_name }</td>
				</tr>
				<tr>
					<td>${m.m_name }</td>
				</tr>
				<tr>
					<td>${m.m_join_people_cnt  }명</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="pagination">
			<c:if test="${meetPages.prev }">
				<a class="page-link" href="/main/?pageNum=${meetPages.startPage - 1 }&searchType=${meetPages.cri.searchType}&keyword=${meetPages.cri.keyword}">prev</a>
			</c:if>
			<c:forEach var="page" begin="${meetPages.startPage }" end="${meetPages.endPage }">
				<li class="page-item ${meetPages.cri.pageNum eq page ? 'active' : '' }"><a  class="page-link" href="/main/?pageNum=${page }&searchType=${meetPages.cri.searchType}&keyword=${meetPages.cri.keyword}">${page }</a></li>
			</c:forEach>
			<c:if test="${meetPages.next }">
				<a  class="page-link" href="/main/?pageNum=${meetPages.endPage + 1 }&searchType=${meetPages.cri.searchType}&keyword=${meetPages.cri.keyword}">next</a>
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