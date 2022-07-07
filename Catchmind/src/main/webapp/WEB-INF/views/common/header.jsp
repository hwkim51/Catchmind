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
    
    <style>
        /* 전체 */
        *{
            margin: 0;
            box-sizing: border-box;
        }
        /* header : icon */
        label[for="menuicon"], #membericon{
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
            width:50px;
            height: 5px;
            margin: 10px 0px;
            transition-duration:0.5;
        }
        #membericon{
            position: relative;
            top:20px;
            float: right;
            background:url('./resources/images/people.png') 0px 0 / 40px no-repeat;
        }
    
        /* header : sidebar*/
        .sidebar{
            width: 100%;
            height: 1000px;
            background-color: black;
            opacity: 93%;
            position: fixed;
            top:0;
            left:-2000px;
            z-index: 1;
            transition:all 0.7s;
        }
        .sidebar label{
            height: 600px;
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
        </style>
</head>

<body>
    <!-- header : 메뉴아이콘 -->
    <input type="checkbox" id="menuicon" hidden>
    <label for="menuicon">
        <div class="line" id="top"></div>
        <div class="line" id="mid"></div>
        <div class="line" id="btm"></div>
    </label>

    <a href="">
        <div class="homelogo">CATCHMIND</div>
    </a>
    
    
    <!-- header : 회원아이콘 -->
    <div id="membericon" style="right:0px;" onclick="myPage()">
        <br clear="both">
    </div>

    <!-- header : click 시 sidebar -->
    <div class="sidebar">
        <label>
            <ul class="accodion"><a href=""><span>MBTI 테스트</span></a></ul><br>
            <ul class="accodion"><a href=""><span>❣ CATCH ❣</span></a></ul><br>
            <ul class="accodion"><a><span>커뮤니티</span></a></ul>
                <div>
                    <li><a href=""> 함께 놀러가요 💑</a></li>
                    <li><a href="">에브리타임</a></li>
                    <li><a href="">연애의 발견</a></li>
                </div>
            <br>
            <ul class="accodion"><a><span>고객센터</span></a></ul>
                <div>
                    <li><a href="">공지사항</a></li>
                    <li><a href="catchTalk.faq">FAQ</a></li>
                    <li><a href="enrollForm.in">1:1문의</a></li>
                </div>
         
        </label>
    </div>

    <script>
        // accodion 클릭 시 active 클래스 속성명 추가해주기(효과용)
        var accodion = document.querySelectorAll('.accodion');
        
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
                location.href="mypage.me";
            }
            else{
                location.href="loginPage.me";
            }
        }
    </script>
</body>
</html>