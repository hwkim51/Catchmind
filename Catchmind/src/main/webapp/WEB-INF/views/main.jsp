<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title> CATCHMIND | 캐치마인드 </title>
 <style>
        /* nav */
        nav{
            height: 100vh;
            position: absolute;
            top:0;
            overflow: hidden;
        }
        nav img{
            width:100vw;
            height: 100vh;
            float:left;
        }
        /* section */
        section{
            position: absolute;
            top: 100vh;
        }
        .btn-main{
            background-color: orange;
            font-size: 18px;
            width: 180px;
            height: 40px;
            border: 0;
            border-radius: 30px;
            font-weight: bolder;
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
        table .texteffect{
            overflow: hidden;
            
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
        .script_font{
            position:absolute;
            color:white;
            font-weight: 500;
            font-size: 45px;
            top: 210px;
            left: 330px;
            line-height: 5px;
            animation: showText 0.9s; 
        }
        .logo_font{
            position: absolute;
            color:white;
            font-weight: 700;
            font-size: 155px;
            top: 240px;
            left: 400px;
            line-height: 150px;
            animation: showText 0.9s; 
            animation-delay: 0.1s;
        }

        @keyframes showText{
            from{
                transform: translateY(30px);
                opacity: 0;
            }
            to{
                transform: translateY(0px);
                opacity: 1;
            }
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
    <nav style="width:400vw;">
        <img src='./resources/images/nav1.jpg'>
        <img src='./resources/images/nav2.jpg'>
        <img src='./resources/images/nav3.jpg'>
        <img src='./resources/images/nav4.jpg'>

            <div class="script_font">딱 나만큼 괜찮은 사람과의 만남</div>
            <div class="logo_font">CATCH<br>MIND</div>
    </nav>
    
    <br>

    <section>
       <br><br><br>

        <article class="article-main">
           <table>
            <tr>
                <td class="left texteffect">
                    <b>세상에 없던 새로운 매칭 !</b><br><br>

                    <b>MBTI를 기반으로 한</b><br>
                    <b>신개념 데이트 웹 플랫폼</b><br><br>
                    
                    나의 연애 성격 유형과 숨겨진 능력은?<br><br>
                    
                    <input type="button" class="btn-main" value="MBTI 검사하기" onclick="mbtiGo()">
                </td>
                <td class="right"> 
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
                <td class="left" style="overflow: hidden;">
                    <img src='./resources/images/nav2.jpg' width="500px;">
                </td>
                <td class="right">
                    <br><b>원치않는 상대는 NO ✋</b><br><br>
                
                    이용에 불편하신 점이 있다면 언제든지 알려주세요!<br>
                    연락처 연동을 통해 지인들에게 내 정보가 노출되지 않도록 하기<br>
                    채팅 후 상대와의 만남을 다시 원하지 않는다면 신고/ 차단하기<br>
                    쾌적한 이용환경을 만들어 드릴게요<br><br><br><br>
                <input type="button" class="btn-main" style="margin-left: 10vmin;" value="채팅 상대 둘러보기">
                </td>
            </tr>
            </table>
        </article>

    <br clear="both">
    <hr>
     
        <article class="article-main">
            <table>
                <tr>
                    <td class="left">
                        <img src='./resources/images/nav3.jpg' width="500px;">
                    </td>
                    <td class="right">
                        <br>
                        <b>유저들의 이유있는 선택,</b><br>
                        <b>CATCHMIND 캐치마인드</b><br><br>
                        이용에 불편하신 점이 있다면 언제든지 알려주세요!<br>
                        연락처 연동을 통해 지인들에게 내 정보가 노출되지 않도록 하기<br>
                        채팅 후 상대와의 만남을 다시 원하지 않는다면 신고/ 차단하기<br>
                        쾌적한 이용환경을 만들어 드릴게요<br><br><br><br>
                    </td>
                </tr>
            </table>
        </article>
        
    </section>
     
    <%-- footer 영역 --%>
    <jsp:include page="common/footer.jsp"/>

    <script>
        function mbtiGo(){
            location.href = 'mbtiTest.te';
        }
        
       
    </script>
</body>
</html>