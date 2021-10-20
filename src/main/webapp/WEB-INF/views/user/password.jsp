<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOYO - 비밀번호 변경</title>
</head>
<body>
	<h3>기존 비밀번호를 입력하세요.</h3>
	
	<form action="/user/password" method="post">
		<input type="password" name="u_pw" required /><br><br/>
		
		<p><button type="button" onclick="history.back()">이전</button>
		<input type="submit" value="확인" /></p>
	</form>
	
	<script>
		let result = "${result}";
		console.log(result);
		if(result === "fail") {
			alert("비밀번호가 일치하지 않습니다.");
		}
	</script>
</body>
</html>