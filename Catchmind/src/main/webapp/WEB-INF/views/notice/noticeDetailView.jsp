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
   background-color: rgb(247, 240, 232);
}

#noticeDetail{
    margin:auto;
    width:80%;
    text-align: center;
    border-collapse: separate;
    border-spacing: 0 15px;
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
                    <td>공지사항입니다.</td>
                    <th>작성일자</th>
                    <td>2022-05-05</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>admin</td>
                    <th>조회수</th>
                    <td>43</td>
                </tr>
                <tr>
                    <th>내용</th>
                </tr>
                <tr>
                    <td colspan="4">
                        <img src="resources/images/tiger.jpg" style="height:500px;">
                        
                        <p style="height:200px;"> 
                            작성한 글 내용
                        </p>
                    </td>

                </tr>
            </table>
            <br><br>
        <div align="center">
            <button type="button" class="btn btn-light">목록으로 ▶</button>
        </div>
        <br><br>  
        </div>
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>

</body>

</html>