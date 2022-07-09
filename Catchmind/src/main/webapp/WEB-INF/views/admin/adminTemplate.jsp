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
    border:1px solid yellow; /* 나중에 삭제하면 됩니다 */
}

.right {
    width : 87.5%;
    height : 100%;
    float:left;
    border: 1px solid red;  /* 나중에 삭제하면 됩니다 */
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
            <span id="title">1:1 문의 상세 조회</span>
            <span id="toMain">CATCHMIND</span>    
            <div class="body-content">
            <!-- 내용물 작성하는 공간 -->


            </div>        
        </div>
    </div>
</body>

</html>