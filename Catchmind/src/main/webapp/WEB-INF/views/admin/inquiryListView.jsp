<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catchmind</title>
<style>
div{
	box-sizing : border-box;
    margin : 0px;
    padding : 0px;  
}

.wrap{
    width:1200px;
    height:1000px;
    margin-left:80px;
}

.body{
    width:100%;
}
.left{
    width:12.5%;
    height:100%;
    float:left;
}

.right {
    width : 87.5%;
    height : 100%;
    float:left;
}

#title {
    font-size : 30px;
    font-weight : bolder;
    padding-left : 20px;
}

#toMain {
    font-size : 35px;
    font-weight : bolder;
    color : orange;
    float : right;
    padding-right : 20px;
}

#inquiryTable {
    margin-left : 20px;
    margin-top:20px;
    width:95%;
    text-align:center;
    border-color: lightgray;
    font-size:14px;
}

#inquiryTable>thead {
    background-color : lightgrey;
}

#inquiryTable>thead>tr {
    padding-left : 15px;
    text-align: center;
    height:40px;
}

#btn1{
    background-color: orange;
    color: white;
    width:5px;
    height:20px;
    border-radius: .25em;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    font-size:medium;          
}
    
#pagingArea {width:fit-content; margin:auto; margin-top:50px;}
</style>
</head>
<body>
    <div class="wrap">
       <div class="body left">
        <!-- adminHeader.jsp 파일 include 하는 공간-->
            <jsp:include page="../admin/adminHeader.jsp"/>
        </div>
       
          <div class="body right">
            <br>
                <!-- 메뉴 별 제목 작성하는 곳! -->
                <span id="title">1:1 문의 관리</span>
                <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
            <br>
            <div class="body-content">
            <table id="inquiryTable">
                <thead>
                    <tr>
                        <th style="width : 100px;">글번호</th>
                        <th style="width : 300px;">글제목</th>
                        <th style="width : 200px;">작성자</th>
                        <th style="width : 150px;">답변여부</th>
                        <th style="width : 100px;">상세보기</th>
                    </tr>
                </thead>
                <tbody>
	            	<c:choose>
	                	<c:when test="${empty list }">
	                		<td colspan="5">1:1 문의 내역이 없습니다.</td>
	                	</c:when>
                		<c:otherwise>
		                    <c:forEach items="${list}" var="iq">
			                    <tr align="center">
			                        <td class="qno">${iq.qaNo}</td>
			                        <td class="tt">${iq.qaTitle}</td>
			                        <td>${iq.qaWriter}</td>
			                        <td>${iq.qaAnswerYn}</td>
			                        <td id="detail"><a id="btn1">상세보기</a></td>
			                    </tr>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
          </div>
          <!-- 페이징 바 영역 -->
            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${pi.currentPage eq 1}">
                            <li class="page-item disabled"><a class="page-link" href="#">&lt; Prev</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="inquiryList.ad?cpage=${pi.currentPage - 1}">&lt; Prev</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="inquiryList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>     
                    <c:choose>   
                        <c:when test="${pi.currentPage eq pi.maxPage}">  
                            <li class="page-item disabled"><a class="page-link" href="#">Next &gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="inquiryList.ad?cpage=${pi.currentPage + 1}">Next &gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
    
    <script>
        $("#inquiryTable>tbody>tr>#detail").click(function(){
        	location.href="detailInquiry.ad?qno="+$(this).siblings(".qno").text();
       })
    </script>
  </div>
</body>

</html>