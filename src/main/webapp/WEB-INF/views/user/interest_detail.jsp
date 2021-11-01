<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상세 관심사 - DA!MOYO</title>
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
			<button type="button" class="btn btn-outline-danger"
				onclick="history.back()">이전</button>
		</div>
		<div class="interest-header__column">
			<h1 class="interest-header__title">상세 관심사 선택</h1>
		</div>
		<div class="interest-header__column">
			<div class="interest-form__btn">
				<button class="btn btn-outline-primary" onclick="save()">저장</button>
			</div>
		</div>
	</header>
	<!-- END header -->
	<div class="detail-list-group">
		<form action="/user/interest/detail" method="post" id="detailCheck">
			<c:forEach var="list1" items="${list }">
			  <h3 class="interest-detail__cate-name">${list1.i_cate_name }</h3>
		 	  <c:forEach var="list2" items="${list1.detailList }">
			 	 <div class="form-check form-check-inline">
				 	<input type="checkbox" class="btn-check" name="i_detail_name" 
				 	  		value="${list2.i_detail_name }" id="${list2.i_detail_num}">
					<label class="btn btn-outline-warning" for="${list2.i_detail_num }">${list2.i_detail_name }</label><br>
			     </div>
			  </c:forEach>
			</c:forEach>	
			<input type="hidden" name="u_id" value="${sessionId}" />
		</form>
	</div>
	
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
		function save() {
			let save = document.getElementById("detailCheck");
			save.submit();
		}
	
		$("#detailCheck input[type='checkbox']").on("click", function() {
			let count = $("#detailCheck input:checked[type='checkbox']").length;
			if(count > 30) {
				$(this).prop("checked", false);  // 30개 넘을 경우 선택 취소시키기
				alert("최대 30개까지 선택이 가능합니다.");
			} 
		});
		
		const warn = "${warn}";
		if(warn === "warn") {
			alert("최소 1개 이상 선택해주세요.");
		} 
	</script>
</body>
</html>