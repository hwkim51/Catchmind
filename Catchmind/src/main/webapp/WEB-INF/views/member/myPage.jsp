<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CATCHMIND | 캐치마인드 </title>
<style>
	.myPage-nav {
        width: 1000px;
        margin-left: 150px;
    }
    .myPage-menu {
        display : table-cell;
        height : 50px;
        width : 150px;
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
    
    .myPage-area {
        width: 1000px;
        height: 600px;
        margin: auto;
    }

    .profile-area {
        width: 400px;
        height: 600px;
        float: left;
    }

    #myPage-info td {
        height: 50px;
    }

    #myPage-info {
        margin-top: 70px;
    }

    #profile-img {
        width: 200px;
        height: 200px;
        border-radius: 70%;
        margin-top: 80px;
        object-fit: cover;
    }

    #user-mbti {
        margin-top: 15px;
        font-size: 20px;
    }

    #user-nickname {
        font-weight: bold;
        font-size: 25px;
    }

    #user-age {
        font-size: 15px;
        font-weight: normal;
    }

    #user-feature {
        font-size: 14px;
    }

    #user-message {
        width: 250px;
        height: 50px;
        word-break: break-all;
        margin-top: 20px;
        font-size: 15px;
        overflow-y: scroll;
    }

    #user-message::-webkit-scrollbar {
        width: 5px;
    }

    #user-message::-webkit-scrollbar-thumb {
        height: 10%;
        background: orange;
        border-radius: 10px;
    }

    #user-message::-webkit-scrollbar-track {
        background: rgb(254, 235, 200);
    }

    #user-coupleID {
        margin-top: 13px;
        font-weight: 500;
    }

    .myPageInfo-area {
        width: 600px;
        height: 600px;
        float: left;
    }

    #pwdmod-btn {
        background-color: orange;
        color: white;
        width: 100px;
        font-size: 13px;
        font-weight: bold;
        border: none;
        border-radius: 15px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="myPage-nav">
        <div class="myPage-menu"><a href="">회원정보수정</a></div>
        <div class="myPage-menu"><a href="followlist.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="blocklist.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="">커플관리</a></div>
        <div class="myPage-menu"><a href="">내글관리</a></div>
        <hr>
    </div>
    
    <div class="myPage-area" align="center">
        <div class="profile-area" align="center">
            <img id="profile-img" src="${ loginUser.pic }">
            <div id="user-mbti">${ loginUser.mbti }</div>
            <div id="user-nickname"> 
            	${ loginUser.nickname } 
                <font id="user-age">
                	<!-- 현재 년도 - 생년 + 1 -->
                	<script>
                		var now = new Date().getFullYear(); // 현재 년도
                		
                		var birthDay = "${ loginUser.birthDay }"; 
                		var birthYear = birthDay.substr(0, 4); // 생년
                		
                		var age = (now - birthYear) + 1;
                		
                		$("#user-age").text("(" + age + ")");
                	</script>
                </font>
            </div>
            <div id="user-feature">번개처럼 빠른</div>
            <div id="user-message">
            	<c:choose>
            		<c:when test="${ loginUser.profile eq not null }">
            			${ loginUser.profile }
            		</c:when>
            		<c:otherwise>
            			나만의 상태메세지를 작성해주세요
            		</c:otherwise>
            	</c:choose>
            </div>
            <div id="user-coupleID">
            	<c:choose>
            		<c:when test="${ loginUser.partner eq null}">
            			💖CATCH MIND💖
            		</c:when>
            		<c:otherwise>
            			💖${ loginUser.partner }💖
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>

        <div class="myPageInfo-area" align="center">
            <table id="myPage-info">
                <tr>
                    <td width="100px" height="35px">ID</td>
                    <td width="200px">${ loginUser.userId }</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>${ loginUser.userName }</td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                    	<c:choose>
                    		<c:when test="${ loginUser.gender eq null}">
		            			<label><input type="radio" name="gender" value="M" onclick="return(false);">남자 &nbsp; &nbsp;</label>
                        		<label><input type="radio" name="gender" value="F" onclick="return(false);">여자</label>
		            		</c:when>
		            		<c:when test="${ loginUser.gender eq M}">
		            			<label><input type="radio" name="gender" value="M" checked onclick="return(false);">남자 &nbsp; &nbsp;</label>
                        		<label><input type="radio" name="gender" value="F" onclick="return(false);">여자</label>
		            		</c:when>
		            		<c:otherwise>
		            			<label><input type="radio" name="gender" value="M" onclick="return(false);">남자 &nbsp; &nbsp;</label>
                        		<label><input type="radio" name="gender" value="F" checked onclick="return(false);">여자</label>
		            		</c:otherwise>
		            	</c:choose>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>*********</td>
                    <td width="100px">
                        <button id="pwdmod-btn">비밀번호 수정</button>
                    </td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>${ loginUser.birthDay }</td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>${ loginUser.phone }</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${ loginUser.email }</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>주소입니다~</td>
                </tr>
                <tr>
                    <td>키</td>
                    <td>${ loginUser.height }</td>
                </tr>
            </table>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    console.log(${ loginUser });
    
</body>
</html>