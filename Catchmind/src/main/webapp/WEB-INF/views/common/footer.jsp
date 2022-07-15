<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
    <style>
        /* footer*/
        .footer{
            background-color: lightgray;
            height: 90px; /* footer 높이 */
            width: 100%;
            position: fixed; /* sticky같은 역할 */
            bottom: 0; /* 푸터위치 잡기 */
            left: 0; /* 공백제거*/
            transition: 0.5s; /* 올라오는 속도 */
            transform: translateY(60px); /* 숨길 높이값 */
        }
        .footer:hover{
            transform: translateY(0px); /* 숨긴 높이값을 없애서 다시 나타나게 함 */
        }
        .footer{
            text-align: center;
            line-height: 30px;
            font-size: 14px;
        }
        .footerinner{
            top:-40px;
            height: 90px;
        }
        .footerinner pre{
            text-align: left;
            margin: 10px 50px;
            line-height: 20px;
            display: inline-block;
        }
        .GIT_A{
        	text-decoration: none;
        	color:black;
        	cursor:pointer;
        }
        .GIT_A:hover{
        	text-decoration: none;
        	color:black;
        	cursor:pointer;
        }
    </style>
</head>
<body>
        <div class="footer">
            Copyright ⓒ Catchmind Inc. All rights reserved
            <div class="footerinner">
                <pre style="margin-left: 10px;"><b>캐치마인드</b><br>(주) 캐치마인드 / 사업자 등록 번호 : 590-81-00690</pre>
                <pre><b>고객센터</b><br>문의전화 : 010-4806-7399 / 이메일 : catchmindofficial@gmail.com</pre>
                <pre><b>GIT 💻 </b><br><a class="GIT_A" href="https://github.com/hwkim51/Catchmind">https://github.com/hwkim51/Catchmind</a></pre>
            </div>
        </div>
</body>
</html>