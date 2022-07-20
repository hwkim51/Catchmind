<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<style>
    body{
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .sessionTitle{
        margin-left: 50px;
        width: 300px;
    }
    .matchList{
        padding: 20px 220px;
    }
    
    .wrap_area{
    }
    
	.swiper-container {
	  width: 100%;
	  padding-top: 80px;
	  padding-bottom: 50px;
	  overflow: hidden;
	}
	.swiper-slide {
	  background-position: center;
	  background-size: cover;
	  width: 300px;
	  height: 360px;
	  
	}
    .swiper-3d .swiper-slide-shadow-left{
    	background-image: none;
    }
    .swiper-3d .swiper-slide-shadow-right{
		background-image: none;
    }
    
    
    
    
.card
{
    position: relative;
    width: 300px;
    height:190px;
    background: #fff;
    border-radius: 20px;
    box-shadow: 0 35px 80px rgba(0,0,0,0.15);
    transition: 0.5s;
}
/* 카드 틀 */

.card:hover
{
    height: 350px;
}
/* 호버 시 길이 */

.imgBx
{
    position:absolute;
    left: 50%;
    top: -50px;
    transform: translateX(-50%);
    width: 150px;
    height: 150px;
    background-color: #fff;
    border-radius: 20px;
    box-shadow: 0 15px 50px rgba(0,0,0,0.35);
    overflow: hidden;
    transition: 0.5s;
}
/* 이미지 박스의 모양 */

.card:hover .imgBx
{
    width:170px;
    height: 170x;
}
/* 호버 시 이미지 박스의 모양 */

.imgBx img
{
    position:absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
/* 실제 사용자 이미지 */

.card .content
{
    position:absolute;
    width:100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: flex-end;
    overflow: hidden;
}
/* 사용자에 대한 내용을 카드에 붙히는 기능고 모양잡기 */

.card .content .details
{
    padding:40px;
    text-align: center;
    width: 100%;
    transition: 0.5s;
    transform: translateY(120px);
}
/* 사용자에 대한 내용 영역 */
.card:hover .content .details .user_info
{
}
.card:hover .content .details
{
    transform: translateY(0px);
}
/* 호버 시 내용들 고정시키기 */

.card .content .details h2
{
    font-size: 1.25em;
    font-weight: 600;
    color: #555;
    line-height: 1.2em;
}
/* 이름, 직업, 취미 스타일 */

.card .content .details h2 span
{
    font-size: 0.75em;
    font-weight: 500;
    opacity: 0.5;
}
/* 직업, 취미 스타일 */

.card .content .details .data
{
    display: flex;
    justify-content: space-between;
    margin:  20px 0;
}
/* 게시글, 팔로워, 팔로잉 모양 스타일 */

.card .content .details .data h3
{
    font-size: 1em;
    color: #555;
    line-height: 1.2em;
    font-weight: 600;
}
/* 게시글, 팔로워, 팔로잉의 숫자 스타일  */

.card .content .details .data h3 span
{
    font-size: 0.85em;
    font-weight: 400;
    opacity: 0.5;
}
/* 게시글, 팔로워, 팔로잉 스타일  */

.card .content .details .actionBtn
{
	transform: translateY(20px);
    display: flex;
    justify-content: center;
}
/* 버튼 모양잡기 */

.card .content .details .actionBtn button
{
    border-radius: 5px;
    border: none;
    outline: none;
    font-size: 1em;
    font-weight: 500;
    background: #ff5f95;
    color: #fff;
    cursor: pointer;
    margin-right:10px;
    margin-left: 10px;
}
/* 버튼 스타일 */

.card .content .details .actionBtn button:nth-child(2)
{
    border: 1px solid #999;
    color: #999;
    background: #fff;
}
/* message 버튼 스타일 */

.sub_menu{
position:absolute;
top:130px;
width:200px;
height:500px;
border:1px solid red;
}
.sub_menu .search_height{
width:80px;
}
.sub_menu .search_age{
width:80px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>
    <div class="matchList">
        <nav class="sessionTitle">
            <h3><b>매칭 리스트</b></h3>
            <hr>
        </nav>
        <br>
        <div class="wrap_area">
        <div class="swiper-container">
		<div class="swiper-wrapper">
		  <c:choose>
		  	<c:when test="${ not empty loginUser.userNo }">
		  		<c:forEach var="m" items="${ mlist }">
		  <div class="swiper-slide">
			  <div class="inner">
		        <div class="outter">
		            <div class="card">
		                <div class="imgBx">
		                    <img src="${ m.pic }" alt="프로필 사진">
		                </div>
		                <div class="content">
		                    <div class="details">
		                        <h2 class="user_info">${ m.nickname }<br><span>${ m.mbti }</span></h2>
		                        <div class="data">
		                            <h3>소개글<br><span>${ m.profile }</span></h3>
		                        </div>
		                        
		                        <div class="actionBtn">
		                            <button onclick="follow(${m.userNo });">팔로우</button>
		                            <button onclick="blocked(${m.userNo});">차단</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		  </div>
		    </c:forEach>
		    </c:when>
		    <c:otherwise>
		    </c:otherwise>
		    </c:choose>
		  </div>
		</div>
		</div>
    </div>
    
    <!-- #################### 필터 구역 #################### -->
					    <div class="sub_menu">
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
                            </div> <!-- user-mbti -->
                            <form action="searchList.ma">
                            <input type="hidden"  name="mbti" id="updateMbti">
                            <input type="number" class="search_height" name="hlow" id="hlow" placeholder="이상"> ~ <input type="number" class="search_height" name="hhigh" id="hhigh" placeholder="이하">
                            <input type="number" class="search_age" name="alow" id="alow" placeholder="이상"> ~ <input type="number" class="search_age" name="ahigh" id="ahigh" placeholder="이하">
                            <button type="submit" id="searchbtn">검색</button>
                            </form>
    						</div> <!-- sub_menu -->
    						
    						<!-- #################### 필터 구역 #################### -->
    							<script>
                                /* 변경된 MBTI 추출 */
                                $(function() {
                                    /* 사용자가 MBTI를 변경하지 않는 경우 */
                                    $("#updateMbti").val("");
                                    
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
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>


	<script>
var swiper = new Swiper('.swiper-container', {
	  pagination: '.swiper-pagination',
	  effect: 'coverflow',
	  grabCursor: true,
	  centeredSlides: true,
	  slidesPerView: 'auto',
	  coverflow: {
	    rotate: 50,
	    stretch: 0,
	    depth: 100,
	    modifier: 1,
	    slideShadows : true
	  },
	  loop: true
	});
	</script>
	
	<script>
	function blocked(e) {
		$.ajax({
			url: "block.ma",
			data: {userNo:${loginUser.userNo},
				block:e},
			success: function(result) {
				if(result=="success") {
  					location.reload();
					window.alert("차단 목록에 등록되었습니다.");
					
				} else {
					window.alert("차단 목록 등록 실패!");
				}
			}
		});
	}
	
	function follow(e) {
		$.ajax({
			url: "follow.ma",
			data: {userNo:${loginUser.userNo},
				follow:e},
			success: function(result) {
				if(result=="success") {
					window.alert("팔로우 요청이 접수되었습니다.");
				} else {
					window.alert("팔로우 요청 접수 실패!");
				}
			}
		});
	}
	</script>
	
	<script>
	$( document ).ready( function() {
        $( '#hlow, #hhigh, #alow, #ahigh' ).change( function() {
          var a = $( '#hlow' ).val();
          var b = $( '#hhigh' ).val();
          var c = $( '#alow' ).val();
          var d = $( '#ahigh' ).val();
          a=Number(a);
          b=Number(b);
          c=Number(c);
          d=Number(d);
          if(a>b||c>d) {
        	  document.getElementById("searchbtn").disabled = true;
          } else {
        	  document.getElementById("searchbtn").disabled = false;
          }
        });
      } );
	</script>
	
	
</body>
</html>