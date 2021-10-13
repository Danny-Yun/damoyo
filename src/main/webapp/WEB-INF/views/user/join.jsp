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
				<input type="text" name="u_id" id="u_id" placeholder="ID" required  />
				<button type="button" id="idCheck" onclick="fn_idCheck();" value="N">중복확인</button>
			</div>

			<div>
				비밀번호 <br> 
				<input type="password" name="u_pw" id="u_pw" minlength="8" 
					onchange="check_pw()" placeholder="8자 이상 입력하세요" required />
			</div>
			
			<div>
				새 비밀번호 확인 <br>
				<input type="password" name="re_pw" id="re_pw"
			 		minlength="8" onchange="check_pw()" required />
		 		<span id="check"></span>
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
				alert("아이디를 입력하세요.");
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
						alert("사용 가능한 아이디입니다.");
						$("#idCheck").attr("value", "OK");  // 아이디 중복 확인되었음으로 속성값 변경 
					} else {
						alert("중복된 아이디입니다.");
						$("#u_id").val("");  // 아이디 입력칸 초기화
					} 
				}
			})
		}
		$("#submit").on("click", function() {
			
			let idCheckVal = $("#idCheck").val();
			if(idCheckVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else {
				$("joinForm").submit();
			}
		});
		
		// 비밀번호 일치여부 검사
		function check_pw() {
			if(document.getElementById('u_pw').value!='' && document.getElementById('re_pw').value!=''){
		        if(document.getElementById('u_pw').value === document.getElementById('re_pw').value ){
		            document.getElementById('check').innerHTML='OK'
		            document.getElementById('check').style.color='blue';
		        }
		        else{
		            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
		            document.getElementById('check').style.color='red';
		        }
		    }
		}
		
	</script>
</body>
</html>