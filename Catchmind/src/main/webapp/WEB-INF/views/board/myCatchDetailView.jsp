<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
      /* 폰트 */
      @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Myeongjo&display=swap');
       
      .body{
          margin: auto;
          width: 1200px;
      } /* 전체틀 가운데 정렬 및 넓이 설정 */

      /* ################### sub_head 설정 영역 ################### */
      .sub_head{
            position: relative;
            margin: 0 100px;
            width: 1000px;
            height: 50px;
        } /* 게시판 타이틀 및 작성 영역 설정 */

        .sessionTitle{
        	margin-left:31px !important;
        	transform: translateX(7px);
        }
      
      .sub_head>.btn_update{
            position: absolute;
            font-size: 15px;
            cursor: pointer;
            color: white;
            right:0px; /* 오른쪽 정렬 */
            top: 10px;
            width: 90px;
            height: 35px;
            border-radius: 5px;
            background-color: rgb(17, 199, 231);
            text-decoration: none;
            text-align: center;
            vertical-align: middle;
            padding-top: 6px;
            right:102px;
        	  transform: translateY(-15px);
        } /* 작성 설정 */
        .sub_head>.btn_delete{
            position: absolute;
            font-size: 12px;
            cursor: pointer;
            color: white;
            right:0px; /* 오른쪽 정렬 */
            top: 10px;
            width: 90px;
            height: 35px;
            border-radius: 5px;
            background-color: rgb(17, 199, 231);
            text-decoration: none;
            text-align: center;
            padding-top: 6px;
            vertical-align: middle;
        	  transform: translateY(-15px);
        } /* 작성 설정 */

      /* ################### sub_body 설정 영역 ################### */
      .sub_body{
          font-family: 'IBM Plex Sans KR', sans-serif;
          margin: auto;
          height: 100%;
          width: 1000px;
          background-color: #eaeaea;
          padding: 10px 10px 10px 10px;
      } /* 게시판의 영역 설정 */
      

      /* ########## 글제목, 작성일자, 작성자 설정 영역 ########## */
      .sub_body>.wr_title{
        display: inline-block;
        width: 720px;
        font-weight: 800;
        margin-bottom: 5px;
      } /* 글제목 설정 */
      .sub_body>.wr_date{
        display: inline-block;
        width: 180px;
        font-weight: 800;
      } /* 작성일자 설정 */
      .sub_body>.wr_writer{
        display: inline-block;
        width: 720px;
        font-weight: 800;
      } /* 작성자 설정 */
      .sub_body>.wr_count{
        display: inline-block;
        width: 120px;
        font-weight: 800;
      } /* 조회수 설정 */
      .sub_body>.wr_count>#countLike{
        display: inline-block;
      }
      
      .sub_body>.btn_like{
        display: inline-block;
        font-weight: 800;
      	cursor:pointer;
      	background: none;
        text-align: left;
        border: none;
        transform: translateY(-1px);
      }.sub_body>.btn_like_cancel{
        display: inline-block;
        font-weight: 800;
      	cursor:pointer;
      	background: none;
        text-align: left;
        border: none;
        transform: translateY(-1px);
      }
      .sub_body>.btn_like_disabled{
        display: inline-block;
        font-weight: 800;
        text-align: left;
        border: none;
        transform: translateY(-1px);
      }
      
      .swiper {
		  width: 100%;
		  height: 300px;
		  position:sticky !important;
		  top:1px !important;
		  background: #eaeaea;
		  z-index:0 !important;
		}
      .swiper img{
	    width:100%;
	    height: 100%;
      	object-fit:contain;
      	margin-right:20px;
      }

      /* ########## 글내용 설정 영역 ########## */
      .sub_body>.wr_content{
        font-family: 'IBM Plex Sans KR', sans-serif;
        height: 100%;
        white-space: pre-wrap;
        margin-bottom:0px;
        font-size: 15px;
      } /* 글 내용 설정 */
      
      /* ################### sub_foot 설정 영역 ################### */
      .sub_foot{
        text-align: center;
        border: none;
        padding-bottom: 5px;
        padding-top: 10px;
        margin-bottom: 30px;
      } /* 목록으로 구역 설정 및 스타일 적용 */
      .sub_foot>.btn_list{
        font-family: 'IBM Plex Sans KR', sans-serif;
        cursor:pointer;
        color:black;
        text-decoration: none;
      } /* 목록으로 스타일 적용 */
      
      /* ################### MODAL 설정 영역 ################### */
      .report-box{
      outline:none !important;
      border:none;
      background:none;
      float: right;
      font-size: 12px;
      color: grey;
      } /* 신고하기 스타일 적용*/
     .w3-modal-content{
      top: 200px;
      width: 400px;
      height: 250px;
     }
      .w3-orange{
        width: 100%;
        height: 40px;
      }
      .w3-container>span:hover{
      background-color: transparent !important;
      } /* 모달창 내에 취소박스 배경색 적용 */
      .w3-container>textarea{
      margin:15px 10px;
      width:90%;
      height:140px;
      resize:none;
      outline:none;
      } /* 모달창 내에 사유 입력 스타일 */
      .w3-container>button{
      border:none;
      margin-bottom: 10px;
      background-color:orange;
      } /* 모달창 내에 제출 스타일 */
      .report-box{
      font-size: 7px;
      transform: translateY(-10px);
      } /* 댓글의 신고하기 크기설정 */
      
      
    </style>

