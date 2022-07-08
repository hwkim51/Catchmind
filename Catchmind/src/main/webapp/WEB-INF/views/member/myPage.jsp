<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="myPage-menu"><a href="">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="">차단리스트</a></div>
        <div class="myPage-menu"><a href="">커플관리</a></div>
        <div class="myPage-menu"><a href="">내글관리</a></div>
        <hr>
    </div>
    
    <div class="myPage-area" align="center">
        <div class="profile-area" align="center">
            <img id="profile-img" src="">
            <div id="user-mbti">INFP</div>
            <div id="user-nickname"> 
            	공주승아 
                <font id="user-age">(24)</font>
            </div>
            <div id="user-feature">번개처럼 빠른</div>
            <div id="user-message">나를 공주라고 불러줄 사람 구해요fsdkjfaslkjklhsrlkhtlrkfhgdfdsfsdkjthlsuylfsrkjtblnisuhrntlkjh</div>
            <div id="user-coupleID">💖couple ID💖</div>
        </div>

        <div class="myPageInfo-area" align="center">
            <table id="myPage-info">
                <tr>
                    <td width="100px" height="35px">ID</td>
                    <td width="200px">PrincessJSA</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>지승아</td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                        <label><input type="radio" name="gender" value="M">남자 &nbsp; &nbsp;</label>
                        <label><input type="radio" name="gender" value="F">여자</label>
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
                    <td>1999-01-20</td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>010-0000-0000</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>jsa@naver.com</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>서울시 구로구</td>
                </tr>
                <tr>
                    <td>키</td>
                    <td>167</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>