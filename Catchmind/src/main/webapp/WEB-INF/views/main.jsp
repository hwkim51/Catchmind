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
            height: 788px;
            position: absolute;
            top:0px;
            overflow: hidden;
        }
        nav img{
            width:100vw;
            height: 788px;
            float:left;
        }
        /* section */
        section{
            position: absolute;
            top: 788px;
        }
        .btn-main{
            background-color: orange;
            width: 180px;
            height: 40px;
            border: 0;
            border-radius: 30px;
            font-weight: bolder;
        }
        /* article */
        .article-main {
            width: 100vw;
            padding: 100px 200px;
        }
        .article-main p, .article-main img{
            float:left;
            margin: 50px;
        }
        .article-main{
            height: 600px;
        }
        .article-main p{
            height: 400px;
        }
        .article-main p{
            font-weight: bolder;
            font-size: 16px;
        }
        .article-main b{
            font-size: 35px;
            line-height: 50px;
        }
        
        .line{
            background-color: white !important;
            width:50px;
            height: 5px;
            margin: 10px 0px;
            transition-duration:0.5;
        }
    
    </style>
</head>

<body>
    
    <%-- header 영역 --%>
    <jsp:include page="common/header.jsp"/>
    
    <%-- main 영역 --%>
    <nav style="background:skyblue; width:400vw;">
            <img src='./resources/images/nav1.jpg'>
            <img src='./resources/images/nav2.jpg'>
            <img src='./resources/images/nav3.jpg'>
            <img src='./resources/images/nav4.jpg'>
    </nav>
    
    <br>

    <section>
       
        <article class="article-main">
            <p>
                <br><b>세상에 없던 새로운 매칭 !</b><br><br>
                
                <b>MBTI를 기반으로 한</b><br>
                <b>신개념 데이트 웹 플랫폼</b><br><br><br>
                
               	 나의 연애 성격 유형과 숨겨진 능력은?<br><br>
                
                <input type="button" class="btn-main" value="MBTI 검사하기">
            </p>
            <img src='./resources/images/nav4.jpg' width="500px;">
        </article>

    <br clear="both">
    <hr>

        <article class="article-main">
            <img src='./resources/images/nav2.jpg' width="500px;">
            <p>
                <br><b>원치않는 상대는 NO ✋</b><br><br>
                
                이용에 불편하신 점이 있다면 언제든지 알려주세요!<br>
                연락처 연동을 통해 지인들에게 내 정보가 노출되지 않도록 하기<br>
                채팅 후 상대와의 만남을 다시 원하지 않는다면 신고/ 차단하기<br>
                쾌적한 이용환경을 만들어 드릴게요<br><br><br><br><br><br>
            <input type="button" class="btn-main" value="채팅 상대 둘러보기">
            </p>  
        </article>

    <br clear="both">
    <hr>

        <article class="article-main">
            <img src='./resources/images/nav3.jpg' width="500px;">
            <p>
                    <br>
                    <b>유저들의 이유있는 선택,</b><br>
                    <b>CATCHMIND 캐치마인드</b><br><br>
                    이용에 불편하신 점이 있다면 언제든지 알려주세요!<br>
                    연락처 연동을 통해 지인들에게 내 정보가 노출되지 않도록 하기<br>
                    채팅 후 상대와의 만남을 다시 원하지 않는다면 신고/ 차단하기<br>
                    쾌적한 이용환경을 만들어 드릴게요<br><br><br><br>
            </p>
        </article>
        
    </section>
     
    <%-- footer 영역 --%>
    <jsp:include page="common/footer.jsp"/>
</body>
</html>