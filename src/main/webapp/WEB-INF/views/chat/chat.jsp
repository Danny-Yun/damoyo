<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임 정보 - DA!MOYO</title>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/css/styles.css">
<!-- font-awesome code kit -->
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<!-- SokectJS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript">
    var webSocket = {
        init: function(param){
            this._url = param.url;
            this._initSocket();
        },
        sendChat: function(){
            this._sendMessage('${param.room_id}', 'CMD_MSG_SEND', $('#message').val(), '${userInfo.u_name}');
            $('#message').val('');
        },
        sendEnter:function(){
            this._sendMessage('${param.room_id}', 'CMD_ENTER', $('#message').val(), '${userInfo.u_name}');
            $('#message').val('');
        },
        receiveMessage: function(msgData) {
            // 정의된 CMD 코드에 따라서 분기 처리
            if(msgData.cmd == 'CMD_MSG_SEND'){
                $('#divChatData').append('<div>' + msgData.msg + '</div>');
            }
            // 입장
            else if(msgData.cmd == 'CMD_ENTER'){
                $('#divChatData').append('<div>' + msgData.msg + '</div>');
            }
            // 퇴장
            else if(msgData.cmd == 'CMD_EXIT'){
                $('#divChatData').append('<div>' + msgData.msg + '</div>');
            }
        },
        closeMessage: function(str) {
            $('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
        },
        disconnect: function(){
            this._socket.close();
        },
        _initSocket: function(){
            this._socket = new SockJS(this._url);
            this._socket.onopen = function(evt){
                webSocket.sendEnter();
            };
            this._socket.onmessage = function(evt) {
                webSocket.receiveMessage(JSON.parse(evt.data));
            };
            this._socket.onclose = function(evt) {
                webSocket.closeMessage(JSON.parse(evt.data));
            }
        },
        _sendMessage: function(room_id, cmd, msg, name) {
            var msgData = {
                room_id : room_id,
                cmd : cmd,
                msg : msg,
                name : name
            };
            var jsonData = JSON.stringify(msgData);
            this._socket.send(jsonData);
        }
    };
</script>
<script type="text/javascript">
	$(window).on('load', function() {
		webSocket.init({ url: '<c:url value="/chat" />' });			
	});
</script>
</head>
<body>
	<div id="wrapper">
		<!-- Start header -->
	  	<header class="main-header">
	  		<div class="main-header__column">
	  			<a href="/main/">
	  			<img class="main-header__logo" src="/resources/img/logo.jpg" /></a>
	  		</div>
			<div class="main-header__column">
				<span class="main-header__username">${infos.user.u_name }님, 환영합니다.</span>
				<span class="main-header__logout">
					<form action="/user/logout" method="post">
						<input type="submit" class="main-header__logout" value="로그아웃" />
					</form>
				</span>
			</div>
	  	</header>
		<!-- END header -->
		
		<!-- Start meet-detail -->
		<div class="meet-detail">
			<div class="meet-detail__name">${infos.meet.m_name }</div>
		</div>
		<!-- END meet-detail -->
		
	  	<!-- Start nav -->
	  	<nav class="main-nav">
		  	<ul class="main-nav__list">
				<li class="main-nav__btn">
					<a class="main-nav__link" href="/meet/info?num=${infos.meet.m_num }"
							style="color: black">
						<i class="fab fa-fort-awesome fa-lg"></i>
						<span>모임방</span>
					</a>
				</li>  	
				<li class="main-nav__btn">
					<a class="main-nav__link-checkJoin" href="${infos.checkJoin eq null ? '#':'/meet/board/list'}">
						<div class="main-nav__link">
							<i class="fas fa-feather-alt fa-lg"></i>
							<span>게시판</span>
						</div>
					</a>
				</li>  	
				<li class="main-nav__btn">
					<c:if test="${infos.checkJoin eq null }">
						<a class="main-nav__link-checkJoin" href="#" style="color: black">
							<div class="main-nav__link">
								<i class="fas fa-comments fa-lg"></i>
								<span>채팅</span>
							</div>
						</a>
					</c:if>
					<c:if test="${infos.checkJoin ne null }">
						<a class="main-nav__link-checkJoin" href="/chatting?room_id=${infos.meet.m_num }" style="color: black">
							<div class="main-nav__link">
								<i class="fas fa-comments fa-lg"></i>
								<span>채팅</span>
							</div>
						</a>
					</c:if>
				</li>  			
				<li class="main-nav__btn">
					<a class="main-nav__link" href="/main/">
						<i class="far fa-compass fa-lg"></i>
						<span>모임 찾기</span>
					</a>
				</li>  			
		  	</ul>
	  	</nav>
	  	<!-- END nav -->
	  	
	  	
	    <div style="width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
	        <div id="divChatData"></div>
	    </div>
	    <div style="width: 100%; height: 10%; padding: 10px;">
	        <input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
	        <input type="button" id="btnSend" value="전송" onclick="webSocket.sendChat()"/>
	    </div>
	</div>
</body>
</html>