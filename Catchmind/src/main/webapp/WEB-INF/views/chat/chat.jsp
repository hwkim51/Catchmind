<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 서비스</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- <script
	src="${ pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
	<input type="text" id="nickname" class="form-inline"
		placeholder="닉네임을 입력해주세요" required autofocus>
	<button class="btn btn-primary" id="name">확인</button>
	<div id="chatroom"
		style="width: 400px; height: 600px; border: 1px solid; background-color: gray"></div>
	<input type="text" id="message" name="message" style="height: 30px; width: 340px"
		placeholder="내용을 입력하세요" autofocus>
	<button class="btn btn-primary" id="send">전송</button>

	<script>
	
		$(function() {
			
			$("#send").click(function() {
				client.send('/fromServer/' + roomNo, {},
						JSON.stringify({
							roomNo : roomNo,
							chatContent : $("#message").val(),
							writer : $("#nickname").val()
							/* writer : loginUser.userNo */
						})
					);
				$("#message").val("");

			});
			
			var sock = new SockJS("http://192.168.40.23:8006/catchmind/chat");
			var client = Stomp.over(sock);
			var roomNo = ${roomNo};
			client.connect({}, function() {

				client.subscribe('/subscribe/' + roomNo, function(chat) {
					
					var content = JSON.parse(chat.body);
					var chatResult = $("#chatroom").html();
					chatResult += content.writer + " : " + content.chatContent + "<br>";
					$("#chatroom").html(chatResult);

				});
				
				client.send('/fromServer/' + roomNo, {},
					JSON.stringify({
						chatContent : message,
						writer : $("#nickname").val()
						/* writer : loginUser.userNo */
					})
				);

			});

		});
		
		
	</script>

</body>

</html>