<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOYO - 마이페이지</title>
</head>
<body>
	<h2>마이페이지</h2>
	<a href="/main/"><button>DAMOYO LIST</button></a>
	<a href="/user/mypage"><button>My Page</button></a><br>
	
	<hr>
	
	${profile.u_profile}
	${profile.u_name}
	${profile.u_area}
	${profile.u_birth}
	
	<a href="/user/modify"><button>내 정보 수정</button></a><br>
	<form action="/user/logout" method="post">
		<input type="submit" value="로그아웃" />
	</form>
	
	<hr>
	
	<a href="/user/myinterest"><button>내 관심사</button></a><br>
	<a href="#"><button>내 모임</button></a><br>
	<a href="#"><button>내 관심 모임</button></a><br>
	<a href="/user/password"><button>비밀번호 변경</button></a><br>
	<a href="/user/leave"><button>회원 탈퇴</button></a><br>
	
	<script>
		let result = "${result}";
		console.log(result);
		if(result === "changePwOK") {
			alert("비밀번호가 변경되었습니다.");
		} 
	</script>
</body>
</html>