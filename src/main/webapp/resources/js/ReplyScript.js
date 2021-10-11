$(()=>{
	// JSON 불러오기
	let board = $("#board").text();
	let user = $("#user").text();
	
	console.log(board);
	console.log(user);

	let m_num = JSON.parse(board).m_num;
	let b_num = JSON.parse(board).b_num;
	let u_id = JSON.parse(user).u_id;


	// 댓글 불러오기
	function getAllList(){
		$.getJSON("/replies/all/" + b_num, function(data){
			// console.log(data.length);
			// console.log(data);
			let str = "";
			$(data).each(function(){
				if(u_id != this.u_id){
					str += "<li data-rno='" + this.b_comment_num + "' class='replyLi'>" 
					+ this.u_id + " - <span>" + this.b_comment_content 
					+ "</span>";
				}else{
					str += "<li data-rno='" + this.b_comment_num + "' class='replyLi'>" 
					+ this.u_id + " - <span>" + this.b_comment_content 
					+ "</span><button>수정/삭제</button></li>";
				}
			});
			$("#replies").html(str);
		});
	}
	getAllList();

	// 댓글 생성
	$("#replyAddBtn").on("click", function(){
		let b_comment_content = $("#b_comment_content").val();
		//console.log("댓글 생성버튼");
		//console.log(u_id);
		//console.log(b_comment_content);

		$.ajax({
			type : 'post',
			url : '/replies',
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				b_num : b_num,
				m_num : m_num,
				u_id : u_id,
				b_comment_content : b_comment_content
			}),
			success : function(result) {
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					// 댓글을 쓰고 나서 다시 새롭게 갱신된 목록을
					// 넣어주도록 전체 댓글 다시 조회
					getAllList();
				}
			}
		});
	});

	// 모달창 오픈
	$("#replies").on("click", ".replyLi button", function(){
		// console.log("삭제버튼 클릭");
		let replyLi = $(this).parent();
		let b_comment_num = replyLi.attr("data-rno");
		let b_comment_content = $(this).siblings().text();
		// console.log(replyLi);
		// console.log(b_comment_num);
		// console.log(b_comment_content);

		// 모달 오픈
		$(".modal-title").html(b_comment_num);
		$("#replytext").val(b_comment_content);
		$("#modiDiv").show("slow");
	});

	// 모달창 닫기
	$("#closeBtn").on("click", function(){
		// console.log("닫기 버튼 클릭");
		$("#modiDiv").hide("slow");
	});

	// 댓글 삭제
	$("#replyDelBtn").on("click", function(){
		let b_comment_num = $(".modal-title").text();
		// console.log(b_comment_num);
		$.ajax({

			type : 'delete',
			url : '/replies/' + b_comment_num,
			success : function(result) {
				if (result === 'SUCCESS') {
					alert(b_comment_num + "번 댓글이 삭제 되었습니다.");
					// 댓글 삭제 후 모달창 닫고 새 댓글목록을 갱신
					$("#modiDiv").hide("slow");
					getAllList();
				}
			}
		});
	});

	// 댓글 수정
	$("#replyModBtn").on("click", function(){
		let b_comment_num = $(".modal-title").text();
		let b_comment_content = $("#replytext").val();

		$.ajax({
			type : 'put',
			url : '/replies/' + b_comment_num,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({b_comment_content : b_comment_content}),
			dataType : 'text',
			success : function(result){
				if(result == 'SUCCESS'){
					alert("댓글이 수정 되었습니다.");
					$("#modiDiv").hide("slow");
					getAllList();
				}
			}
		});
	});



























});



