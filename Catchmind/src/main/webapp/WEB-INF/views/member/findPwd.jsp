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
    .info_font{
        text-align: left;
        font-size:13px; 
        color:dimgrey;
        font-weight: 500;
   }
   #inquiry{ 
        text-decoration: none;
        color:dimgrey;
   }
   .btn-email{
        border:none;
        font-weight: 600;
   }
   .btn-email:active{
        border:none;
   }
   .btn-email::after{
        border: none;
   }


</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    
    <hr>
    <!-- *ID, *PW, *PW확인, 이름, 생년월일, 성별, *전화번호, *이메일-->
    <form action="findPwd.me" method="post" id="findForm">
        <div id="enrollStep">
            <div class="enrollTitle">비밀번호 찾기<br>
                <span class="info_font">가입 시 입력한 회원정보(아이디, 이름, 이메일)로 비밀번호를 찾아 드립니다.</span></div>
                
            
            <label for="userId">* 아이디 : </label>
            <input type="text" id="userId" name="userId" placeholder="가입회원의 아이디를 입력해주세요." required><br><br>

            <label for="userName">* 이름 : </label>
            <input type="text" id="userName" name="userName" placeholder="가입 시 작성한 성함을 입력해주세요." required><br><br>

            <label for="email">* EMAIL : </label>
            <input type="email" id="email" name="email" style="width:300px;" placeholder="가입 시 작성한 이메일을 입력해주세요." required> &nbsp; 
            <button type="button" id="clickButton" class="btn-email" onclick="getCertificationNum();">메일발송</button><br>
            <input type="text" name="loginNumber" id="loginNumber" style="width:300px;" disabled placeholder="인증번호 6자리 입력" size="25"> &nbsp;&nbsp;&nbsp;&nbsp; <br><br>

            <input type="submit" id="btn-find" class="btn-terms" value=" 회원정보 찾기 ">
            <br><br><br><a href="enrollForm.in" class="info_font" id="inquiry">등록한 회원정보가 변경되었거나 회원정보를 찾는 데 문제가 있으신가요? · · · · · ▷ click </a> 
            
        </div>
    </form>
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

    <script>
        var otp;
        var email = $("#email").val();

        
        function getCertificationNum() {

            if($("#email").val() == ''){
                alert("이메일 항목을 입력해주세요.");
                setTimeout(function(){
                    $("#email").css("border","2px solid red");
                },200)
            }
            else{	            
                $("#loginNumber").removeAttr("disabled");
                $("#email").css("border","1px solid black");
                $.ajax({
                    url : "sendEmail.me",
                    data : {email : email},
                    type : "post",
                    success : function(result) {
            
                    // result : 컨트롤러에서 발생시킨 otp 코드
                    otp = result;
                    }, 
                    error : function() {
                            console.log("이메일 인증용 ajax 실패");
                    }
                });
                setTimeout(function(){
                    alert("인증번호가 전송되었습니다.");
                },200);
            }
        }
        
        function invalidateNum() {

            var inputOtp = $("#loginNumber").val();
                 if(otp == inputOtp) {
                     alert("인증되었습니다. ");
                     return true; 
                } else {
                      alert("인증번호가 맞지 않습니다.");
                      $("#loginNumber").val("").attr("disabled", true);
                    return false;
            }
            return false;
       }    
    </script>
</body>
</html>