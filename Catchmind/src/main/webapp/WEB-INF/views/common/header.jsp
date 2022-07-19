<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <!-- Alertify 라이브러리 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
     <!--AOS-->
     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
     <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
     
    <style>
        /* 폰트 */
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Myeongjo&display=swap');
        /* 전체 */
        *{
            margin: 0;
            box-sizing: border-box;
        }
        /* header : icon */
        label[for="menuicon"], #membericon, #loginchk+label{
            width:80px;
            height:80px;
            padding: 15px;
            z-index: 2;
            cursor: pointer;
            overflow: hidden;
            position: relative;
        }
        .line{
            background-color: black;
            width: 50px;
            height: 5px;
            margin: 10px 0px;
            transition-duration:0.5;
        }
        #membericon{
            top:20px;
            float: right;
            background:url('./resources/images/people.png') 0px 0 / 40px no-repeat;
        }
        #loginchk+label{
            position: relative;
            top: -60px;
            float: right;
            right: 90px;
        }
    
        /* header : sidebar*/
        .sidebar{
            width: 100%;
            height: 100vh;
            background-color: black;
            opacity: 93%;
            position: fixed;
            top:0;
            left:-200vw;
            z-index: 1;
            transition:all 0.9s;
        }
        .sidebar label{
            height: 30vh;
            text-align: center;
            margin : auto; 
            position : absolute;
            top : 0px;
            bottom : 0px;
            left : 0px;
            right : 0px;
        }
        .sidebar a{
            font-size: 35px;
            font-weight: 900;
            color:white;
            display: block;
            height: 100%;
            text-decoration: none;
        }
        .sidebar li{
            list-style-type: none;
            line-height: 40px;
        }
        .sidebar li>a:hover{
            color:rgb(229, 119, 32);
        }
        .sidebar li>a{
            font-size: 20px;
        }
        .accodion+div{
            display: none;
        }
        .accodion{
            color:white;
            line-height: 38px;
        }
        .active+div{
            display: block;
            padding-left: 40px;
        }
        .accodion>a>span:hover {
            background : linear-gradient(to top, orange 50%, transparent 50%);
            display : inline-block;
        }
        
        .active a{
            display: inline-block;
            background : linear-gradient(to top, orange 50%, transparent 50%)
        }

    
        #menuicon:checked + label ~ .sidebar{
            left:0;
        }
        #menuicon:checked + label #top{
            width: 30px;
            transform:translateY(15px) rotate(45deg);
            transform-origin:center;
            position: fixed;
        }
        #menuicon:checked + label #mid{
            opacity: 0;
        }
        #menuicon:checked + label #btm{
            width: 30px;
            transform: translateY(-10px) rotate(-45deg);
            transform-origin:center;
            position: fixed;
        }
        #menuicon:checked + label .line {
            background-color:white;
            
        }
        #menuicon:checked + label ~ #membericon {
            background:url('./resources/images/people.png') 0px -83px / 40px no-repeat;
            position: fixed;
        }
        .homelogo{
            width: 100vw;
            text-align: center;
            position: absolute;
            font-size: 35px;
            font-weight: 700;
            top: 20px;
            color:orange;
        }
        .homelogo:hover{
            background: linear-gradient( rgb(236, 3, 194) 1%, orange);
            -webkit-text-fill-color : transparent;
            -webkit-background-clip: text; 
        }
        #loginchk{
            position:absolute; 
            left: -1000%;
        }
        #loginchk+label{
            display:inline-block;
            width:60px;
            height:25px;
            background:#d3d3d3;
            border-radius:60px;
            position:relative;
            transition: background .4s;
        }
        #loginchk+label:after{
            content:""; 
            position:absolute; 
            left:4px;
            top:50%;
            width:17px;
            height:17px;
            border-radius:100%;
            background:#fff;
            box-shadow: 1px 1px 2px rgba(0,0,0, 0.3);
            transform:translateY(-50%);
            transition: all .4s;
        }
        #loginchk+label span{
            display:none;
        }
        #loginchk:checked+label{
            background-color: #2dac5e;
        }
        #loginchk:checked+label:after{
            left: 65%;
        }
        .sessionTitle{
            font-family: 'IBM Plex Sans KR', sans-serif;
            margin-left: 50px;
            width: 300px;
        }
       
        </style>
