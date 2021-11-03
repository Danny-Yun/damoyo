<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.box_left {
		margin-left:350px;
		float:left;
	}
	
	.box {
		padding-top:20px;
		padding-bottom:20px;
		width:500px;
		display:block;
		float:right;
		/*border:1px solid black;*/
	}
	
	.left_side{
		clear:both;
		float:left;
	}
	
	.right_side {
		float:right;
	}
	
	.u_id {
		clear:both;
		width:50px;
		float:left;
	}
	
	.b_date {
		/*padding-left:300px;*/
		width:100px;
		float:right;
	}
	
	hr {
		clear:both;
	}
	
	.titlecontent {
		width:200px;
		heigth:50px;
		float:left;
	}
	
	.b_image1 {
		width:150px;
		height:70px;
		border:1px solid black;
		float:right;
	}
	
	.b_like {
		clear:both;
		width:100px;
		float:left;
	}
	
	.b_cate_name {
		width:50px;
		float:right;
	}
</style>
</head>
<body>
	<h1>모임방_게시판</h1>
	<%-- 유저정보 : ${infos.user }<br>
	모임정보 : ${infos.meet }<br> --%>
	<a href="/meet/info?num=${meetInfo.m_num }"><button>정보</button></a>
	<a href="/meet/board/list"><button>게시판</button></a>
	<a href="#"><button>갤러리</button></a>
	<a href="#"><button>채팅</button></a>
	<a href="/main/"><button>메인화면</button></a>
	<br>
	
	<form action="/board/list">
		<select name="searchType">
			<option selected="${boardPages.cri.searchType eq null ? 'selected' : ''}" value="">
					전체보기
			</option>
			<c:forEach var="c" items="${category }">
				<option value="${c.b_cate_name}"
					<c:out value="${boardPages.cri.searchType eq c.b_cate_name ? 'selected' : ''}"  />>
					 ${c.b_cate_name }
				</option>
			</c:forEach>	
		</select>
		<input type="text" name="keyword" placeholder="검색어" value="${boardPages.cri.keyword }">
		<input type="submit" value="검색">
	</form>
	<br>
	<hr>
	<c:forEach var="list" items="${list}">
		<div class="left_side">
			<div class="box_left"/></div>
			<div class="box" onclick="location.href='/board/detail?b_num=${list.b_num}';" style="cursor:pointer;">
				<div class="u_id">${list.u_id}</div> <div class="b_date">${list.b_date}</div><br><br>
				<div class="titlecontent">
					<strong>${list.b_title}</strong><br>
					<script>
						var b_content = "${list.b_content}";
						if(b_content.length > 10) {
							document.write(b_content.substring(0, 11) + "...");
						} else {
							document.write(b_content);
						}
					</script>
					<br>
				</div>
				<div class="b_image1"></div><br>
				<hr>
				<div class="b_like">좋아요 ${list.b_like}</div> <div class="b_cate_name">${list.b_cate_name}</div>
					<hr>
			</div>
		</div>
			<div class="right_side">
		</div>
	</c:forEach>
	<hr>
	<div>
		<form action="/board/write" method="get">
			<input type="submit" value="글쓰기">
		</form>
		<%-- ${boardPages } --%>
	</div>
	<ul class="pagination">
		<c:if test="${boardPages.prev }">
			<a class="page-link" href="/board/list?pageNum=${boardPages.startPage - 1 }&searchType=${boardPages.cri.searchType}&keyword=${boardPages.cri.keyword}">Prev</a>
		</c:if>
		<c:forEach var="page" begin="${boardPages.startPage }" end="${boardPages.endPage }">
			<li class="page-item ${boardPages.cri.pageNum eq page ? 'active' : '' }"><a class="page-link" href="/board/list?pageNum=${page }&searchType=${boardPages.cri.searchType}&keyword=${boardPages.cri.keyword}">${page}</a></li>
		</c:forEach>
		<c:if test="${boardPages.next }">
			<a class="page-link" href="/board/list?pageNum=${boardPages.endPage + 1 }&searchType=${boardPages.cri.searchType}&keyword=${boardPages.cri.keyword}">Next</a>
		</c:if>
	</ul>
	
</body>
</html>