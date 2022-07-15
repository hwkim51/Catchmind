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

        /* ################### sub_body 설정 영역 ################### */
        .sub_body{
            height: 100%;
        } /* 리스트형 게시판의 영역 설정 */
        .sub_body *{
            border-collapse: collapse;
            text-align: center;
        } /* 테두리 선에 대한 설정 */
        .sub_body #areaCode{
        margin-left: 50px;
	        margin-bottom: 10px;
	        font-size: 20px;
	        size: 5;
        }
        .card_area {
            display: flex;
            flex-wrap: wrap;
        }
        .card_area .Loding_data{
        	display:block;
            font-size: 30px;
            width: 1700px;
            height: 620px;
            margin:auto;
            padding-top:250px;
        }
        .card_items {
            width: 500px;
            height: 300px;
            margin: 0px 10px 20px 50px;
        }
        
        .card_items * {
            border: 1px solid #cccccc;
        }

        .card_items .card_img{
       	 	height: 190px;
       	 	width: 500px;
            object-fit: contain;
        }
        
        .card_items .data_area .title{
            overflow: hidden;
            height: 25px;
            text-overflow:ellipsis;
            white-space:nowrap;
        }

        .card_items .data_area .addr{
            overflow: hidden;
            height: 25px;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        
    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    
    <div class="body">
        <div class="inner_body">
            <div class="sub_head">
                <div class="title">함께 놀러가요</div>
            </div>
            <div class="sub_body">
            <select id="areaCode" name="areaCode">
			    <option value="1">서울</option>
			    <option value="2">인천</option>
			    <option value="3">대전</option>
			    <option value="4">대구</option>
			    <option value="5">광주</option>
			    <option value="6">부산</option>
			    <option value="7">울산</option>
			    <option value="31">경기</option>
			    <option value="32">강원</option>
			    <option value="33">충북</option>
			    <option value="34">충남</option>
			    <option value="35">경북</option>
			    <option value="36">경남</option>
			    <option value="37">전북</option>
			    <option value="38">전남</option>
			    <option value="39">제주</option>
			</select>
                <div class="card_area" id="result1">
                    <div class="card_area" id="result1">
                    <div class="Loding_data">데이터를 불러오는 중입니다. <br>
                    	잠시만 기다려주세요.</div>
                </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    $(function() {
    	$.ajax({
			url : "data.to",
			data : {areaCode : 1 },
			success : function(data) {
				var itemArr = $(data).find("item");
				var itemArrSort = itemArr;
				var value = "";
				// 2. 반복문을 이용해서 실제 데이터가 담긴 요소들에 접근해서 동적으로 요소 만들기
				// -> 제이쿼리 반복문
				itemArr.each(function(index, item) {
					if($(item).find("firstimage").text()) {
					value += "<div class="+"card_items"+">"
                    + "<img class="+"card_img"+" src="+$(item).find("firstimage").text()+">"
                    + "<div class="+"data_area"+">"
                    + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                    + "<div class="+"addr"+">"+$(item).find("addr1").text()+$(item).find("addr2").text()+"</div>"
                    + "<div class="+"period"+">"+$(item).find("eventstartdate").text()+"~"+$(item).find("eventenddate").text()+"</div>"
                    + "</div>"
                	+ "</div>"
					} else {
					value += "<div class="+"card_items"+">"
                    + "<img class="+"card_img"+" src="+"https://dilavr.com.ua/image/catalog/empty-img.png"+">"
                    + "<div class="+"data_area"+">"
                    + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                    + "<div class="+"addr"+">"+$(item).find("addr1").text()+$(item).find("addr2").text()+"</div>"
                    + "<div class="+"period"+">"+$(item).find("eventstartdate").text()+"~"+$(item).find("eventenddate").text()+"</div>"
                    + "</div>"
                	+ "</div>"
					}
				});
					$("#result1").html(value);
					
			},
			error : function() {
				
			}
		});
    	
    	$("select[name=areaCode]").change(function(){
			$.ajax({
				url : "data.to",
				data : {areaCode : $("select[name='areaCode']").val() },
				success : function(data) {
					var itemArr = $(data).find("item");
					var itemArrSort = itemArr;
					var value = "";
					// 2. 반복문을 이용해서 실제 데이터가 담긴 요소들에 접근해서 동적으로 요소 만들기
					// -> 제이쿼리 반복문
					itemArr.each(function(index, item) {
						if($(item).find("firstimage").text()) {
						value += "<div class="+"card_items"+">"
                        + "<img class="+"card_img"+" src="+$(item).find("firstimage").text()+">"
                        + "<div class="+"data_area"+">"
                        + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                        + "<div class="+"addr"+">"+$(item).find("addr1").text()+$(item).find("addr2").text()+"</div>"
                        + "<div class="+"period"+">"+$(item).find("eventstartdate").text()+"~"+$(item).find("eventenddate").text()+"</div>"
                        + "</div>"
                    	+ "</div>"
						} else {
						value += "<div class="+"card_items"+">"
                        + "<img class="+"card_img"+" src="+"https://dilavr.com.ua/image/catalog/empty-img.png"+">"
                        + "<div class="+"data_area"+">"
                        + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                        + "<div class="+"addr"+">"+$(item).find("addr1").text()+$(item).find("addr2").text()+"</div>"
                        + "<div class="+"period"+">"+$(item).find("eventstartdate").text()+"~"+$(item).find("eventenddate").text()+"</div>"
                        + "</div>"
                    	+ "</div>"
						}
					});
						$("#result1").html(value);
						
				},
				error : function() {
					
				}
			});
    	});
    });
    
    
    	
    
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>