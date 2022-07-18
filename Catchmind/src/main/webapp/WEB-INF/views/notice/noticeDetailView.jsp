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
    font-family: 'IBM Plex Sans KR', sans-serif;
    width:1200px;
    height: 800px;
    margin-left: 13%;
}

.innerContent{
   /*border: 1px solid red; */
   margin:auto;
   width:80%;
}

#noticeDetail{
    margin:auto;
    width:800px;
    border-collapse: separate;
    border-spacing: 0 15px;
}

#noticeDetail thead th{
    width:10%;
    
}

#noticeDetail thead td{
    width: 40%;
}

#noticeDetail pre{
    margin: auto;
    text-align: left;
    border: none;
    width: 800px;
    height:100%;
    margin-top:10px;
}

#noticeDetail textarea::-webkit-scrollbar{
    display: none;
}
</style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>

    <div class="content">
        <nav class="sessionTitle">
            <h3><b>공지사항</b></h3>
            <hr>
        </nav>
        <br>
        <div class="innerContent" align="center">
            <table align="center" id="noticeDetail">
                <thead>
                    <tr>
                        <th>글제목</th>
                        <td colspan="3">${n.noticeTitle }</td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td>${n.noticeCount }</td>
                        <th>작성일자</th>
                        <td>${n.noticeDate }</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>내용</th>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <c:choose>
                                <c:when test="${empty n.originName }">
                                    첨부파일이 없습니다.
                                </c:when>
                                <c:otherwise>
                                    <img src="${n.changeName }" style="width:100%; height:250px;">
                                </c:otherwise>
                            </c:choose>
                            <pre>${n.noticeContent}</pre>
                        </td>
                    </tr>
                </tbody>
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