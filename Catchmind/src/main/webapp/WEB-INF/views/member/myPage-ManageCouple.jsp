<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CATCHMIND | 캐치마인드 </title>
<style>
 	.myPage-nav {
        width: 1000px;
        margin-left: 150px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 22px;
    }
    .myPage-menu {
        display : table-cell;
        height : 50px;
        width : 200px;
        font-weight: 600;
        text-align: center;
    }
    .myPage-menu a {
        text-decoration: none !important;
        color : black !important;
        font-size : 20px;
        display : block;
        width : 100%;
        height : 100%;
        line-height : 50px;
    }
    .myCouple-area {
        width: 1000px;
        height: 600px;
        margin: auto;
    }
    
    .inputCoupleID-area {
        width: 1000px;
        height: 200px;
    }

    .coupleID-text {
        margin-top: 50px;
        margin-bottom: 10px;
        font-size: 20px;
        font-weight: bold;
        width: 210px;
    }

    #input-coupleID {
        width: 250px;
        display: inline-block;
        vertical-align: middle;
    }

    #coupleRequest-btn {
        background-color: orange;
        color: white;
    }

    .coupleRequest-area {
        width: 500px;
        height: 400px;
    }

    .coupleRequest-text {
        width: 370px;
        font-size: 18px;
        font-weight: bold;
    }

    .coupleRequestMem-area {
        width: 370px;
        height: 45px;
        margin-top: 8px;
    }

    .coupleRequest-img {
        width: 45px;
        height: 45px;
        border-radius: 70%;
        float: left;
        object-fit: cover;
    }

    .coupleRequest-infoArea {
        width: 320px;
        height: 45px;
        float: right;
        background-color: rgb(246, 245, 245);
    }
    
    .coupleRequest-name {
        width: 180px;
        font-weight: bold;
        float: left;
        line-height: 45px;
        margin-left: 10px;
        font-size: 17px;
    }

    .couple-acceptBtn {
        background-color: orange !important;
        color: white !important;
        margin-top: 3px;
    }

    .couple-refuseBtn {
        margin-top: 3px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="myPage-nav">
        <div class="myPage-menu"><a href="myPage.me">회원정보수정</a></div>
        <div class="myPage-menu"><a href="myFollow.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="myBlock.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="myCouple.me">커플관리</a></div>
        <div class="myPage-menu"><a href="myBoard.po">내글관리</a></div>
        <hr>
    </div>
    
    <div class="myCouple-area" align="center">
        <div class="inputCoupleID-area">
        	<form action="requestCouple.me" method="post">
	            <div class="coupleID-text" align="left">커플 아이디 입력</div>
	            <input type="hidden" name="userNo" value="${ loginUser.userNo }">
	            <input type="hidden" name="userId" value="${ loginUser.userId }">
	            <input type="hidden" name="userPwd" value="${ loginUser.userPwd }">
	            <input id="input-coupleID" type="text" class="form-control" name="coupleId">
	            <button type="submit" id="coupleRequest-btn" class="btn">요청</button>
            </form>
        </div>
        
        <div class="coupleRequest-area">
            <div class="coupleRequest-text" align="left">커플 신청 현황</div>

			<c:forEach var="c" items="${ cList }">
	            <div class="coupleRequestMem-area">
	            	<c:choose>
		        		<c:when test="${ c.pic eq null }">
		        			<img class="coupleRequest-img" src="resources/images/pic.png">
		        		</c:when>
		        		<c:otherwise>      
		        			<img class="coupleRequest-img" src="${ c.pic }">
		        		</c:otherwise>
		        	</c:choose>
		        	
	                
	                <div class="coupleRequest-infoArea">
	                    <font class="coupleRequest-name" align="left">${ c.nickname }</font>
        				<input style="width: 50px" type="hidden" name="partner" value="${ c.userNo }">
	                    <button class="btn couple-acceptBtn" onclick="coupleFormSubmit(1);">수락</button>
	                    <button class="btn btn-secondary couple-refuseBtn" onclick="coupleFormSubmit(2);">거절</button>
	                </div>
	            </div>
            </c:forEach>
        </div>
        
        <form id="coupleForm" action="" method="post">
        	<input type="hidden" name="userNo" value="${ loginUser.userNo }">        	
        	<input type="hidden" name="userId" value="${ loginUser.userId }">        	
        	<input type="hidden" name="userPwd" value="${ loginUser.userPwd }">
        	<input type="hidden" name="partner" value="">
        </form>
        
        <script>
        	$(function() {
        		$(".coupleRequest-infoArea .couple-acceptBtn").click(function() {
        			$("#coupleForm input[name=partner]").attr("value", $(this).prev().val())
        			$("#coupleForm").attr("action", "acceptCouple.me").submit();
        		});
        		
        		$(".coupleRequest-infoArea .couple-refuseBtn").click(function() {
        			$("#coupleForm input[name=partner]").attr("value", $(this).prev().prev().val())
        			$("#coupleForm").attr("action", "refuseCouple.me").submit();
        		});
        	});
        	/*
        	function coupleFormSubmit(num) {
        		
        		$(".coupleRequest-infoArea .couple-acceptBtn").click(function() {
        			
        			if(num == 1) {
        				
        				
        			
        			} else if(num == 2) {
        				
        				$("#coupleForm input[name=partner]").attr("value", $(this).prev().prev().val())
            			$("#coupleForm").attr("action", "refuseCouple.me").submit();
        			}
        		});
        	}
        	*/
        </script>
    </div>
</body>
</html>