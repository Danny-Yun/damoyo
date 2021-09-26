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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
<script>
	let id = "${joinUserId}";
	let result = "${success}";
	console.log(id);
	console.log(result);
</script>
</head>
<body>
	<h3>관심사 선택</h3><br>
	
	<div class="list-group">
		<form action="/user/join/interset" method="post">
			<c:forEach var="list" items="${list }">	
			  <label class="list-group-item">
			    <input class="form-check-input me-1" type="checkbox" value="${list.i_cate_num }">
			    ${list.i_cate_name }
			  </label>
	  		</c:forEach>
	  		<input type="hidden" name="u_id" value="${joinUserId}" />
	  		<p><input class="btn btn-outline-primary" type="submit" value="다음" /><p>
  		</form>
	</div>
	
</body>
</html>