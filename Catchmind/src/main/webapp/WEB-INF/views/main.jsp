<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title> CATCHMIND | 캐치마인드 </title>

    <!--AOS-->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <!--SWIPER-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    
 <style>
        html{
            font-size: 20px;
        }
         /* swiper */
        #mainSwiper{
            position: absolute;
            z-index: 0;
            top:0;
            width: 100vw;
            height: 100vh;
            transition-duration: 1s;
        }
        .swiper-slide img{
            width: 100vw;
            height: 100vh;
        }
        .text-wrap{
            position:absolute;
            top:50%;
            left: 0;
            right: 0;
            width: 900px;
            opacity: 0;
            margin: auto;
            text-align: center;
            transition : 0.9s;
        }
        .swiper-slide-active .text-wrap{
            transition-delay: 0.3s;
            opacity: 1;
            top: 20%;
            transition: 0.9;
        }
        .text-wrap h2{
            color: white;
            font-size: 160px;
            line-height: 1;
            font-weight: bold;
            margin-bottom: 16px;
        }
        .text-wrap p{
            color:white;
            font-weight: 500;
            font-size: 45px;
            margin-bottom: 0px;
        }

        .swiper-pagination-bullet{
            width: 40px;
            height: 4px;
            border-radius: 0;
            background-color: #fff;
        }
        .swiper-button-prev,
        .swiper-button-next{
            color: white;
        }
        /* section */
        section{
            position: absolute;
            top: 100vh;
        }
        .btn-main{
            margin-left: 100px;
            background-color: orange;
            font-size: 18px;
            width: 200px;
            height: 50px;
            border: 0;
            border-radius: 30px;
            font-weight: bolder;
            box-shadow: 1px 3px 4px rgba(0,0,0,0.3);
        }
        .btn-main:hover{
            color: white;
            background: linear-gradient(to right, rgb(236, 3, 194) 10%, orange);
        }
        /* article */
        .article-main {
            width: 100vw;
            height: 550px;
        }
        .article-main table{
            width: 1100px;
            height: 500px;
            margin: auto;
        }
        .left{
            width: 550px;
        }
        .article-main b{
            font-size: 35px;
            line-height: 30px;
        }
        .line{
            background-color: white !important;
            width: 50px;
            height: 5px;
            margin: 10px 0px;
            transition-duration:0.5;
        }
        .article-main b{
            display: block;
        }

        /* 미디어쿼리 (반응형 웹)
         @media screen and (max-width:780px),(max-height:500px) {
            nav img{
                width:780px;
                height: 100vh;
                float:left;
            }
            .script_font{
                font-size: 30px;
                top: 200px;
                left: 70px;
                line-height: 10px;
            }
            .logo_font{
                font-size: 120px;
                top: 240px;
                left: 70px;
                line-height: 100px;
            } 
        }*/
    
    </style>
</head>

