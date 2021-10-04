<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사진 등록 페이지</h1>
	<form action="/create" method="post">
	사진 번호 : <input type="number" name="p_num"><br>
	사진 이름 : <input type="text" name="p_cate_name"><br>
	모임 번호 : <input type="number" name="m_num">
	사진 보기 :
	<select name="p_view">
		<c:forEach var="num" begin="1" end="150">
			<option value="${p_num }">{p_num}</option>
		</c:forEach>
	</select>
	<input type="submit" value="등록">
	
	</form>
	<a href="#">업로드 완료</a>
</body>
</html>