</head>
<body style="overflow-x: hidden">

    <jsp:include page="../common/header.jsp" />
        
    <div class="body">
        <div class="inner_body">
          <nav class="sessionTitle">
            <h3 style="margin-bottom: 8px;"><b style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 28px;">연애의 발견</b></h3>
            <hr>
          </nav>
            <div class="sub_head">
                <c:if test="${ (not empty loginUser) and (loginUser.userNo eq c.catchWriter) or (loginUser.userNo eq 1) }">
                <a class="btn_update" onclick="catchFormSubmit(1);">수정</a>
                <a class="btn_delete" onclick="catchFormSubmit(2);">삭제</a>
            	</c:if>
            </div>
            <c:if test="${ (not empty loginUser) and (loginUser.userNo eq c.catchWriter) or (loginUser.userNo eq 1) }">
            	<form id="catchForm" action="" method="post">
            		<input type="hidden" name="catchNo" value="${ c.catchNo}">
            	</form>
            	
            	<script>
            		function catchFormSubmit(num) {
            			if(num == 1) { // 수정 요청으로 action 속성값 바꾸기
            				$("#catchForm").attr("action", "myUpdateEnroll.ca").submit();
            			} else { // 삭제 요청으로 action 속성값 바꾸기
            				$("#catchForm").attr("action", "myDelete.ca").submit();
            			}
            		}
            	</script>
            	</c:if>
            	
            <div class="sub_body">
            	<input type="hidden" name="cno" value="${ c.catchNo }">
                <div class="wr_title">글제목 : ${ c.catchTitle }</div>
                <div class="wr_date">작성일자 : ${ c.catchDate }</div> <br>
                <div class="wr_writer">작성자 : ${ c.nickName }</div>
                <div class="wr_count">조회수 : ${ c.catchCount }</div>
                <c:choose>
                <c:when test="${ not empty loginUser and llist eq 0 }">
                <button class="btn_like" onclick="like();">좋아요 : ${ l }</button><br>
                </c:when>
                <c:when test="${ not empty loginUser and llist eq 1 }">
                <button class="btn_like_cancel" onclick="cancelLike();">좋아요 : ${ l }</button><br>
                </c:when>
                <c:otherwise>
                <div class="btn_like_disabled">좋아요 : ${ l }</div><br>
                </c:otherwise>
                </c:choose>
                <c:if test="${ !empty alist }">
                	<div class=swiper>
               			<div class=swiper-wrapper>
		                	<c:forEach var="a" items="${ alist }">
		                		<div class="swiper-slide"><img src="${ a.attChange }"></div>
		                	</c:forEach>
	                	</div>
	                	<c:if test="${ alist[1].attNo > 0 }">
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
          </c:if>
                	</div>
                </c:if>
                <pre class="wr_content">${ c.catchContent }</pre>
                <c:if test="${ (not empty loginUser) or (loginUser.userNo eq 1) }">
                <!-- Trigger/Open the Modal -->
				<button onclick="document.getElementById('id01').style.display='block'"
				class="report-box" id="postRep">🚨 게시물 신고하기</button>
				</c:if>
                
            </div>
            
           
            
            <div class="sub_foot">
                <a class="btn_list" href="myBoard.ca">목록으로 ▶ </a>
            </div>
        </div>
    </div>
    
    
    <!-- The Modal -->
	<div id="id01" class="w3-modal">
	    <div class="w3-modal-content w3-animate-zoom">
	        <header class="w3-container w3-orange">
	            <span onclick="document.getElementById('id01').style.display='none'"
	            class="w3-button w3-display-topright">&times;</span>
	            <h5 style="font-family: 'IBM Plex Sans KR', sans-serif;
                          padding:10px;">🚨 REPORT </h5>
	        </header>
	    <div class="w3-container">
	      <span onclick="document.getElementById('id01').style.display='none'"
	      class="w3-button w3-display-topright">&times;</span>
            <input type="hidden" name="catchNo" value="${ c.catchNo }">
            <textarea id="repContent" name="repContent" 
            style="font-family: 'IBM Plex Sans KR', sans-serif;" placeholder="신고사유를 작성해주세요" required></textarea>
            <br>
            <button onclick="reportRep();" style="border-radius: 5px; font-family: 'IBM Plex Sans KR', sans-serif;">신고접수</button>
	    </div>
	  </div>
	  </div>
	  
	  
	  <script>
	  function reportRep() {
      		$.ajax({
      			url : "report.all",
      			data : {
      				repContent : $("#repContent").val(),
      				catchNo : ${ c.catchNo },
      			},
      			success : function(result) {
      				if(result == "success") {
      					location.reload();
    					window.alert("신고가 접수되었습니다.!");
      				} else {
      					alertify.alert("댓글작성실패", "댓글등록에 실패하였습니다.")
      				}
      			},
      			error : function() {
      				console.log("댓글작성용 ajax 통신 실패!");
      			}
      		});
  		}
	  function like() {
		  $.ajax({
			  url : "like.ca",
			  data : {
				  catchNo : ${ c.catchNo},
				  likeUser : ${ loginUser.userNo }
			  },
			  success : function(result) {
					  if(result=="success") {
						  selectLike();
					  } else {
						  console.log("좋아요 반영 실패")
					  }
				  },
			  error : function() {
				  console.log("좋아요 ajax 통신 실패!");
			  }
			  
		  });
	  }
	  
	  function cancelLike() {
		  $.ajax({
			  url : "cancelLike.ca",
			  data : {
				  catchNo : ${ c.catchNo},
				  likeUser : ${ loginUser.userNo }
			  },
			  success : function(result) {
					  if(result=="success") {
						  selectLike();
					  } else {
						  console.log("좋아요 반영 실패")
					  }
				  },
			  error : function() {
				  console.log("좋아요 ajax 통신 실패!");
			  }
			  
		  });
	  }
	  
	  function selectLike() {
		  $.ajax({
			  url : "countLike.ca",
			  data : {catchNo : ${ c.catchNo }},
			  success : function(result) {
				  location.reload();
			  },
			  error : function() {
				  console.log("좋아요 선택 통신 실패!")
			  }
		  });
	  }
	  </script>
	  <script>
	  const swiper = new Swiper('.swiper', {
		  // Optional parameters
		  direction: 'vertical',
		  loop: true,
		  // Navigation arrows
		  navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
		  }
		});
	  </script>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>