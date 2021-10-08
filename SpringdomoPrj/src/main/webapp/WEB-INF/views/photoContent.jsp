<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="w3-border w3-padding">댓글</div>
			<div class="w3-border w3-padding">
				<c:if test="${ id == null }">
					<textarea rows="5" cols="50" class="w3-input w3-border newLogin" readonly>로그인 후 댓글 달기</textarea>
				</c:if>
				<c:if test="${ id != null }">
					<i class="fa fa-user w3-padding-16"></i> ${ photo.u_id }
					<form>
						<input type="hidden" name="no" id="p_num" value="${ photo_content.p_num }"> 
						<input type="hidden" name="id" id="u_id" value="${ id }">
						<textarea rows="5" cols="50" class="w3-input w3-border" placeholder="댓글 작성" name="reply_content" id="reply_content"></textarea>
						<input type="button" class="w3-button w3-border" id="reply_btn" value="댓글 등록">
					</form>
				</c:if>
			</div>
			
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>		
			 $("#reply_btn").click(function(){
	    	if($("#reply_content").val().trim() === ""){
	    		alert("댓글을 입력하세요.");
	    		$("#reply_content").val("").focus();
	    	}else{
	    		$.ajax({
	    			url: "/views/uploadForm.jsp",
	                type: "POST",
	                data: {
	                    p_num : $("#p_num").val(),
	                    u_id : $("#u_id").val(),
	                    p_comment_content : $("#p_comment_contentt").val()
	                },
	                success: function () {
	                	alert("댓글 등록 완료");
	                	$("#p_comment_content").val("");
	                	getReply();
	                },
	    		})
	    	}
	    })
	</script>
</body>
</html>