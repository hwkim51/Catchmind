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
            width: 1720px;
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

        .sub_head>.btn_write{
            position: absolute;
            font-size: 15px;
            cursor: pointer;
            color: white;
            right:0px; /* 오른쪽 정렬 */
            top: 50px;
            width: 130px;
            height: 37px;
            border-radius: 4px;
            background-color: black;
            text-decoration: none;
            text-align: center;
            vertical-align: middle;
            padding-top: 8px;
        } /* 작성 설정 */

        /* ################### sub_body 설정 영역 ################### */
        .sub_body{
            height: 100%;
        } /* 리스트형 게시판의 영역 설정 */
        .sub_body *{
            border: 1px solid #cccccc;
            border-collapse: collapse;
            text-align: center;
        } /* 테두리 선에 대한 설정 */
        .card_area {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .card_items{
            width: 500px;
            height: 300px;
            border: 1px red solid;
            margin-bottom: 10px;
        }

        .card_items>.card_img{
            width: 100%;
        }

        .card_items>.data_area>.info{
            overflow: hidden;
            width: 60px;
            height: 20px;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        
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
            padding: 5px 5px 5px 5px;
            margin: 5px 5px 5px 5px;
        } /* 페이지네이션 스타일 및 정렬 및 애니메이션 속도 */

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
            color: white;
        } /* 호버 시 애니메이션 .signal(prev,next)는 위에서 id선택자를 사용하여 우선순위에 의해 border-radius가 적용되지 않고 background-color만 적용됨 */
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    
    <div class="body">
        <div class="inner_body">
            <div class="sub_head">
                <div class="title">함께 놀러가요</div>
                <a class="btn_write" href="detail.to">작성</a>
            </div>
            <div class="sub_body">
                <div class="card_area" id="result1">
                    <div class="card_items">
                        <a class="card_img" href=""><img src="" alt="이미지 박스입니다."></a>
                        <div class="data_area">
                            <div class="title">제목자리</div>
                            <div class="info">설명자리입니다만</div>
                        </div>
                    </div>
                    
                </div>
                  <div class="sub_foot">
                      <div class="pagination">
				        <ul>
				            <li class="signal" id="left">&lt; Prev</li>
				            <li class="page_num active">1</li>
				            <li class="page_num">2</li>
				            <li class="page_num">3</li>
				            <li class="page_num">4</li>
				            <li class="page_num">5</li>
				            <li class="page_num">6</li>
				            <li class="page_num">7</li>
				            <li class="page_num">8</li>
				            <li class="page_num">9</li>
				            <li class="page_num">10</li>
				            <li class="signal" id="right">Next &gt;</li>
				        </ul>
				    </div>
                  </div>
            </div>
        </div>
    </div>
    
    <script>
    $(function() {
			$.ajax({
				url : "data.to",
				success : function(data) {
					var itemArr = $(data).find("item");
					var value = "";
					
					// 2. 반복문을 이용해서 실제 데이터가 담긴 요소들에 접근해서 동적으로 요소 만들기
					// -> 제이쿼리 반복문
					itemArr.each(function(index, item) {
						
						value += "<div class="+card_items+">"
                        + "<a class="+card_img+" href="+">"+이미지자리+"</a>"
                        + "<div class="+data_area+">"
                        + "<div class="+title+">"+제목자리+"</div>"
                        + "<div class="+info+">"+설명자리입니다만+"</div>"
                        + "</div>"
                    	+ "</div>;"
					});
						$("#result1").html(value);
				},
				error : function() {
					
				}
			})
    });
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>