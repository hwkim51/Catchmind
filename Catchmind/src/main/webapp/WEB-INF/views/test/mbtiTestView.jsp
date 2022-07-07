<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catch Mind</title>
<style>
	.qArea {
		margin-top: 50px;
	}
	.qNum {
        font-weight: bold;
        font-size: 35px;
        color: darkblue;
        width: 450px;
    }
    .qText {
        font-size: 28px;
        font-weight: bold;
        line-height: 1.5;
        height: 100px;
        margin-top: 10px;
        width: 450px;
        color: black;
    }

    .options {
        margin-top: 20px;
        height: 240px;
    }
    .option {
        width: 450px;
        height: 100px;
        margin-bottom: 12px;
        padding: 0 30px;
        font-size: 20px;
        color: rgba(0, 0, 0, 0.8);
        text-align: left;
        line-height: 100px;
        background-color: rgb(227, 234, 245);
        border-radius: 15px;
        cursor: pointer; 
    }
    .option:hover {
        background-color: darkblue !important;
        color: white !important;
    }
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div id="question" class="carousel slide" data-ride="carousel" data-interval="0">
    	
    	<div class="carousel-inner">
            
            <div class="carousel-item active qArea" align="center">
                <div class="qNum" align="left">Q1</div>
                <div class="qText" align="left">
                    <div>데이트가 없는</div>
                    <div>주말에 나는</div>
                </div>
                <div class="options" align="center">
                    <div class="option" href="#question" data-slide="next" value="E">
                    	모여! 친구들과 약속을 잡는다
                    </div>
                    <div class="option" href="#question" data-slide="next" value="I">
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
                <div class="options" align="center">
                	<input type="hidden" id="test-end" value="end">
                    <div class="option" href="#question" data-slide="pause" value="T">
                    	구구절절 늦은 이유를 설명한다
                    </div>
                    <div class="option" href="#question" data-slide="pause" value="F">
                    	"미안미안해진짜미안" 무릎부터 꿇는다
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	$(function() {
    		
    		var E = 0;
			var I = 0;
			var S = 0;
			var N = 0;
			var T = 0;
			var F = 0;
			var P = 0;
			var J = 0;
			var mbti = "";
			
    		$(".option").click(function() {
    			
    			if($(this).attr("value") == "E") {
    				E += 1;
    			} else if($(this).attr("value") == "I") {
    				I += 1;
    			} else if($(this).attr("value") == "S") {
    				S += 1;
    			} else if($(this).attr("value") == "N") {
    				N += 1;
    			} else if($(this).attr("value") == "T") {
    				T += 1;
    			} else if($(this).attr("value") == "F") {
    				F += 1;
    			} else if($(this).attr("value") == "P") {
    				P += 1;
    			} else {
    				J += 1;
    			}
    			
    			console.log(E);
    			console.log(I);
    			console.log(S);
    			console.log(N);
    			console.log(T);
    			console.log(F);
    			console.log(P);
    			console.log(J);
    			
    			if(E + I + S + N + T + F + P + J == 12) {
    				if(E > I) {
            			mbti += "E";
            		} else {
            			mbti += "I";
            		}
            		
            		if(S > N) {
            			mbti += "S";
            		} else {
            			mbti += "N";
            		}
            		
            		if(T > F) {
            			mbti += "T";
            		} else {
            			mbti += "F";
            		}
            		
            		if(P > J) {
            			mbti += "P";
            		} else {
            			mbti += "J";
            		}
            		
            		console.log(mbti);
    			}
    			
    			if(mbti == "ESTP") {
    				
    			} else if(mbti == "ESTJ") {
    				
    			} else if(mbti == "ESFP") {
    				
    			} else if(mbti == "ESFJ") {
    				
    			} else if(mbti == "ENFP") {
    				
    			} else if(mbti == "ENFJ") {
    				
    			} else if(mbti == "ENFP") {
    				
    			} else if(mbti == "ENFJ") {
    				
    			} else if(mbti == "ENTP") {
    				
    			} else if(mbti == "ENTJ") {
    				
    			} else if(mbti == "ISTJ") {
    				
    			} else if(mbti == "ISTP") {
    				
    			} else if(mbti == "ISFJ") {
    				
    			} else if(mbti == "ISFP") {
    				
    			} else if(mbti == "INFJ") {
    				
    			} else if(mbti == "INFP") {
    				
    			} else if(mbti == "INTJ") {
    				
    			} else if(mbti == "INTP") {
    				
    			}
    		});
    	});
    </script>
</body>
</html>