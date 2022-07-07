<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    <div class="home">CATCHMIND 하세요</div>

    <!-- *ID, *PW, *PW확인, 이름, 생년월일, 성별, *전화번호, *이메일-->
    <form action="insert.me" method="post" id="enrollForm">
        <label for="userId">* ID : </label>
        <input type="text" id="userId" name="userId" required><br>
        <label for="userPwd">* PW : </label>
        <input type="password" id="userPwd" name="userPwd" required><br>
        <label for="chekchPwd">* PW 확인 : </label>
        <input type="password" id="chekchPwd" name="chekchPwd" required><br>
        <label for="userName"> 이름 : </label>
        <input type="text" id="userName" name="userName"><br>
        <label for="phone">* 전화번호 : </label>
        <input type="text" id="phone" name="phone" required><br>
        <label for="email">* 이메일 : </label>
        <input type="text" id="email" name="email" required><br>

        <br>

        <!-- 닉네임, 주소, 전화번호, 키, MBTI-->
        <label for="pic">프로필사진 : </label>
        <input type="text" id="pic" name="pic"><br>
        <label for="nickname">닉네임: </label>
        <input type="text" id="nickname" name="nickname"><br>
        <label for="mbti">MBTI : </label>
        <input type="text" id="mbti" name="mbti"><br>
        <!-- Q. 빼는건지/ 경도,위도로 가는건지 확인 : <label for="ADDRESS">주소 : </label> 
        <input type="text" id="userId" name="userId"><br>-->
        
        <br>

        <button type="submit" class="btn btn-primary" disabled>회원가입</button>
        <button type="reset" class="btn btn-danger">초기화</button>
    </form>
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>