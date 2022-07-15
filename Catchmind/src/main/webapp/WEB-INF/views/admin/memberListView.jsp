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

#memberTable {
    margin-left : 20px;
    margin-top:20px;
    width:95%;
    text-align:center;
    border-color: lightgray;
}

#memberTable>thead {
    background-color : lightgrey;
}

#memberTable>thead>tr {
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

.btn-member{
    margin: 5px 0px;
    width: 80px;
    height: 30px;
    border: none;
    border-radius: 5px;
    font-weight: 600;
    color: white;
    background-color: rgb(65, 65, 65);
}
.btn-member:hover{
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
                 <span id="title">회원관리</span>
                 <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
             <br>
             <div class="body-content">
             <table id="memberTable">
                 <thead>
                     <tr>
                         <th class="userId" style="width : 150px;">ID</th>
                         <th style="width : 200px;">닉네임</th>
                         <th style="width : 150px;">이름</th>
                         <th style="width : 150px;">상태</th>
                         <th style="width : 200px;"></th>
                     </tr>
                 </thead>
                 <tbody>
                        <c:choose>
                            <c:when test="${empty list}">
                                <th colspan="5">
                                    회원 정보가 존재하지 않습니다.
                                </th>
                            </c:when>
                            <c:otherwise>
                                
                                    <c:forEach items="${list}" var="m">
                                        <tr>
                                            <th class="userId">${m.userId}</th>
                                            <th class="nickname">${m.nickname}</th>
                                            <th class="userName">${m.userName}</th>
                                            <th class="status">
                                                <c:choose>
                                                    <c:when test="${m.status eq 0}">일반</c:when>
                                                    <c:when test="${m.status eq 1}">탈퇴</c:when>
                                                    <c:otherwise>블랙</c:otherwise>
                                                </c:choose>
                                            </th>
                                            <th class="statusBtn">
                                                <c:choose>
                                                    <c:when test="${m.status eq 2}"> <!-- 0:일반(디폴트) / 1:탈퇴 / 2:블랙-->
                                                        <input type="button" class="btn-member btn-recover" value="복구" style="background-color: rgb(51, 143, 51);">&nbsp;&nbsp;
                                                    </c:when> 
                                                    <c:otherwise>
                                                        <input type="button" class="btn-member btn-black" value="블랙">&nbsp;&nbsp;
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:choose>
                                                    <c:when test="${m.status eq 1}">
                                                        <input type="button" class="btn-member btn-recover" value="복구" style="background-color: rgb(51, 143, 51);">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="button" class="btn-member btn-delete" value="탈퇴" style="background-color: rgb(181, 40, 40);">
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
                            <li class="page-item"><a class="page-link" href="memberList.ad?cpage=${pi.currentPage - 1}">&lt; Prev</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="memberList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>     
                    <c:choose>   
                        <c:when test="${pi.currentPage eq pi.maxPage}">  
                            <li class="page-item disabled"><a class="page-link" href="#">Next &gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="memberList.ad?cpage=${pi.currentPage + 1}">Next &gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                 </ul>
             </div>
         </div>
     </div>

     <script>
        $(function(){
            $(".btn-recover").click(function(){
                var userId = $(this).parent().siblings(".userId").text();
                location.href="recoverMember.ad?userId="+ userId;
            })
            $(".btn-black").click(function(){
                var userId = $(this).parent().siblings(".userId").text();
                location.href="blackMember.ad?userId="+ userId;
            })
            $(".btn-delete").click(function(){
                var userId = $(this).parent().siblings(".userId").text();
                location.href="deleteMember.ad?userId="+ userId;
            })
        })
     </script>
</body>
</html>