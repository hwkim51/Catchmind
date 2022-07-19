<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<title>이야기 나누기</title>
<style>
	div {
		/* border: 1px solid red; */
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
        margin-left : 15px;
	}
	
	.chat-profile {
		width: 350px;
		height: 100%;
		float: left;
		padding-top: 50px;
        margin-right : 15px;
	}
	
	.chat-window {
		width: 750px;
		height: 100%;
		float: left;
        padding-left : 10px;
        border-left : 1px solid lightgrey;
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
        margin-top : 15px;
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


    .modal-dialog{
        height : 70vh;
        background-color : white;
        border-radius : 25px;
        border : 1px solid blue;
        margin-top : 15vh !important;
    }

    .review-profile {
        width : 200px;
        height : 200px;
        border-radius : 70%;
        background-color : green;
        margin-top : -40px;
        margin-left : -40px;
    }

    #chat-area {
        height : 600px;
    }

	.received-side {
		-webkit-border-radius: 50px;
		-moz-border-radius: 50px;
		border-radius: 50px;
		background: #5a99ee;
		padding: 10px 20px;
		position: relative;
		display : inline-block;
		align-items : right;
	}

	.writer-side {
		-webkit-border-radius: 50px;
		-moz-border-radius: 50px;
		border-radius: 50px;
		background: orange;
		padding: 10px 20px;
		position: relative;
		display : inline-block;
		align-items : right;
	}

    #chat-attachment {
        height : 50px;
    }

    #chat-input {
        height : 100px;
    }

    #chat-text {
        width : 670px;
        height : 80px;
        margin-top : 7px;
        resize : none;
    }

    #chat-send {
        float : right;
        height : 80px;
        width : 60px;
        border : 0px;
        background-color : orange;
        color : white;
        border-radius : 5px;
        margin-top : 7px;
    }

    #bottom {
        height : 200px;
        width : 100vw;
        display : block;
        float : bottom;
    }

	#chat-text-list {
		list-style-type : none;
	}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<script>
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
		
		$(function() {
			
			signalFromChat;
			
			interval = setInterval(signalFromChat, 2000);
		});
		
		function signalFromChat() {
			$.ajax({
        		url : "signalFromChat.me",
        		data : {
        			userNo : "${loginUser.userNo}"
        		},
        		success : function(result){
        		},
        		error : function(){
        			console.log("header ajax problem");
        		}
        	});

		}
	</script>
	
	<div class="chat-outer">
		<div class="chat-back">
			<div class="back-icon">
				<img id="back-icon" src="resources/images/left-arrow.png">
			</div>
		</div>
		<div class="chat-profile" align="center">
            
            <c:choose>
            	<c:when test="${ users.m1.userNo == loginUser.userNo }">
            		<c:set var='profile' value='${ users.m2 }' />
            	</c:when>
            	<c:otherwise>
            		<c:set var='profile' value='${ users.m1 }' />
            	</c:otherwise>
            </c:choose>
            
            <div id="profile-pic">
                <img src="${ profile.pic }">
            </div>
			<div id="profile-nickname">
				<span>${ profile.nickname }</span>
			</div>
			<div id="profile-mbti">
				<span>${ profile.mbti }</span>
			</div>
			<div id="profile-introduction">
				<span>${ profile.profile }</span>
			</div>
            
			<hr id="profile-midline">
			<div id="profile-review">
				<button type="button" id="chat-review">상대 후기 남기기</button>
			</div>
			<div id="profile-btns">
				<button type="button" id="profile-block">차단</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="profile-report">신고</button>
			</div>
		</div>
		<div class="chat-window">
            <div id="chat-area">
                <ul id="chat-text-list">
                    
                </ul>
            </div>
            <div id="chat-attachment"></div>
            <div id="chat-input">
                <textarea id="chat-text" name="chatContent" placeholder="내용을 입력해주세요."></textarea>
                <button type="button" id="chat-send">전송</button>
            </div>
        </div>    
        <div id="bottom" border="1"></div>    

	</div>
    

	<!-- The Modal -->
	<div class="modal fade" id="review-Modal">
		<div class="modal-dialog" style="width:840px;">
            <div class="review-profile"></div>
		</div>
	</div>

	<script>
        $(document).ready(function(){
            $("#chat-review").click(function(){
                $("#review-Modal").modal();
            });
        });

	</script>

	<script>
		
		$(function() {
			
			$("#chat-send").click(function() {
				client.send('/fromServer/' + roomNo, {},
						JSON.stringify({
							roomNo : roomNo,
							chatContent : $("#chat-text").val(),
							writer : ${ loginUser.userNo }
						})
					);
				$("#chat-text").val("");
	
			});
			
			var sock = new SockJS("http://localhost:8006/catchmind/chat");
			var client = Stomp.over(sock);
			var roomNo = ${roomNo};
			client.connect({}, function() {
	
				client.subscribe('/subscribe/' + roomNo, function(chat) {
					
					var content = JSON.parse(chat.body);
					var chatResult = $("#chat-text-list").html();
					
					if(content.writer == "${loginUser.userNo}"){
						chatResult += "<li class='writer-side'>"
							+ "<div class='chat-body'>"
                			+ 		"<div class='chat-message'>"
                			+			"<h5>" + "${loginUser.nickname}" + "</h5>"
                			+			"<p>" + content.chatContent + "</p>"
                			+		"</div>"
            				+	"</div>"
            				+ "</li>";
					}
					else {
						chatResult += "<li>"
							+ "<div class='received-side'>"
                			+ 		"<div class='chat-message'>"
                			+			"<h5>" + "${profile.nickname}" + "</h5>"
                			+			"<p>" + content.chatContent + "</p>"
                			+		"</div>"
            				+	"</div>"
            				+ "</li>";
					}
					
					$("#chat-text-list").html(chatResult);
	
				});
				
				client.send('/fromServer/' + roomNo, {},
					JSON.stringify({
						chatContent : "님이 입장하셨습니다.",
						writer : ${loginUser.userNo}
					})
				);
	
			});
	
		});
		
		
	</script>


	<jsp:include page="../common/footer.jsp" />
</body>
</html>