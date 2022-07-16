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

<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Alertify 라이브러리 -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
       
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
    cursor: pointer;
}

.admin-menu>ul {
    margin-top : -10px;
}

.admin-menu a{ 
    text-decoration: none;
    color: black;
}

#toMain:hover{
    background: linear-gradient( rgb(236, 3, 194) 1%, orange);
    -webkit-text-fill-color : transparent;
    -webkit-background-clip: text; 
}
</style>
</head>
<body>
    <div class="admin-outer">

        <div class="admin-menu admin-body-l">
            <div id="admin-member">회원 관리</div>
            <div id="admin-board">게시글 관리</div>
            <ul>
                <li><a href="postList.ad">에브리타임</a></li>
                <li><a href="">연애의 발견</a></li>
            </ul>
            <div id="admin-cs">고객센터 관리</div>
            <ul>
                <li><a href="noticeList.ad">공지사항</a></li>
                <li><a href="faqList.ad">FAQ</a></li>
                <li><a href="inquiryList.ad">1:1 문의</a></li>
            </ul>
            <div id="admin-stat"><a href="statistics.ad">웹사이트 통계</a></div>
        </div>
       
       <!-- 1회성 알람 문구 기능 -->
		<c:if test="${ not empty alertMsg }">
			<script>
				alertify.alert("알람", "${ alertMsg }");
			</script>
			<c:remove var="alertMsg" scope="session" />
		</c:if>          

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