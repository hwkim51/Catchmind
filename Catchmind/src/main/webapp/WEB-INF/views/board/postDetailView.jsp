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

    <style>
       /* 폰트 */
       @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
       @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Myeongjo&display=swap');
        
      .body{
          margin: auto;
          width: 1200px;
          /*transform: translateY(-20px);*/
      } /* 전체틀 가운데 정렬 및 넓이 설정 */

      /* ################### sub_head 설정 영역 ################### */
      .sub_head{
            position: relative;
            margin: 0 100px;
            width: 1000px;
            height: 50px;
        } /* 게시판 타이틀 및 작성 영역 설정 */

      .sessionTitle{
        	margin-left:0px !important;
        	transform: translateX(9px);
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
            font-size: 12;
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
        width: 230px;
        font-weight: 800;
      } /* 작성일자 설정 */
      .sub_body>.wr_writer{
        display: inline-block;
        width: 720px;
        font-weight: 800;
      } /* 작성자 설정 */
      .sub_body>.wr_count{
        display: inline-block;
        width: 230px;
        font-weight: 800;
      } /* 조회수 설정 */
      .sub_body .wr_image{
        height:300px;
      }
      .sub_body .wr_image>img{
        width:100%;
        height: 100%;
      	object-fit:contain;
      }
      .sub_body #postRep{
      	transform: translateY(75px);
      }

      /* ########## 글내용 설정 영역 ########## */
      .sub_body>.wr_content{
        font-family: 'IBM Plex Sans KR', sans-serif;
        height: 100%;
        white-space: pre-wrap;
        margin-bottom:0px;
        font-size: 15px;
      } /* 글 내용 설정 */
      
      /* ########## 댓글 입력 설정 영역 ##########*/
      .sub_body>.wr_reply{
        padding-top: 10px;
        text-align: center;
        margin-top: 10px;
      } /* 글내용과 댓글입력 창 사이 공간 설정 */
      .sub_body>.wr_reply textarea{
        width: 500px;
        height: 30px;
        border: none;
        outline: none;
        border-radius: 4px;
        resize:none;
        margin-left:100px;
      } /* 댓글 입력하는 창 설정 */
      .sub_body>.wr_reply button{
        border: none;
        border-radius: 4px;
        height: 30px;
        width: 75px;
        color: white;
        transform: translateY(-10px); /* 입력창과 높이 맞춤 */
        margin-left: 30px;
        background-color: rgb(17, 199, 231)
      } /* 댓글 입력 버튼 설정 영역 */
      
      /* ########## 입력된 댓글 설정 영역 ########## */
      .sub_body .rep_count{
      width:100px;
      margin-bottom:2px;
      } /* 댓글 개수 */
      .sub_body .rep_userbox{
      display:inline-flex;
      width:100%;
      } /* 댓글 작성자에 대한 정보 */
      .sub_body .rep_userbox .rep_replyDate{
      margin-left: auto;
      }
      .sub_body .rep_userbox, .rep_content{
      border-collapse: collapse;
      white-space: pre-wrap;
      } /* 댓글 내용 */
      .sub_body .rep_update, .rep_delete, .rep_replyDate{
      flex-wrap: wrap;
      display: flex;
      align-items:center;
      margin: 0px 0px 0px 10px;
      cursor:pointer;
      } /* 수정하기 삭제하기 스타일 적용 */
      /* ################### sub_foot 설정 영역 ################### */
      .sub_foot{
        text-align: center;
        border: none;
        padding-bottom: 5px;
        padding-top: 10px;
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
      #reply_Area .report-box{
      font-size: 7px;
      } /* 댓글의 신고하기 크기설정 */
    </style>
    
