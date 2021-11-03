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
				<a class="main-nav__link-checkJoin" href="${infos.checkJoin eq null ? '#':'#'}">
					<div class="main-nav__link">
						<i class="far fa-images fa-lg"></i>
						<span>갤러리</span>
					</div>
				</a>
			</li>  				
			<li class="main-nav__btn">
				<a class="main-nav__link-checkJoin" href="${infos.checkJoin eq null ? '#':'#'}">
					<div class="main-nav__link">
						<i class="fas fa-comments fa-lg"></i>
						<span>채팅</span>
					</div>
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

	<br>
	<script type="text/javascript"></script>
	<table border="1">
		<tr><td colspan="2"><img style="height: 300px" src="/main/display2?m_num=${infos.meet.m_num }"></td></tr>
		<tr>
			<td>${infos.meet.i_cate_name }</td>
			<td>${infos.meet.m_name }</td>
		</tr>
		<tr><td colspan="2">${infos.meet.m_content }</td></tr>
	</table>
	<c:if test="${infos.checkJoin == null}">
		<form action="/meet/join" method="post">
			<input type="hidden" name="u_id" value="${infos.user.u_id }">
			<input type="hidden" name="m_num" value="${infos.meet.m_num}">
			<input type="submit" value="가입">
		</form>
	</c:if>
	<c:if test="${infos.checkJoin != null}">
		<form action="/meet/withdraw" method="post">
			<input type="hidden" name="u_id" value="${infos.checkJoin.u_id }">
			<input type="hidden" name="m_num" value="${infos.checkJoin.m_num}">
			<input type="submit" value="탈퇴">
		</form>
	</c:if>
	<c:if test="${infos.checkAdd == null}">
		<form action="/meet/add" method="post">
			<input type="hidden" name="u_id" value="${infos.user.u_id }">
			<input type="hidden" name="m_num" value="${infos.meet.m_num}">
			<input type="submit" value="관심모임에 추가">
		</form>
	</c:if>
	<c:if test="${infos.checkAdd != null}">
		<form action="/meet/anymore" method="post">
			<input type="hidden" name="u_id" value="${infos.checkAdd.u_id }">
			<input type="hidden" name="m_num" value="${infos.checkAdd.m_num}">
			<input type="submit" value="관심모임 해제">
		</form>
	</c:if>
	<h2>모임 정모</h2>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	  정모 생성
	</button>
	<br>
	<table>
		<c:forEach var="p" items="${infos.plan }">
			<tr><td>${p.m_plan_name }[${p.m_plan_people_cnt }명]</td></tr>
			<tr><td>${p.m_plan_startdate }</td></tr>
			<tr><td>${p.m_plan_area }</td></tr>
			<tr><td>&#8361; ${p.m_plan_money }원</td></tr>
			<br>
		</c:forEach>
	</table>
	
	<h2>모임 멤버</h2>
	<%-- ${memberList } --%>
	<table border="1">
		<c:forEach var="member" items="${infos.memberList }">
			<tr>
				<td rowspan="2"><img src="/user/display?u_id=${member.u_id }"></td>
				<td>${member.u_name }</td>
				<td rowspan="2">${member.member_list_position }</td>
			</tr>
			<tr>
				<td>${member.u_intro }</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	<form action="/meet/update" method="post">
		<input type="hidden" name="num" value="${infos.meet.m_num }">
		<input type="submit" value="수정">
	</form>
	<form action="/meet/remove" method="post">
		<input type="hidden" name="num" value="${infos.meet.m_num }">
		<input type="submit" value="삭제">
	</form>

<!-- 정모 생성 -->
<!-- Button trigger modal -->


<!-- Modal -->
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