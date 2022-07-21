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
	#chat-input {
		height: 100px;
	}

	#chat-text {
		margin-top: 7px;
		margin-left : 10px;
		resize: none;
		width: 510px; height: 80px; background-color: white; border: 1px solid gray; border-radius: 7px; float: left;
		-ms-overflow-style: none;
	}
	#chat-send {
		float: left;
		height: 80px;
		width: 65px;
		border: 0px;
		background-color: orange;
		color: white;
		border-radius: 5px;
		margin-top: 7px;
		margin-left : 5px;
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
	/* 모달 스타일*/
	.modal-dialog{
		background-color: rgb(207, 206, 206);
		border-radius: 50px;
		border: none;
	}
	.modal-content{
		background-color: white;
		border-radius: 50px;
		margin: auto;
		top: 40px;
		width: 600px !important;
		height: 330px;
		padding-left : 25px;
	}
	.modal-content *{
		border: none;
	}
	.btn-review{
		font-family: 'Noto Sans KR', sans-serif;
		width: 230px;
		height: 40px;
		background-color: orange;
		border-radius: 20px;
		margin: 0 15px 20px 15px;
		color: white;
		font-weight: 600;
		box-shadow: 1px 3px 4px rgba(0,0,0,0.3);
		display: block;
		float: left;
		padding-top: 5px;
	}

	.modal-body, .modal-footer{
		padding: 0px 16px;
	}
	.btn-sendReview{
	background-color: white;
	border-radius : 5px;
	}
	input[type="radio"]:checked + label, .btn-review:hover{
		background-color: rgb(255, 123, 0) !important;
		cursor: pointer !important;
	}

	input[type="radio"] {
		display : none;
	}

	.reviewModal, .modal-dialog{
		top: 120px;
		text-align: center;
		max-width: 700px !important;
		width: 640px !important;
		height: 430px;
	}
	.modal-footer{
		height: 80px;
		cursor: pointer;
		padding-top : 0px;
	}
	.review-profile {
		position:absolute;
		left: 100px;
		width: 160px;
		height: 160px;
		border-radius: 70%;
		background-color: green;
		margin-top: -80px;
		margin-left: -80px;
		object-fit : cover;
	}
	
	.close {
		padding-top : 0px;
	}
	
	#id01 {
		position : absolute;
		z-index : 500;
		left : 40vw;
		top : 25vh;
	}
	
     .w3-modal-content{
      top: 200px;
      width: 400px;
      height: 260px;
      background-color : lightgrey;
      border-radius : 5px;
     }
      .w3-orange{
        width: 100%;
        height: 40px;
        background-color : orange;
        border-radius : 5px;
      }
      .w3-container>span{
      	margin-right : 10px;
      	margin-top : 5px;
      }
      .w3-container>span:hover{
      background-color: transparent !important;
      cursor : pointer;
      } /* 모달창 내에 취소박스 배경색 적용 */
      .w3-container>textarea{
      margin:15px 10px;
      width:90%;
      height:140px;
      resize:none;
      outline:none;
      margin-left : 17px;
      border-radius : 5px;
      padding : 10px;
      } /* 모달창 내에 사유 입력 스타일 */
      .w3-container>button{
      border:none;
      margin-bottom: 10px;
      background-color:orange;
      } /* 모달창 내에 제출 스타일 */
      #reply_Area .report-box{
      font-size: 7px;
      } /* 댓글의 신고하기 크기설정 */
      
      #reportBtn {
      	margin-left : 160px;
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
        <div style="width: 400px; height: 650px; border-radius : 5px; background: linear-gradient(to bottom, rgb(253, 167, 86), white); float: left;" align="center">
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
            <button type="button" class="btn btn-sm" id="chat-review" style="width: 220px; background-color: rgb(91, 124, 208); color: white; margin-bottom: 10px; display: block;">상대 후기 남기기</button>
            <button type="button" class="btn btn-sm" id="profile-block" style="width: 100px; background-color: lightgrey; color: white; margin-right: 15px;">차단</button>
            <button type="button" class="btn btn-sm" id="profile-report" style="width: 100px; background-color: lightgrey; color: white;">신고</button>
            
            <script>
				$("#profile-block").click(function() {
					location.href = "block.ch?userNo=${profile.userNo}";
				});
				$("#profile-report").click(function() {
					$("#id01").css("display", "block");
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
	<div class="modal fade" id="myModal" data-backdrop="static">
		
		<div class="modal-dialog modal-lg reviewModal">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div class="modal-header">
						
					<c:choose>
						<c:when test="${ profile.pic eq null }">
							<img class="review-profile" src="resources/images/pic.png">
						</c:when>
						<c:otherwise>            
							<img class="review-profile" src="${ profile.pic }">
						</c:otherwise>
					</c:choose>
					<h5 style="text-align: left; padding-left: 150px;"><br><br><b>
						<span style="font-size: 30px;">${ profile.nickname }</span>님과의 대화는 어떠셨나요?</b></h5><br>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
					<!-- Modal body -->
					<div class="modal-body">
						
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
						
					</div>
						
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="button" class="btn-sendReview" style="margin: auto;" onclick="imageReview()" value="S E N D ✏">
					</div>

				
			</div>
		</div>

	</div>
	
	<!-- The Modal -->
	<div id="id01" class="w3-modal" style='display:none;'>
	    <div class="w3-modal-content w3-animate-zoom">
	        <header class="w3-container w3-orange">
	            <span onclick="document.getElementById('id01').style.display='none'"
	            class="w3-button w3-display-topright" style='float:right;'>&times;</span>
	            <h5 style="font-family: 'IBM Plex Sans KR', sans-serif;
                          padding:10px;">🚨 REPORT </h5>
	        </header>
	    <div class="w3-container">
            <textarea id="reportedFor" name="reportedFor" 
            style="font-family: 'IBM Plex Sans KR', sans-serif;" placeholder="신고사유를 작성해주세요" required></textarea>
            <br>
            <button id="reportBtn" onclick="chatReport();" style="border-radius: 5px; font-family: 'IBM Plex Sans KR', sans-serif;">신고접수</button>
	    </div>
	  </div>
	  </div>


	<script>
		$(document).ready(function(){
		    $("#chat-review").click(function(){
				$("#myModal").modal();
		    });		
		});
		
		function imageReview() {
			$.ajax({
				url : "imageReview.me",
				type : "POST",
				data : {
					reviewNo : ${ profile.userNo },
					reviewType : $("input[name='reviewType']:checked").val()
				},
				success : function(result) {
					if(result) {
						alert("채팅 상대에 대한 후기를 남겼어요!");
						$("#myModal").modal('hide');
					}
				},
				error : function() {
					console.log("review ajax problem");
				}
			});
		}
		
		function chatReport() {
      		$.ajax({
      			url : "report.ch",
      			data : {
      				reportedFor : $("#reportedFor").val(),
      				userNo : ${ profile.userNo },
              		reportedFrom : ${ loginUser.userNo }
            	},              
      			success : function(result) {
      				if(result == 1) {
      					alert("신고가 접수되었습니다.!");
      					$("#id01").css("display", "none");
      				}
      			},
      			error : function() {
      				console.log("chat report ajax problem");
      			}
      		});
  		}

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
							$("#myModal").modal();
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
			
			var sock = new SockJS("http://192.168.40.23:8006/catchmind/chat");
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