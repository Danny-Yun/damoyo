<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOYO - 회원 탈퇴</title>
</head>
<body>
	<h3 style="color:red">
		한 번 탈퇴하면 복구할 수 없습니다.<br>
		탈퇴를 원하시면 비밀번호를 입력하여 주세요.
	</h3>
	
	<form action="/user/leave" method="post">
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