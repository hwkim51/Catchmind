<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<title>이야기 나누기</title>
<style>
/*
div {
	border: 1px solid red;
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
}

.chat-outer {
	width: 100vw;
	margin: auto;
}

.chat-back {
	width: 170px;
	height: 100%;
	float: left;
	margin-left: 15px;
}

.chat-profile {
	width: 350px;
	height: 100%;
	float: left;
	padding-top: 50px;
	margin-right: 15px;
}

.chat-window {
	width: 750px;
	height: 100%;
	float: left;
	padding-left: 10px;
	border-left: 1px solid lightgrey;
}

#back-icon {
	width: 40px;
}

.chat-profile>div {
	width: 100%;
}

#profile-pic {
	height: 230px;
}

#profile-pic>img {
	width: 200px;
	height: 200px;
	border-radius: 70%;
	object-fit: cover;
	margin-top: 15px;
}

#profile-nickname {
	height: 70px;
}

#profile-nickname>span {
	font-size: 50px;
	font-weight: bolder;
}

#profile-mbti {
	height: 40px;
}

#profile-mbti>span {
	font-size: 25px;
}

#profile-introduction {
	height: 150px;
}

#profile-introduction>span {
	font-size: 12px;
}

#profile-midline {
	width: 270px;
}

#profile-review {
	height: 50px;
	text-align: center;
	line-height: 25px;
}

#chat-review {
	width: 270px;
	height: 30px;
	border: none;
	background-color: rgba(0, 0, 139, 0.642);
	color: white;
	border-radius: 5px;
}

#chat-review:hover {
	background-color: white;
	border: 2px solid rgba(0, 0, 139, 0.642);
	color: black;
}

#profile-btns {
	height: 50px;
	text-align: center;
	line-height: 30px;
}

#profile-block {
	width: 122px;
	height: 30px;
	border: none;
	background-color: lightgrey;
	border-radius: 5px;
}

#profile-report {
	width: 122px;
	height: 30px;
	border: none;
	background-color: lightgrey;
	border-radius: 5px;
}

.modal-dialog {
	background-color: rgb(232, 230, 230);
	border-radius: 70px !important;
	margin-top: 15vh !important;
}

.review-profile {
	position:absolute;
	left: 100px;
	width: 200px;
	height: 200px;
	border-radius: 70%;
	background-color: green;
	margin-top: -40px;
	margin-left: -40px;
	object-fit : cover;
}

#chat-area {
	height: 600px;
}

.received-side {
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	background: #5a99ee;
	padding: 10px 20px;
	position: relative;
	display: inline-block;
	align-items: right;
}

.writer-side {
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	border-radius: 50px;
	background: orange;
	padding: 10px 20px;
	position: relative;
	display: inline-block;
	align-items: right;
}

#chat-attachment {
	height: 50px;
}

#chat-input {
	height: 100px;
}

#chat-text {
	width: 670px;
	height: 80px;
	margin-top: 7px;
	resize: none;
}

#chat-send {
	float: right;
	height: 80px;
	width: 60px;
	border: 0px;
	background-color: orange;
	color: white;
	border-radius: 5px;
	margin-top: 7px;
}

#bottom {
	height: 200px;
	width: 100vw;
	display: block;
	float: bottom;
}

#chat-text-list {
	list-style-type: none;
}
*/
	#chat-input {
		height: 100px;
	}

	#chat-text {
		margin-top: 7px;
		margin-left : 15px;
		resize: none;
		width: 510px; height: 90px; background-color: white; border: 1px solid gray; border-radius: 7px; float: left;
		-ms-overflow-style: none;
	}
	#chat-send {
		float: right;
		height: 90px;
		width: 65px;
		border: 0px;
		background-color: orange;
		color: white;
		border-radius: 5px;
		margin-top: 7px;
	}
	.profile-img {
        width: 200px;
        height: 200px;
        border-radius: 70%;
        margin-top: 80px;
        object-fit: cover;
    }

    .user-mbti {
        margin-top: 15px;
        font-size: 20px;
    }

    .user-nickname {
        font-weight: bold;
        font-size: 25px;
        display: inline-block;
    }

    .user-message {
        width: 200px;
        height: 50px;
        word-break: break-all;
        margin-top: 20px;
        font-size: 15px;
        overflow-y: scroll;
        margin-bottom: 30px;
    }
    
    .user-message::-webkit-scrollbar {
        width: 5px;
    }

    .user-message::-webkit-scrollbar-thumb {
        height: 10%;
        background: orange;
        border-radius: 10px;
    }

    .user-message::-webkit-scrollbar-track {
        background: rgb(254, 235, 200);
    }

    .test {
        -ms-overflow-style: none;
    }
    .test::-webkit-scrollbar{
        display:none;
    }

    .input {
        -ms-overflow-style: none;
    }
    .input ::-webkit-scrollbar{
        display:none;
    }

	.tableDiv{
        display: table;
        
    }
    .timeDiv{
        display: table-cell;
        vertical-align: bottom;
        padding: 0px 0px 15px 10px;
    }
  
    .partnertimeDiv {
        display: table-cell;
        vertical-align: bottom;
        padding: 0px 10px 15px 0px;
    }
	.btn-review{
		font-family: 'Noto Sans KR', sans-serif;
		width: 230px;
		height: 40px;
		background-color: orange;
		border:none;
		border-radius: 20px;
		margin: 0 15px 20px 15px;
		color: white;
		font-weight: 600;
		box-shadow: 1px 3px 4px rgba(0,0,0,0.3);
		display: block;
		float: left;
	}
	.btn-review:hover{
		background-color: rgb(255, 123, 0) !important;
		cursor: pointer !important;
	}
	.reviewModal, .modal-dialog{
		text-align: center;
		max-width: 600px !important;
		width: 600px !important;
		height: 500px;
		z-index: 5 !important;
	}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
		var chatTimeVar = "";
	</script>
	<c:choose>
		<c:when test="${ users.m1.userNo == loginUser.userNo }">
			<c:set var='profile' value='${ users.m2 }' />
		</c:when>
		<c:otherwise>
			<c:set var='profile' value='${ users.m1 }' />
		</c:otherwise>
	</c:choose>
	
			

	<div style="width: 1000px; height: 650px; margin: auto;">

        <!-- 채팅 상대 프로필 -->
        <div style="width: 400px; height: 650px; background-color: azure; float: left;" align="center">
            <c:choose>
        		<c:when test="${ profile.pic eq null }">
        			<img class="profile-img" src="resources/images/pic.png">
        		</c:when>
        		<c:otherwise>            
        			<img class="profile-img" src="${ profile.pic }">
        		</c:otherwise>
        	</c:choose>
            <div class="user-mbti">${profile.mbti}</div>
            <div class="user-nickname">${profile.nickname}</div>
            <div class="user-message" id="user-message" align="left">${profile.profile}</div>
            <hr style="width: 220px;">
            <button type="button" class="btn btn-sm" id="chat-review" style="width: 200px; background-color: rgb(91, 124, 208); color: white; margin-bottom: 10px; display: block;">상대 후기 남기기</button>
            <button type="button" class="btn btn-sm" id="profile-block" style="width: 90px; background-color: lightgrey; color: white; margin-right: 15px;">차단</button>
            <button type="button" class="btn btn-sm" id="profile-report" style="width: 90px; background-color: lightgrey; color: white;">신고</button>
            
            <script>
				$("#profile-block").click(function() {
					location.href = "block.ch?userNo=${profile.userNo}";
				});
				$("#profile-report").click(function() {
					location.href = "report.ch?userNo=${profile.userNo}";
				});
				var profileNo = ${profile.userNo};
			</script>
        </div>

        <!-- 채팅창 -->
        <div style="width: 600px; height: 650px; float: left;">
            <!-- 채팅 영역 -->
            <div class="test" id="chat-div" style="width: 600px; height: 560px; float: left; overflow-y: scroll;">
                
                <ul style="list-style: none;" id="chat-text-list">
                	<c:forEach var="c" items="${ chatlist }">
						<c:choose>
							<c:when test="${ c.writer == loginUser.nickname }">
								<li>
									<div style='background-color: #FAD961; background-image: linear-gradient(270deg, #FAD961 0%, #ff9151 100%); box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0,0,0,0.3) 0px 8px 16px -8px, rgba(0,0,0,0.024) 0px -6px 16px -6px; width: fit-content; max-width: 350px; padding: 12px; border-radius: 20px 0px 20px 20px; color: white; margin-bottom: 10px; float: right; margin-right: 30px;'>
										${ c.chatContent }
									</div>
									<div style='float:right; margin-right:10px;'>${ c.chatTime }</div>
									<div style='clear: both;'></div>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<div style='background-color: #ffaea2; box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0,0,0,0.3) 0px 8px 16px -8px, rgba(0,0,0,0.024) 0px -6px 16px -6px; background-image: linear-gradient(90deg, #ffaea2 0%, #ff6e90 55%, #ff728c 100%); width: fit-content; max-width: 350px; padding: 12px; border-radius: 0px 20px 20px 20px; color: white; float: left; margin-bottom: 10px;'>
										${ c.chatContent }
									</div>
									<div style='float:left; margin-left:10px;'>${ c.chatTime }</div>
									<div style='clear: both;'></div>
								</li>
							</c:otherwise>
						</c:choose>
                    </c:forEach>

                </ul>
                
            </div>
            
            <!-- 채팅 입력창 -->
            
			<textarea id="chat-text" name="chatContent"
			placeholder="내용을 입력해주세요."></textarea>
			<button type="button" id="chat-send">전송</button>


        </div>

        
    </div>
	
	<!-- The Modal -->
	
	<div class="modal fade" id="review-Modal">
		<div class="modal-dialog">
			<div class="reviewModal">
				<img src="${ profile.pic }" class="review-profile">
				<span class="btn-close" style="float:right; padding-right: 70px;"><h1>&times;</h1></span>
				<div style="padding-top: 170px;"> 
				
					<h5 style="text-align: left; padding-left: 70px;"><b>
							<span style="font-size: 30px;">캔디현우</span>님과의 대화는 어떠셨나요?</b></h5><br>
					
					<input type="radio" name="reviewType" id="charming" value="CHARMING">
						<label for="charming" class="btn-review"> 💟 매력적이에요 </label>
					<input type="radio" name="reviewType" id="kind" value="KIND">
						<label for="kind" class="btn-review">친절해요 💚</label><br>
					
					<input type="radio" name="reviewType" id="warmhearted" value="WARMHEARTED">
						<label for="warmhearted" class="btn-review">따뜻해요 💞</label>
					<input type="radio" name="reviewType" id="rapid" value="RAPID">
						<label for="rapid" class="btn-review">⚡ 답장이 빨라요</label><br>

					<input type="radio" name="reviewType" id="happy" value="HAPPY">
						<label for="happy" class="btn-review">대화가 즐거워요 😄</label>
					<input type="radio" name="reviewType" id="love" value="LOVE">
						<label for="love" class="btn-review">갖고싶어요 💝</label><br clear="both">

					<input type="submit" class="btn btn-secondary" value="보내기">
				</div>
				
				
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function(){
		    $("#chat-review").click(function(){
				$("#review-Modal").modal();
		    });

			$(".btn-close").click(function(){
				$("#review-Modal").modal("hide");
			});
		
		});
		
		

		chatPage = 1;
		$(function() {
			if("${loginUser.userNo}"=="") {
				alert("로그인 후 이용 가능한 서비스입니다.");
				history.back();
			}
			else if(!(("${loginUser.userNo}"=="${users.m1.userNo}") ||("${loginUser.userNo}" == "${users.m2.userNo}"))) {
				alert("비정상적인 접근입니다.");
				history.back();
			}
		});
		
		var interval;
		var interval2
		var roomTime = 0;
		var roomNo = "${roomNo};"
		$(function() {
			chatPage = 1;
			setRoomTime();
		});
		
		function signalFromChat() {
			console.log("챗시그널");
			$.ajax({
        		url : "signalFromChat.me",
        		data : {
        			userNo : "${loginUser.userNo}"
        		},
        		success : function(result){
        		},
        		error : function(){
        			console.log("chatsignal ajax problem");
        		}
        	});

		}
		
		function signalFromChatRoom() {
			console.log("챗룸시그널");
			$.ajax({
				url : "signalFromChatRoom.ch",
				data : {
					roomNo : "${roomNo}",
					userNo : "${loginUser.userNo}"
				},
				success : function(result) {
					if(result == 0) {
						clearInterval(interval);
						clearInterval(interval2);
						var modalAnswer = confirm("상대가 채팅방을 떠났습니다.\n채팅 후기를 남기시겠습니까?");
						if(modalAnswer == true) {
							$("#review-Modal").modal();
						}
						else {
							location.href = "/catchmind";
						}
						
					}
					else {
						
					}
				},
				error : function() {
					console.log("chatroom ajax problem");
				}
			});
		}
		
		function setRoomTime() {
			$.ajax({
				url : "setRoomTime.ch",
				data : {
					roomNo : "${roomNo}"
				},
				success : function(result) {
					chatPage = 1;
					console.log("인터벌 설정 완료");
					signalFromChat;
					signalFromChatRoom;
					interval = setInterval(signalFromChat, 2000);
					interval2 = setInterval(signalFromChatRoom, 5000);
				},
				error : function() {
					console.log("setRoomTime ajax problem");
				}
			});
		}
		
		var client;
		var chatTimeVar = "";
		
		$(function() {
			
			var sock = new SockJS("http://localhost:8006/catchmind/chat");
			client = Stomp.over(sock);
			var roomNo = ${roomNo};
			var enterString = "${loginUser.nickname}님이 입장하셨습니다.";
			
			$("#chat-send").click(function() {
				var contents = $("#chat-text").val();
				if(contents != ""){
					if(contents.replace(/\n/g, "").trim().replace(/ /g, "") != ""){
						contents = contents.replace(/\n/g, "<br>");
						client.send('/fromServer/' + roomNo, {},
								JSON.stringify({
									roomNo : roomNo,
									chatContent : contents,
									writer : ${ loginUser.userNo }
								})
							);
						$("#chat-text").val("");
					}
				}
			});
			
			client.connect({}, function() {
	
				client.subscribe('/subscribe/' + roomNo, function(chat) {
					var content = JSON.parse(chat.body);
					var chatResult = $("#chat-text-list").html();

					
					// 내가 쓴거
					if(content.writer == "${loginUser.userNo}"){
						
						chatResult += "<li>"
									+ "<div style='background-color: #FAD961; background-image: linear-gradient(270deg, #FAD961 0%, #ff9151 100%); box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0,0,0,0.3) 0px 8px 16px -8px, rgba(0,0,0,0.024) 0px -6px 16px -6px; width: fit-content; max-width: 350px; padding: 12px; border-radius: 20px 0px 20px 20px; color: white; margin-bottom: 10px; float: right; margin-right: 30px;'>"
									+ content.chatContent
									+ "</div>";
						if(chatTimeVar != content.chatTime) {
                			chatResult += "<div style='float:right; margin-right:10px;'>" + content.chatTime + "</div>";
                			chatTimeVar = content.chatTime;
                		}
						
						chatResult += "<div style='clear: both;'></div>"
                    				+ "</li>";
						
					}
					
					// 남이 쓴거
					else {

						chatResult += "<li>"
									+ "<div style='background-color: #ffaea2; box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0,0,0,0.3) 0px 8px 16px -8px, rgba(0,0,0,0.024) 0px -6px 16px -6px; background-image: linear-gradient(90deg, #ffaea2 0%, #ff6e90 55%, #ff728c 100%); width: fit-content; max-width: 350px; padding: 12px; border-radius: 0px 20px 20px 20px; color: white; float: left; margin-bottom: 10px;'>"
									+ content.chatContent
									+ "</div>";
						if(chatTimeVar != content.chatTime) {
		        			chatResult += "<div style='float:left; margin-left:10px;'>" + content.chatTime + "</div>";
		        			chatTimeVar = content.chatTime;
		        		}
						
						chatResult += "<div style='clear: both;'></div>"
		            				+ "</li>";
					}
					
					$("#chat-text-list").html(chatResult);
					$("#chat-div").scrollTop($("#chat-div")[0].scrollHeight);
					
	
				});
				
				client.send('/fromServer/' + roomNo, {},
					JSON.stringify({
						chatContent : enterString,
						writer : ${loginUser.userNo}
					})
				);
	
			});
			
		});
		
	</script>




	<jsp:include page="../common/footer.jsp" />
</body>
</html>