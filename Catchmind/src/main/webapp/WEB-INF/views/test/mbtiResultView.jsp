<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CATCHMIND | 캐치마인드 </title>
<style>
	.mbtiResult-area {
        width: 1200px;
        height: 750px;
        margin: auto;
        margin-bottom: 80px;
    }

    .mbtiResult-img {
        width: 500px;
        margin-top: 70px;
    }

    .mbtiResult-title {
        font-size: 30px;
        font-weight: bold;
        margin-top: 15px;
    }

    .mbtiResult-mbti {
        font-size: 45px;
        font-weight: bold;
    }

    .mbtiResult-content {
        width: 500px;
        margin: 25px 0px 35px 0px;
    }

    .mbtiResult-btn {
        background-color: orange !important;
        color: white !important;
        width: 250px;
        border-radius: 20px !important;
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
	
    <div class="mbtiResult-area" align="center">
        <img class="mbtiResult-img" src="${ testResult.mbtiImg }">
        <div class="mbtiResult-title">${ testResult.mbtiTitle }</div>
        <div class="mbtiResult-mbti">${ testResult.mbtiResult }</div>
        <div class="mbtiResult-content" align="left">${ testResult.mbtiContent }</div>
        <button class="btn mbtiResult-btn" data-toggle="modal" data-target="#mbtiResultModal">확인</button>
    </div>

    <div class="modal" id="mbtiResultModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">내 MBTI 업데이트</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	나의 MBTI 정보를 업데이트 하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer" align="center">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    <form action="updateMbti.te" method="post">
                    	<input type="hidden" name="mbtiUser" value="${ loginUser.userId }">
                    	<input type="hidden" name="mbtiResult" value="${ testResult.mbtiResult }">
                    	<button type="submit" class="btn btn-success">확인</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>