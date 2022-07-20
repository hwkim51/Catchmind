<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    
    #profileModal .modal-header, #addressModal .modal-header,
    #coupleUserModal .modal-header, #withdrawModal .modal-header,
    #updatePwdModal .modal-header {
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
    
    .couple-profileImg {
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
    
    #couple-age {
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
    
    #couple-coupleID {
        margin-top: 13px;
        font-weight: 500;
    }

    .myPageInfo-area {
        width: 600px;
        height: 600px;
        float: left;
        margin-bottom: 100px;
    }

    .pwdmod-btn, .findAddress-btn {
        background-color: orange !important;
        color: white !important;
        width: 100px;
        height: 30px;
        font-size: 12px !important;
        border-radius: 15px !important;
        padding: 0px !important;
    }

    .modal-body select {
        width: 20px;
        outline: 0;
        border-width: 0px;
        appearance: none;
        text-align: center;
    }

    .profile-updateBtn, .searchAddress-btn, .info-updateBtn, #addressConfirm, .couple-deleteBtn, .updatePwd-btn,
    .deleteMem-btn {
        background-color: orange !important;
        color: white !important;
        margin: auto;
    }
    
    .deleteMem-btn {
    	margin: 15px 0px 0px 0px;
    }
    
    .updatePwd-btn {
    	margin: 15px 0px 0px 0px;
    }
    
    .couple-deleteBtn {
    	margin-top: 30px;	
    	margin-bottom: 30px;
    }
    
    .profile-updateBtn {
    	margin-bottom: 30px;
    }
    
    .info-updateBtn {
        margin-top: 20px;
    }
    
    input[name=address] {
    	background-color: white !important;
    }
    
    select option[value=""][disabled] {
    	display: none;
    }
    
    #user-coupleID .coupleId:hover {
    	cursor: pointer;
    }
    
    .withdrawFont {
    	color: rgb(148, 148, 148);
    	font-size: 15px;
    }
    
    .withdrawFont:hover {
		cursor: pointer;
	}
}
</style>
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 카카오 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77749acda3a6480214504c82f0f3e2fe&libraries=services"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="myPage-nav">
        <div class="myPage-menu"><a href="myPage.me">회원정보수정</a></div>
        <div class="myPage-menu"><a href="myFollow.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="myBlock.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="#" onclick="javascript:document.myCoupleForm.submit();">커플관리</a></div>
        <div class="myPage-menu"><a href="myBoard.po">내글관리</a></div>
        <hr>
    </div>
    
    <form name="myCoupleForm" action="myCouple.me" method="post">
    	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
    </form>
    
    <div class="myPage-area" align="center">
        <div class="profile-area">
        	<c:choose>
        		<c:when test="${ loginUser.pic eq null }">
        			<img class="profile-img" src="resources/images/pic.png">
        		</c:when>
        		<c:otherwise>            
        			<img class="profile-img" src="${ loginUser.pic }">
        		</c:otherwise>
        	</c:choose>
            <div class="user-mbti">
            	<c:choose>
            		<c:when test="${ loginUser.mbti eq '0'}">
            		</c:when>
            		<c:otherwise>
            			${ loginUser.mbti }
            		</c:otherwise>
            	</c:choose>
            </div>
            <div class="user-nickname">
            	${ loginUser.nickname } 
                <font id="user-age">
                	<!-- 현재 년도 - 생년 + 1 -->
                	<script>
                		$(function() {
                			// 회원의 생일이 null이 아닌 경우만 나이 추출
                			if("${ loginUser.birthDay }" != "") {
                				var now = new Date().getFullYear(); // 현재 년도
                    			
                    			var birthDay = "${ loginUser.birthDay }"; 
                        		var birthYear = birthDay.substr(0, 4); // 생년
                        		
                        		var age = (now - birthYear) + 1;
                        		
                        		$("#user-age").text("(" + age + ")");
                			}
                		});
                	</script>
                </font>
            </div>
            <i class="bi bi-pencil-fill" data-toggle="modal" data-target="#profileModal"></i>
            <div id="user-feature">번개처럼 빠른</div>
            <div class="user-message" id="user-message" align="left">
            	<c:choose>
            		<c:when test="${ loginUser.profile eq null }">
            			나만의 상태메세지를 작성해주세요
            		</c:when>
            		<c:otherwise>
            			${ loginUser.profile }
            		</c:otherwise>
            	</c:choose>
            </div>
            <script>
                /* 사용자 상태메세지 공백 제거 */
                $(function() {
                    var m = $("#user-message").text();
                    
                    $("#user-message").text($.trim(m));
                });
            </script>
            <div id="user-coupleID">
            	<c:choose>
            		<c:when test="${ loginUser.partner eq 0}">
            			💖CATCH MIND💖
            		</c:when>
            		<c:otherwise>
            			<div class="coupleId" data-toggle="modal" data-target="#coupleUserModal">💖${ coupleMem.nickname }💖</div>
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
		
		<!-- 커플 회원 모달 -->
		<div class="modal" id="coupleUserModal">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<!-- 커플 회원 모달 헤더 -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- 커플 회원 모달 바디 -->
					<div class="modal-body">
						<!-- 커플 회원 프로필 사진 -->
						<c:choose>
							<c:when test="${ coupleMem.pic eq null }">
								<img class="profile-img couple-profileImg" src="resources/images/pic.png">
							</c:when>
			        		<c:otherwise>            						
			        			<img class="profile-img couple-profileImg" src="${ coupleMem.pic }">
			        		</c:otherwise>
			        	</c:choose>
						
						<!-- 커플 회원 MBTI -->  
						<div class="user-mbti">${ coupleMem.mbti }</div>
						
						<!-- 커플 회원 닉네임 및 나이 -->
						<div class="user-nickname">
		            		${ coupleMem.nickname } 
			                <font id="couple-age">
			                	<!-- 현재 년도 - 생년 + 1 -->
			                	<script>
			                		$(function() {
			                			// 회원의 생일이 null이 아닌 경우만 나이 추출
			                			if("${coupleMem.birthDay}" != "") {
			                				var now = new Date().getFullYear(); // 현재 년도
			                    			
			                    			var birthDay = "${ coupleMem.birthDay }"; 
			                        		var birthYear = birthDay.substr(0, 4); // 생년
			                        		
			                        		var age = (now - birthYear) + 1;
			                        		
			                        		$("#couple-age").text("(" + age + ")");
			                			}
			                		});
			                	</script>
			                </font>
		            	</div>
		            	
		            	<!-- 커플 회원 상태메세지 -->
		            	<div class="user-message" id="couple-message" align="left">
			            	<c:choose>
			            		<c:when test="${ coupleMem.profile eq null }">
			            			나만의 상태메세지를 작성해주세요
			            		</c:when>
			            		<c:otherwise>
			            			${ coupleMem.profile }
			            		</c:otherwise>
			            	</c:choose>
			            </div>
			            <script>
			                /* 사용자 상태메세지 공백 제거 */
			                $(function() {
			                    var m = $("#couple-message").text();
			                    
			                    $("#couple-message").text($.trim(m));
			                });
			            </script>
			            
			            <!-- 커플 회원의 커플 닉네임 -->
			            <div id="couple-coupleID">
			            	<c:choose>
			            		<c:when test="${ coupleMem.partner eq 0}">
			            			💖CATCH MIND💖
			            		</c:when>
			            		<c:otherwise>
			            			<div class="coupleId">💖${ loginUser.nickname }💖</div>
			            		</c:otherwise>
			            	</c:choose>
			            </div>
			            
			            <!-- 커플 회원 삭제 버튼 -->
			            <form action="deleteCouple" method="post">
			            	<input type="hidden" name="userId" value="${ loginUser.userId }">
			            	<input type="hidden" name="userPwd" value="${ loginUser.userPwd }">
			            	<input type="submit" class="btn couple-deleteBtn" value="삭제하기">
			            </form>
					</div>
					
				</div>
			</div>
		</div>
		
		
		<!-- 프로필 수정 모달 -->
        <div class="modal" id="profileModal"> 
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- 프로필 수정 모달 헤더 -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- 프로필 수정 모달 바디 -->
                    <div class="modal-body">

                        <form action="updateProfile.me" method="post" enctype="multipart/form-data">
                        	<input type="hidden" name="userId" value="${ loginUser.userId }">
                        	<input type="hidden" name="userPwd" value="${ loginUser.userPwd }">
                        	
                            <!-- 프로필 수정 - 이미지 -->
                            <c:choose>
				        		<c:when test="${ loginUser.pic eq null }">
				        			<img class="profile-img update-profileImg" src="resources/images/pic.png" onclick="document.getElementById('updateProfileImg').click();">
				        		</c:when>
				        		<c:otherwise>
				        			<img class="profile-img update-profileImg" src="${ loginUser.pic }" onclick="document.getElementById('updateProfileImg').click();">
				        		</c:otherwise>
				        	</c:choose>
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
                            <div class="user-mbti">
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
                                    <c:when test="${ loginUser.profile eq null }">
                                    	나만의 상태메세지를 작성해주세요
                                    </c:when>
                                    <c:otherwise>
                                    	${ loginUser.profile }
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
        	<form action="updateInfo.me" method="post">
	            <table id="myPage-info">
	                <tr>
	                    <td width="100px">ID</td>
	                    <td width="220px">
	                    	<input type="text" class="form-control" value="${ loginUser.userId }" name="userId" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <td>비밀번호</td>
	                    <td>
	                    	<input type="password" class="form-control" value="${ loginUser.userPwd }" name="userPwd" readonly>
	                    </td>
	                    <td width="110px" align="right">
	                        <button type="button" class="btn pwdmod-btn" data-toggle="modal" data-target="#updatePwdModal">비밀번호 수정</button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>이름</td>
	                    <td>
	                    	<input type="text" class="form-control" value="${ loginUser.userName }" name="userName">
	                    </td>
	                </tr>
	                <tr>
	                    <td>성별</td>
	                    <td>
	                        <label><input type="radio" name="gender" value="M">&nbsp;남자</label> &nbsp; &nbsp; &nbsp;
	                        <label><input type="radio" name="gender" value="F">&nbsp;여자</label>
	                    </td>
	                </tr>
	                <tr>
	                    <td>생년월일</td>
	                    <td>
	                    	<input type="date" class="form-control" value="${ loginUser.birthDay }" name="birthDay">
	                    </td>
	                </tr>
	                <tr>
	                    <td>전화번호</td>
	                    <td>
	                    	<input type="text" class="form-control" value="${ loginUser.phone }" name="phone">
	                    </td>
	                </tr>
	                <tr>
	                    <td>이메일</td>
	                    <td>
	                    	<input type="text" class="form-control" value="${ loginUser.email }" name="email">
	                    </td>
	                </tr>
	                <tr>
	                    <td>주변 역</td>
	                    <td>
	                    	<input type="text" class="form-control" name="address" value="${ address }" readonly>
	                    	<input type="hidden" class="form-control" name="latitude" value="${ loginUser.latitude }">
	                    	<input type="hidden" class="form-control" name="longitude" value="${ loginUser.longitude }">
	                    </td>
	                    <td width="110px" align="right">
	                        <button type="button" class="btn findAddress-btn" data-toggle="modal" data-target="#addressModal" onclick="resizeMap()">주변 역 찾기</button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>키</td>
	                    <td>
	                    	<input type="text" class="form-control" value="${ loginUser.height }" name="height">
	                    </td>
	                </tr>
	                <tr>
	                    <td><div class="withdrawFont" data-toggle="modal" data-target="#withdrawModal">회원탈퇴 ></div></td>
	                    <td align="center">
	                    	<input type="submit" class="btn info-updateBtn" value="수정하기">
	                    </td>
	                </tr>
	            </table>
	    	</form>
        </div>
        
        <!-- 회원 탈퇴 모달 -->
        <div class="modal" id="withdrawModal">
        	<div class="modal-dialog"> 
        		<div class="modal-content">
        		
        			<!-- 회원 탈퇴 모달 헤더 -->
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>
        			
        			<!-- 회원 탈퇴 모달 바디 -->
        			<div class="modal-body">
        				<form action="deleteMember" id="deleteMember" method="post">
        					<div style="font-size: 18px; font-family: 'IBM Plex Sans KR', sans-serif; width: 310px; margin-bottom: 10px" align="left">
        						안전한 회원탈퇴를 위해, <br>
        						비밀번호를 확인해주세요.
        					</div>
	        				<table>
	        					<tr>
	        						<td width="80" height="40">아이디</td>
	        						<td width="230">
	        							<input type="hidden" name="userId" value="${ loginUser.userId }">
	        							<div>${ loginUser.userId }</div>
	        						</td>
	        					</tr>
	        					<tr>
	        						<td>비밀번호</td>
	        						<td>
	        							<input type="text" class="form-control" name="userPwd">
	        						</td>
	        					</tr>
	        				</table>
	                        <input type="button" class="btn deleteMem-btn" value="탈퇴하기">
                        </form>
        			</div>
        		</div>
            </div>
        </div>
        <script>
        	$(function() {
        		$(".deleteMem-btn").click(function() {
        			
        			var inputUserPwd = $("#withdrawModal input[name=userPwd]").val();
        			var userPwd = "${ loginUser.userPwd }";
        			
        			if(inputUserPwd != userPwd) {
        				alert("비밀번호를 다시 확인해주세요.");	
        			} else {
        				$("#deleteMember").submit();
        			}
        		});
        	});
        </script>
        <!-- 비밀번호 수정 모달 -->
        <div class="modal" id="updatePwdModal">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<!-- 비밀번호 수정 모달 헤더 -->
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>			
        			
        			<!-- 비밀번호 수정 모달 바디 -->
        			<div class="modal-body">
        				<form action="infoUpdatePwd.me" method="post" id="infoChangePwdForm">
	        				<input type="hidden" class="form-control" name="userId" value="${ loginUser.userId }">
	        				<table>
	        					<!-- 기존 비밀번호 입력 -->
	        					<tr>
	        						<td width="130">기존 비밀번호</td>
	        						<td>
	        							<input type="text" class="form-control" name="originPwd" style="width: 280px;">
	        						</td>
	        					</tr>
	        					<!-- 변경할 비밀번호 입력 -->
	        					<tr>
	        						<td>변경할 비밀번호</td>
	        						<td>
	        							<input type="text" class="form-control" id="userPwd" name="userPwd" style="width: 280px" readonly>
	        							<div id="checkUpdatePwd" style="font-size:0.8em; display:none;"></div>
	        						</td>
	        					</tr>
	        				</table>
	        				<input type="submit" class="btn updatePwd-btn" value="비밀번호 변경">
        				</form>
        			</div>
        			<script>
        				// 기존 비밀번호 확인
			        	$(function() {
			        		
			        		// 기존 비밀번호를 입력하는 input 요소 객체 자체를 변수에 담아두기
			        		var originPwd = $("input[name=originPwd]");
                            var changePwd = $("#infoChangePwdForm input[name=userPwd]");
                            var regExpPwd = /^[a-zA-Z0-9`~!@#$%^&*+=_-|₩';:₩"/?]{4,16}$/i;
			        		
			        		originPwd.keyup(function() {
			        			
			        			if(originPwd.val().length >= 4) {
			        				
			        				$.ajax({
			        					url : "originPwdCheck.me",
			        					data : {checkOriginPwd : originPwd.val()},
			        					success : function(result) {
			        						
			        						if(result == "NNNNY") { // 기존 비밀번호 일치
			        							
			        							// 수정할 비밀번호 입력칸 활성화
			        							changePwd.attr("readonly", false);
			        							
			        						}
			        						else { // 기존 비밀번호 불일치
			        							
			        							// 비밀번호 변경 비허용 메세지 출력
			        							$("#checkOriginPwd").show();
			        							$("#checkOriginPwd").css("color", "red").text("기존 비밀번호와 일치하지 않습니다. 비밀번호를 확인해주세요");
			        							
			        							// 비밀번호 변경 버튼 비활성
			        							$("#infoChangePwdForm :submit").attr("disabled", true);
			        						}
			        					},
			        					error : function() {
			        						
			        						console.log("기존 비밀번호 체크용 ajax 통신 실패!");
			        					}
			        				});
			        			}
			        		});

                            changePwd.keyup(function() {

                                console.log(changePwd.val());

                                if(changePwd.val().length >= 1 && !regExpPwd.test(changePwd.val())) {

                                    $("#checkUpdatePwd").show();
                                    $("#checkUpdatePwd").css("color", "red").text("영문자, 숫자, 특수기호 4 ~ 16자로 입력해주세요.");

                                    // 비밀번호 변경 버튼 비활성
        							$("#infoChangePwdForm :submit").attr("disabled", true);

                                } else if(changePwd.val().length >= 4 && regExpPwd.test(changePwd.val())) {

                                    $("#checkUpdatePwd").show();
                                    $("#checkUpdatePwd").css("color", "blue").text("사용 가능한 비밀번호입니다.");
			        				
			        				// 비밀번호 변경 버튼 활성
        							$("#infoChangePwdForm :submit").attr("disabled", false);
                                }
                            });
			        	});
			        </script>
        		</div>
        	</div>
        </div>
        
        <!-- 주소 찾기 모달 -->
        <div class="modal" id="addressModal">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<!-- 주소 찾기 모달 헤더 -->
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>
        			
        			<!-- 주소 찾기 모달 바디 -->
        			<div class="modal-body">
        				
                        <form onsubmit="searchAddress(); return false;">
                            <div class="input-group mb-3" style="width: 400px;">
                                <input type="text" class="form-control" id="keyword" placeholder="주변 역을 입력하세요">
                                <div class="input-group-append">
                                  <button type="submit" class="btn searchAddress-btn">검색</button>
                                </div>
                            </div>
                        </form>
        				<div id="map" style="width: 100%; height: 450px; margin-bottom: 20px;"></div>

                        <button class="btn" id="addressConfirm">확인</button>

                        <script>
                            // 마커 클릭 시 장소명을 표출할 인포윈도우
                            var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                            
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                mapOption = {
                                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };

                            // 지도 생성
                            var map = new kakao.maps.Map(mapContainer, mapOption);

                            // 모달 사용을 위한 지도 사이즈 재설정
                            function resizeMap() {
                                var mapContainer = document.getElementById('map');
                                mapContainer.style.width = '100%';
                                mapContainer.style.height = '450px';

                                setTimeout(function(){ map.relayout(); }, 0);
                            }

                            // 장소 검색 객체 생성
                            var ps = new kakao.maps.services.Places();

                            // 키워드로 주소 검색
                            searchAddress();

                            // 주소 검색을 요청하는 함수
                            function searchAddress() {

                                var keyword = document.getElementById('keyword').value;

                                if(!keyword.replace(/^\s+|\s+$/g, '')) {
                                    return false;
                                }
                                
                                // 장소검색 객체를 통해 키워드로 주소 검색 요청
                                ps.keywordSearch(keyword, placesSearchCB);
                            }

                            // 주소 검색 완료 시 호출되는 콜백함수
                            function placesSearchCB (data, status, pagination) {
                                if(status == kakao.maps.services.Status.OK) {

                                    // 검색된 장소 위치를 기준으로 지도 범위 재설정
                                    // => LatLngBounds 객체에 좌표 추가
                                    var bounds = new kakao.maps.LatLngBounds();

                                    for(var i = 0; i < data.length; i++) {
                                        displayMarker(data[i]);
                                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                                    }

                                    // 검색된 장소 위치를 기준으로 지도 범위 재설정
                                    map.setBounds(bounds);
                                }
                            }

                            var placeName = "";
                            var addressLat = 0;
                            var addressLng = 0;

                            // 지도에 마커를 표시하는 함수
                            function displayMarker(place) {

                                // 마커 생성 및 지도에 표시
                                var marker = new kakao.maps.Marker({
                                    map: map,
                                    position: new kakao.maps.LatLng(place.y, place.x)
                            });

                                // 마커에 클릭 이벤트 등록
                                kakao.maps.event.addListener(marker, 'click', function() {

                                    // 마커 클릭 시 장소명이 인포윈도우에 표출
                                    infowindow.setContent('<div style="padding:5px; font-size:12px;">' + place.place_name + '</div>');
                                    infowindow.open(map, marker);
                                    
                                    placeName = place.place_name; 				// 클릭한 마커의 장소명
                                    
                                    addressLat = marker.getPosition().getLat(); // 클릭한 마커의 위도
                                    addressLng = marker.getPosition().getLng(); // 클릭한 마커의 경도
                                    
                                    // var message = '클릭한 위치의 위도는 ' + addressLat + ' 이고, ';
                                    //     message += '경도는 ' + addressLng + ' 입니다';
                                        
                                    var resultDiv = document.getElementById('result');
                                    resultDiv.innerHTML = message;
                                });
                            }
                                    

                            // 주소 확인 버튼
                            $(function() {

                                $("#addressConfirm").click(function() {
                                    if(confirm(placeName + "을 주변 역으로 지정하시겠습니까?")) { // 주소 확인
                                        $("#addressModal").modal('hide');
                                    	$("input[name=address]").val(placeName);
                                    	$("input[name=latitude]").val(addressLat);
                                    	$("input[name=longitude]").val(addressLng);

                                    } else { // 주소 확인 취소
                                        
                                        $("#addressModal").modal('show');
                                    }
                                });
                            });
                        </script>
        			</div>
        		</div>
            </div>
        </div>
        
        <script>
        	$(function() {
        		if("${ loginUser.gender }" != "") { // 성별 정보가 있는 경우
        			$("input[value=${ loginUser.gender }]").attr("checked", true);
        		}
        	});
        </script>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>