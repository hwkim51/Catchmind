<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div[id*="enrollStep"]{
        height: 500px;
    }
    .enrollTitle{
        text-align: left;
        font-size: 19px;
        font-weight: 600;
        margin: 25px 40px;
        
    }
    #findForm{
        border-radius: 10px;
        background-color: rgba(211, 211, 211, 0.326);
        width: 700px;
        height: 370px;
        text-align: center;
        font-size: larger;
        position: absolute;
        margin: auto;
        top: 200px;
        left: 0px;
        right: 0px;
        font-size: 16px;
    }
    #findForm input[type="text"], #findForm input[type="email"]{
        width: 400px;
    }
    .btn-terms{
        width: 180px;
        height: 40px;
        border: 0;
        border-radius: 30px;
        font-weight: 600;
        color:white;
        background-color: rgb(63, 63, 63);
        box-shadow: 1px 3px 4px rgba(0,0,0,0.2);
    }
   .info_font{
        text-align: left;
        font-size:13px; 
        color:dimgrey;
        font-weight: 500;
   }
   .info_font a{
        text-decoration: none;
   }

</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    
    <hr>
    <!-- *ID, *PW, *PW확인, 이름, 생년월일, 성별, *전화번호, *이메일-->
    <form id="findForm">
        <div id="enrollStep">
            <div class="enrollTitle">회원정보<br>
                <span class="info_font">${resultMsg}</span></div>
                <br>
            <c:choose>
                <c:when test="${not empty findUser}">
                    <br><label style="font-size: 1em;"> 환영합니다. ${findUser.userId} 회원님 :D </label><br><br><hr>
                   
                    <span class="info_font">지금 로그인하고 운명의 상대 찾으러 가기💕</span><br><br>
                    <input type="button" id="btn-find" class="btn-terms" value=" L O G I N " onclick="login()">
                </c:when>
                <c:otherwise>
                    <br><label>일치하는 회원 정보가 없습니다.</label><br><br><hr>
                    <span class="info_font">지금 회원가입하고 운명의 상대 찾으러 가기💕</span><br><br>
                    <input type="button" id="btn-find" class="btn-terms" value=" 회 원 가 입 " onclick="enrollFome()">
                </c:otherwise>
            </c:choose>
           
            
        </div>
    </form>
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

    <script>

        function login(){
            location.href="loginPage.me";
        }
        function enrollFome(){
            location.href="enrollForm.me";
        }
        
    </script>
</body>
</html>