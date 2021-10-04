<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	margin:20px;
</style>
<meta charset="UTF-8">
<title>DAMOYO - 비밀번호 변경</title>
</head>
<body>
	<form action="/user/password/change" method="post">
		<h4>새 비밀번호</h4>
		<input type="password" name="u_pw" id="u_pw" 
			minlength="8" onchange="check_pw()" required /><br><br/>
		<h4>새 비밀번호 확인</h4>
		<input type="password" name="re_pw" id="re_pw"
			 minlength="8" onchange="check_pw()" required />&nbsp;<span id="check"></span><br><br/>
		<input type="submit" value="확인" />
	</form>
	
	<script>
		function check_pw() {
			if(document.getElementById('u_pw').value!='' && document.getElementById('re_pw').value!=''){
		        if(document.getElementById('u_pw').value === document.getElementById('re_pw').value ){
		            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
		            document.getElementById('check').style.color='blue';
		        }
		        else{
		            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
		            document.getElementById('check').style.color='red';
		        }
		    }
		}
	
		let result = "${result}";
		console.log(result);
		if(result === "fail") {
			alert("두 비밀번호가 일치하지 않습니다.");
		}
	</script>
</body>
</html>