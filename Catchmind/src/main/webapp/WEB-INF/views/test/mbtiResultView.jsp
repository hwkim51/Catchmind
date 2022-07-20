<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CATCHMIND | 캐치마인드 </title>
 <!--AOS-->
 <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
    /* 폰트 */
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Myeongjo&display=swap');
	.mbtiResult-area {
        width: 1200px;
        height: 1100px;
        margin: auto;
        margin-bottom: 80px;
    }

    .mbtiResult-img {
        width: 500px;
        margin-top: 50px;
    }

    .mbtiResult-title {
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 30px;
        font-weight: bold;
        margin-top: 15px;
    }

    .mbtiResult-mbti {
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 45px;
        font-weight: bold;
    }

    .mbtiResult-content {
        font-family: 'IBM Plex Sans KR', sans-serif;
        width: 500px;
        margin: 25px 0px 35px 0px;
    }

    .mbtiResult-btn {
        background-color: orange !important;
        color: white !important;
        height: 45px;
        width: 250px;
        border-radius: 20px !important;
        font-family: 'IBM Plex Sans KR', sans-serif;
        box-shadow: 1px 3px 4px rgba(0,0,0,0.3);
    }
    .mbtiResult-btn:hover{
        color: white;
        background: linear-gradient(to right, rgb(236, 3, 194) 10%, orange);
    }
    #mbtiResultModal{
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .btn-yes{
        background-color: white;
        color:rgb(0, 0, 0);
        font-size: 20px;
        font-weight: 900;
        width: 210px;
        height: 40px;
        border-radius: 10px;
        border: none;
    }
    .btn-no{
        background-color: white;
        color:rgb(93, 93, 93);
        font-size: 20px;
        font-weight: 900;
        width: 220px;
        height: 40px;
        border-radius: 10px;
        border: none;
    }
    .btn-yes:hover, .btn-no:hover{
        opacity: 0.7;
    }
 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
    <hr>
    <div class="mbtiResult-area" align="center" data-aos="fade-up" data-aos-duration="1000">
        <img class="mbtiResult-img" src="${ testResult.mbtiImg }">
        <div class="mbtiResult-title" data-aos="fade-up" data-aos-duration="1000">${ testResult.mbtiTitle }</div>
        <div class="mbtiResult-mbti" data-aos="fade-up" data-aos-duration="1000">${ testResult.mbtiResult }</div>
        <div class="mbtiResult-content" align="left" data-aos="fade-up" data-aos-duration="1000">${ testResult.mbtiContent }</div>
        <button class="btn mbtiResult-btn" data-toggle="modal" data-target="#mbtiResultModal" data-aos="fade-up" data-aos-duration="1000">MBTI 업데이트</button>
        <br><br><br>
    </div>

    <div class="modal" id="mbtiResultModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">나의 MBTI 업데이트</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	회원 정보에 나의 MBTI를 업데이트 하시겠습니까?<br><br>
                    <h1 style="text-align: center; font-size: 100px;">🤔<br></h1>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer" align="center">
                    
                    <form action="updateMbti.te" method="post">
                    	<input type="hidden" name="mbtiUser" value="${ loginUser.userId }">
                    	<input type="hidden" name="mbtiResult" value="${ testResult.mbtiResult }">
                    	<button type="submit" class="btn-yes">YES</button>
                    </form>
                    <button type="button" class="btn-no" id="noModal" data-dismiss="modal">NO</button>
                    <script>
                    	$("#noModal").click(function() {
                    		$(location).attr('href', "/catchmind");
                    	});
                    </script>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
        AOS.init();
    </script>
</body>
</html>