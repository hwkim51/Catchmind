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
    height: 800px;
    margin-left: 13%;
}

.innerContent{
   /*border: 1px solid red; */
   margin:auto;
   width:80%;
   background-color: rgb(250, 243, 235);
}

#noticeDetail{
    margin:auto;
    width:80%;
    text-align: center;
    border-collapse: separate;
    border-spacing: 0 15px;
}

#noticeDetail p{
    margin-top: 15px;
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
            <table align="center" id="noticeDetail">
                <tr>
                    <th>글제목</th>
                    <td>${n.noticeTitle }</td>
                    <th>작성일자</th>
                    <td>${n.noticeDate }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>admin</td>
                    <th>조회수</th>
                    <td>${n.noticeCount }</td>
                </tr>
                <tr>
                    <th>내용</th>
                </tr>
                <tr>
                    <td colspan="4">
                        <img src="resources/images/tiger.jpg" style="height:350px;">
                        <p> 
                            ${n.noticeContent}
                        </p>
                    </td>

                </tr>
            </table>
            <br><br>
        <div align="center">
             <a class="btn btn-light" href="javascript:history.back()">목록으로 ▶ </a>
        </div>
        <br><br>  
        </div>
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>

</html>