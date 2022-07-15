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
        width:1000px;
        height: 800px;
        margin-left: 13%;
    }

    .innerContent{
        margin-top:50px;
    }

    #blockTable{
        width:85%;
        margin: auto;
        text-align: center;
        border-collapse: separate;
        border-spacing: 0 25px;
    }

    #blockTable tr{
        height:50px;
    }

    #blockTable td{
        background-color: lightgray;
        font-size: medium;
        font-weight: 500;
    }

    .box {
        width: 70px;
        height: 70px; 
        overflow: hidden;
        
    }
    .profile {
        width: 95%;
        height: 95%;
        border-radius: 70%;
        object-fit: cover;
        <!--filter:brightness(30%);-->
    }
    
    .myPage-nav {
        width: 1000px;
        margin-left: 150px;
    }
    .myPage-menu {
        display : table-cell;
        height : 50px;
        width : 150px;
        text-align: center;
    }
    .myPage-menu a {
        text-decoration: none !important;
        color : black !important;
        font-size : 20px;
        display : block;
        width : 100%;
        height : 100%;
        line-height : 50px;
    }
    </style>
</head>
<body>
    <%-- header 영역 --%>
    <jsp:include page="../common/header.jsp"/>

    <%-- myPage header 영역 --%>
    <div class="myPage-nav">
        <div class="myPage-menu"><a href="">회원정보수정</a></div>
        <div class="myPage-menu"><a href="myFollow.me">팔로우리스트</a></div>
        <div class="myPage-menu"><a href="myBlock.me">차단리스트</a></div>
        <div class="myPage-menu"><a href="">커플관리</a></div>
        <div class="myPage-menu"><a href="">내글관리</a></div>
        <hr>
    </div>
    
    <%-- myPage BlockList 영역 --%>
    <div class="content">
        <div class="innerContent">
            <table align="center" id="blockTable">
                <tbody>
                <c:forEach var="bl" items="${list }"> 
                    <tr>
                    	<th class="box" style="background: white;">
		           			<c:choose>
		           			<c:when test="${empty bl.pic }">
		                        <img class="profile" src="resources/images/user.png">
		                    </c:when>
		                    <c:otherwise>
		                    	<img class="profile" src="${bl.pic }">
		                    </c:otherwise>   
		                    </c:choose> 
		                </th>
                    	<td>${bl.mbti }</td>
	                    <td>${bl.nickname }</td>
	                    <c:choose>
		                    <c:when test="${empty bl.profile }">
		                   	 	<td>작성된 소개 글이 없어요!</td>
		                    </c:when>
		                    <c:otherwise>
		                    	<td>${bl.profile }</td>
		                    </c:otherwise>
	                    </c:choose>
                    	<td id="blButton"><a class="btn btn-dark">차단 취소</a></td>
                    	<td class="blno" style="visibility: hidden; display:none;">${bl.userNo }</td>
                	</tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
    	
    	$("#blockTable>tbody>tr>#blButton").click(function(){
    		//console.log($(this).siblings(".bno").text()); 
    		location.href="deleteBlock.me?blno="+$(this).siblings(".blno").text();
    	})
    </script>
    
    <%-- footer 영역 --%>
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>