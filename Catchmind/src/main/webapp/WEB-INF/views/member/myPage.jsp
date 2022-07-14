<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    
    .profile-modalHeader {
        border-bottom: none !important;
    }

    .profile-img {
        width: 200px;
        height: 200px;
        border-radius: 70%;
        margin-top: 80px;
        object-fit: cover;
    }

    .update-profileImg {
        margin-top: 20px !important;
    }
    
    .update-profileImg:hover {
    	cursor: pointer;
    	opacity: 0.8;
    }
    
    #updateProfileImg {
    	display: none;
    }

    .user-mbti {
        margin-top: 15px;
        font-size: 20px;
    }

    .user-nickname {
        font-weight: bold;
        font-size: 25px;
        display: inline-block;
    }
    
    .update-nickname {
    	outline: 0;
    	border: none;
    	width: 250px;
    	font-size: 28px !important;
    	text-align: center;
        display: block !important;
    }

    .bi-pencil-fill {
        margin-left: 5px;
    }
    
    .bi-pencil-fill:hover {
        cursor: pointer;
    }

    #user-age {
        font-size: 15px;
        font-weight: normal;
    }

    #user-feature {
        font-size: 14px;
    }

    .user-message {
        width: 250px;
        height: 50px;
        word-break: break-all;
        margin-top: 20px;
        font-size: 15px;
        overflow-y: scroll;
    }
    
    .user-message::-webkit-scrollbar {
        width: 5px;
    }

    .user-message::-webkit-scrollbar-thumb {
        height: 10%;
        background: orange;
        border-radius: 10px;
    }

    .user-message::-webkit-scrollbar-track {
        background: rgb(254, 235, 200);
    }

    .update-message {
        outline: 0;
        border: none;
        resize: none;
        display: block;
        margin-bottom: 40px;
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

    .modal-body select {
        width: 20px;
        outline: 0;
        border-width: 0px;
        appearance: none;
        text-align: center;
    }

    .profile-updateBtn {
        background-color: orange !important;
        color: white !important;
        margin: auto;
        margin-bottom: 30px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="myPage-nav">
        <div class="myPage-menu"><a href="myPage.me">회원정보수정</a></div>
        <div class="myPage-menu"><a href="myFollow.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="myBlock.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="">커플관리</a></div>
        <div class="myPage-menu"><a href="">내글관리</a></div>
        <hr>
    </div>
    
    <div class="myPage-area" align="center">
        <div class="profile-area">
            <img class="profile-img" src="${ loginUser.pic }">
            <div class="user-mbti">${ loginUser.mbti }</div>
            <div class="user-nickname">
            	${ loginUser.nickname } 
                <font id="user-age">
                	<!-- 현재 년도 - 생년 + 1 -->
                	<script>
                		$(function() {
                			var now = new Date().getFullYear(); // 현재 년도
                			
                			var birthDay = "${ loginUser.birthDay }"; 
                    		var birthYear = birthDay.substr(0, 4); // 생년
                    		
                    		var age = (now - birthYear) + 1;
                    		
                    		$("#user-age").text("(" + age + ")");
                		});
                	</script>
                </font>
            </div>
            <i class="bi bi-pencil-fill" data-toggle="modal" data-target="#profileModal"></i>
            <div id="user-feature">번개처럼 빠른</div>
            <div class="user-message">
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
		
		<!-- 프로필 수정 모달 -->
        <div class="modal" id="profileModal"> 
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- 프로필 수정 모달 헤더 -->
                    <div class="modal-header profile-modalHeader">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- 프로필 수정 모달 바디 -->
                    <div class="modal-body">

                        <form action="updateProfile.me" method="post" enctype="multipart/form-data">
                        	<input type="hidden" name="userId" value="${ loginUser.userId }">
                        	<input type="hidden" name="userPwd" value="${ loginUser.userPwd }">
                        	
                            <!-- 프로필 수정 - 이미지 -->
                            <img class="profile-img update-profileImg" src="${ loginUser.pic }" onclick="document.getElementById('updateProfileImg').click();">
                            <input type="file" id="updateProfileImg" name="profileImg" accept="image/*" onchange="setProfileImg(event)">
                            <input type="hidden" name="pic" value="${ loginUser.pic }">
                            
                            <script>
                            	function setProfileImg(event) {
                            		var reader = new FileReader();
                            		
                            		reader.onload = function(event) {
                            			$(".update-profileImg").attr("src", event.target.result);
                            		};
                            		
                            		reader.readAsDataURL(event.target.files[0]);
                            	}
                            </script>
                            
                            <!-- 프로필 수정 - MBTI -->
                            <div class="user-mbti" style="background-color: aqua;">
                            <c:set var="userMBTI" value="${ loginUser.mbti }" />
                            <select id="EI">
                                <c:choose>
                                    <c:when test="${ fn:contains(userMBTI, 'E') }">
                                        <option value="E" selected>E</option>
                                        <option value="I">I</option>
                                    </c:when>
                                    <c:when test="${ fn:contains(userMBTI, 'I') }">
                                        <option value="E">E</option>
                                        <option value="I" selected>I</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="" disabled selected>M</option>
                                        <option value="E">E</option>
                                        <option value="I">I</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <select id="SN">
                                <c:choose>
                                    <c:when test="${ fn:contains(userMBTI, 'S') }">
                                        <option value="S" selected>S</option>
                                        <option value="N">N</option>
                                    </c:when>
                                    <c:when test="${ fn:contains(userMBTI, 'N') }">
                                        <option value="S">S</option>
                                        <option value="N" selected>N</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="" disabled selected>B</option>
                                        <option value="S">S</option>
                                        <option value="N">N</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <select id="TF">
                                <c:choose>
                                    <c:when test="${ fn:contains(userMBTI, 'T') }">
                                        <option value="T" selected>T</option>
                                        <option value="F">F</option>
                                    </c:when>
                                    <c:when test="${ fn:contains(userMBTI, 'F') }">
                                        <option value="T">T</option>
                                        <option value="F" selected>F</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="" disabled selected>T</option>
                                        <option value="T">T</option>
                                        <option value="F">F</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <select id="JP">
                                <c:choose>
                                    <c:when test="${ fn:contains(userMBTI, 'J') }">
                                        <option value="J" selected>J</option>
                                        <option value="P">P</option>
                                    </c:when>
                                    <c:when test="${ fn:contains(userMBTI, 'P') }">
                                        <option value="J">J</option>
                                        <option value="P" selected>P</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="" disabled selected>I</option>
                                        <option value="J">J</option>
                                        <option value="P">P</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <input type="hidden" name="mbti" id="updateMbti">
                            </div>
                            <script>
                                /* 변경된 MBTI 추출 */
                                $(function() {
                                    /* 사용자가 MBTI를 변경하지 않는 경우 */
                                    var m = $("#EI").val();
                                    var b = $("#SN").val();
                                    var t = $("#TF").val();
                                    var i = $("#JP").val();
                                    var mbti = m + b + t + i;
                                    
                                    $("#updateMbti").val(mbti);
                                    
                                    /* 사용자가 MBTI를 변경할 경우 */
                                    $("select").click(function() {
                                        
                                        m = $("#EI").val();
                                        b = $("#SN").val();
                                        t = $("#TF").val();
                                        i = $("#JP").val();
                                        
                                        mbti = m + b + t + i;                                	
                                        
                                        $("#updateMbti").val(mbti);
                                    });
                                });
                            </script>
                            
                            <!-- 프로필 수정 - 닉네임 -->
                            <input type="text" class="user-nickname update-nickname" name="nickname" value="${ loginUser.nickname }">
                            
                            <!-- 프로필 수정 - 상태메세지 -->
                            <textarea class="user-message update-message" name="profile">
                                <c:choose>
                                    <c:when test="${ loginUser.profile eq not null }">
                                        ${ loginUser.profile }
                                    </c:when>
                                    <c:otherwise>
                                    	나만의 상태메세지를 작성해주세요
                                    </c:otherwise>
                                </c:choose>
                            </textarea>
                            <script>
                                /* 사용자 상태메세지 공백 제거 */
                                $(function() {
                                    var m = $(".update-message").text();
                                    
                                    $(".update-message").text($.trim(m));
                                });
                            </script>
                            
                            <!-- 프로필 수정 버튼 -->
                            <input type="submit" class="btn profile-updateBtn" value="수정하기">
                        </form>

                    </div>
                </div>
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
    
</body>
</html>