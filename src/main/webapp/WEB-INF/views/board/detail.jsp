<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게시판 상세 - DA!MOYO</title>
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
  	
  	<!-- Start screen-header -->
  	<div class="screen-header">
		<h1 class="screen-header__title">게시글</h1>
	</div>
	<!-- END screen-header -->
  	
  	<!-- Start main -->
	<main>
		<div class="board-detail__buttons">
			<button type="button" class="btn btn-outline-secondary" 
				onclick="location.href='/board/list'">게시판 목록으로</button>
			<form action="/board/delete" method="post">
				<input type="hidden" name="b_num" value="${infos.board.b_num}"/>
				<input class="btn btn-outline-danger" type="${infos.user.u_id == infos.board.u_id ? 'submit' : 'hidden' }" value="삭제"/>
			</form>
		</div>
		<div class="board-detail__info">
			<div class="board-detail__column">
				<div class="board-detail__column-left">
					<img class="board-detail__img" src="/user/display?u_id=${infos.user.u_id }">
					<div class="board-detail__column-text">
						<span class="board-detail__id">${infos.board.u_id}</span>
						<span class="board-detail__date">${infos.board.b_date}</span>
					</div>
				</div>
				<span class="board-detail__cate">${infos.board.b_cate_name }</span>
			</div>
			<div class="board-detail__column">
			    <span class="board-detail__title">${infos.board.b_title }</span>
				<span class="board-detail__content">${infos.board.b_content }</span>
			</div>
		</div>
		<div class="board-detail__like">
			<c:choose>
				<c:when test="${infos.likeInfo eq null }">
					<button class="board-detail__like-btn" id="likeBtn"><i class="far fa-thumbs-up"></i>좋아요</button>
				</c:when>
				<c:otherwise>
					<button class="board-detail__like-btn" id="likeCancelBtn"><i class="far fa-thumbs-up"></i>좋아요 취소</button>
				</c:otherwise>
			</c:choose>
		</div>		 	
		<div class="board-detail__text">
			<span>조회 : ${infos.board.b_view }</span>
			<span>추천 : ${infos.likeCnt }</span>		
		</div>
	
		<form style='display:inline' action="/board/like" method="post" id="likeForm">
			<input type="hidden" value="" name="m_num" />
			<input type="hidden" value="" name="b_num" />
			<input type="hidden" value="" name="u_id" />
		</form> 
		<form style='display:inline' action="/board/likeCancel" method="post" id="likeCancelForm">
			<input type="hidden" value="" name="m_num" />
			<input type="hidden" value="" name="b_num" />
			<input type="hidden" value="" name="u_id" />
		</form> 
		<hr>
	<h2>댓글창</h2>
	<input type="text" id="b_comment_content" placeholder="댓글을 달아주세요">
	<button  id="replyAddBtn">등록</button>
	<hr>
	<ul id="replies"></ul>
	<ul id="testinfo"></ul>

	<div id="modiDiv" style="display: none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replytext">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">close</button>
		</div>
	</div>
	<span hidden="" id="board">${board}</span>
	<span hidden="" id="user">${user}</span>
	
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
	<!-- reply.js  -->
	<script type="text/javascript" src="/resources/js/ReplyScript.js"></script>
</body>
</html>