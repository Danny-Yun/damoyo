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
</style>
<meta charset="UTF-8">
<title>DAMOYO - 관심사 카테고리</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
<script>
	let id = "${joinUserId}";
	let result = "${success}";
	console.log(id);
	console.log(result);
</script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	  		<p><input class="btn btn-outline-primary" type="submit" value="다음" /><p>
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
	</script>
</body>
</html>