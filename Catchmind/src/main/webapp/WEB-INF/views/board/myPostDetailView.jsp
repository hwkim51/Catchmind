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

    <style>

      .body{
          margin: auto;
          width: 1700px;
      } /* 전체틀 가운데 정렬 및 넓이 설정 */

      /* ################### sub_head 설정 영역 ################### */
      .sub_head{
          position: relative;
          height: 130px;
      } /* 게시판 타이틀 및 작성 영역 설정 */

      .sub_head>.title{
          position: absolute;
          font-size: 50px;
          width: 450px;
          left:0px; /* 왼쪽 정렬 */
          padding-bottom: 9px;
          border-bottom: 1px solid black;
      } /* 게시판 타이틀 설정 */
      
      .sub_head>.btn_update{
            position: absolute;
            font-size: 15px;
            cursor: pointer;
            color: white;
            right:0px; /* 오른쪽 정렬 */
            top: 60px;
            width: 120px;
            height: 40px;
            border-radius: 4px;
            background-color: rgb(17, 199, 231);
            text-decoration: none;
            text-align: center;
            vertical-align: middle;
            padding-top: 8px;
            right:140px;
        } /* 작성 설정 */
        .sub_head>.btn_delete{
            position: absolute;
            font-size: 15px;
            cursor: pointer;
            color: white;
            right:0px; /* 오른쪽 정렬 */
            top: 60px;
            width: 120px;
            height: 40px;
            border-radius: 4px;
            background-color: rgb(17, 199, 231);
            text-decoration: none;
            text-align: center;
            vertical-align: middle;
            padding-top: 8px;
        } /* 작성 설정 */

      /* ################### sub_body 설정 영역 ################### */
      .sub_body{
          height: 100%;
          background-color: #eaeaea;
          padding: 25px 25px 25px 25px;
      } /* 게시판의 영역 설정 */
      

      /* ########## 글제목, 작성일자, 작성자 설정 영역 ########## */
      .sub_body>.wr_title{
        display: inline-block;
        width: 1200px;
        font-weight: 800;
        font-size: 30px;
        margin-bottom: 5px;
      } /* 글제목 설정 */
      .sub_body>.wr_date{
        display: inline-block;
        width: 400px;
        font-weight: 800;
        font-size: 30px;
      } /* 작성일자 설정 */
      .sub_body>.wr_writer{
        display: inline-block;
        width: 1200px;
        font-weight: 800;
        font-size: 30px;
        margin-bottom: 20px;
      } /* 작성자 설정 */
      .sub_body>.wr_count{
        display: inline-block;
        width: 400px;
        font-weight: 800;
        font-size: 30px;
      } /* 조회수 설정 */
      .sub_body>.wr_image{
        width: 1645px;
        height:100%;
        overflow:hidden;
      } /* 이미지영역 설정 */
      .sub_body>.wr_image>img{
      	object-fit:none;
      }

      /* ########## 글내용 설정 영역 ########## */
      .sub_body>.wr_content{
        height: 100%;
        font-size: 20px;
        border-bottom: 1px solid #cccccc;
        padding-bottom: 20px;
    	white-space: pre-wrap;
      } /* 글 내용 설정 */
      
      /* ########## 댓글 입력 설정 영역 ##########*/
      .sub_body>.wr_reply{
        padding-top: 20px;
        text-align: center;
      } /* 글내용과 댓글입력 창 사이 공간 설정 */
      .sub_body>.wr_reply textarea{
        width: 700px;
        height: 45px;
        border: none;
        outline: none;
        border-radius: 4px;
        padding: 10px 10px 10px 10px;
        font-size: 15px;
        resize:none;
      } /* 댓글 입력하는 창 설정 */
      .sub_body>.wr_reply button{
        border: none;
        border-radius: 4px;
        height: 45px;
        width: 120px;
        color: white;
        font-size: 17px;
        transform: translateY(-16px); /* 입력창과 높이 맞춤 */
        margin-left: 30px;
        background-color: rgb(17, 199, 231)
      } /* 댓글 입력 버튼 설정 영역 */
      
      /* ########## 입력된 댓글 설정 영역 ########## */
      .sub_body .rep_count{
      width:100px;
      font-size:20px;
      margin-bottom:2px;
      } /* 댓글 개수 */
      .sub_body .rep_userbox{
      display:inline-flex;
      width:100%;
      background-color: rgb(186,186,186);
      } /* 댓글 작성자에 대한 정보 */
      .sub_body .rep_userbox, .rep_content{
      font-size:17px;
      border: 1px solid black;
      border-collapse: collapse;
      white-space: pre-wrap;
      } /* 댓글 내용 */
      .sub_body .rep_update, .rep_delete{
      flex-wrap: wrap;
      font-size:10px;
      display: flex;
      align-items:center;
      margin: 0px 0px 0px 10px;
      cursor:pointer;
      } /* 수정하기 삭제하기 스타일 적용 */
      /* ################### sub_foot 설정 영역 ################### */
      .sub_foot{
        text-align: center;
        font-size: 30px;
        border: none;
        padding-bottom: 100px;
        padding-top: 20px;
      } /* 목록으로 구역 설정 및 스타일 적용 */
      .sub_foot>.btn_list{
        cursor:pointer;
        color:black;
        text-decoration: none;
      } /* 목록으로 스타일 적용 */
      
      /* ################### MODAL 설정 영역 ################### */
      .report-box{
      outline:none !important;
      border:none;
      background:none;
      } /* 신고하기 스타일 적용*/
      .w3-container>span:hover{
      background-color: transparent !important;
      } /* 모달창 내에 취소박스 배경색 적용 */
      .w3-container>textarea{
      margin-top:5px;
      width:100%;
      height:600px;
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
    
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

    <jsp:include page="../common/header.jsp" />
        
    <div class="body">
        <div class="inner_body">
            <div class="sub_head">
                <div class="title">에브리타임</div>
                <c:if test="${ (not empty loginUser) and (loginUser.userNo eq p.postWriter) or (loginUser.userNo eq 1) }">
                <a class="btn_update" onclick="postFormSubmit(1);">수정</a>
                <a class="btn_delete" onclick="postFormSubmit(2);">삭제</a>
            	</c:if>
            </div>
            <c:if test="${ (not empty loginUser) and (loginUser.userNo eq p.postWriter) or (loginUser.userNo eq 1) }">
            	<form id="postForm" action="" method="post">
            		<input type="hidden" name="postNo" value="${ p.postNo}">
            		<input type="hidden" name="filePath" value="${ a.attChange }">
            	</form>
            	
            	<script>
            		function postFormSubmit(num) {
            			if(num == 1) { // 수정 요청으로 action 속성값 바꾸기
            				$("#postForm").attr("action", "myUpdateEnroll.po").submit();
            			} else { // 삭제 요청으로 action 속성값 바꾸기
            				$("#postForm").attr("action", "myDelete.po").submit();
            			}
            		}
            	</script>
            	</c:if>
            	
            <div class="sub_body">
            	<input type="hidden" name="pno" value="${ p.postNo }">
                <div class="wr_title">글제목 : ${ p.postTitle }</div>
                <div class="wr_date">작성일자 : ${ p.postDate }</div> <br>
                <div class="wr_writer">작성자 : ${ p.nickName }</div>
                <div class="wr_count">조회수 : ${ p.postCount }</div> <br>
                <div class="wr_image"><img src="${ a.attChange }" /> <br></div>
                <pre class="wr_content">${ p.postContent }</pre>
                <c:if test="${ (not empty loginUser) or (loginUser.userNo eq 1) }">
                <!-- Trigger/Open the Modal -->
				<button onclick="document.getElementById('id01').style.display='block'"
				class="report-box">신고하기</button>
				</c:if>
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
                
                <div>댓글</div>
                
                <div id="reply_Area">
                	<c:forEach var="r" items="${ rlist }">
                        <div class="rep_userbox">
                        <input type="hidden" class="rno" name="rno" value="${ r.replyNo }">
		                <div class="rep_nickname">${ r.replyNickName }</div>
			                <c:if test="${ (not empty loginUser) and (loginUser.userNo eq r.replyWriter) or (loginUser.userNo eq 1) }">
				                <div class="rep_delete">(삭제하기)</div>
				                <button onclick="document.getElementById('id01').style.display='block'"
				class="report-box">신고하기</button>
			                </c:if>
		               	</div>
		               	<pre class="rep_content">${ r.replyContent }</pre>
                    </c:forEach>
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
        				replyWriter : ${ loginUser.userNo }
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
                <a class="btn_list" href="myBoard.po">목록으로 ▶ </a>
            </div>
        </div>
    </div>
    
    
    <!-- The Modal -->
	<div id="id01" class="w3-modal">
	    <div class="w3-modal-content w3-animate-zoom">
	        <header class="w3-container w3-orange">
	            <span onclick="document.getElementById('id01').style.display='none'"
	            class="w3-button w3-display-topright">&times;</span>
	            <h2>신고하기</h2>
	        </header>
	    <div class="w3-container">
	      <span onclick="document.getElementById('id01').style.display='none'"
	      class="w3-button w3-display-topright">&times;</span>
            <input type="hidden" name="postNo" value="${ p.postNo }">
            <input type="hidden" id="replyNo" name="replyNo" value="">
            <textarea id="repContent" name="repContent" placeholder="신고사유를 작성해주세요" required></textarea>
            <button onclick="reportRep();">신고</button>
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