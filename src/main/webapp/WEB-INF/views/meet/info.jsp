<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 정보 - DA!MOYO</title>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
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
				<a class="main-nav__link" href="/meet/info?num=${infos.meet.m_num }"
						style="color: black">
					<i class="fab fa-fort-awesome fa-lg"></i>
					<span>모임방</span>
				</a>
			</li>  	
			<li class="main-nav__btn">
				<a class="main-nav__link-checkJoin" href="${infos.checkJoin eq null ? '#':'/meet/board/list'}">
					<div class="main-nav__link">
						<i class="fas fa-feather-alt fa-lg"></i>
						<span>게시판</span>
					</div>
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
	  <div class="meet-info-outer">
		<img class="meet-info__photo" style="height: 300px" src="/main/display2?m_num=${infos.meet.m_num }"></td></tr>
		<div class="meet-info__title">
			<span class="meet-info__name">${infos.meet.m_name }</span>
			<span class="meet-info__cate">${infos.meet.i_cate_name }</span>
		</div>
		
		<div class="meet-info-header">
		<div class="meet-info__content">
			<span>${infos.meet.m_content }</span>
		</div>
		<!-- Start meet-info__buttons -->
		<div class="meet-info__buttons">
			<c:if test="${infos.checkJoin == null}">
				<form class="check-join" action="/meet/join" method="post">
					<input type="hidden" name="u_id" value="${infos.user.u_id }">
					<input type="hidden" name="m_num" value="${infos.meet.m_num}">
					<input class="btn btn-outline-info" type="submit" value="가입하기">
				</form>
			</c:if>
			<c:if test="${infos.checkJoin != null}">
				<form class="check-join" action="/meet/withdraw" method="post">
					<input type="hidden" name="u_id" value="${infos.checkJoin.u_id }">
					<input type="hidden" name="m_num" value="${infos.checkJoin.m_num}">
					<input class="btn btn-outline-danger" type="submit" value="탈퇴하기">
				</form>
			</c:if>
			<c:if test="${infos.checkAdd == null}">
				<form class="check-interest" action="/meet/add" method="post">
					<input type="hidden" name="u_id" value="${infos.user.u_id }">
					<input type="hidden" name="m_num" value="${infos.meet.m_num}">
					<input class="btn btn-warning" type="submit" value="관심모임에 추가">
				</form>
			</c:if>
			<c:if test="${infos.checkAdd != null}">
				<form class="check-interest" action="/meet/anymore" method="post">
					<input type="hidden" name="u_id" value="${infos.checkAdd.u_id }">
					<input type="hidden" name="m_num" value="${infos.checkAdd.m_num}">
					<input class="btn btn-secondary" type="submit" value="관심모임에서 삭제">
				</form>
			</c:if>
		</div>
		<!-- END meet-info__buttons -->
		</div>
		
		<!-- Start meet-info-bottom -->
		<div class="meet-info-bottom">
			<!-- Start meet-meeting -->
			<div class="meet-meeting">
				<!-- 모임장일 경우 정모 생성 버튼 확인  -->
				<c:forEach var="member" items="${infos.memberList }">
					<c:if test="${member.u_id eq infos.user.u_id}">
						<h2 class="meet-meeting__title">모임 정모</h2>
						<c:if test="${member.member_list_position eq '모임장' }">
						  <div class="meet-meeting__button">
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  정모 생성
							</button>
						  </div>
						</c:if>
						<c:if test="${member.member_list_position ne '모임장' }">
						  <div class="meet-meeting__button">
						  	<i class="far fa-calendar-minus"></i>
							<span>현재 정모가 없습니다.</span>
						  </div>
						</c:if>
					</c:if>
				</c:forEach>
				<table>
					<c:forEach var="p" items="${infos.plan }">
						<tr><td>${p.m_plan_name }[${p.m_plan_people_cnt }명]</td></tr>
						<tr><td>${p.m_plan_startdate }</td></tr>
						<tr><td>${p.m_plan_area }</td></tr>
						<tr><td>&#8361; ${p.m_plan_money }원</td></tr>
						<br>
					</c:forEach>
				</table>
			</div>
			<!-- END meet-meeting -->
			
			<!-- Start meet-member -->
			<div class="meet-member">
				<h2 class="meet-member__title">모임 멤버</h2>
				<%-- ${memberList } --%>
				<c:forEach var="member" items="${infos.memberList }">
       			  <div class="meet-member__info">
					<div class="meet-member__column">
						<img class="meet-member__img" src="/user/display?u_id=${member.u_id }">
						<div class="meet-member__text">
							<span class="meet-member__name">${member.u_name }</span>
							<span class="meet-member__intro">${member.u_intro }</span>
						</div>
					</div>
					<div class="meet-member__column">
						<span class="meet-member__position">${member.member_list_position }</span>
					</div>
				  </div>
				</c:forEach>
			</div>
			<!-- END meet-member -->
		</div>
		<!-- END meet-info-bottom -->
				
		<!-- 모임장일 경우 모임의 수정/삭제 버튼 확인  -->
		<div class="meet-maker__btn">
			<c:forEach var="member" items="${infos.memberList }">
				<c:if test="${member.u_id eq infos.user.u_id}">
					<c:if test="${member.member_list_position eq '모임장' }">
						<form action="/meet/update" method="post">
							<input type="hidden" name="num" value="${infos.meet.m_num }">
							<input class="btn btn-outline-success" type="submit" value="수정">
						</form>
						<form action="/meet/remove" method="post">
							<input type="hidden" name="num" value="${infos.meet.m_num }">
							<input class="btn btn-outline-danger" type="submit" value="삭제">
						</form>
					</c:if>
				</c:if>
			</c:forEach>
		</div>
		
		<!-- 정모 생성 -->
		<!-- Start Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<form action="/plan/create" method="post">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">정모 생성</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							정모 이름 : <input type="text" name="m_plan_name"><br>
							정원수 : <input type="text" name="m_plan_people_cnt"><br>
							날짜 : <input type="text" name="m_plan_startdate"><br>
							금액 : <input type="text" name="m_plan_money"><br>
							지역 : <input type="text" name="m_plan_area"><br>
							<input type="hidden" name="m_num" value="${infos.meet.m_num }"><br>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<input type="submit" class="btn btn-primary" value="생성"></input>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- END Modal -->
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
		let checkJoin = $(".main-nav__link-checkJoin").attr('href');
		console.log(checkJoin);
		$(".main-nav__link-checkJoin").on("click", function (){
			if(checkJoin == "#") {
				alert("가입 후에 열람할 수 있습니다.");
			}
		});
	</script>
</body>
</html>