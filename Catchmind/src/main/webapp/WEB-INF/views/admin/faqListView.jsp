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
    height:600px;
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
    cursor: pointer;
    opacity: 0.3;
}

#faqTable {
    margin-left : 20px;
    margin-top:20px;
    width:95%;
    text-align:center;
 	border-color: lightgray;
     font-size:14px;
}

#faqTable>thead {
    background-color : lightgrey;
}


#faqTable>thead>tr>th {
    padding-left : 15px;
    height:40px;
    font-size:14px;
}

#id {
    width : 35px;
}

#ftitle {
    width : 150px;
}

#fContent{
    width : 300px;
}

#detail {
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
    text-decoration: none;          
} 

#btn1:hover{
    opacity: 0.73;
    cursor: pointer;
}   

#pagingArea {width:fit-content; margin:auto; margin-top:50px;}


#toMain:hover{
    background: linear-gradient( rgb(236, 3, 194) 1%, orange);
    -webkit-text-fill-color : transparent;
    -webkit-background-clip: text; 
}

.fno{
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
                <span id="title">FAQ 관리</span>
                <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
            <br>
            <div class="body-content">
               
            <table id="faqTable">
                <thead>
                    <tr>
                        <th class="fno" id="id">글번호</th>
                        <th id="ftitle">FAQ제목</th>
                        <th id="fContent">FAQ내용</th>
                        <th id="detail"></th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty list }">
                			<th colspan="4">등록된 FAQ 리스트가 없습니다.</th>
                		</c:when>
              			<c:otherwise>
		                    <c:forEach items="${list}" var="f">
			                    <tr align="center">
			                        <th class="fno">${f.faqNo}</th>
			                        <th>${f.faqTitle}</th>
			                        <th>${f.faqContent}</th>
		                            <th id="detail"><a id="btn1">삭제하기</a></th>
			                    </tr>
		                    </c:forEach>
                   		</c:otherwise>
                      </c:choose>
                </tbody>
              </table>
              <div class="btn_area"><a class="btn_write" data-toggle="modal" data-target="#insertFaqModal">작성하기</a></div>
              <!-- 페이징 바 영역 -->
                <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item disabled"><a class="page-link" href="#">&lt; Prev</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="faqList.ad?cpage=${pi.currentPage - 1}">&lt; Prev</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="faqList.ad?cpage=${ p }">${ p }</a></li>
                        </c:forEach>     
                        <c:choose>   
                            <c:when test="${pi.currentPage eq pi.maxPage}">  
                                <li class="page-item disabled"><a class="page-link" href="#">Next &gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="faqList.ad?cpage=${pi.currentPage + 1}">Next &gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
       $("#faqTable>tbody>tr>#detail").click(function(){
        	location.href="deleteFaq.ad?fno="+$(this).siblings(".fno").text();
       })
    </script>
  </div>


  <!-- The Modal -->
  <div class="modal fade" id="insertFaqModal">
    <div class="modal-dialog .modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Insert FAQ</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="insertFaq.ad" method="post">
          	<table>
            	<tr>
                	<th>제목</th>
                    <td></td>
                    <td><input type="text" name="faqTitle" size="50" placeholder="Enter Title"></td>
                </tr>
                <tr>
                	<th>내용</th>
                    <td></td>
                    <td><textarea name="faqContent" style="resize:none;" cols="52" rows="10" placeholder="Enter Content"></textarea></td>
                </tr>
            </table>
        </div>
        
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">등록하기</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>

</html>