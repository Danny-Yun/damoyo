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
	<h1>main 페이지</h1>
	${userInfo }<br>
	
	<a href="#"><button>DAMOYO LIST</button></a>
	<a href="#"><button>My Page</button></a><br>
	<form action="#" method="get">
		<select name="i_cate_num" name="b_cate_name">
			<option selected="selected" value="">
				전체보기
			</option>
			<c:forEach var="interest" items="${interest }">
				<option value="${interest.i_cate_num }">
					${interest.i_cate_name }
				</option>
			</c:forEach>
		</select>
		<input type="text" name="keyword">
		<input type="submit">
	</form>
	<table border="1">
		<c:forEach var="m" items="${meetList }">
			<tr>
			<td rowspan="3">
				<a href="/meet/info?num=${m.m_num }">"${m.m_profile }이미지${m.m_num }"</a>
			</td>
				<td>${m.m_area }</td>
			</tr>
			<tr>
				<td>${m.m_name }</td>
			</tr>
			<tr>
				<td>${m.m_people_cnt }</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${meetPages.prev }">
		<a href="/main/?pageNum=${meetPages.startPage - 1 }"><button>prev</button></a>
	</c:if>
	<c:forEach var="page" begin="${meetPages.startPage }" end="${meetPages.endPage }">
		<a href="/main/?pageNum=${page }"><button>${page }</button></a>
	</c:forEach>
	<c:if test="${meetPages.next }">
		<a href="/main/?pageNum=${meetPages.endPage + 1 }"><button>next</button></a>
	</c:if>
	<br>
	${meetPages }
	<br>
	<a href="/main/register"><button>개설</button></a><br>
</body>
</html>