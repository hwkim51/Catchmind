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
        top: 240px;
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
    }
    .check_font{
        padding: 0px 0px 10px 60px;
        font-size: 10px;
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
   input[type="password"]{
    width: 300px;
   }
   .btn-terms:disabled{
        background-color: gray;
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
            <div class="enrollTitle">비밀번호 찾기 및 변경<br>
                <span class="info_font">입력한 정보로 찾은 회원 조회 결과 입니다.</span></div>
                <br>
            <c:choose>
                <c:when test="${not empty findUser}">
                    <label for="userPwd">* 변경 PW 입력: </label>
                    <input type="password" id="userPwd" name="userPwd" maxlength="16" placeholder="변경 할 비밀번호를 입력하세요."><br>
                        <div class="check_font" id="pwd_check">영문자, 숫자, 특수기호 총 4 ~ 16글자</div>

                    <label for="checkPwd">* 변경 PW 확인 : </label>
                    <input type="password" id="checkPwd" name="checkPwd" maxlength="16" placeholder="변경 할 비밀번호를 입력하세요."><br>
                        <div class="check_font" id="pwd_check2"> 확인을 위해 동일한 비밀번호를 입력하세요.</div>
                        <br><input type="button" id="changePwd" class="btn-terms" value=" 비밀번호 변경 " disabled="true">
                </c:when>
                <c:otherwise>
                    <br><label>일치하는 회원 정보가 없습니다.</label><br><br><hr>
                    <span class="info_font">지금 회원가입하고 운명의 상대 찾으러 가기💕</span><br><br>
                    <input type="button" class="btn-terms" value=" 회 원 가 입 " onclick="enrollFome()">
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

        $(function(){
            var $userPwd = $("#findForm input[name=userPwd]");
            var $checkPwd = $("#findForm input[name=checkPwd]");

            // * 비밀번호 유효성 체크 
            var regExp = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
                $userPwd.blur(function(){

                    if($userPwd.val().length >= 1 && !regExp.test($userPwd.val())){
                        $("#pwd_check").css("color","red").text("영문자, 숫자, 특수기호 4 ~ 16자로 입력해주세요.");
                        $("#changePwd").prop("disabled",true); 
                    }
                    else if($userPwd.val().length == 0){
                        $("#changePwd").prop("disabled",true); 
                    }else{
                        $("#pwd_check").text(" 　");
                    }
                })

                // * 재확인 비밀번호 일치 체크
                $checkPwd.blur(function(){       
                
                    if( $checkPwd.val().length >= 1 && $userPwd.val() != $checkPwd.val()){
                        $("#pwd_check2").css("color","red").text("비밀번호가 일치하지 않습니다.");
                        $("#changePwd").prop("disabled",true);
                    }
                    else if($checkPwd.val().length == 0){
                        $("#changePwd").prop("disabled",true);
                    }else{ 
                        $("#pwd_check2").text(" 　");
                        $("#changePwd").prop("disabled",false); 
                        
                    }
                }) 

                // * 비밀번호 변경 ajax
                var $changePwd = $("#findForm input[id=changePwd]");

                // $changePwd.click(function(result){
                //     $.ajax({
                //         url : 'changePwd.me',
                //         data : { 
                //             userId : '${findUser.userId}',
                //             userPwd : $userPwd.val()
                //          },
                //         success : function(result){
                //             console.log(result);
                //         },
                //         error : function(){
                //             console.log("비밀번호 변경 ajax 통신 실패");
                //         }
                //     })
                // })
        });
    </script>
</body>
</html>