<body>
    
    <%-- header 영역 --%>
    <jsp:include page="common/header.jsp"/>
    
    <%-- main 영역 --%>
    <!-- swiper-->
    <div class="swiper" id="mainSwiper">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
                <img src='./resources/images/nav1.jpg'>
                <div class="text-wrap"><br>
                    <p>딱 나만큼 괜찮은 사람과의 만남</p>
                </div>
                <div class="text-wrap" style="transition-delay: 0.6s;"><br><br><br>
                    <h2>CATCH&nbsp;&nbsp;&nbsp;<br>MIND&nbsp;&nbsp;&nbsp;&nbsp;</h2>
                </div>
            </div>
            <div class="swiper-slide">
                <img src='./resources/images/nav2.jpg'>
                <div class="text-wrap">
                    <h2><br>CATCHMIND</h2>
                    <p>당신의 인연을 캐치하세요</p>
                </div>
            </div>
            <div class="swiper-slide">
                <img src='./resources/images/nav4.jpg'>
                <div class="text-wrap" style="text-align: left;"><br>
                    <p style="color:rgb(246, 255, 0);">딱 나만큼 괜찮은 사람과의 만남</p>
                    <h2 style="color:rgb(246, 255, 0);">CATCH<br>&nbsp;MIND</h2>
                </div>
            </div>
        </div>
        <!-- pagination -->
        <div class="swiper-pagination"></div>
    
        <!-- navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    
    </div>
    

    <script>
        const swiper = new Swiper('.swiper', {
        speed: 1000,
        loop:true,
            autoplay: {
            disableOnInteraction: false,
            delay: 5000
        },

        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },

        // Navigation arrows
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },

        });
    </script>
    
    <br>

    <section>

       <br><br><br>

        <article class="article-main">
           <table>
            <tr>
                <td class="left" data-aos="fade-up" data-aos-duration="1000">
                    <b>세상에 없던 새로운 매칭 !</b><br><br>

                    <b>MBTI를 기반으로 한</b><br>
                    <b>신개념 데이트 웹 플랫폼</b><br>
                    그동안 몰랐던 또 다른 나의 모습...!<br>
                    MBTI로 알아보는 천생연분 연애 테스트<br><br>
                    나의 연애 성격 유형과 숨겨진 능력은?<br><br>
                    
                    <input type="button" class="btn-main" value="MBTI 검사하기" onclick="mbtiGo()">
                </td>
                <td class="right" data-aos="fade-up" data-aos-duration="1000"> 
                    <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" width="600px;">
                        <source src='./resources/images/mbtivideo.mp4'>
                    </video>  
                </td>
            </tr>
           </table> 
        </article>

    <br clear="both">
    <hr>

        <article class="article-main">
           <table>
            <tr>
                <td class="left" style="overflow: hidden;" data-aos="flip-left" data-aos-duration="1000">
                    <img src='./resources/images/nav2.jpg' width="550px;" height="350px;">
                </td>
                <td class="right" style="padding-left: 50px;" data-aos="fade-left" data-aos-duration="1000">
                    <br><b>원치않는 상대는 NO ✋</b><br><br>

                    ✔ 연락처를 연동하여 지인들에게 노출되지 않도록<br><br>
                    ✔ 채팅상대와의 만남을 다시 원치 않는다면 신고/차단<br><br>
                    
                    이용에 불편하신 점이 있다면 언제든지 알려주세요!<br>
                    쾌적한 이용환경을 만들어 드릴게요 :)<br><br>
                    
                    지금 바로 나의 운명의 상대를 찾고 싶다면? <br><br>
                <input type="button" class="btn-main" value="채팅 상대 둘러보기">
                </td>
            </tr>
            </table>
        </article>

    <br clear="both">
    <hr>
     
        <article class="article-main">
            <table>
                <tr>
                    <td class="left" data-aos="fade-right" data-aos-duration="1000">
                        <br><br><br>
                        <b>유저들의 이유있는 선택,</b><br>
                        <b>CATCHMIND 캐치마인드</b><br><br>
                        지루한 일상에서 벗어날 수 있도록<br>
                        당신과 딱 맞는 사람을 찾아드릴게요! <br><br>
                        연인, 친구같은 만남의 계기부터 <br>
                        취미, 거리, MBTI 만남의 취향까지 다양하게<br>
                        당신의 마음을 "Catch!💖" 🤞<br><br>
                        캐치마인드에서 나만의 소중한 인연을 찾아보세요!<br><br><br><br>
                        
                    </td>
                    <td class="right" data-aos="flip-left" data-aos-duration="1000">
                        <img src='./resources/images/nav3.jpg' width="550px;" height="350px;">
                    </td>
                </tr>
            </table>
        </article>

        
    <br clear="both">
    <hr>
    <br><br><br>
        
    </section>
     
    <%-- footer 영역 --%>
    <jsp:include page="common/footer.jsp"/>

    <script>

        // AOS 
        AOS.init();

        // MBTI TEST로 이동
        function mbtiGo(){
            location.href = 'mbtiTest.te';
        }
       
    </script>
</body>
</html>