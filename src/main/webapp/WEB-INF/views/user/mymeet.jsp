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
	.star {
		cursor:pointer;
		color: #DADA00;
		width: 1%;
	}
	.star:hover{
		color: #DADA00;
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
	<h3>가입한 모임</h3>
	<br>
	<a href="/main/"><button>DAMOYO LIST</button></a>
	<a href="/user/myMeet"><button>내 모임</button></a>
	<a href="/user/mypage"><button>My Page</button></a><br>
	
	<br><br/>
	
	<div class="meetDiv">
		<c:forEach var="list" items="${list}" >
			<c:if test="${list.my_join_star == 0}">
				<a class="star" onclick="addStar(${list.m_num})"><i class="far fa-star"></i></a>
			</c:if>
			<c:if test="${list.my_join_star == 1}">
				<a class="star" onclick="deleteStar(${list.m_num})"><i class="fas fa-star"></i></a>
			</c:if>
			<div class="meet" onclick="location.href='/meet/info?num=${list.m_num }'">
				<span>${list.m_profile}이미지</span>
				<div class="meet__column">
					<h6>${list.m_area}</h6>
					<h5>${list.m_name}</h5>
				</div>
				<span>${list.m_join_people_cnt}명</span>
			</div>
		</c:forEach>
	</div>
	
	<form action="/user/addStar" method="post" id="addStar">
		<input type="hidden" name="m_num" value="">
		<input type="hidden" name="u_id" value="${u_id }">
	</form>
	<form action="/user/deleteStar" method="post" id="deleteStar">
		<input type="hidden" name="m_num" value="">
		<input type="hidden" name="u_id" value="${u_id }">
	</form>
	
	<script>
		function addStar(data) {
			let addStar = document.getElementById("addStar");
			addStar.childNodes[1].setAttribute("value", data);
			addStar.submit();
		}
		function deleteStar(data) {
			let deleteStar = document.getElementById("deleteStar");
			deleteStar.childNodes[1].setAttribute("value", data);
			deleteStar.submit();
		}
	</script>
	<!-- font-awesome code kit -->
	<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
</html>