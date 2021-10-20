<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	p {
		padding:20px 20px;
	}
	form {
		margin:20px;
	}
	div {
		margin:20px;
	}
</style>
<meta charset="UTF-8">
<title>DAMOYO - 프로필 수정</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
</head>
<body>
	<form action="/user/modify" method="post">
		<div>
			<input type="text" name="u_profile" value="${profile.u_profile}" />
			<input type="text" name="u_id" value="${profile.u_id}" readonly />
		</div>

		<div>
			<input type="text" name="u_name" value="${profile.u_name}" required />
			
			<c:choose>
			  <c:when test="${profile.u_sex == 0}">
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="0">남성</label>
				
				  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off">
				  <label class="btn btn-outline-primary" for="1">여성</label>
				</div>
			  </c:when>
			  <c:otherwise>
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off">
				  <label class="btn btn-outline-primary" for="0">남성</label>
				
				  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="1">여성</label>
				</div>
			  </c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<input type="date" name="u_birth" value="${profile.u_birth}" required />
			<input type="text" name="u_area" value="${profile.u_area}" required />
		</div>
		
		<div>
			<textarea cols="40px" rows="10px" name="u_intro" 
				required="required">${profile.u_intro}</textarea>
		</div>
		
		<p><button type="button" class="btn btn-outline-danger"
			onclick="history.back()">이전</button>
		<input class="btn btn-outline-primary" type="submit" value="저장" /><p>	
	</form>
	
</body>
</html>