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
            width: 1400px;
        } /* 전체틀 가운데 정렬 및 넓이 설정 */
        /* ################### sub_body 설정 영역 ################### */
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
            width: 1400px;
            height: 620px;
            margin:auto;
            padding-top:250px;
        }
        .card_items {
            width: 330px;
            height: 220px;
            margin: 0px 10px 20px 10px;
            cursor: pointer;
        }

        .card_items .card_img{
       	 	height: 150px;
       	 	width: 330px;
            object-fit: contain;
            border: 1px solid #cccccc;
        }
        
        .card_items .data_area{
            border: 1px solid #cccccc;
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
        .card_items #conid{
        	display:none;
        }
        
        .w3-modal {
	        position: absolute;
	        displaty:none;
        }
        .w3-container>span:hover{
		    background-color: transparent !important;
		    } /* 모달창 내에 취소박스 배경색 적용 */
	    .w3-container textarea{
		    margin-top:5px;
		    width:100%;
		    resize:none;
		    outline:none;
		    } /* 모달창 내에 사유 입력 스타일 */
        .sessionTitle{
            font-family: 'IBM Plex Sans KR', sans-serif;
            margin-left: 50px;
            width: 300px;
        }
    </style>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>
<body style="overflow-x: hidden; overflow-y: hidden">

    <jsp:include page="../common/header.jsp"/>
    
    <div class="body">
        <div class="inner_body">
            <nav class="sessionTitle">
                <h3><b>함께 놀러가요 💑 </b></h3>
                <hr>
            </nav>
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
                    <div class="Loding_data">데이터를 불러오는 중입니다. <br>
                    	잠시만 기다려주세요.</div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    $(function() {
    	
    	AOS.init();
    	
    	$.ajax({
			url : "data.to",
			data : {areaCode : 1 },
			success : function(data) {
				var itemArr = $(data).find("item");
				var itemArrSort = itemArr;
				var value = "";
				itemArr.each(function(index, item) {
					if($(item).find("firstimage").text()) {
					var sdate = $(item).find("eventstartdate").text();
					var edate = $(item).find("eventenddate").text();
					var aos = " data-aos=\"fade-up\"";
					var addr = $(item).find("addr1").text()+$(item).find("addr2").text();
					value += "<div class="+"card_items"+aos+">"
                    + "<img class="+"card_img"+" src="+$(item).find("firstimage").text()+">"
                    + "<div class="+"data_area"+">"
                    + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                    + "<div class="+"addr"+">"+addr+"</div>"
                    + "<div class="+"period"+">"+sdate.slice(0,4)+"."+sdate.slice(4,6)+"."+sdate.slice(6,9)+"~"+edate.slice(0,4)+"."+edate.slice(4,6)+"."+edate.slice(6,9)+"</div>"
                    + "<div id="+"conid "+">"+"^"+$(item).find("contentid").text()+"</div>"
                    + "</div>"
                	+ "</div>"
					} else {
					var sdate = $(item).find("eventstartdate").text();
					var edate = $(item).find("eventenddate").text();
					var aos = " data-aos=\"fade-up\"";
					var addr = $(item).find("addr1").text()+$(item).find("addr2").text();
					value += "<div class="+"card_items "+aos+">"
                    + "<img class="+"card_img"+" src="+"https://dilavr.com.ua/image/catalog/empty-img.png"+">"
                    + "<div class="+"data_area"+">"
                    + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                    + "<div class="+"addr"+">"+addr+"</div>"
                    + "<div class="+"period"+">"+sdate.slice(0,4)+"."+sdate.slice(4,6)+"."+sdate.slice(6,9)+"~"+edate.slice(0,4)+"."+edate.slice(4,6)+"."+edate.slice(6,9)+"</div>"
                    + "<div id="+"conid "+">"+"^"+$(item).find("contentid").text()+"</div>"
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
					itemArr.each(function(index, item) {
						var sdate = $(item).find("eventstartdate").text();
						var edate = $(item).find("eventenddate").text();
						var aos = " data-aos=\"fade-up\"";
						var addr = $(item).find("addr1").text()+$(item).find("addr2").text();
						if($(item).find("firstimage").text()) {
						value += "<div class="+"card_items "+aos+">"
                        + "<img class="+"card_img"+" src="+$(item).find("firstimage").text()+">"
                        + "<div class="+"data_area"+">"
                        + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                        + "<div class="+"addr"+">"+$(item).find("addr1").text()+$(item).find("addr2").text()+"</div>"
                        + "<div class="+"period"+">"+sdate.slice(0,4)+"."+sdate.slice(4,6)+"."+sdate.slice(6,9)+"~"+edate.slice(0,4)+"."+edate.slice(4,6)+"."+edate.slice(6,9)+"</div>"
                        + "<div id="+"conid "+">"+"^"+$(item).find("contentid").text()+"</div>"
                        + "</div>"
                    	+ "</div>"
						} else {
						value += "<div class="+"card_items "+aos+">"
                        + "<img class="+"card_img"+" src="+"https://dilavr.com.ua/image/catalog/empty-img.png"+">"
                        + "<div class="+"data_area"+">"
                        + "<div class="+"title"+">"+$(item).find("title").text()+"</div>"
                        + "<div class="+"addr"+">"+$(item).find("addr1").text()+$(item).find("addr2").text()+"</div>"
                        + "<div class="+"period"+">"+sdate.slice(0,4)+"."+sdate.slice(4,6)+"."+sdate.slice(6,9)+"~"+edate.slice(0,4)+"."+edate.slice(4,6)+"."+edate.slice(6,9)+"</div>"
                        + "<div id="+"conid "+">"+"^"+$(item).find("contentid").text()+"</div>"
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

    $(function() {
        $('.card_area').on('click','.card_items', function() {
        	var str = $(this).text();
        	var conid = (str.substr(str.indexOf('^')+1));
        	$.ajax({
        		url:"detail.to",
        		data: {contentid: conid},
        		success : function(data) {
        			var value = "";
        			var itemArr = $(data).find("item");
					itemArr.each(function(index, item) {
						var homepage= $(item).find("homepage").text();
						var str = (homepage.substr(9,homepage.indexOf("target=",10)-11));
						window.open(str);
        		});
        		}
        	});
        });
        });
    
    </script>
    
      <!-- The Modal -->
		<div id="id01" class="w3-modal">
	    <div class="w3-modal-content w3-animate-zoom">
	        <header class="w3-container w3-orange">
	            <span onclick="document.getElementById('id01').style.display='none'"
	            class="w3-button w3-display-topright">&times;</span>
	            <h2>내 문의</h2>
	        </header>
	    <div class="w3-container">
	      <span onclick="document.getElementById('id01').style.display='none'"
	      class="w3-button w3-display-topright">&times;</span>
	      	<div class="qtis_div"></div>
	      	<div class="qac_div"></div>
	  </div>
	  </div>
	  </div>
    

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>