</head>
<body style="overflow-x: hidden">
    
  <jsp:include page="../common/header.jsp" />
    
    <div class="body">
        <div class="inner_body">
          <nav class="sessionTitle">
            <h3 style="margin-bottom: 8px;"><b style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 28px;">에브리타임⏰</b></h3>
            <hr>
          </nav>

            <div class="sub_head">
                <c:if test="${ (not empty loginUser) and (loginUser.userNo eq p.postWriter) or (loginUser.userNo eq 1) }">
                <a class="btn_update" onclick="postFormSubmit(1);">수정</a>
                <a class="btn_delete" onclick="postFormSubmit(2);">삭제</a>
            	</c:if>
            </div>
            <c:if test="${ (not empty loginUser) and (loginUser.userNo eq p.postWriter) or (loginUser.userNo eq 1) }">
            	<form id="postForm" action="" method="post">
            		<input type="hidden" name="postNo" value="${ p.postNo}">
            		<input type="hidden" name="filePath" value="${ a.attChange }">
            		<input type="hidden" name="attNo" value="${ a.attNo}">
            	</form>
            	
            	<script>
            		function postFormSubmit(num) {
            			if(num == 1) { // 수정 요청으로 action 속성값 바꾸기
            				$("#postForm").attr("action", "updateEnroll.po").submit();
            			} else { // 삭제 요청으로 action 속성값 바꾸기
            				$("#postForm").attr("action", "delete.po").submit();
            			}
            		}
            	</script>
            	</c:if>
            	
            <div class="sub_body">
            	<input type="hidden" name="pno" value="${ p.postNo }">
            	<c:choose>
            	<c:when test="${ empty loginUser.userId }">
            	<input type="hidden" id="loginChecker" value="1">
            	</c:when>
            	<c:otherwise>
            	<input type="hidden" id="loginChecker" value="${ loginUser.userNo }">
            	</c:otherwise>
            	</c:choose>
                <div class="wr_title">글제목 : ${ p.postTitle }</div>
                <div class="wr_date">작성일자 : ${ p.postDate }</div> <br>
                <div class="wr_writer">작성자 : ${ p.nickName }</div>
                <div class="wr_count">조회수 : ${ p.postCount }</div> <br><br>
                <c:if test= "${ !empty a }">
                	<div class="wr_image"><img src="${ a.attChange }"> <br></div>
                </c:if>
                <pre class="wr_content">${ p.postContent }</pre>
                <c:if test="${ (not empty loginUser) or (loginUser.userNo eq 1) }">
                <!-- Trigger/Open the Modal -->
				<button onclick="document.getElementById('id01').style.display='block'"
				class="report-box" id="postRep">🚨 게시물 신고하기</button>
				</c:if>
                
                <br><br><br>
                <div><b>댓글</b></div>
                <hr>
                <div id="reply_Area">
                	<c:forEach var="r" items="${ rlist }">
                        <div class="rep_userbox">
                        <input type="hidden" class="rno" name="rno" value="${ r.replyNo }">
		                <div class="rep_nickname"> 🙆‍♂️ <b> ${ r.replyNickName }</b></div>
			                <c:if test="${ (not empty loginUser) and (loginUser.userNo eq r.replyWriter) or (loginUser.userNo eq 1) }">
				                <div class="rep_delete">(삭제하기)</div>
				                <button onclick="document.getElementById('id01').style.display='block'"
				class="report-box">신고하기</button>
			                </c:if>
		               	<div class="rep_replyDate" style="padding-right:10px;">${ r.replyDate }</div>
		               	</div>
		               	<pre class="rep_content" style="padding-left: 35px;">${ r.replyContent }</pre>
                    </c:forEach>
                </div>
                <div class="wr_reply">
                  <c:choose>
                    <c:when test="${ empty loginUser }">
                     <textarea id="rep_input" placeholder="로그인 후 이용 가능합니다." readonly></textarea>
                     <button type="button" onclick="addReply();" disabled>작성</button>
                    </c:when>
                    <c:otherwise>
                    
                     <textarea id="rep_input" placeholder="댓글을 입력해주세요"></textarea>
                     <button type="button" onclick="addReply();">작성</button>
                    </c:otherwise>
                  </c:choose>
              </div>
                
                <script>
		           	$(function() {
		           		$(".rep_delete").click(function() {
		           			$.ajax({
		           				url : "delete.rep",
		           				data : {replyNo : $(this).prev().prev().val()},
		           			 	success : function(result) {
		            				if(result == "success") {

		            					console.log($("#rno").val());
		            					location.reload();
		            					window.alert("댓글이 삭제되었습니다!");
		            				} else {
		            					alertify.alert("댓글삭제실패", "댓글삭제에 실패하였습니다.");
		            				}
		           			 	}
		           			});
		           		});
		           		$(".report-box").click(function() {
		           			$('#replyNo').val($(this).prev().prev().prev().val());
		           		});
		           	});
		           </script>
                
            </div>
            
           <script>
    	function addReply() {
    		if($("#rep_input").val().trim().length != 0) {
        		$.ajax({
        			url : "insert.rep",
        			data : {
        				replyPost : ${ p.postNo },
        				replyContent : $("#rep_input").val(),
        				replyWriter : $("#loginChecker").val()
        			},
        			success : function(result) {
        				if(result == "success") {
        					selectReplyList();
        					$("#rep_input").val("");
        				} else {
        					alertify.alert("댓글작성실패", "댓글등록에 실패하였습니다.")
        				}
        			},
        			error : function() {
        				console.log("댓글작성용 ajax 통신 실패!");
        			}
        		});
    			
    		} else {
    			alertify.alert("댓글작성실패", "댓글작성후등록요청을해주세요.")
    		}
    	}
    	function selectReplyList() {
    		$.ajax({
    			url : "list.rep",
    			data : {pno : ${ p.postNo }},
    			success : function(result) {
    				var resultStr = "";
    				for(var i = 0; i < result.length; i++) {
    					resultStr += "<div class="+"rep_userbox"+">"
    	                +"<div class="+"rep_nickname"+">"+result[i].replyNickName+"</div>"
	                    +"</div>"
	                    +"<pre class="+"rep_content"+">"+result[i].replyContent+"</pre>";
    				}
    				
    				$("#reply_Area").html(resultStr);
    				location.reload();
    			},
    			error : function() {
    				console.log("댓글리스트 조회 실패")
    			}
    		});
    	}
    </script>
            
            <div class="sub_foot">
                <a class="btn_list" href="list.po">목록으로 ▶ </a>
            </div>
        </div>
    </div>
    <br><br>
    
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
            <input type="hidden" name="postNo" value="${ p.postNo }">
            <input type="hidden" id="replyNo" name="replyNo" value="">
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
      				postNo : ${ p.postNo },
      				replyNo : $("#replyNo").val(),
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
	  </script>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>