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
<title>DAMOYO - 상세 관심사</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	crossorigin="anonymous">
</head>
<body>
	<h3>상세 관심사 선택</h3><br>
	
	관심사 카테고리 : ${cateNameList }
	
	<br><br/>
	
	상세 관심사: ${list}
	
	<form action="#" method="post">
	
	<c:forEach var="list1" items="${list }">
	  <h3>${list1.i_cate_name }</h3>
	  <br><br/> 
 	  <c:forEach var="list2" items="${list1.detailList }">
		  <div class="form-check form-check-inline">
		 	<input type="checkbox" class="btn-check" name="i_detail_name" 
		 	  		value="${list2.i_detail_name }" id="${list2.i_cate_num}" autocomplete="off">
			<label class="btn btn-outline-primary" for="${list2.i_cate_num }">${list2.i_detail_name }</label><br>
		  </div> 
	  </c:forEach>
	</c:forEach>	
	  
	  <input type="hidden" name="i_cate_num" value="${i_cate_num}" />
	  <input type="hidden" name="u_id" value="${sessionId}" />
	  <p><input class="btn btn-outline-primary" type="submit" value="저장" /><p>	  
	</form>
	
</body>
</html>