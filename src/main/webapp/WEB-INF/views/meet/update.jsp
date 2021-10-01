<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>모임 수정창</h1>
	${vo }
	<form action="/meet/update/process" method="post">
		<input type="hidden" name="m_num" value="${vo.m_num }">
		모임 이름 : <input type="text" name="m_name" value="${vo.m_name }"><br>
		모임 인원 : 
			<select name="m_people_cnt">
				<c:forEach var="num" begin="1" end="200">
					<option value="${num }">${num }
				</c:forEach>
			</select>
			<br>
		모임 지역 : <input type="text" name="m_area"><br>
		모임 사진 : <input type="text" name="m_profile"><br>
		모임 종류 : 
			<select name="i_cate_num">
				<option selected>부서를 선택하세요.</option>
					<c:forEach var="cate" items="${category }">
					    <option value=${cate.i_cate_num }>${cate.i_cate_name}</option>
					</c:forEach>
			</select>
		<br>
		모임 방장 : <input type="text" name="u_id" value="${userInfo.u_id }" readonly="readonly"><br>
		모임 내용 :<br>
		<textarea name="m_content">${vo.m_content }</textarea><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>