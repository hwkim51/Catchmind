<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CATCHMIND | 캐치마인드 </title>

 <!--AOS-->
 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
    /* 폰트 */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Myeongjo&display=swap');
    .qArea {
        margin-top: 60px;
    }

    .qNum {
        font-weight: bold;
        font-size: 2.3vw;
        color: darkblue;
        width: 30vw;
    }

    .qText {
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 1.8vw;
        font-weight: bold;
        line-height: 1.5;
        height: 6.6vw;
        margin-top: 10px;
        width: 30vw;
        color: black;
    }

    .options {
        margin-top: 1.3vw;
        height: 18vw;
    }

    .option {
        font-family: 'IBM Plex Sans KR', sans-serif;
        width: 30vw;
        height: 6.6vw;
        margin-bottom: 12px;
        padding: 0 30px;
        font-size: 1.3vw;
        color: rgba(0, 0, 0, 0.8);
        text-align: left;
        line-height: 6.6vw;
        background-color: rgb(227, 234, 245);
        border-radius: 15px;
        cursor: pointer;
        box-shadow: 1px 3px 4px rgba(0,0,0,0.3);
    }

    .option:hover {
        background-color: darkblue !important;
        color: white !important;
    }

    .progressNum {
        width: 29vw;
        margin: auto;
        margin-bottom: 6px;
        font-size: 1vw;
        color: rgb(157, 157, 157);
    }

    .testProgressBar {
        width: 30vw;
        height: 0.4vw;
        border-radius: 7px;
        margin: auto;
        background-color: rgb(198, 216, 240);
    }

    .testProgress {
        width: 2.5vw;
        height: 0.4vw;
        border-radius: 7px;
        background-color: steelblue;
    }
    .optionA{
        transition-delay: 0.9s;
    }
    .optionB{
        transition-delay: 1.8s;
    }
    .testBackImg1{
        position: relative;
        top: -158px;
        left: 150px;
    }
    .testBackImg2{
        position: absolute;
        top: -16px;
        left: 670px;
    }
    .testBackImg3{
        position: absolute;
        top: 14px;
        left: 810px;
    }
    .testBackImg4{
        position: absolute;
        top:-46px;
        left: 770px;
    }
    .testBackImg5{
        position: absolute;
        top: 140px;
        left: 980px;
    }
    .testBackImg6 {
    	position: absolute;
	    left: 770px;
	    top: -66px;
	    height: 250px;
    }
    .homelogo{
        width: 100vw;
        text-align: center;
        position: absolute;
        font-size: 35px;
        font-weight: 700;
        top: 20px;
        color:orange;
        z-index: 5;
    }
    .homelogo:hover{
        background: linear-gradient( rgb(236, 3, 194) 1%, orange);
        -webkit-text-fill-color : transparent;
        -webkit-background-clip: text; 
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <a href="/catchmind/">
        <div class="homelogo">CATCHMIND</div>
    </a>
   
    <div id="question" class="carousel slide" data-ride="carousel" data-interval="0">
        <div class="carousel-inner">
            <br><br><br>
            <div class="carousel-item active qArea" align="center">
                <div class="qNum" align="left">Q1</div>
                <div class="qText" align="left" data-aos="fade-left" data-aos-duration="800">
                    <div>데이트가 없는</div>
                    <div>주말에 나는</div>
                    <img src='./resources/images/mbti1.png' class='testBackImg1' width="320px;" height="200px;">
                </div>
                <div class="options" align="center">
                    <div class="option optionA" href="#question" data-slide="next" value="E"
                        data-aos="fade-left" data-aos-duration="600">
                    	모여! 친구들과 약속을 잡는다
                    </div>
                    <div class="option optionB" href="#question" data-slide="next" value="I"
                        data-aos="fade-left" data-aos-duration="600">
                    	집이 최고야! 이불 밖은 위험해
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q2</div>
                <div class="qText" align="left">
                    <div>데이트 룩을</div>
                    <div>고를 때 나는</div>
                </div>
                <img src='./resources/images/mbti2.png' class='testBackImg2' width="360px;" height="200px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="J">
                    	날씨부터 착장까지 완벽하게 계산한다
                    </div>
                    <div class="option" href="#question" data-slide="next" value="P">
                    	나가기 직전 기분따라 정한다
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q3</div>
                <div class="qText" align="left">
                    <div>어색한 첫만남</div>
                    <div>침묵의 순간 나는</div>
                </div>
                <img src='./resources/images/mbti3.png' class='testBackImg3' width="130px;" height="170px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="E">
                        "말씀 많이 들었어요" 분위기를 띄운다
                    </div>
                    <div class="option" href="#question" data-slide="next" value="I">
                    	조용한 눈인사를 건넨다
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q4</div>
                <div class="qText" align="left">
                    <div>연인이 집에</div>
                    <div>놀러온다고 했을 때 나는</div>
                </div>
                <img src='./resources/images/mbti4.png' class='testBackImg4' style="top: 70px !important; left: 920px;" width="300px;" height="350px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="P">
                        OK 콜! 얼른 와~
                    </div>
                    <div class="option" href="#question" data-slide="next" value="J">
                    	도착시간을 물어보고 집을 치운다
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q5</div>
                <div class="qText" align="left">
                    <div>인생영화를 궁금해하는</div>
                    <div>연인에게 나는</div>
                </div>
                <img src='./resources/images/mbti5.png' class='testBackImg5' width="350px;" height="330px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="S">
                    	연애의 온도! 완전 현실 커플 이야기
                    </div>
                    <div class="option" href="#question" data-slide="next" value="N">
                    	인터스텔라! 우주란 흥미로워
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q6</div>
                <div class="qText" align="left">
                    <div>연인과 사소한 일로</div>
                    <div>다퉜을 때 나는</div>
                </div>
                <img src='./resources/images/mbti6.png' class='testBackImg2' style="left: 750px;" width="230px;" height="200px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="T">
                        "왜 화가 났나면..." 이유를 설명한다
                    </div>
                    <div class="option" href="#question" data-slide="next" value="F">
                        "니가 어떻게 나한테.." 감정이 우선이다
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q7</div>
                <div class="qText" align="left">
                    <div>데이트 중 길에서</div>
                    <div>연인의 친구를 만난다면 나는</div>
                </div>
                <img src='./resources/images/mbti7.png' class='testBackImg2' style="left: 800px;" width="230px;" height="200px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="E">
                    	우리는 모두 친구! 친구가 된다
                    </div>
                    <div class="option" href="#question" data-slide="next" value="I">
                        "안녕하세요 안녕히 가세요..^^;"
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q8</div>
                <div class="qText" align="left">
                    <div>상사한테 지적 당해</div>
                    <div>우울한 애인에게 나는</div>
                </div>
                <img src='./resources/images/mbti8.png' class='testBackImg2' style="left: 750px; top: -26px" width="330px;" height="210px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="T">
                        "다음에는 이런 식으로 해보면 어떨까?"
                    </div>
                    <div class="option" href="#question" data-slide="next" value="F">
                        "그 사람 이상한 사람이네!!"
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q9</div>
                <div class="qText" align="left">
                    <div>연인에게 줄</div>
                    <div>선물을 고르게 된 나는</div>
                </div>
                <img src='./resources/images/mbti9.png' class='testBackImg5' width="390px;" height="330px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="S">
                    	평소 애인이 필요했던 실용적인 선물
                    </div>
                    <div class="option" href="#question" data-slide="next" value="N">
                    	예쁘고 잊지 못할 감동적인 선물
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q10</div>
                <div class="qText" align="left">
                    <div>연인에게 노래를</div>
                    <div>추천해줄 때 나는</div>
                </div>
                <img src='./resources/images/mbti10.png' class='testBackImg5' style="top:-20px;" width="430px;" height="450px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="S">
                        "가사보다 멜로디" 멜로디가 좋은 노래
                    </div>
                    <div class="option" href="#question" data-slide="next" value="N">
                        "널 향한 내 마음" 편지같은 가사의 노래
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q11</div>
                <div class="qText" align="left">
                    <div>애인과 여행을</div>
                    <div>떠나게 된 나는</div>
                </div>
                <img src='./resources/images/mbti11.png' class="testBackImg6">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="P">
                    	숙소 예약! 계획 끝! 여행 시작
                    </div>
                    <div class="option" href="#question" data-slide="next" value="J">
                    	교통, 맛집, 명소, 숙박 꼼꼼하게 계획한다
                    </div>
                </div>
            </div>

            <div class="carousel-item qArea" align="center">
                <div class="qNum" align="left">Q12</div>
                <div class="qText" align="left">
                    <div>애인과의 약속에</div>
                    <div>지각했을 때 나는</div>
                </div>
                <img src='./resources/images/mbti12.png' class='testBackImg2' style="left: 720px;" width="320px;" height="200px;">
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="pause" value="T">
                    	구구절절 늦은 이유를 설명한다
                    </div>
                    <div class="option" href="#question" data-slide="pause" value="F">
                        "미안미안해진짜미안" 무릎부터 꿇는다
                    </div>
                </div>
            </div>

            <form name="mbtiResult" action="mbtiResult.te" method="post">
                <input type="hidden" id="mbtiResult" name="mbtiResult">
            </form>
        </div>

        <div>
            <div class="progressNum" align="right">1 / 12</div>
            <div class="testProgressBar">
                <div class="testProgress"></div>
            </div>
        </div>
        
    </div>
    
    <jsp:include page="../common/footer.jsp"/>

    <script>
        var chatPage = 0;
        var interval;
        
        $(function() {
        	if(chatPage == 0){
	        	if("${loginUser.userNo}" != "") {        		
	        		interval = setInterval(loginSignal, 2000);
	        	}
	        	else {				
					console.log("비로그인");
	        	}
        	}
        });
                
    
        function loginSignal() {
        	
        	$.ajax({
        		url : "loginSignal.me",
        		data : {
        			userNo : "${loginUser.userNo}"
        		},
        		success : function(result){
        			if(result != "") {
        				
        				clearInterval(interval);
        				console.log(result.chatClaimFrom.userNo); 
        				console.log(result.roomNoWith); 
        				var answer = confirm(result.chatClaimFrom.nickname + "님으로부터 채팅 요청이 들어왔습니다.\n" + "채팅 요청에 응하시겠습니까?");
        				
        					
        				if(answer == true) {
        					$.ajax({
        						url : "chatAgreed.ch",
        						type : "POST",
        						data : {
        							userNo : "${loginUser.userNo}",
        							userNo2 : result.chatClaimFrom.userNo
        						},
        						success : function(data){
        							location.replace("/catchmind/chat.do?roomNo=" + result.roomNoWith);
        						},
        						error : function() {
        							console.log("header ajax2 problem");
        						}
        					});
        				}
        				else {
        					$.ajax({
        						url : "cancelRequest.ch",
        						data : {
        							userNo : "${loginUser.userNo}"
        						},
        						success : function(result){
        							interval = setInterval(loginSignal, 2000);
        						},
        						error : function() {
        							console.log("header ajax2 problem");
        						}
        					});
        				}
        			}
        			console.log("다시 인터벌 시작");
        		},
        		error : function(){
        			console.log("header ajax problem");
        		}
        	});

        }

         AOS.init();

        $(function () {

            var E = 0;
            var I = 0;
            var S = 0;
            var N = 0;
            var T = 0;
            var F = 0;
            var P = 0;
            var J = 0;
            var mbti = "";

            var num = 1;
            var progress = 2.5;
            var testProgress = "";

            $(".option").click(function () {

                if ($(this).attr("value") == "E") {
                    E += 1;
                } else if ($(this).attr("value") == "I") {
                    I += 1;
                } else if ($(this).attr("value") == "S") {
                    S += 1;
                } else if ($(this).attr("value") == "N") {
                    N += 1;
                } else if ($(this).attr("value") == "T") {
                    T += 1;
                } else if ($(this).attr("value") == "F") {
                    F += 1;
                } else if ($(this).attr("value") == "P") {
                    P += 1;
                } else {
                    J += 1;
                }

                if(num < 12) {
                    num += 1;
                    progress += 2.5
                    testProgress += "<div style='width: " + progress + "vw; height: 0.4vw; border-radius: 7px; background-color: steelblue'>"

                    $(".progressNum").text(num + " / 12");
                    $(".testProgress").html(testProgress);
                }
                
                if (E + I + S + N + T + F + P + J == 12) {
                    if (E > I) {
                        mbti += "E";
                    } else {
                        mbti += "I";
                    }

                    if (S > N) {
                        mbti += "S";
                    } else {
                        mbti += "N";
                    }

                    if (T > F) {
                        mbti += "T";
                    } else {
                        mbti += "F";
                    }

                    if (P > J) {
                        mbti += "P";
                    } else {
                        mbti += "J";
                    }
                    
                    $("#mbtiResult").val(mbti);

                    document.mbtiResult.submit();
                }
            });
        });
    </script>
</body>
</html>