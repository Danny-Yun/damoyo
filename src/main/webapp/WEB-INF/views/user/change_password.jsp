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
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<form action="/user/password/change" method="post" id="change">
		<h4>새 비밀번호</h4>
		<input type="password" name="u_pw" id="u_pw" 
			minlength="8" onchange="check_pw()" required />
			<span id="check_pw"></span>
			<button type="button" id="pw" value="N"></button><br><br/>
			
		<h4>새 비밀번호 확인</h4>
		<input type="password" name="re_pw" id="re_pw"
			 minlength="8" onchange="check_repw()" required />&nbsp;<span id="check"></span><br><br/>
			 
		<p><button type="button" onclick="history.back()">이전</button>
		<input type="submit" value="확인" /></p>
	</form>
	
	<script>
		function check_pw() {
			let u_pw = $("#u_pw").val();
			let pwRegExp = /^[a-zA-z0-9]{8,16}$/;
			
			if(u_pw === "") {
				$("#check_pw").html("필수 정보입니다.");
				$("#check_pw").css("color","red");
				$("#pw").attr("value", "N");
				return;
			}
			
			if(!pwRegExp.test(u_pw)) {
				$("#check_pw").html("8~16자의 영문 대 소문자, 숫자와 특수문자를 사용하세요.");
				$("#check_pw").css("color","red");
				$("#pw").attr("value", "N");
				return;
			} else {
				$("#check_pw").html("");  // 검사 통과시 경고문 삭제
			}
			$("#pw").attr("value", "OK");
		}
	
		function check_repw() {
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
		
		$("#pw").hide();	
		$("#submit").on("click", function() {
			
			let pwCheckVal = $("#pw").val();

			if(pwCheckVal == "N")  {
				alert("비밀번호를 확인하세요.");
				return false;
			} else {
				$("change").submit();
			}
		});
	</script>
</body>
</html>