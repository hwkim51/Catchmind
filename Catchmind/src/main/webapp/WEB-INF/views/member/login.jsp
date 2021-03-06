<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .line{
        background-color: white !important;
        width:50px;
        height: 5px;
        margin: 10px 0px;
        transition-duration:0.5;
    }
    /* nav */
    nav{
        height: 100vh;
        position: absolute;
        top:0px;
        overflow: hidden;
    }
    nav img{
        width:100vw;
        float:left;
    }
    /* loginForm */
    #loginArea{
        border-radius: 10px;
        padding: 20px;
        background-color: rgba(211, 211, 211, 0.326);
        width: 500px;
        height: 350px;
        text-align: center;
        font-size: larger;
        position: absolute;
        top: 40vh;
        left: 50vw;
    }
    #loginForm label, #loginForm .btn-login, #loginForm span{
        font-weight: 700;
    }
    #loginForm input{
        margin-top: 5px;
        height: 35px;
    }
    #loginForm span{
        display: inline-block;
        margin: 10px 20px;
        font-size: 15px;
    }
    #loginForm a{
        color: black;
        text-decoration: none;
    }
    .btn-login{
        width: 280px;
        height: 30px;
        background-color: black;
        border: 0px;
        border-radius:5px;
        color:white;
    }
    .check_font{
        font-size: 11px;
    }

</style>
</head>

<body>

    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    
    <%-- main 영역 --%>
    <nav>
            <img src='./resources/images/nav5.jpg'>
    </nav>
    
    <div id="loginArea">
        <h1>L O G I N</h1>
        <hr>
        <form action="login.me" method="post" id="loginForm">
            <label for="userId">I &nbsp;D : &nbsp;</label>
            <input class="form-control" style="width: 250px; display: inline;" type="text" id="userId" name="userId" placeholder="Enter ID" required><br>
            <label for="userPwd">PW : &nbsp;</label>
            <input class="form-control" style="width: 250px; display: inline;" type="password" id="userPwd" name="userPwd" placeholder="Enter Password" required><br>
            <div class="check_font" id="acount_check"> 　</div>
            <span><a href="findIdPage.me">아이디 </a>/ <a href="findPwdPage.me">비밀번호 찾기</a></span>
            <span><a href="enrollForm.me">회원가입</a></span><br>
            <input type="submit" class="btn-login" value="로그인하기">
        </form>
     
    </div>

    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

    <c:if test="${ not empty alertMsg }">
        <script>
            alertify.alert("알람", "${alertMsg}");
        </script>
    
    <c:remove var="alertMsg" scope="session"/>
    </c:if> 
</body>
</html>