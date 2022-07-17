<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .sessionTitle{
        margin-left: 70px;
        width: 300px;
    }
    .matchList{
        padding: 30px 220px;
    }
    .matchUser{
        position: relative;
        display: inline-block;
        margin: 60px 50px;
        border-radius: 50px;
        width: 250px;
        height: 230px;
        background-color: rgb(234, 232, 232);
    }
    .matchUser:hover{
        cursor: pointer;
    }
    .matchUser *{
        position: absolute;
    }
    .matchUserPic{
        border-radius: 70%;
        background-image:url('./resources/images/song.jpg');
        background-size: contain;
        background-color: rgba(0, 0, 0, 0.865);
        object-fit: cover;
        width: 120px;
        height: 120px;
        top: -50px;
        left: 65px;
    }
    .matchUserInfo{
        width: 100%;
        text-align: center;
    }
    .matchUserNickname{
        top:85px;
        font-size: 18px;
        font-weight: 600;
    }
    .matchUserMbti{
        top: 110px;
    }
    .matchUserWord{
        font-size: 12px;
        top: 150px;
    }
    .btn-match{
        top: 180px;
        left: 80px;
    }
    #profileModal{
        text-align: center;
        background-color: rgba(0, 0, 0, 0.829)
    }
    .profile-img{
        width: 350px;
        height: 350px;
        border-radius: 70%;
        object-fit: cover;
    }

</style>
</head>
<body>
 
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    <div class="matchList">
        <nav class="sessionTitle">
            <h2><b>매칭 리스트</b></h2>
            <hr>
        </nav>
        <br>
        
        <article class="matchUser" data-toggle="modal" data-target="#profileModal">
            <div class="matchUserPic"></div>
            <div class="matchUserInfo matchUserNickname">조러블메이커(25)</div>
            <div class="matchUserInfo matchUserMbti">ENFP</div>
            <div class="matchUserInfo matchUserWord">진지한 만남 상대 찾아요❣</div>
            <div class="btn-match">
                <input type="button" class="btn-sm btn-danger" value="자세히 보기">
            </div>
        </article>

        <article class="matchUser" data-toggle="modal" data-target="#profileModal">
            <div class="matchUserPic"></div>
            <div class="matchUserInfo matchUserNickname">캔디현우(27)</div>
            <div class="matchUserInfo matchUserMbti">ENFP</div>
            <div class="matchUserInfo matchUserWord">💌안녕 나랑 친구하자</div>
            <div class="btn-match">
                <input type="button" class="btn-sm btn-danger" value="자세히 보기">
            </div>
        </article>
        
        <article class="matchUser" data-toggle="modal" data-target="#profileModal">
            <div class="matchUserPic"></div>
            <div class="matchUserInfo matchUserNickname">치매정인(22)</div>
            <div class="matchUserInfo matchUserMbti">ISTJ</div>
            <div class="matchUserInfo matchUserWord">진지한 만남 상대 찾아요.</div>
            <div class="btn-match">
                <input type="button" class="btn-sm btn-danger" value="자세히 보기">
            </div>
        </article>

        <article class="matchUser" data-toggle="modal" data-target="#profileModal">
            <div class="matchUserPic"></div>
            <div class="matchUserInfo matchUserNickname">영웅유진(24)</div>
            <div class="matchUserInfo matchUserMbti">ENFP</div>
            <div class="matchUserInfo matchUserWord">안녕 나랑 친구하자</div>
            <div class="btn-match">
                <input type="button" class="btn-sm btn-danger" value="자세히 보기">
            </div>
        </article>

        <article class="matchUser" data-toggle="modal" data-target="#profileModal">
            <div class="matchUserPic"></div>
            <div class="matchUserInfo matchUserNickname">캔디현우(29)</div>
            <div class="matchUserInfo matchUserMbti">ISTJ</div>
            <div class="matchUserInfo matchUserWord">진지한 만남 상대 찾아요.💌</div>
            <div class="btn-match">
                <input type="button" class="btn-sm btn-danger" value="자세히 보기">
            </div>
        </article>
        
        <article class="matchUser" data-toggle="modal" data-target="#profileModal">
            <div class="matchUserPic"></div>
            <div class="matchUserInfo matchUserNickname">치매정인(31)</div>
            <div class="matchUserInfo matchUserMbti">ENFP</div>
            <div class="matchUserInfo matchUserWord">안녕 나랑 친구하자</div>
            <div class="btn-match">
                <input type="button" class="btn-sm btn-danger" value="자세히 보기">
            </div>
        </article>



        <!-- 프로필 상세보기 모달 -->
        <div class="modal" id="profileModal"> 
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- 프로필 상세보기 모달 헤더 -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- 프로필 상세보기 모달 바디 -->
                    <div class="modal-body">

                        <form action="follow.me" method="post">
                        	<input type="hidden" name="userId" value="">
                        	<input type="hidden" name="userPwd" value="">
                            <input type="hidden" name="userNo" value=""><!--팔로우 할 상대의 userNo-->
                        	
                            <!-- 프로필 - 이미지 -->
                            <img class="profile-img" src='./resources/images/song.jpg'>
                           
                            <br><br>
                            <div class="matchUserInfo matchUserNickname">조러블메이커(25)</div>
                            <div class="matchUserInfo matchUserMbti">ENFP</div>
                            <div class="matchUserInfo matchUserWord">진지한 만남 상대 찾아요❣</div>
                            <hr>                            
                            <!-- 팔로우 / 차단하기 버튼 -->
                            <input type="submit" class="btn btn-danger" value=" f o l l o w "> &nbsp;
                            <input type="button" class="btn btn-secondary" value=" 차 단 하 기 ">
                            <br>
                        </form>

                    </div>
                </div>
        	</div>
        </div>


    </div>
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>