<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	body {
		padding:20px 20px;
	}
</style>
<meta charset="UTF-8">
<title>DAMOYO - 내 관심사</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
</head>
<body>
	<div class="d-grid gap-2">
		<a href="/user/interest"><button type="button" class="btn btn-primary">관심사 추가하기</button></a>
	</div>
	<br><br/>
	
	<b>선택한 상세관심사</b>
	<br><br/>
	<c:forEach var="myInterest" items="${myInterest}" >
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-light" value="${myInterest.f_interest_num }">${myInterest.i_detail_name }</button>
			<button type="button" class="btn-close" onclick="removeInterest(${myInterest.f_interest_num })" ></button>
		</div>&nbsp;&nbsp;
	</c:forEach>

	<form style='display:inline' action="/user/myinterest/remove" method="post" id="remove">
		<input type="hidden" value="" name="f_interest_num" />
	</form> 
	
	<p>총 개수 : ${i_num }</p>
	
	<p><button type="button" class="btn btn-warning"
			onclick="location.href='/user/mypage'">마이페이지</button></p>
	
	<script>
		function removeInterest(data) {
			let remove = document.getElementById("remove");
			remove.childNodes[1].setAttribute("value", data);
			console.log(remove.childNodes[1]);
			remove.submit(); 
		}
		
		let result = "${result}";
		console.log(result);
		if(result === "fail") {
			alert("선택한 관심사가 최대 개수인 30개를 초과하였습니다.");
		} 
	</script>
</body>
</html>