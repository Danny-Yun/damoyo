<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#modiDiv {
	width: 300px;
	height: 100px;
	background-color: green;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-right: -150px;
	z-index: 1;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<h2>Ajax 테스트</h2>

	<div>
		<div>
			REPLYER <input type="text" name="u_id" id="u_id">
		</div>
		<div>
			REPLY TEXT <input type="text" name="b_comment_content" id="b_comment_content">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>

	<ul id="replies">
	</ul>

	<!-- 모달 요소는 안 보이기 때문에 어디에 넣어도 되지만 보통 html요소들 끼리 놨을 때,
	제일 아래쪽에 작성하는 경우가 많다.-->
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

	<!-- jquery -->
	<script type="text/javascript" src="/resources/js/ReplyScript.js"></script>
</body>
</html>