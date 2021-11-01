<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관심사 카테고리 - DA!MOYO</title>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/css/styles.css">
<!-- font-awesome code kit -->
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</head>
<body>
  <div id="wrapper">
  
	<!-- Start header -->
	<header class="interest-header">
		<div class="interest-header__column">
		</div>
		<div class="interest-header__column">
			<h1 class="interest-header__title">관심사 선택</h1>
		</div>
		<div class="interest-header__column">
			<div class="interest-form__btn">
				<button class="btn btn-outline-primary" onclick="next()">다음</button>
			</div>
		</div>
	</header>
	<!-- END header -->
	
	<!-- Start interest-form -->
	<div class="list-group">
		<form action="/user/interest" method="post" id="interest-form">
			<c:forEach var="list" items="${list }">	
			  <label class="list-group-item">
			    <input class="form-check-input me-1" type="checkbox" name="i_cate_num" value="${list.i_cate_num }">
			    <div class="interest-form__name">${list.i_cate_name }</div>
			  </label>
	  		</c:forEach>
	  		<input type="hidden" name="u_id" value="${joinUserId}" />
  		</form>
	</div>
	<!-- END interest-form -->
	
	<!-- Start footer -->
	<footer class="login-footer">
		<div class="login-footer__info">
			Made by Riudiu, Wakebro &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
			Contact by GitHub : github.com/Riudiu
		</div>
		<div class="login-footer__copyright">Copyright 2021. DAMOYO. All rights reserved. </div>
	</footer>
	<!-- END footer -->
  </div>		
	<script>
		function next() {
			let next = document.getElementById("interest-form");
			next.submit();
		}
	
		$("input[type='checkbox']").on("click", function() {
			let count = $("input:checked[type='checkbox']").length;
			if(count > 7) {
				$(this).prop("checked", false);  // 7개 넘을 경우 선택 취소시키기
				alert("최대 7개의 관심사만 선택할 수 있습니다.");
			} 
		});
		
		const warn = "${warn}";
		if(warn === "warn") {
			alert("최소 1개 이상 선택해주세요.");
		} 
	</script>
</body>
</html>