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
        
    margin-top : 20px;
    margin-left : 50px;
    border-collapse: separate;
    border-spacing: 0 20px;
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
                <span id="toMain">CATCHMIND</span>
            <br>
            <div class="body-content">
            <table id="inquiryTable" class=".table-hover">
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
                
                    <c:forEach items="${list}" var="iq">
	                    <tr align="center">
	                        <td class="nno">${iq.qaNo}</td>
	                        <td class="tt">${iq.qaTitle}</td>
	                        <td>${iq.qaWriter}</td>
	                        <td>${iq.qaAnswerYn}</td>
	                        <td id="btn1">상세보기</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </div>
    </div>
    
    <script>
        $("#inquiryTable>tbody>tr>#btn1").click(function(){
        	location.href="detailInquiry.ad?nno="+$(this).siblings(".nno").text();
       })
    </script>
  </div>
</body>

</html>