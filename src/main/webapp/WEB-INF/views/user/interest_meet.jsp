<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	body {
			padding: 30px;
	}
	.meetDiv {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		width:70%;
		border-bottom: 1px solid mistyrose;
		margin-bottom: 20px;
		cursor:pointer;
	}
	.meetDiv span {
		margin-right: 20px;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
</head>
<body>
	<h3>내 관심 모임</h3>
	<br><br/>
	
	<c:forEach var="list" items="${list}">
		<div class="meetDiv" onclick="location.href='/meet/info?num=${list.m_num }'">
			<span>[${list.m_area}]</span>
			<h5>${list.m_name}</h5>
		</div>
	</c:forEach>
	
	<p><button type="button" class="btn btn-warning"
			onclick="location.href='/user/mypage'">마이페이지</button></p>
</body>
</html>