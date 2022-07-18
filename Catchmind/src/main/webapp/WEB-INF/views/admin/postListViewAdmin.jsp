<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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

#postTable {
    margin-left : 20px;
    margin-top:20px;
    width:95%;
    text-align:center;
    border-color: lightgray;
}

#postTable>thead {
    background-color : lightgrey;
}

#postTable>thead>tr {
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

#toMain:hover{
    background: linear-gradient( rgb(236, 3, 194) 1%, orange);
    -webkit-text-fill-color : transparent;
    -webkit-background-clip: text; 
}

.btn-post{
    margin: 5px 0px;
    width: 80px;
    height: 30px;
    border: none;
    border-radius: 5px;
    font-weight: 600;
    color: white;
    background-color: rgb(65, 65, 65);
}
.btn-post:hover{
    opacity: 0.7;
}
.userId{
    padding-left: 20px;
    text-align: left;
}
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
                 <span id="title">에브리타임 관리</span>
                 <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
             <br>
             <div class="body-content">
             <table id="postTable">
                 <thead>
                     <tr>
                         <th class="userId" style="width : 50px;">글번호</th>
                         <th style="width : 300px;">제목</th>
                         <th style="width : 80px;">작성자</th>
                         <th style="width : 80px;">작성일</th>
                         <th style="width : 50px;">상태</th>
                         <th style="width : 150px;"></th>
                     </tr>
                 </thead>
                 <tbody>
                    <c:choose>
                        <c:when test="${empty list}">
                            <th colspan="5">
                                작성된 게시글이 없습니다.
                            </th>
                        </c:when>
                        <c:otherwise>
                            
                                <c:forEach items="${list}" var="p">
                                    <tr>
                                        <th id="postNo" class="userId">${p.postNo}</th>
                                        <th class="nickname">${p.postTitle}</th>
                                        <th class="userName">${p.nickName}</th>
                                        <th class="userName">${p.postDate}</th>
                                        <th class="status">
                                            <c:choose>
                                                <c:when test="${p.postStatus eq 'Y'}">Y</c:when>
                                                <c:otherwise>N</c:otherwise>
                                            </c:choose>
                                        </th>
                                        <th class="statusBtn">
                                            <c:choose>
                                                <c:when test="${p.postStatus eq 'Y'}"> 
                                                    <input type="button" class="btn-post btn-recover" value="복구" disabled>&nbsp;&nbsp;
                                                    <input type="button" class="btn-post btn-delete" value="삭제" style="background-color: rgb(51, 143, 51);">&nbsp;&nbsp;
                                                </c:when> 
                                                <c:otherwise>
                                                    <input type="button" class="btn-post btn-recover" value="복구" style="background-color: rgb(51, 143, 51);">&nbsp;&nbsp;
                                                    <input type="button" class="btn-post btn-delete" value="삭제" disabled>&nbsp;&nbsp;
                                                </c:otherwise>
                                            </c:choose>
                                        </th>
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
                            <li class="page-item"><a class="page-link" href="postList.ad?cpage=${pi.currentPage - 1}">&lt; Prev</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="postList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>     
                    <c:choose>   
                        <c:when test="${pi.currentPage eq pi.maxPage}">  
                            <li class="page-item disabled"><a class="page-link" href="#">Next &gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="postList.ad?cpage=${pi.currentPage + 1}">Next &gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                 </ul>
             </div>
         </div>
     </div>

     <script>
     $(function(){
         $(".btn-recover").click(function(){
             var postNo = $(this).parent().siblings("#postNo").text();
             location.href="recoverfncPost.ad?postNo="+ postNo;
         });
         $(".btn-delete").click(function(){
             var postNo = $(this).parent().siblings("#postNo").text();
             location.href="deletefncPost.ad?postNo="+ postNo;
         });
     });
     </script>
</body>
</html>