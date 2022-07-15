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

.btn_area{
    margin-top: 20px;
    margin-left : 50px;
    width: 90%;
    text-align:right;
}

.btn_write{
    padding: 0px 5px 0px 5px;
    text-decoration:none !important;
    background-color: black;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 18px;
    margin-left: 15px;
}

.btn_write:hover{
    text-decoration:none !important;
    color:white;
}

#noticeTable {
    margin-left : 20px;
    margin-top:20px;
    width:95%;
    text-align:center;
 	border-color: lightgray;
    font-size:14px;
}

#noticeTable>thead {
    background-color : lightgrey;
}

#noticeTable>thead>tr>th {
    padding-left : 15px;
    height:40px;
}

#id {
    width : 50px;
}

#ntitle {
    width : 280px;
}

#ndate {
    width : 70px;
}

#status{
    width:50px;
}

#detailmenu {
    width : 50px;
}

.admin-menu a{ 
    text-decoration: none;
    color: black;
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
                <span id="title">공지사항 관리</span>
                <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
            <br>
            <div class="body-content">
                
            <table id="noticeTable">
                <thead>
                    <tr>
                        <th id="id">글번호</th>
                        <th id="ntitle">글제목</th>
                        <th id="ndate">작성일</th>
                        <th id="status">상태</th>
                        <th id="detailmenu">상세보기</th>
                    </tr>
                </thead>
                <tbody>
                
                    <c:forEach items="${list}" var="n">
	                    <tr align="center">
	                        <td class="nno">${n.noticeNo}</td>
	                        <td class="tt">${n.noticeTitle}</td>
	                        <td>${n.noticeDate}</td>
                            <td>${n.noticeStatus}</td>
	                        <td id="detail"><a id="btn1">상세보기</a></td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="btn_area"><a class="btn_write" href="noticeEnrollForm.ad">작성하기</a></div>
            </div>
            <!-- 페이징 바 영역 -->
            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${pi.currentPage eq 1}">
                            <li class="page-item disabled"><a class="page-link" href="#">&lt; Prev</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="noticeList.ad?cpage=${pi.currentPage - 1}">&lt; Prev</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="noticeList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>     
                    <c:choose>   
                        <c:when test="${pi.currentPage eq pi.maxPage}">  
                            <li class="page-item disabled"><a class="page-link" href="#">Next &gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="noticeList.ad?cpage=${pi.currentPage + 1}">Next &gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
    
    <script>
        $("#noticeTable>tbody>tr>#detail").click(function(){
        	location.href="detailNotice.ad?nno="+$(this).siblings(".nno").text();
       })
    </script>
  </div>
</body>

</html>