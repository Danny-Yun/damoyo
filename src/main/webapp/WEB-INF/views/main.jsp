<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main 페이지</h1>
	${userInfo }<br>
	
	<a href="/main/"><button>DAMOYO LIST</button></a>
	<a href="#"><button>My Page</button></a><br>
	<form action="/main/" method="get">
		<select name="searchType">
 			<option selected="${meetPages.cri.searchType eq null ? 'selected' : ''}" value="">
				전체보기
			</option>
			<c:forEach var="interest" items="${interest }">
				<option value="${interest.i_cate_num }"
					<c:out value="${meetPages.cri.searchType eq interest.i_cate_num ? 'selected' : '' }"/>>
					${interest.i_cate_name }
				</option>
			</c:forEach>
		</select>
		<input type="text" name="keyword" placeholder="검색어" value="${meetPages.cri.keyword }">
		<input type="submit">
	<br>
	<br>
	<a href="/main/register"><button>개설</button></a><br>
	</form>
	<table border="1">
		<c:forEach var="m" items="${meetList }">
			<tr>
				<td rowspan="3">
					<a href="/meet/info?num=${m.m_num }">"${m.m_profile }이미지${m.m_num }"</a>
				</td>
				<td>${m.m_area }</td>
				<td rowspan="3">${m.i_cate_name }</td>
			</tr>
			<tr>
				<td>${m.m_name }</td>
			</tr>
			<tr>
				<td>${m.m_people_cnt }</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination">
		<c:if test="${meetPages.prev }">
			<a class="page-link" href="/main/?pageNum=${meetPages.startPage - 1 }&searchType=${meetPages.cri.searchType}&keyword=${meetPages.cri.keyword}">prev</a>
		</c:if>
		<c:forEach var="page" begin="${meetPages.startPage }" end="${meetPages.endPage }">
			<li class="page-item ${meetPages.cri.pageNum eq page ? 'active' : '' }"><a  class="page-link" href="/main/?pageNum=${page }&searchType=${meetPages.cri.searchType}&keyword=${meetPages.cri.keyword}">${page }</a></li>
		</c:forEach>
		<c:if test="${meetPages.next }">
			<a  class="page-link" href="/main/?pageNum=${meetPages.endPage + 1 }&searchType=${meetPages.cri.searchType}&keyword=${meetPages.cri.keyword}">next</a>
		</c:if>
	</ul>
	
</body>
</html>