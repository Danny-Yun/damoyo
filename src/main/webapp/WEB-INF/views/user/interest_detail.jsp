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
	
	<script>
	
	</script>
	
	
	관심사 카테고리1 : ${cateNameList }
	
	<br><br/>
	
	상세 관심사: ${list}
	
	
	<form action="#" method="post">
	
	<c:forEach var="cateNameList" items="${cateNameList }">
	  <h3>${cateNameList.i_cate_name }</h3>
	  
	  <c:forEach var="list" items="${list }">
	  ${list.iDetailVO.i_detail_name }
		<%-- <div class="form-check form-check-inline">
	 	  <input type="checkbox" class="btn-check" name="i_detail_name" 
	 	  		value="${list.i_detail_name }" id="${list.i_cate_num }" autocomplete="off">
		  <label class="btn btn-outline-primary" for="${list.i_cate_num }">${list.i_detail_name }</label><br>
		</div> --%>
	  </c:forEach>
	  <br><br/>
	  
	</c:forEach>	
	  
	  <input type="hidden" name="u_id" value="${sessionId}" />
	  <p><input class="btn btn-outline-primary" type="submit" value="저장" /><p>	  
	</form>
	
</body>
</html>