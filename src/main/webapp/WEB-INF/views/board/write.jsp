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
 	<h1>글쓰기 창</h1>
 	유저 : ${infos.user.u_name }<br>
 	모임 : ${infos.meet.m_name }<br>
 	<form action="/board/register" method="post">
		제목 : <input type="text" name="b_title"><br>
		작성자 : <input type="text" name="u_id" value=${infos.user.u_id } readonly><br>
		<input type="hidden" name="m_num" value=${infos.meet.m_num }>
		카테고리:
			<select name="b_cate_name">
				<c:forEach var="cate" items="${infos.category}">
					<option value=${cate.b_cate_name } 
						<c:out value="${cate.b_cate_name eq '자유게시판' ? 'selected' : ''}"/>
						<c:out value="${cate.b_cate_name eq '전체보기' ? 'hidden' : ''}"/>>
				    	${cate.b_cate_name}
				    </option>
				</c:forEach>
			</select>
		<br>
		모임 내용 :<br>
		<textarea name="b_content"></textarea><br>
		모임 사진 : <input type="text" name="b_image1"><br>
		모임 사진 : <input type="text" name="b_image2"><br>
		모임 사진 : <input type="text" name="b_image3"><br>
		<input type="submit" value="생성">
	</form>
	<a href="/main/"><button>메인화면</button></a>
 	
</body>
</html>