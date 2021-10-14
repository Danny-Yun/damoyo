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
		display:flex;
		flex-direction: column;
		justify-content: center;
	}
	.meet {
		display: flex;
		justify-content: space-between;
		align-items: center;
		width:70%;
		border-bottom: 1px solid mistyrose;
		margin-bottom: 20px;
		cursor:pointer;
	}
	.meet__column {
		display:flex;
		flex-direction: column;
		align-items: center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
<body>
	<h3>내 모임</h3>
	<br><br/>
	
	<div class="meetDiv">
		<c:forEach var="list" items="${list}" >
			<div class="star">${list.my_join_star}</div>
			<div class="meet" onclick="location.href='/meet/info?num=${list.m_num }'">
				<span>${list.m_profile}이미지</span>
				<div class="meet__column">
					<h6>${list.m_area}</h6>
					<h5>${list.m_name}</h5>
				</div>
				<span>${list.m_people_cnt}명</span>
			</div>
		</c:forEach>
	</div>
	
	<p><button type="button" class="btn btn-warning"
			onclick="location.href='/user/mypage'">마이페이지</button></p>
</body>
</html>