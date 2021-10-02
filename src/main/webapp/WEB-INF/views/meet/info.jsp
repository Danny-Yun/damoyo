<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>
<body>
	<h1>모임방</h1>
	유저정보 : ${userInfo }<br>
	모임정보 : ${meetInfo }<br>
	${userInfo eq null ? '정보 없음':'정보 있음' } <br>
	가입여부 : ${checkJoin eq null ? '정보 없음':'정보 있음' } <br>
	<a href="/meet/info?num=${meetInfo.m_num }"><button>정보</button></a>
	<a href="/meet/board/list"><button>게시판</button></a>
	<a href="#"><button>갤러리</button></a>
	<a href="#"><button>채팅</button></a>
	<a href="/main/"><button>메인화면</button></a>
	<br>
	<table border="1">
		<tr><td colspan="2">${meetInfo.m_profile }</td></tr>
		<tr>
			<td>${meetInfo.i_cate_name }</td>
			<td>${meetInfo.m_name }</td>
		</tr>
		<tr><td colspan="2">${meetInfo.m_content }</td></tr>
	</table>
	<c:if test="${checkJoin == null}">
		<form action="/meet/join" method="post">
			<input type="hidden" name="u_id" value="${userInfo.u_id }">
			<input type="hidden" name="m_num" value="${meetInfo.m_num}">
			<input type="submit" value="가입">
		</form>
	</c:if>
	<c:if test="${checkJoin != null}">
		<form action="/meet/withdraw" method="post">
			<input type="hidden" name="u_id" value="${checkJoin.u_id }">
			<input type="hidden" name="m_num" value="${checkJoin.m_num}">
			<input type="submit" value="탈퇴">
		</form>
	</c:if>
	<h2>모임 정모</h2>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	  정모 생성
	</button>
	
	<h2>모임 멤버</h2>
	<%-- ${memberList } --%>
	<table border="1">
		<c:forEach var="member" items="${memberList }">
			<tr>
				<td rowspan="2">${member.u_profile }</td>
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
		<input type="hidden" name="num" value="${meetInfo.m_num }">
		<input type="submit" value="수정">
	</form>
	<form action="/meet/remove" method="post">
		<input type="hidden" name="num" value="${meetInfo.m_num }">
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
					<input type="hidden" name="m_num" value="${meetInfo.m_num }"><br>
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
</body>
</html>