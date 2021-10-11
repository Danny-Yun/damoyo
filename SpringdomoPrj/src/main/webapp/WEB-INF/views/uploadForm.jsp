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
	<form action="uploadFormAction" method="post" enctype="multipart/form-data">
	<label>아이디:</label>
    <input type="text" name="u_id"><br>
	<label>이름:</label>
    <input type="text" name="u_name"><br>
	사진 번호 : <input type="number" name="p_num"><br>
	<input type='file' name='uploadFile' multiple>
	<input type="submit" value="등록">
	<a href="javascript:void(0);" class="like " id="likeBtn" data-chuserid="claeotls" data-prgid="62543630"><i></i>0</a>
	</form>
	<a href="/main"><button>메인 페이지로</button></a>
</body>
</html>