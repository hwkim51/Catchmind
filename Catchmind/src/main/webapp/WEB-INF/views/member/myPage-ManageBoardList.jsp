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
    /* ################### 게시판 설정 영역 ################### */
    #wrap_flex{
        display: flex;
        margin-left: 150px;
    }
    #wrap_flex a{
    	text-decoration: none;
        color: black;
    }
    /* ################### sub_munebar 설정 영역 ################### */
    #wrap_flex>#sub_menubar{
        width: 180px;
        height: 600px;
        background: #eaeaea;
    }
    #wrap_flex>#sub_menubar>.menu_content{
        display: flex;
        width:180px;
        height: 50px;
        flex-wrap: wrap;
        font-size: 25px;
    }
    /* ################### 게시글 설정 영역 ################### */
    #wrap_flex>#container{
        margin-left: 20px;
        width: 798px;
    }
    #wrap_flex>#container>*{
        font-size: 18px;
    }
    
    #wrap_flex>#container>.table>thead{
        background-color: #eaeaea;
        border-spacing: 0px;
    } /* 리스트형 게시판의 상단부 설정 */
    #wrap_flex>#container>.table>tbody{
    	cursor: pointer;
    }
    #wrap_flex table{
        border: 1px solid #cccccc;
        border-collapse: collapse;
        text-align: center;
    } /* 테두리 선에 대한 설정 */
    #alertEmpty{
    text-align: center;
    } /* 작성된 게시글이 없을 경우 나타남 */
    /* ################### sub_foot 설정 영역 ################### */
	.pagination *{
		margin: auto;
		padding: auto;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	} /* 정렬 */
	.pagination ul li{
	    list-style: none;
	    line-height: 45px;
	    text-align: center;
	    font-size: 18px;
	    cursor: pointer;
	    height: 35px;
	    width: 35px;
	    transition: all 0.5s ease;
	} /* 페이지네이션 스타일 및 정렬 및 애니메이션 속도 */
	.pagination ul li a{
	    padding: 5px 5px 5px 5px;
	    margin: 5px 5px 5px 5px;
		text-decoration: none;
		color:black;
	} /* 페이지네이션 a스타일 */
	.pagination #left{
	    border-radius: 25px 5px 5px 25px;
	    width: 85px;
	} /* 이전 스타일 */
	
	.pagination #right{
	    border-radius: 5px 25px 25px 5px;
	    width: 85px;
	} /* 다음 스타일 */
	
	.pagination .active,
	.pagination .page_num:hover,
	.pagination .signal:hover{
	    background-color: rgb(255, 165,0);
	    border-radius: 50%;
	    color:white;
	} /* 호버 시 애니메이션 .signal(prev,next)는 위에서 id선택자를 사용하여 우선순위에 의해 border-radius가 적용되지 않고 background-color만 적용됨 */
    
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
	
    <div id="wrap_flex">
        <div id="sub_menubar">
            <a class="menu_content" href="myBoard.po">에브리타임</a>
            <a class="menu_content" href="myBoard.ca">연애의 발견</a>
            <a class="menu_content" href="myBoard.qa">1:1문의</a>
        </div>
        <div id="container">
                <table class="table">
                    <thead>
                      <tr>
                        <th class="table_title">글 번호</th>
                        <th class="table_writer">제목</th>
                        <th class="table_date">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
	                   	<c:if test="${ not empty list }">
		                    <c:forEach var="p" items="${ list }">
		                      <tr>
		                        <td class="pno">${ p.postNo }</td>
		                        <td>${ p.postTitle }</td>
		                        <td>${ p.postDate }</td>
		                      </tr>
		                    </c:forEach>
	                    </c:if>
                    </tbody>
                  </table>
                  <c:if test="${ empty list }">
                  <div id="alertEmpty">현재 작성된 게시글이 없습니다. <br>
	              <a href="list.po">게시글 작성하러 가기</a></div>
	              </c:if>
                  
                  	<script>
		           	$(function() {
		           		$(".table>tbody>tr").click(function() {
		           			location.href = "myDetail.po?pno=" + $(this).children(".pno").text();
		           		});
		           	});
		           </script>
                  
                  <div class="sub_foot">
                      <div class="pagination">
				        <ul>
				        <c:choose>
				        	<c:when test="${ pi.maxPage ne 0 }">
				        		<c:choose>
	                			<c:when test="${ pi.currentPage eq 1 }">
					            	<li class="signal disabled" id="left"><a href="#">&lt; Prev</a></li>
					            </c:when>
	                    		<c:otherwise>
	                    			<li class="signal" id="left"><a href="list.po?ppage=${ pi.currentPage -1 }">&lt; Prev</a></li>
	                    		</c:otherwise>
                    		</c:choose>
                    		
				            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				            <li class="page_num"><a href="list.po?ppage=${ p }">${ p }</a></li>
				            </c:forEach>
				            
				            <c:choose>
	                    		<c:when test="${ pi.currentPage eq pi.maxPage }">
					            	<li class="signal disabled" id="right"><a href="#">Next &gt;</a></li>
					            </c:when>
	                    		<c:otherwise>
	                    			<li class="signal" id="right"><a href="list.po?ppage=${ pi.currentPage +1 }">Next &gt;</a></li>
					            </c:otherwise>
                    		</c:choose>
				        	</c:when>
				        	<c:otherwise>
				        	</c:otherwise>
				        </c:choose>
				        </ul>
				    </div>
                  </div>
            </div>
           </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>