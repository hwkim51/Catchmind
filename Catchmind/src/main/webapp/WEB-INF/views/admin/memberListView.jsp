<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        border : 1px solid red;
        padding : 0px;   
    }

    .admin-outer {
        width : 1200px;
        height : 1000px;
        margin-left : 80px;
        margin-right : 80px;
    }

    .admin-menu {
        width : 12.5%;
        height : 100%;
        float : left;
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

    .admin-content {
        width : 87.5%;
        height : 100%;
        float : left;
    }

    #title {
        font-size : 30px;
        font-weight : bolder;
        padding-left : 20px;
    }

    #toMain {
        font-size : 35px;
        font-weight : bolder;
        color : orange;
        float : right;
        padding-right : 20px;
    }

    #memberTable {
        border : 1px solid black;
        margin-left : 20px;
    }

    #memberTable>thead {
        background-color : lightgrey;
    }

    #memberTable>thead>tr>th {
        padding-left : 15px;
    }

    #id {
        width : 150px;
    }

    #nickname {
        width : 150px;
    }

    #name {
        width : 150px;
    }

    #status {
        width : 150px;
    }

    #btns {
        width : 400px;
    }

</style>
</head>
<body>
    <div class="admin-outer">

        <div class="admin-menu">
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
                <li>1:1 문의</li>
            </ul>
            <div id="admin-stat">웹사이트 통계</div>
        </div>
        <div class="admin-content">
            <br>
            <span id="title">회원 관리</span>
            <span id="toMain">CATCHMIND</span>
            <br><br>
            <table id="memberTable">
                <thead>
                    <tr>
                        <th id="id">ID</th>
                        <th id="nickname">닉네임</th>
                        <th id="name">이름</th>
                        <th id="status">상태</th>
                        <th colspan="2" id="btns"></th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
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