<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1>${infos.meet.m_name }의 게시판</h1>
	유저 정보 : ${infos.user}<br>
	${infos.user.u_id}<br>
	모임 정보 : ${board}<br>
	게시판 정보 : ${infos.board }<br>
	<a href="/board/list">게시판 목록</a>
	<form action="/board/delete" method="post">
		<input type="hidden" name="b_num" value="${infos.board.b_num}"/>
		<input type="${infos.user.u_id == infos.board.u_id ? 'submit' : 'hidden' }" value="삭제"/>
	</form>
	<table border="1">
		<tr>
			<td rowspan="2">${infos.user.u_profile }이미지</td>
			<td>${infos.board.u_id}</td>
			<td rowspan="2">${infos.board.b_cate_name }
		</tr>
		<tr>
			<td>${infos.board.b_date}</td>
		</tr>
		<%-- <tr><td>${infos.board.b_date}</td></tr> --%>
		<tr><td colspan="3">${infos.board.b_title }</td></tr>
		<tr><td colspan="3">${infos.board.b_content }</td></tr>
		<tr><td colspan="3">${infos.board.b_image1 }</td></tr>
		<tr><td colspan="3">${infos.board.b_image2 }</td></tr>
		<tr><td colspan="3">${infos.board.b_image3 }</td></tr>
		<tr>
			<td colspan="3">${infos.board.b_like }좋아요</td>
		</tr>
	</table>
	<hr>
	<form action="#">
		<input type="text" placeholder="댓글을 달아주세요">
		<input type="submit" value="전송">
	</form>
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
	<!-- Jquery -->
	<script type="text/javascript" src="/resources/js/ReplyScript.js"></script>
</body>
</html>