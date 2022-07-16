<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catchmind</title>
<style>

body{
    margin:auto;
    padding: 0%;
}

.content{
    width:1200px;
    height: 1000px;
    margin-left: 13%;
}

.innerContent{
   /* border: 1px solid red; */
   /*cursor: pointer;*/
}

#mainNotice{
    height: 350px;
    width: 100%;
    position: relative;
    overflow: hidden;
    cursor: pointer;
}
#noticeList>thead>tr, #noticeList>tbody>tr {
    text-align:center;
}

#noticeList>tbody>tr{
    text-align:center;
    cursor: pointer;
}

#mainNotice, #noticeList{
    width:100%;
}

#pagingArea{
    width:fit-content; 
    margin:auto;
}

</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>


    <div class="content">
    <br>
    <h1>공지사항</h1>
    <hr><br>

    <div class="innerContent" align="center">
        <div id="mainNotice" align="center">
        	<!-- 이미지 경로 동적으로 구성 예정 -->
            <img src="${pic }" id="noticeImg" style="width:100%; height:100%; object-fit:cover;">
        </div>
        <br><br>

        <table id="noticeList" align="center" class="table table-hover">
            <thead>
                <tr>
                    <th style="width:10%;">글번호</th>
                    <th style="width:50%;">글제목</th>
                    <th style="width:10%;">조회수</th>
                    <th style="width:30%;">작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
            	<c:when test="${not empty list }">
	            	<c:forEach var="no" items="${list }">
	                    <tr>
	                        <td class="nno">${no.noticeNo }</td>
	                        <td>${no.noticeTitle }</td>
	                        <td>${no.noticeCount }</td>
	                        <td>${no.noticeDate }</td>
	                    </tr>
	                </c:forEach>
                </c:when>
                <c:otherwise>
                			<td colspan="4">등록된 공지사항이 없습니다.</td>
                </c:otherwise>
            </c:choose>
            </tbody>
          </table>
          <br><br>

        <script>
            $(function(){

                $("#noticeList>tbody>tr").click(function(){
                    location.href="detail.no?nno="+$(this).children(".nno").text();
                });
            });

            // 이미지 배너가 노출되는 공지사항 클릭 시 실행 함수
            $(function(){

                $("#noticeImg").click(function(){
                    location.href="detail.no?nno="+$("#noticeList>tbody>tr").eq(0).children(".nno").text();
                });
            });
        </script>

        <!-- 페이징 바 영역 -->
        <div id="pagingArea">
        	<ul class="pagination">
	           	<c:choose>
               		<c:when test="${pi.currentPage eq 1}">
                   		<li class="page-item disabled"><a class="page-link" href="#">&lt; Prev</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="list.no?cpage=${pi.currentPage - 1}">&lt; Prev</a></li>
                   	</c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                  <li class="page-item"><a class="page-link" href="list.no?cpage=${ p }">${ p }</a></li>
                </c:forEach>     
                <c:choose>   
	               	<c:when test="${pi.currentPage eq pi.maxPage}">  
	                    <li class="page-item disabled"><a class="page-link" href="#">Next &gt;</a></li>
              		</c:when>
              		<c:otherwise>
              			<li class="page-item"><a class="page-link" href="list.no?cpage=${pi.currentPage + 1}">Next &gt;</a></li>
              		</c:otherwise>
	            </c:choose>
              </ul>
        </div>
      </div>
    </div>
    <br><br>

    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>

</html>