<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	#modiDiv {
		width:	300px;
		height: 100px;
		background-color: green;
		position:	absolute;
		top:	50%;
		left:	50%;
		margin-top: -50px;
		margin-right: -150px;
		z-index: 1;
	}
</style>
</head>
<body>
	<h1>${infos.meet.m_name }의 게시판</h1>
	유저 정보 : ${infos.user}<br>
	${infos.user.u_id}<br>
	모임 정보 : ${infos.meet}<br>
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
		<tr>
			<td>조회 : ${infos.board.b_view }</td><td>댓글 : ${infos.replyCnt }</td><td>추천 : ${infos.likeCnt }</td>
		</tr>
		<tr><td colspan="3">${infos.board.b_title }</td></tr>
		<tr><td colspan="3">${infos.board.b_content }</td></tr>
		<tr><td colspan="3">${infos.board.b_image1 }</td></tr>
		<tr><td colspan="3">${infos.board.b_image2 }</td></tr>
		<tr><td colspan="3">${infos.board.b_image3 }</td></tr>
	</table>
	<c:choose>
		<c:when test="${infos.likeInfo eq null }">
			<button id="likeBtn">좋아요</button>
		</c:when>
		<c:otherwise>
			<button id="likeCancelBtn">좋아요 취소</button>
		</c:otherwise>
	</c:choose>
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
	<!-- Jquery -->
	<script type="text/javascript" src="/resources/js/ReplyScript.js"></script>
</body>
</html>