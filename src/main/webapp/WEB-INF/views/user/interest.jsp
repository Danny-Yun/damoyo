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
	<h3>관심사 선택</h3><br>
	
	<div class="list-group">
		<form action="/user/interest" method="post">
			<c:forEach var="list" items="${list }">	
			  <label class="list-group-item">
			    <input class="form-check-input me-1" type="checkbox" name="i_cate_num" value="${list.i_cate_num }">
			    ${list.i_cate_name }
			  </label>
	  		</c:forEach>
	  		<input type="hidden" name="u_id" value="${joinUserId}" />
	  		<p><button type="button" class="btn btn-warning"
			onclick="location.href='/user/myinterest'">내 관심사 조회</button>
			<input class="btn btn-outline-primary" type="submit" value="다음" /><p>
  		</form>
	</div>
	
	<script>
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