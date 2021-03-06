<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .body{
            margin: auto;
            width: 1200px;
        } /* 전체틀 가운데 정렬 및 넓이 설정 */

        /* ################### sub_head 설정 영역 ################### */
        .sub_head{
            position: relative;
            height: 50px;
            color: rgb(81, 81, 81);
            font-family: 'IBM Plex Sans KR', sans-serif;
        } /* 작성 영역 설정 */
        
        .sessionTitle{
        	margin-left:0px !important;
        }


      .btn_write{
            width: 90px;
            height: 35px;
            background-color: rgb(17, 199, 231);
            color:white;
            border-radius: 5px;
            border: none;
            float: right;
      }


        /* ################### sub_body 설정 영역 ################### */
        .sub_body{
            height: 100%;
        } /* 리스트형 게시판의 영역 설정 */
        .sub_body>.table>thead{
            background-color: #eaeaea;
            border-spacing: 0px;
        } /* 리스트형 게시판의 상단부 설정 */
        .sub_body table{
            font-family: 'IBM Plex Sans KR', sans-serif;
            border: 1px solid #cccccc;
            border-collapse: collapse;
            text-align: center;
        } /* 테두리 선에 대한 설정 */
        .sub_body table *{
            border-collapse: collapse;
        }
        .sub_body .table tr{
        	cursor: pointer;
            font-size: 14px;
            height:15px;
        	padding: 0px 0px 0px 0px;
        }
        .sub_body .table td{
        	padding-top: 8px;
        	padding-bottom : 8px;
        }
        .sub_body .table_pno{
        	width:100px;
        }
        .sub_body .table_title{
            width: 1000px;
        } /* 제목 행에 대한 넓이 */
        .sub_body .table_writer{
            width: 300px;
        } /* 작성자 행에 대한 넓이 */
        .sub_body .table_date{
            width: 150px;
        } /* 작성일 행에 대한 넓이 */
        /* ################### sub_foot 설정 영역 ################### */
        .pagination *{
        	margin: auto;
        	padding: auto;
            display: flex;
            align-items: center;
            justify-content: center;
        } /* 정렬 */
        .pagination #clickPage {
            background-color: rgb(255, 165,0);
            border-radius: 50%;
        }
        .pagination ul li{
            list-style: none;
            line-height: 45px;
            text-align: center;
            font-size: 18px;
            cursor: pointer;
            height: 35px;
            width: 35px;
            transition: all 0.5s ease;
            margin: 3px 3px 3px 3px;
        } /* 페이지네이션 스타일 및 정렬 및 애니메이션 속도 */
        .pagination ul li a{
            padding: 30px 5px 30px 5px;
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
</head>
<body style="overflow-x: hidden">

    <jsp:include page="../common/header.jsp"/>
    
    <div class="body">
        <div class="inner_body">
            <nav class="sessionTitle">
            <h3 style="margin-bottom: 8px;"><b style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 28px;">에브리타임⏰</b></h3>
            <hr>
          </nav>

            <div class="sub_head">
                * 누구나 OK 어떤 주제든 OK 캐치마인드 유저 커뮤니티
                <c:if test="${ not empty loginUser }">
                    <input type="button" class="btn_write" value="작성" onclick="enrollFormGo();">
                </c:if>
            </div>

            <div class="sub_body">
                <table class="table">
                    <thead>
                      <tr>
                        <th class="table_pno">글 번호</th>
                        <th class="table_title">글 제목</th>
                        <th class="table_writer">작성자</th>
                        <th class="table_date">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${ list }">
                      <tr>
                        <td class="pno">${ p.postNo }</td>
                        <td>${ p.postTitle }</td>
                        <td>${ p.nickName }</td>
                        <td>${ p.postDate }</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                  
                  	<script>
                    
                    function enrollFormGo(){
                        location.href = 'enrollForm.po';
                    }

		           	$(function() {
		           		$(".table>tbody>tr").click(function() {
		           			location.href = "detail.po?pno=" + $(this).children(".pno").text();
		           		});
		           	});
		           </script>
                  
                  <div class="sub_foot">
                      <div class="pagination">
				        <ul>
				        	<c:choose>
	                			<c:when test="${ pi.currentPage eq 1 }">
					            	<li class="signal disabled" id="left"><a href="#">&lt; Prev</a></li>
					            </c:when>
	                    		<c:otherwise>
	                    			<li class="signal" id="left"><a href="list.po?ppage=${ pi.currentPage -1 }">&lt; Prev</a></li>
	                    		</c:otherwise>
                    		</c:choose>
                    		
				            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				            <c:choose>
				            <c:when test="${ p != pi.currentPage }">
				            <li class="page_num" ><a href="list.po?ppage=${ p }">${ p }</a></li>
				            </c:when>
				            <c:otherwise>
				            <li id="clickPage"  class="page_num" ><a href="list.po?ppage=${ p }">${ p }</a></li>
				            </c:otherwise>
				            </c:choose>
				            </c:forEach>
				            
				            <c:choose>
	                    		<c:when test="${ pi.currentPage eq pi.maxPage }">
					            	<li class="signal disabled" id="right"><a href="#">Next &gt;</a></li>
					            </c:when>
	                    		<c:otherwise>
	                    			<li class="signal" id="right"><a href="list.po?ppage=${ pi.currentPage +1 }">Next &gt;</a></li>
					            </c:otherwise>
                    		</c:choose>
				            
				        </ul>
				    </div>
                  </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>