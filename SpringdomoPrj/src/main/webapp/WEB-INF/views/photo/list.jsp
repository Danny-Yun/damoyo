<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="text text-primary">게시물 목록</h1>

	<table class="table table-hover">
		<tr>
			<th>사진번호</th>
			<th>사진</th>
			<th>사진제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="photo" items="${list }">
			<tr>
				<td>${photo.p_num }</td>
				<td>${photo.p_image1 }</td>
				<td>${photo.p_cate_name }</td>
				<td>${photo.p_date }</td>
			</tr>
		</c:forEach>
	</table>
	
	${btnMaker}<br/>
	페이지번호 : ${btnMaker.cri.pageNum}
	<!-- 페이지네이션 버튼 위치 
	페이지네이션 버튼을 상황에 맞게 출력하기 위해
	c태그라이브러리의 조건식을 활용합니다.-->
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  
	  	<!-- prev버튼 
	  	btnMaker의 prev가 true일때만 뒤로가기 버튼 출력-->
	  	<c:if test="${btnMaker.prev}">
	    	<li class="page-item">
	    		<a class="page-link"
	    			href="/board/list?pageNum=${btnMaker.startPage - 1}&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">
	    			Previous
	    		</a>
	    	</li>
	    </c:if>
	    
	    <!-- 번호 버튼 
	    c태그의 forEach기능을 쓰되, begin, end속성을 이용해서
	    startPage부터 endPage까지의 숫자들이 버튼으로 나열되게 만들어주세요. 
	    begin, end에 따른 루프 바퀴에 따른 변수명은 var속성으로 지정합니다.
	    
	    1. 버튼이 갯수 맞게 맞는지부터 확인
	    2. 각 바퀴수별로 다른 수치를 버튼에 새기기 위해서
	       var속성에 변수명 적고 출력
	    		3. 현재 조회중 페이지 강조는 class속성 내에서 삼항연산자를 이용해도 된다.-->
		<c:forEach begin="${btnMaker.startPage}" 
					end="${btnMaker.endPage }"
					var="pageNum"> 
	   		<li class="page-item ${btnMaker.cri.pageNum == pageNum ? 'active' : ''}">
	    		<a class="page-link" 
	    		href="/board/list?pageNum=${pageNum}&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">${pageNum}</a>
	    	</li>
		</c:forEach>
	    
	    <!-- next버튼 -->
	    <c:if test="${btnMaker.next}">
		    <li class="page-item">
		    	<a class="page-link" 
		    	href="/board/list?pageNum=${btnMaker.endPage + 1}&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">Next</a>
		    </li>
		</c:if>
	    
	  </ul>
	</nav>
	
	<a href="/photo/create"><button>사진 넣기</button></a>
	
	
	<div class="modal" id="myModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">사진 업로드 완료</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>${p_num }번 사진이 등록되었습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>		
	
	 <!-- Option 1: Bootstrap Bundle with Popper 
	 부트스트랩용 JS파일도 마저 임포트
	 코드 진행 순서가 위에서 아래이므로
	 script 태그 위에 먼저 js파일을 집어넣습니다.-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
	<script>
		// 컨트롤러에서 success라는 이름으로 날린 자료가 들어오는지 확인
		// 그냥 list페이지 접근시는 success를 날려주지 않아서
		// 아무것도 들어오지 않고
		// remove 로직의 결과로 넘어왔을때만 데이터가 전달됨
		var result = "${success}";
		var p_num = "${p_num}";
		// 모달 사용을 위한 변수 선언
		// 모달 공식문서의 자바스크립트 관련 실행 코드를 복사합니다.
		var myModal = new bootstrap.Modal(document.getElementById('myModal'), focus);
		
		if(result === "success"){
			alert(bno + "번 사진이 삭제되었습니다.");
		} else if(result === "create"){
			// 공식문서 하단의 modal.show()를 응용합니다.
			myModal.show();
		}
	</script>
</body>
</html>