</head>

<body style="overflow-x: hidden;">
	<!-- 1회성 알람 문구 기능 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("알람", "${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
    <!-- header : 메뉴아이콘 -->
    <input type="checkbox" id="menuicon" hidden>
    <label for="menuicon">
        <div class="line" id="top"></div>
        <div class="line" id="mid"></div>
        <div class="line" id="btm"></div>
    </label>

    <a href="/catchmind/">
        <div class="homelogo">CATCHMIND</div>
    </a>
    


    <!-- header : 회원아이콘 -->
    <div id="membericon" style="right:0px;" onclick="myPage()">
        <br clear="both">
    </div>
    <br clear="both">

    
    <!-- header : 로그인/로그아웃 토글-->
    <c:choose>
        <c:when test="${not empty loginUser}">
            <input type="checkbox" id="loginchk" checked><label for="loginchk"><span>로그인상태</span></label>
        </c:when>
        <c:otherwise>
            <input type="checkbox" id="loginchk"><label for="loginchk"><span>로그아웃상태</span></label>
        </c:otherwise>
    </c:choose>


    <!-- header : click 시 sidebar -->
    <div class="sidebar">
        <label>
            <ul class="accodion"><a href="mbtiTest.te"><span>MBTI 테스트</span></a></ul><br>
            <ul class="accodion"><a href="matchList.ch"><span>❣ CATCH ❣</span></a></ul><br>
            <ul class="accodion"><a><span>커뮤니티</span></a></ul>
                <div>
                    <li><a href="list.to"> 함께 놀러가요 💑</a></li>
                    <li><a href="list.po">에브리타임</a></li>
                    <li><a href="list.ca">연애의 발견</a></li>
                </div>
            <br>
            <ul class="accodion"><a><span>고객센터</span></a></ul>
                <div>
                    <li><a href="list.no">공지사항</a></li>
                    <li><a href="catchTalk.faq">FAQ</a></li>
                  <c:if test="${not empty loginUser }">
               		<li><a href="enrollForm.in">1:1문의</a></li>
               	  </c:if>
                </div>
         
        </label>
    </div>
	
    <script>

        // accodion 클릭 시 active 클래스 속성명 추가해주기(효과용)
        var accodion = document.querySelectorAll('.accodion');
        
		var chatPage = 0;
        
        for(var i = 0; i< accodion.length; i++){
            accodion[i].addEventListener('click', function(){
               
                for(var j = 0; j<accodion.length; j++){
                    accodion[j].classList.remove('active');
                }

                this.classList.add('active');
            });
        }
        
        // membericon 클릭 시 마이페이지로 
        var membericon = document.querySelector("#membericon");
        
        function myPage(){
            if("${loginUser}" != ""){
            	/* myPage 이동 시 회원의 userId, userPwd 데이터 전달 */
            	var form = document.createElement('form');
            	
            	var userId;
            	userId = document.createElement('input');
            	userId.setAttribute('type', 'hidden');
            	userId.setAttribute('name', 'userId');
            	userId.setAttribute('value', '${ loginUser.userId }');
                
            	var userPwd;
            	userPwd = document.createElement('input');
            	userPwd.setAttribute('type', 'hidden');
            	userPwd.setAttribute('name', 'userPwd');
            	userPwd.setAttribute('value', '${ loginUser.userPwd }');
            	
            	form.appendChild(userId);
            	form.appendChild(userPwd);
            	form.setAttribute('method', 'post');
            	form.setAttribute('action', 'myPage.me');
            	document.body.appendChild(form);
            	form.submit();
            }
            else{
                location.href="loginPage.me";
            }
        }
        

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

        $(function(){
            
            $("#loginchk").click(function(){
                if("${loginUser}" == ""){ // 로그아웃상태일 때
                    var loginAnswer = confirm("로그인 하시겠습니까?"); 
                   
                    if(loginAnswer == true){
                        //로그인페이지로 넘겨주기
                        location.href="loginPage.me";
                    }
                    else{
                        $(this).prop("checked",false); 
                    }
                    
                }
                else{ // 로그인 상태일 때(초록색)
                   var logoutAnswer = confirm("로그아웃 하시겠습니까?");

                    if(logoutAnswer == true){
                        location.href="logout.me";
                    }
                    else {
                        $(this).prop("checked",true); 
                    }
                }

            });
        
        })
        
        /*
		//beforeunload 이벤트 관련 코드
		// var validNavigation = true;
        
        
        // function wireUpEvents(){	
        
	    //     $(document).keydown(function(e) {
	    //         var key = (e) ? e.keyCode : event.keyCode;
	    //         //alert(key)
	    //         if(e.ctrlKey){
	    //             //이걸로 컨트롤키 뽑을 수 있음
	    //         }
	    //         if(e.altKey){
	    //             //이걸로 알트키 뽑을 수 있음
	    //         }
	    //         if(e.ctrlKey && e.keyCode == 82){
	    //         	 validNavigation = false;
	    //             console.log("컨트롤 + R");
	    //         }
	    //         if(e.keyCode == 116){
	    //         	 validNavigation = false;
	    //             console.log("F5");
	    //         }
	    //         if(e.keyCode == 115){
	    //         	 validNavigation = false;
	    //             console.log("F4");
	    //         }
	    //     });   
            
	    //     $(document).on('mousedown', function() {
	    //     	if ((event.button == 2) || (event.which == 3)) {
		//              console.log("마우스 우클릭");
		//              validNavigation = false;
	    //     	}
	    //  	});
	   		
	    //     // Attach the event click for all links in the page
	    //     $("a").bind("click", function() {
	    //     	 validNavigation = false;
	    //        console.log("a클릭");
	    //     });
	        
	    //     $("tr").bind("click", function() {
	    //     	 validNavigation = false;
	    //        console.log("tr클릭");
	    //     });
	        
	    //     $("li").bind("click", function() {
	    //          validNavigation = false;
	    //         console.log("li클릭");
	    //     });
	
	    //     $("ul").bind("click", function() {
	    //         validNavigation = false;
	    //        console.log("ul클릭");
	    //     });
	        
	    //     $("#noticeImg").bind("click", function() {
	    //         validNavigation = false;
	    //        console.log("img클릭");
	    //     });
	        
	    //     $("div").bind("click", function() {
	    //         validNavigation = false; 
	    //        console.log("div클릭");
	    //     });
	        
	    //      // Prevent logout when clicking in a button (if these buttons redirect to some page)
		//     $("button").bind("click", function() {
	    //         validNavigation = false; 
	    //        console.log("div클릭");
	    //     });
	        
	    //     // Attach the event submit for all forms in the page
	    //     $("form").bind("submit", function() {
	    //         validNavigation = false; 
	    //        console.log("서브밋");
	    //     });
	
	    //     // Attach the event click for all inputs in the page
	    //     $("input[type=submit]").bind("click", function() {
	    //         validNavigation = false; 
	    //        console.log("서브밋인풋");
	    //     });
	        
	    //     $("input[type=button]").bind("click", function() {
	    //         validNavigation = false; 
	    //        console.log("인풋버튼타입");
	    //     });
	    // }
       
			
		// $(document).ready(function() {
	    //      refreshSession();
	    //      wireUpEvents();
	         
	    //      $(window).on('beforeunload', function(e) {
	 	// 		//console.log("beforeunload 결과:"+validNavigation);
	 			
	 	// 		if(validNavigation){
	 	// 			//console.log("최종 beforeunload 결과: "+validNavigation);
	    //             endSession();
	    //      	} 
	 	//     });
	    // });
		
	    //   function endSession() {
	    //       $.ajax({
	             
	    //          url : "closeSession.me",
	    //          data : {
	    //             userId : "${loginUser.userId}"
	    //          },
	    //          success : function(result) {
	    //             console.log("close성공");
	    //          },
	    //          error : function() {
	    //             console.log("댓글 작성용 ajax 통신 실패!");
	    //          }
	             
	    //       });
	    //   }
	      
	    //   function refreshSession() {
	    //       $.ajax({
	             
	    //          url : "refreshSession.me",
	    //          data : {
	    //             userId : "${loginUser.userId}"
	    //          },
	    //          success : function(result) {
	    //             console.log("refresh성공");
	    //          },
	    //          error : function() {
	    //             console.log("댓글 작성용 ajax 통신 실패!");
	    //          }
	             
		//       });
		//    }
    </script>
</body>
</html>