<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	fieldset {
		border: 3px solid black;
		padding:20px;
		width:500px;
	}
	p {
		padding-left:20px;
	}
</style>
<meta charset="UTF-8">
<title>DAMOYO - 회원가입</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h3>회원가입</h3>
	
	<form action="/user/join" method="post" id="joinForm">
		<fieldset>
			<legend>아이디로 가입하기</legend>
			
			<div>
				아이디 <br>
				<input type="text" name="u_id" id="u_id" placeholder="ID"  
					onchange="fn_idCheck()" required/><br>
				<span id="check_id"></span>
				<button type="button" id="id" value="N"></button>
			</div>

			<div>
				비밀번호 <br> 
				<input type="password" name="u_pw" id="u_pw"  
					onchange="check_pw()" placeholder="8자 이상 입력하세요" required /><br/>
				<span id="check_pw"></span>
				<button type="button" id="pw" value="N"></button>
			</div>
			
			<div>
				새 비밀번호 확인 <br>
				<input type="password" name="re_pw" id="re_pw"
			 		 onchange="check_repw()" required /><br/>
		 		<span id="check_repw"></span>
				<button type="button" id="repw" value="N"></button>
			</div>
			
			<div>
				이름 <br> 
				<input type="text" name="u_name" placeholder="NAME" required />
			</div>

			<div>
				성별 <br> 
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="0">남성</label>
				
				  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off">
				  <label class="btn btn-outline-primary" for="1">여성</label>
				</div>
			</div>
			
			<div>
				생일 <br> 
				<input type="date" name="u_birth" required />
			</div>
			
			<div>
				지역 <br> 
				<input type="text" name="u_area" placeholder="AREA" required />
			</div>
		</fieldset>
		<p><input type="submit" id="submit" value="가입하기" /><p>
	</form>
	
	<script>
		
		// 아이디 중복검사
		function fn_idCheck() {

			let u_id = $("#u_id").val();
			if(u_id === "") {
				$("#check_id").html("필수 정보입니다.");
				$("#check_id").css("color","red");
				$("#id").attr("value", "N");
				return;
			}
			
			//아이디 유효성 검사
			let idRegExp = /^[a-z0-9]{5,20}$/;  
			if(!idRegExp.test(u_id)) {
				$("#check_id").html("5~20자의 영문 소문자, 숫자와 특수기호만 사용 가능합니다.");
				$("#check_id").css("color","red");
				$("#id").attr("value", "N");
				return;
			}
			
			$.ajax({
				url : "/user/join/idCheck",
				type : "post",
				dataType : "json",
				data : { "u_id" : u_id },
				success : function(data) {
					console.log(data);
					if(data == 0) {
						$("#check_id").html("멋진 아이디네요!");
						$("#check_id").css("color","#08a600");
						$("#id").attr("value", "OK");  // 아이디 중복 확인되었음으로 속성값 변경 
					} else {
						$("#check_id").html("이미 사용중이거나 탈퇴한 아이디입니다.");
						$("#check_id").css("color","red");
						$("#id").attr("value", "N");
					} 
				}
			})
		}
		
		// 비밀번호 유효성 검사
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
		 
		// 비밀번호 일치여부 검사
		function check_repw() {
			
			if(document.getElementById('u_pw').value!='' && document.getElementById('re_pw').value!=''){
		        if(document.getElementById('u_pw').value === document.getElementById('re_pw').value ){
		            document.getElementById('check_repw').innerHTML='OK';
		            document.getElementById('check_repw').style.color='blue';
		            $("#repw").attr("value", "OK");
		        }
		        else{
		            document.getElementById('check_repw').innerHTML='비밀번호가 일치하지 않습니다.';
		            document.getElementById('check_repw').style.color='red';
		            $("#repw").attr("value", "N");
		        }
		    }
		}
		
		// 확인용 버튼 숨기기
	  	$("#id").hide();
	  	$("#pw").hide();	
	  	$("#repw").hide();	
	  	
		// 가입하기 버튼 클릭시
	 	$("#submit").on("click", function() {
			
			let idCheckVal = $("#id").val();
			let pwCheckVal = $("#pw").val();
			let re_pwCheckVal = $("#repw").val();

			if(idCheckVal == "N") {
				alert("아이디를 확인하세요.");
				return false;
			} else if(pwCheckVal == "N" || re_pwCheckVal == "N" )  {
				alert("비밀번호를 확인하세요.");
				return false;
			} else {
				$("joinForm").submit();
			}
		});
	</script>
</body>
</html>