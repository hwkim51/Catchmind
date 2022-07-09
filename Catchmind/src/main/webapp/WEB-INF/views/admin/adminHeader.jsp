<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catchmind</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
div {
    box-sizing : border-box;
    margin : 0px;
    padding : 0px;   
}

.admin-outer {
    width : 1200px;
    height : 1000px;
    margin-top: 20px;
    
}

.admin-menu {
    width : 12.5%;
    height : 100%;
    float : left;
    /*border: 1px solid royalblue;*/
}

.admin-menu>div{
    height : 50px;
    padding-left : 10px;
    line-height : 50px;
    font-size : 20px;
    font-weight : bold;
}

.admin-menu>ul {
    margin-top : -10px;
}

.admin-menu a{ 
    text-decoration: none;
    color: black;
}
</style>
</head>
<body>
    <div class="admin-outer">

        <div class="admin-menu admin-body-l">
            <div id="admin-member">회원 관리</div>
            <div id="admin-board">게시글 관리</div>
            <ul>
                <li>에브리타임</li>
                <li>연애의 발견</li>
            </ul>
            <div id="admin-cs">고객센터 관리</div>
            <ul>
                <li>공지사항</li>
                <li>FAQ</li>
                <li><a href="inquiryList.ad">1:1 문의</a></li>
            </ul>
            <div id="admin-stat">웹사이트 통계</div>
        </div>
                 

    </div>

    <script>

        $("#admin-member").click(function() {
            location.href = "memberList.ad";
        });

        $("#admin-board").click(function() {
            location.href = "boardList.ad";
        });
    
        $("#admin-cs").click(function() {
            location.href = "inquiryList.ad";
        });

        $("admin-stat").click(function() {
            location.href = "websiteStat.ad";
        });

    </script>

</body>
</html>