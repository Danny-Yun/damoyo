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
		width:500px;
	}
	p {
		padding-left:20px;
	}
</style>
<meta charset="UTF-8">
<title>DAMOYO - 회원가입</title>

</head>
<body>
	<h3>회원가입</h3>
	
	<form action="/user/join" method="post">
		<fieldset>
			<legend>아이디로 가입하기</legend>
			
			<div>
				아이디 <br>
				<input type="text" name="u_id" placeholder="ID" required />
			</div>

			<div>
				비밀번호 <br> 
				<input type="password" name="u_pw" minlength="8" placeholder="8자 이상 입력하세요" required />
			</div>
			
			<div>
				이름 <br> 
				<input type="text" name="u_name" placeholder="NAME" required />
			</div>

			<div>
				성별 <br> 
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="0">남성</label>
				
				  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off">
				  <label class="btn btn-outline-primary" for="1">여성</label>
				</div>
			</div>
			
			<div>
				생일 <br> 
				<input type="date" name="u_birth" required />
			</div>
			
			<div>
				지역 <br> 
				<input type="text" name="u_area" placeholder="AREA" required />
			</div>
		</fieldset>
		<p><input type="submit" value="가입하기" /><p>
	</form>
	
</body>
</html>