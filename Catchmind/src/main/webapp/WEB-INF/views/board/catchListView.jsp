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
        	margin-left:38px;
            margin-bottom: 10px;
            color: rgb(81, 81, 81);
            font-family: 'IBM Plex Sans KR', sans-serif;
        } /* 게시판 타이틀 및 작성 영역 설정 */
        
        .sessionTitle{
        	margin-left:38px !important;
        }

        .sub_head>.btn_write{
            position: absolute;
            font-size: 15px;
            cursor: pointer;
            color: white;
            right: 65px;
    		top: -24px;
            width: 90px;
            height: 35px;
            border-radius: 5px;
            background-color: rgb(17, 199, 231);
            text-decoration: none;
            text-align: center;
            padding-top: 6px;
        } /* 작성 설정 */

        /* ################### sub_body 설정 영역 ################### */
        .sub_body{
            height: 100%;
        } /* 게시판의 영역 설정 */
        .sub_body .card_area{
            border-collapse: collapse;
            text-align: center;
        } /* 테두리 선에 대한 설정 */
        .card_area {
            display: flex;
            flex-wrap: wrap;
        }
        .card_items{
            width: 320px;
            height: 250px;
            margin: 0px 35px 10px 35px;
            cursor: pointer;
        }
        .card_items>*{
        border: 1px solid #eaeaeaea;
        }

        .card_items>.card_img{
            width: 320px;
            height: 190px;
        }
        .card_items>.card_img img{
            width:100%;
            height:100%;
        }
		.card_items>.data_area>.title{
			border-bottom: 1px solid #eaeaeaea;
		}
        .card_items>.data_area>.info{
            overflow: hidden;
            width: 100%;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        
        /* ################### sub_foot 설정 영역 ################### */
        .pagination{
            transform: translateY(-10px);
        }
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
                <h3 style="margin-bottom: 8px;"><b style="font-family: 'IBM Plex Sans KR', sans-serif; font-size: 28px;">연애의 발견</b></h3>
                <hr>
              </nav>
            <div class="sub_head">
                * 연애의 발견은 약 148만 캐치 유저들의 연애 이야기를 다루는 공간입니다. <br> &nbsp;&nbsp; 다른 이들의 소소한 사랑이야기에 공감하고, 때로는 사랑에 대한 진지한 고민을 나눠보세요.
                <c:if test="${ not empty loginUser and loginUser.partner ne 0 }">
                <a class="btn_write" href="enrollForm.ca">작성</a>
                </c:if>
            </div>
            <div class="sub_body">
                <div class="card_area">
                	<c:forEach var="c" items="${ list }">
                    <div class="card_items">
                        <div class="card_img">
	                        <c:choose>
	                        <c:when  test="${ a[c.catchNo] ne null}">
	                        <img src="${ a[c.catchNo].attChange }">
	                        </c:when>
	                        <c:otherwise>
	                        <img src="https://dilavr.com.ua/image/catalog/empty-img.png">
	                        </c:otherwise>
	                        </c:choose>
                        </div>
                        <div class="cno" style="visibility: hidden; display:none;">${ c.catchNo }</div>
                        <div class="data_area">
                            <div class="title">${ c.catchTitle }</div>
                            <div class="info">${ c.nickName }</div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                
                <script>
		           	$(function() {
		           		$(".sub_body>.card_area>.card_items").click(function() {
		           			location.href = "detail.ca?cno=" + $(this).children(".cno").text();
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
	                    			<li class="signal" id="left"><a href="list.ca?cpage=${ pi.currentPage -1 }">&lt; Prev</a></li>
	                    		</c:otherwise>
                    		</c:choose>
                    		
				            <c:forEach var="c" begin="${ pi.startPage }" end="${ pi.endPage }">
				            <c:choose>
				            <c:when test="${ c != pi.currentPage }">
				            <li class="page_num" ><a href="list.ca?cpage=${ c }">${ c }</a></li>
				            </c:when>
				            <c:otherwise>
				            <li id="clickPage" class="page_num" ><a href="list.ca?cpage=${ c }">${ c }</a></li>
				            </c:otherwise>
				            </c:choose>
				            </c:forEach>
				            
				            <c:choose>
	                    		<c:when test="${ pi.currentPage eq pi.maxPage }">
					            	<li class="signal disabled" id="right"><a href="#">Next &gt;</a></li>
					            </c:when>
	                    		<c:otherwise>
	                    			<li class="signal" id="right"><a href="list.ca?cpage=${ pi.currentPage +1 }">Next &gt;</a></li>
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