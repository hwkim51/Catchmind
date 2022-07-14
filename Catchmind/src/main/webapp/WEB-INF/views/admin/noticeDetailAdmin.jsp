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

.body-content{
   margin:auto;
   width:80%;
   height:100%;
   background-color: rgb(250, 243, 235);
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

#noticeDetail{
    margin:auto;
    margin-top:50px;
    width:80%;
    height:800px;
    text-align: center;
    border-collapse: separate;
    border-spacing: 0 20px;
}
/*
#noticeDetail p{
    margin-top: 15px;
    width:100%;
    margin: 0 auto;
    padding: 5%;
    -webkit-transform:scale(0.9);
}
*/

#noticeDetail textarea{
    border: 1px solid gray;
    box-sizing: border-box; 
    width:100%;
    margin: auto;
    padding:3%;
    -webkit-transform:scale(0.9);  
    height:450px;
}

#noticeDetail thead th{
    width:15%;
}

#noticeDetail thead td{
    width: 35%;
}

#noticeDetail textarea::-webkit-scrollbar{
    display: none;
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
            <span id="title">공지사항 상세 조회</span>
            <a href="/catchmind/"><span id="toMain">CATCHMIND</span></a>
            <br>
                <div class="body-content">
                    <table align="center" id="noticeDetail">
                        <thead>
                            <tr>
                                <th>글제목</th>
                                <td colspan="3">${n.noticeTitle }</td>
                            </tr>
                            <tr>
                                <th>작성일자</th>
                                <td>${n.noticeDate }</td>
                                <th>조회수</th>
                                <td>${n.noticeCount }</td>
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
                                            <img src="${n.changeName }" style="height:350px;"><br><br>
                                        </c:otherwise>
                                    </c:choose>
                                    <textarea style="resize:none;"> 
                                        ${n.noticeContent}
                                    </textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div align="center">
                        <a class="btn btn-primary btn-sm" onclick="postFormSubmit(1);">수정하기</a>
                        <a class="btn btn-danger btn-sm" onclick="postFormSubmit(2);">삭제하기</a>
                        <a class="btn btn-success btn-sm" onclick="postFormSubmit(3);">복구하기</a>
                    </div>
                    <form action="" method="post" id="noticeForm">
                        <input type="hidden" name="noticeNo" value="${n.noticeNo}">
                        <input type="hidden" name="filePath" value="${n.changeName}">
                    </form>
                    <br>
                </div>
            </div>
        </div>
    
    <script>
       function postFormSubmit(num){
          
            if(num == 1){  //수정
                $("#noticeForm").attr("action", "updateFormNo.ad").submit();
            }
            else if(num == 2){  //삭제
                $("#noticeForm").attr("action", "deleteNo.ad").submit();
            }
            else if(num == 3){
                $("#noticeForm").attr("action", "recoverNo.ad").submit();
            }
       }
    </script>
  </div>
</body>

</html>