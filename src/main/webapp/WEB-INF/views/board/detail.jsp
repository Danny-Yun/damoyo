<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${vo}
	<form action="/board/delete" method="post">
		<input type="hidden" name="b_num" value="${vo.b_num}"/>
		<input type="submit" value="삭제"/>
	</form>
</body>
</html>