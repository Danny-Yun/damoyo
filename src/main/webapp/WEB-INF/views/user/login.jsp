<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	fieldset {
		border: 3px solid black;
		padding:20px;
		width:200px;
	}
	p {
		padding-left:5px;
	}
</style>
<meta charset="UTF-8">
<title>DAMOYO - 로그인</title>
</head>
<body>
	<h3>로그인</h3>
	
	<form action="/user/login" method="post">
		<fieldset>
			<div>
				아이디 <br>
				<input type="text" name="u_id" placeholder="ID" required />
			</div>

			<div>
				비밀번호 <br> 
				<input type="password" name="u_pw" placeholder="PW" required />
			</div>
			
			<div>
				<p><input type="submit" value="로그인" /></p>
			</div>
		</fieldset>
	</form>
	<a href="/user/join">회원가입</a>
	<script>
		const result = "${result}";
		console.log(result);
		
		if(result === "fail") {
			alert("아이디와 비밀번호가 일치하지 않습니다.");
		} else if (result === "leaveOK") {
			alert("정상적으로 탈퇴 처리되었습니다.");
		}
	</script>
</body>
</html>